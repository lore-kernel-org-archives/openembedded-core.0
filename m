Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8C69F77E97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 13:31:26 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id d14so82109320qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 06:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9Nhbhh73AYDBgadqhyvz+906WvIh5UljFoESj/Ko2wI=;
	b=B9TTAbyr46SHO57CIS2mIHW45zQREXQIOYFeE3lRtxEOBcnZKwEJVw9VZWr0lmQhnT
	YRxJ+J6EYzcQ4EbwCg7lPJaLtyZPwucEjzwdHVkvTb5Hs8lOZ3lCy8rwyRMbM6lhEy96
	pXqL0xE4ZhivS2ZkGXHSWQyqfbhflwr1nsvmtDhcBzmkSFLNOMa3oU5OMsaWvLLBehIl
	lPdHuaC9VpARM7lo75iGJjRMeznkCoQe2xPBc1fBYUVmC7m9PI7UznfOR+Dp2gQVp0Ny
	T+nGKxAqJce4OkBVw1bXF7e02LrY8+FRY/UhJeSMfn0RsRpnVSzKYMJ+y0KPD67b0KFQ
	uDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9Nhbhh73AYDBgadqhyvz+906WvIh5UljFoESj/Ko2wI=;
	b=t7vHtIC2TzU6KHcDxKRS3qYA7js2WlI5eikPyPLWxN5FLvjtObEZGLzM7C7lAcfaBp
	1BfqV/0rn7Wjjq0LJDdzKIX2sNujsPAal9G2ZQdbl8p4bW/W+jOMT0ZtYPO1mz1url/A
	7N0mkuQhS+R+k0xYpHTIpTi6hsO5KCMrfdyHYO9/6Lve4MmTof6ZEgk2achXkoSRbphU
	/C3iK3D7oYh6w08IyYx3TH1FhxrSU/cQ7WI705ESwDc4+gsbtgCFU1go342TjGrLPSwA
	W4rJR4GYuOQgyzN0+WzX4ZrX8EWpyoAHA/NHrVcUfZI1+ejcHb/s72mudCx22/J5gV86
	mElg==
X-Gm-Message-State: AKS2vOxvDjii2vMfWcF+WnXodcSAr0MFbGO4uBqsrNlLHrjY4mBofqpC
	cMizziikO4oRgSK6OkE5DThzRBIf2ZiZ
X-Received: by 10.55.31.162 with SMTP id n34mr38144944qkh.46.1498051887576;
	Wed, 21 Jun 2017 06:31:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Wed, 21 Jun 2017 06:31:07 -0700 (PDT)
In-Reply-To: <CAAQYJAtfYB4m9QJj1KsJHE52=Q5WUx-hT3mfXeLY4yv0ZCgDZg@mail.gmail.com>
References: <1497901004-140599-1-git-send-email-yin.thong.choong@intel.com>
	<1497901004-140599-2-git-send-email-yin.thong.choong@intel.com>
	<CAAQYJAtfYB4m9QJj1KsJHE52=Q5WUx-hT3mfXeLY4yv0ZCgDZg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Jun 2017 14:31:07 +0100
Message-ID: <CAJTo0LZVg2mTa6NLUtqsdtoJVRk53uWrFbwLmv9R5jGj_TJDGA@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: otc-pg-team@eclists.intel.com, core-dev@eclists.intel.com,
	OE-core <openembedded-core@lists.openembedded.org>, "Wold,
	Saul" <saul.wold@intel.com>, "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH v3] image_types.bbclass: Prompt error message on missing setting in UBI and UBIFS
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
X-List-Received-Date: Wed, 21 Jun 2017 13:31:26 -0000
Content-Type: multipart/alternative; boundary="001a1147e5f89d682d055278620f"

--001a1147e5f89d682d055278620f
Content-Type: text/plain; charset="UTF-8"

On 20 June 2017 at 13:36, Andrea Adami <andrea.adami@gmail.com> wrote:

> > +            bberror "MKUBIFS_ARGS and UBINIZE_ARGS argument have to set
> in local.conf for UBI and UBIFS image creation."
>
> Why in local.conf ? It is not globally valid if you do multi-machine
> builds.
> I'd say the right place is the machine.conf in the BSP layer.
>

Yes, they could be set anywhere, so don't specify an explicit location.
Just "MKUBIFS_ARGS and UBINIZE_ARGS have to be set for UBI image
generation" should be sufficient.

Ross

--001a1147e5f89d682d055278620f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 June 2017 at 13:36, Andrea Adami <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:andrea.adami@gmail.com" target=3D"_blank">andrea.adami@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bberror &quot;MKUBIFS_ARGS and UB=
INIZE_ARGS argument have to set in local.conf for UBI and UBIFS image creat=
ion.&quot;<br>
<br>
</span>Why in local.conf ? It is not globally valid if you do multi-machine=
 builds.<br>
I&#39;d say the right place is the machine.conf in the BSP layer.<br></bloc=
kquote><div><br></div><div>Yes, they could be set anywhere, so don&#39;t sp=
ecify an explicit location.=C2=A0 Just &quot;MKUBIFS_ARGS and UBINIZE_ARGS =
have to be set for UBI image generation&quot; should be sufficient.</div><d=
iv><br></div><div>Ross</div></div><br></div></div>

--001a1147e5f89d682d055278620f--
