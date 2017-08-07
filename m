Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id D095B6FF69
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 13:05:39 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id c74so2289978iod.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Aug 2017 06:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nWIYs8hhe7WdT4KSBW31ssyenG/pgOCUyJ5BKI00/u0=;
	b=rCRtDV41byNbjF9qXFvTLjkKjdPA8zSQSSFitYX24zYT25XjGP6KUA2c0z9LmFD62Z
	7HSsGD90602vn3sFu2b/TSlM6pewBENQ1a1Ee4AjOO2XGh76h+ltw/sxjIXIFuLQPNHl
	l8zy49g8rQoTV17ND7p3vd6uhDXh8/VnQAwWUdiuSEzCRCQ+urDaipS9a2GYtc98092D
	4zQY+B7mUAxwrVEKAH5EgPi/njLW621OkA2EQc8z2mGkyBGiou9JbDgHNCR+D342AENa
	Rmn+zzKVCVpgJVExD7iafNr3Pimvo/SwOIVeLej7H4OTdOWIAfSqAtYhCeNt4xUTOYK0
	vfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nWIYs8hhe7WdT4KSBW31ssyenG/pgOCUyJ5BKI00/u0=;
	b=EpOV7q/oclQvF6la7i+DMsaRkxg/TGUlIt0zsrYk5IwO8lr7BKzV0xnMvAOwhJHibZ
	VoxntZE43DaGg0Fr713QFhH1IIRQVhoDCOCN4i+PuAWw8+2muzHzLMPPHQmTHBmrjW4q
	xl9ce7u7H6pNZ55e25KfFKtZ0exyU1ptwpDTyrq8d0LWvEQxkxTNfw1oJopg57DCB7f2
	/r+OGC8zAsqJE9F6RMLm02dD4rW4M5lrCsTxCLv6phS5FN/DRxb+b88chYE+anijOs6J
	tBoZBI9NxxnykeT9RG0qBjux0g2FwX2f/zRCsc6TQFhVkR+GJGvbF7KsATKbjpSJyiwf
	c+bg==
X-Gm-Message-State: AHYfb5jWPi//NrmYRLnJqes3G7cKO5sZVhtkRbQV/WCd8/MrkW+cjhU/
	Oko5nzoA+hPd9k7T6hckD9MJWsgdGnGb
X-Received: by 10.107.12.160 with SMTP id 32mr430989iom.207.1502111140671;
	Mon, 07 Aug 2017 06:05:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Mon, 7 Aug 2017 06:05:20 -0700 (PDT)
In-Reply-To: <770aa4a4-d872-a701-82c4-ba880652976b@linux.intel.com>
References: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
	<20170807114504.28410-3-alexander.kanavin@linux.intel.com>
	<CAJTo0LZPE-vj-+4ud=L8n5JiEKYdhFHod6dsox90ULghcvOaWA@mail.gmail.com>
	<770aa4a4-d872-a701-82c4-ba880652976b@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Aug 2017 14:05:20 +0100
Message-ID: <CAJTo0Larn3k1XzFisD00+aR-UGaiEyE_bzxYHeg70yX7WVqwHQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] btrfs-tools: update to 4.12
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
X-List-Received-Date: Mon, 07 Aug 2017 13:05:39 -0000
Content-Type: multipart/alternative; boundary="001a113f9376f40b1e055629807d"

--001a113f9376f40b1e055629807d
Content-Type: text/plain; charset="UTF-8"

Can you send a v2 instead?

Presumably they don't already use CC_FOR_BUILD and so on?

Ross

On 7 August 2017 at 13:59, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 08/07/2017 03:59 PM, Burton, Ross wrote:
>
>     +-      $(Q)$(CC) $(CFLAGS) $< -o $@
>>     ++      $(Q)$(BUILD_CC) $(CFLAGS) $< -o $@
>>
>>
>> This won't work when CFLAGS contains arguments that the host compiler
>> doesn't recognise, or are inappropriate.
>>
>
> Right, should've been BUILD_CFLAGS? Can you amend the patch in-place?
>
> Alex
>

--001a113f9376f40b1e055629807d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you send a v2 instead?<div><br></div><div>Presumably t=
hey don&#39;t already use CC_FOR_BUILD and so on?</div><div><br></div><div>=
Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n 7 August 2017 at 13:59, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><span class=3D"">On 08/07/2017 03:59 PM, Burton, Ross wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 +-=C2=A0 =C2=A0 =C2=A0 $(Q)$(CC) $(CFLAGS) $&lt; -o $@<br>
=C2=A0 =C2=A0 ++=C2=A0 =C2=A0 =C2=A0 $(Q)$(BUILD_CC) $(CFLAGS) $&lt; -o $@<=
br>
<br>
<br>
This won&#39;t work when CFLAGS contains arguments that the host compiler d=
oesn&#39;t recognise, or are inappropriate.<br>
</blockquote>
<br></span>
Right, should&#39;ve been BUILD_CFLAGS? Can you amend the patch in-place?<b=
r>
<br>
Alex<br>
</blockquote></div><br></div>

--001a113f9376f40b1e055629807d--
