Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id B4851722AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 08:08:36 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id va2so1768438obc.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 00:08:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=+tqsbvvk/tfBhSCDIKM+XHDvLxuC0K2M2jBCIpHI/5A=;
	b=AZPuVPz8VhlcgIou5YqrmJEwn5ytZvuvQqFP5md/uvobuLCfyAnwuRAfEJpVDhoGP4
	A4+uL3CtZUoVg0dd6+w1cbrS7QXy1+3K6vgJG4re41zGz1b+60GBYQI2DvdaJmuEBavM
	m4zq5IYT1wFWg8uTgSw+oXNUuy1/EUS+mXZ6ueKd1G2HD2nhCdcODDeakjTqba/qX5PI
	N8wuZ2plFebIqT1HHPMcb/yRrwh361Em4haSm6LR6uaXPrbJWqF1tyYCs057b2KMN4YF
	V4D7lRPA57DvDvSI1hzNZjDgHVmhh9M8dTPCrfxBEkLBBfPUq/f6u5Z1iXKygE61oTJo
	pewA==
X-Gm-Message-State: ALoCoQmscdx5pX905Zy2eKoCsJhkCGlaqYht67aKpSGu6uGX4Ryave3NPxyNg2Qstg0dqZmZeISO
X-Received: by 10.202.210.72 with SMTP id j69mr1509616oig.87.1418198917464;
	Wed, 10 Dec 2014 00:08:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.159.138 with HTTP; Wed, 10 Dec 2014 00:08:17 -0800 (PST)
In-Reply-To: <CAJTo0LbVEYT9=fo_gKAk0wRSg1H9_-vE5dd5N-SMrMXM38Lbvw@mail.gmail.com>
References: <cover.1417734782.git.anibal.limon@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C7CF45250@ORSMSX103.amr.corp.intel.com>
	<54873BE9.9030905@linux.intel.com>
	<CAJTo0LbVEYT9=fo_gKAk0wRSg1H9_-vE5dd5N-SMrMXM38Lbvw@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 10 Dec 2014 09:08:17 +0100
Message-ID: <CAP71Wjx+daT278dn2-JF-Epn+WJ8FcE55NMLRXV2dJNSP9wawA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 0/3] Upgrades for comply Intel Graphics Stack Release 2014Q3
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
X-List-Received-Date: Wed, 10 Dec 2014 08:08:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2014 at 9:06 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 9 December 2014 at 18:14, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.i=
ntel.com>
> wrote:
>>
>> I don't know, maybe Ross knows?.
>
>
> I ask for Piglit results to verify that approx 95% passes as that's the
> expected pass rate.  I don't bother tracking the exact count as how it
> changes as there's almost ten thousand tests and at some point you have t=
o
> let upstream deal with this.

are you using the oe-core piglit recipe for testing? i didn't realize
we had such recipe.. just want to make sure that the one we have is
ok, then I can run it on my hw as well.

thanks

