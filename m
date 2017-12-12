Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id B65A27882D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 20:10:59 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id r63so62891oia.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 12:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:cc; 
	bh=6+SgJtOR8POm3OCC2ax/6PdFBtgXhuLE5eH2w+MlHHc=;
	b=AQ/MBEoUvGcQcABt/eSu45nzo3Vpqfn4yhwairZ0BVLuXPtFZbm1xmptVPioDumwSl
	wZd8whm3T+47CeblQBo7THFRBh2nzFhmNipOuqEMCeOkt5Zc60zuevi9nU1bWvAX63Tv
	TkV8PGGRntDgVpEgo6CDPVjLTyfEfXop9/mbx+vThdDtclRAnc8MHmz3PU83xVn++tda
	wY0sdEnqDQnWn43kt3uJMZElh3JOGI5VwNCOome4OVxKO9gWBqMACFEMg7Ep+tpsDV6Z
	dFJ4mx+leqfXbsek9xI/W2G2FpeStd7yV8b9AaUHC+RSRGK8A/JLhBCqLpanmY+D+Jvt
	oSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:cc;
	bh=6+SgJtOR8POm3OCC2ax/6PdFBtgXhuLE5eH2w+MlHHc=;
	b=AzV6+LB32ZjKAqPfRMSnZbLosvW8qpbKzAao+L5cZ6+wWTlA+e1iSsT8UYnVenM576
	K2SDvXE4P6jwHOJzad/+xvkU36W5nwmKn3rfo2M5alQKyR4ATQAgTNhhpO416rzevxZn
	9uYlc2vr5F3q8HP2IKXRefsFimwoLidEAbns04RYytxoaLoNgAYdUFFbUvBInl1Ys6y4
	yZDavWucVWEua0f83YtS/vOc735D2DwWHJchH3VG7FED5ME6kLCpdS6HQCixcufyk1hm
	J6kJAq8UT8WH6ckmA6jC60A7OpAXLP4wR+dRUFa8EezRsKCkzPtvBGkZrAkBpMBj9yoh
	Ggrg==
X-Gm-Message-State: AKGB3mL9J9R/I7ALGBKrXZQbct5YxGnAaZXnaPkAM3i3Wc0nGfYX4RGm
	rIzJjLWa/r6HCU0x6Zd9zSRmAPfiBpgV5AHvRQjz
X-Received: by 10.202.72.21 with SMTP id v21mt44964oia.93.1513109460513; Tue,
	12 Dec 2017 12:11:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.152.241 with HTTP; Tue, 12 Dec 2017 12:11:00 -0800 (PST)
In-Reply-To: <a4c0420e-9c6b-0702-68c2-7c504660a15e@gmail.com>
References: <20171121200352.6348-1-george.mccollister@gmail.com>
	<a4c0420e-9c6b-0702-68c2-7c504660a15e@gmail.com>
From: George McCollister <george.mccollister@gmail.com>
Date: Tue, 12 Dec 2017 14:11:00 -0600
Message-ID: <CAFSKS=NxebYO_6X6hZ5XrbM15yVcSgV0OTe__ff29sh6M5VwdQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] glibc: Fix CVE-2017-1000366
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Dec 2017 20:11:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 30, 2017 at 9:16 AM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 11/21/2017 12:03 PM, George McCollister wrote:
>> Add backported patches from the upstream release/2.25/master branch to
>> fix CVE-2017-1000366. Also add a backported patch that resolves SSE
>> related build problems introduced by these patches.
>
> Thanks for the patch. This series causes an error when: bitbake
> core-image-sato -c populate_sdk, so its on hold.
>

Sorry for the delay, this got buried in my inbox and I didn't see it
until today (updated email filters so it shouldn't happen again).

The problem here is that
0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch is
applied first and also touches elf/rtld.c. This causes the patches in
this series to be applied incorrectly against nativesdk-glibc. The
fact that the nativesdk patches are applied before the base patches is
a bit concerning as it could cause other problems as well. It seems
like it would be much safer to apply the base patches then apply the
nativesdk patches to avoid conflicts. Your thoughts?

