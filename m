Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE0677F85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 10:09:26 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id i2so20434112qta.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 03:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/Ks2HYFjc4RA0ZKDZQmNEOfY/OgdDwRPjiVRqlrOT2A=;
	b=hTkAxEL72IlHklBnuiQleXAVWEZgIaFmtm/k8AN/CT8A2lAgMAeoJizfpZXbowrfeb
	r8/sv5v2SOaPTjijjoTDVTI5tK31aWKpdZFD44wjcsb1ou0T43gONsT2HuN9I7kBvUUd
	i4mdsN81lAweU2MqYLXUlm/tUG49TbRQ4OVhlyzuaANf834Z93pPiZG22IArvMWpRs43
	Zt9yfgkEG0wRMCSDjcuUpQzSxvVsvUoEu6eT1R2f2lRyW7UCdxOcF2E37eL1tzjF6TpW
	NODtbc4dCZX8vOVtq2hbLHqaBBJMJHFmwZYh31JMKae3xHYlyyVtIzhUMvRIQaav5YM0
	jqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/Ks2HYFjc4RA0ZKDZQmNEOfY/OgdDwRPjiVRqlrOT2A=;
	b=iLhUJGrvariU/gWjqHIecB0QY5efLGMZmImu8Rj+J2RoaiZ9NE3dE3nHvBEzfn+tht
	g3WHwWOtwSgtHPXNvumMguvU/ZCshyyyBZDhViX/p4ejlb+N1PHzX3IAiwFyIwhsXwEM
	qN28UlDwQBUFF7kPaNYgche3DiUtydChEP91aPiRMf5n5+QuMokrfRkSv9ocALMihT6U
	3wfH9uQB4rwcC1fsnqkbtByycrE6zsGFNmbwp6VksDX6fZzOfaZFg8JgtFIqNjSdcp9Z
	yJUofK3mHpKAukqAyYxrmagF9VuVUaZ8fC03rFqHyXVJHdBkVlO7tpF80Z5R5jDqCeOW
	fncQ==
X-Gm-Message-State: AKS2vOw98AVdvo1CMLq8pfk3VO8PDPlvqWftl3d+gMqMC5tOKw5UszzG
	4xLH/+igWth/9kF/BXDC0DPqvYNS2JgD
X-Received: by 10.237.42.129 with SMTP id t1mr5099282qtd.93.1498558168239;
	Tue, 27 Jun 2017 03:09:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 27 Jun 2017 03:09:07 -0700 (PDT)
In-Reply-To: <1498554326.7464.33.camel@intel.com>
References: <20170601121552.27868-1-net147@gmail.com>
	<1498554326.7464.33.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Jun 2017 11:09:07 +0100
Message-ID: <CAJTo0Lb-3N5JT1RVJPnQ0gkwY_9LydsFWSUj-qF79o9ZCr-z3A@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL
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
X-List-Received-Date: Tue, 27 Jun 2017 10:09:28 -0000
Content-Type: multipart/alternative; boundary="94eb2c05ac1a4b26c90552ee4351"

--94eb2c05ac1a4b26c90552ee4351
Content-Type: text/plain; charset="UTF-8"

On 27 June 2017 at 10:05, Patrick Ohly <patrick.ohly@intel.com> wrote:

> Sorry for the late reply, going through my backlog... I see that this
> has been merged. Probably needs to be reverted or fixed.
>

The typo fix is in ross/mut already.

Ross

--94eb2c05ac1a4b26c90552ee4351
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 June 2017 at 10:05, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4fg" class=3D=
"a3s aXjCH m15ce8cdc68f269d5">Sorry for the late reply, going through my ba=
cklog... I see that this<br>
has been merged. Probably needs to be reverted or fixed.</div></blockquote>=
</div><br>The typo fix is in ross/mut already.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c05ac1a4b26c90552ee4351--
