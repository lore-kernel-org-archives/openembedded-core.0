Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8EDAF6FFE8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 13:27:51 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id f6so89448872ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XSWLh5rBOFIsZeIWwaqcGvUwyYt0qiWI2GIybmJfjfE=;
	b=pX2YFPZDTrfFX03Imgw6uk/TqwDFkx/Cv2cASmq8OUu70rW9TlZXxWFJF7X7matAG+
	nvTCdqq8qTmERgjaEQ7k/G4JnHK224fO4RT9gqhq5WBXwm4Pw8Db3wRvn+OB5/QyI63i
	+EGyw8Q4Nspek9iUy+kIMzFIGhkzInDecW0xfYfhhEetoQBWMErap9U/0k83S44MFHhV
	zHAAWcYXM70MVePGniEdiCTLfsGZ9PCUuVThNQgOO6gHMAYqy3gnMu04cO7bPPw/8+ZJ
	quRrYjT2M7zUaZ2ddIxFjPPOtU6BKd8Udi8Dvu4bktvgZ35gdpVmHtqcgmYldXYjju5V
	o4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XSWLh5rBOFIsZeIWwaqcGvUwyYt0qiWI2GIybmJfjfE=;
	b=dXoIKj0cznnM+Tp+10B/jWRybdBR2R+nSsqNVAdwfqAbf7K38F0EYJTBvDeKEvlOt1
	LSC454i7ISYx97tMTCpyIyfVh1iXKDTRpBPBr0CFXprzlZ9oDS5BL45GcXPpWhWnP8E3
	jD7T5jcIpPiCmjETaXky/SKYmY/VSNT6XYbY4NAyDFeisWhRiGt2PfQ6A4jbOSFP3Qhq
	VZ3dCMgDq6+PyTi0goZGx5CELELrQCK6NZau3sWPa97vG4bMhEN3P2XvPWhY7cdk8yVS
	9Riyh1a5jzGEHXgI7++ljP1XqddeYIkY/t0wria/BcAqnnKRLNgp6rusWzbOHbxKrmi4
	bD/Q==
X-Gm-Message-State: AEkoouuEZtab7E8flNsxic2/eJcnZYTsTK2V4Qv4HbeYqyS6f3hiW/iGPj9GDEBuigOohPE+opkVH7CEu2354Kib
X-Received: by 10.36.129.213 with SMTP id q204mr5474768itd.38.1472131672310;
	Thu, 25 Aug 2016 06:27:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 25 Aug 2016 06:27:31 -0700 (PDT)
In-Reply-To: <cd135782-5368-e383-1e13-7763c3075a4b@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<9bf820ce898dc5e0127b0108efb64f7095887732.1471936926.git-series.jeremy.rosen@smile.fr>
	<9301FDF2-F2EB-414C-A671-9B87ED5F0D3C@gmail.com>
	<0c795b84-5305-072b-4540-8a3e3049d5b2@smile.fr>
	<17d95410-d50f-80f6-665c-35405a72e11a@smile.fr>
	<CAJTo0LZ_44oh+u0Muv=qu7Qj4eUfHBvoS4pVrND8bZqY0EZPhg@mail.gmail.com>
	<cd135782-5368-e383-1e13-7763c3075a4b@smile.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Aug 2016 14:27:31 +0100
Message-ID: <CAJTo0LZNud_Fhbp95xvHxKGDjqQZEAG6Kj29w3j=FPG52J=GVQ@mail.gmail.com>
To: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] [autotools] export CCLD_FOR_BUILD
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
X-List-Received-Date: Thu, 25 Aug 2016 13:27:52 -0000
Content-Type: multipart/alternative; boundary=94eb2c08b1fc641ee8053ae55d9f

--94eb2c08b1fc641ee8053ae55d9f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25 August 2016 at 13:40, J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.fr> =
wrote:

> I can avoid that by defining CCLD_FOR_BUILD in the recipe, but since I
> need to wait for glibc for v2 anyway, I'm not in a rush...
>
> if I have no news, I'll do that for V2
>

Cool, looking forward to v2.

Ross

--94eb2c08b1fc641ee8053ae55d9f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 August 2016 at 13:40, J=C3=A9r=C3=A9my Rosen <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:jeremy.rosen@smile.fr" target=3D"_blank">jeremy.rosen@smile=
.fr</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D=
"#FFFFFF" text=3D"#000000">I can avoid that by defining CCLD_FOR_BUILD in t=
he recipe, but since
    I need to wait for glibc for v2 anyway, I&#39;m not in a rush...<br>
    <br>
    if I have no news, I&#39;ll do that for V2<br></div></blockquote></div>=
<br>Cool, looking forward to v2.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--94eb2c08b1fc641ee8053ae55d9f--
