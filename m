Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 25E5774BE5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 10:35:21 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id r16-v6so41660481oie.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 03:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=022w/K2/Y0R8uyz/JQA8zli2XxYKAF/tXlmKm7tqQ5U=;
	b=Mv1vLbAsjDxCaoYjpVV3okThil9ZuWekRKLgT7Rl6mwX00uICuMvGvpxnP1AjauM3d
	nbLFZidbwvXVGECR5OgVSS/Mk0lZqTzY6rikEoUCnqCZABgllWJZyj705rYrimCT3pBu
	IrlDUYBWcQG08OdlCIAJmiLfcLiGSBMIk/PbzH4y+JFH8+jtqQxhB8zUeEpXfTQWbStK
	KzQF6B3jokKm68WNKJziz1/fkE/54uJzQS+qHqFIZj59IU9Ecz2LOmKzwU1z7LM29JaI
	pXMpM2fG74yzrOnTH3UPqRBIfcU2450NJy9KOGca/+y/vs/mZilj/crVWiDEG7XmoeSE
	L1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=022w/K2/Y0R8uyz/JQA8zli2XxYKAF/tXlmKm7tqQ5U=;
	b=a072weBAIemdIWgJPU60755r2OyOcE6g6PQHM3hRVQkcAS1TsEHCDBaRXkK386Ry1N
	Uem8XNzm1kKOgcJfmUUQEByCQVDEjsV0TTfi9mR0UwLyMQ2trkPnX2q76Jh7triucJ89
	HKfgTUel4vijpkoS1d/F4T0n0lKTNgc8bm4TcPQkc7NZ2gptvK/S7iEYKqWKGuCgXArg
	qGofWZXLvTu8AfiCps+k490NYDOiGYFG3zzLq1FUfcA+w/fXzjn9iHqdSJcBC7ak9nfQ
	LsJwS+e5b5vXSXcmgi5j8cZddPpglbO8feJ6aFLDC2gPZa8dlPJ8japXWTbmFmd1TRq6
	tz+Q==
X-Gm-Message-State: APt69E1E8eLGu1vpLZtRN3+a6LjcpY6tYHWPbel+Ey8MYttpubPzyRAX
	WkQdJqPev1D+lSQrg2+gVM6sI3vBvnWu1A6g1DqkXQ==
X-Google-Smtp-Source: AAOMgpfrpsXOQXc383xIrUaz5SGmZ78HohwCBaZMDMpzkYRUOSEOGYK/X5gk+wSglOcPbUvPpErgfaE9t8R0akJiLKI=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr28687689oih.102.1531218923037; 
	Tue, 10 Jul 2018 03:35:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 03:35:02
	-0700 (PDT)
In-Reply-To: <20180710094936.GB1825@jama>
References: <20180710080702.20527-1-Martin.Jansa@gmail.com>
	<20180710080702.20527-2-Martin.Jansa@gmail.com>
	<05aaa19a3bf9bcf837150745d1ee17deaa41304f.camel@linuxfoundation.org>
	<20180710094936.GB1825@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Jul 2018 11:35:02 +0100
Message-ID: <CAJTo0LbieaddC3czbhTBA+v8tCo+Fn-c6ToPK9=HDYW5g6B=wg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libdrm: allow to build native and nativesdk
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
X-List-Received-Date: Tue, 10 Jul 2018 10:35:22 -0000
Content-Type: text/plain; charset="UTF-8"

Whilst I'm not yet convinced this is something we should have on by
default, I am very interested in seeing it working.

Ross

On 10 July 2018 at 10:49, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Jul 10, 2018 at 09:45:45AM +0100, Richard Purdie wrote:
>> Normally I don't mind native/nativesdk variants but libdrm starts to
>> worry me as its a short step away from mesa and when we've tried native
>> or nativesdk versions in the past its been a nightmare, particularly
>> around GL.
>>
>> Could you explain a little more about why we need libdrm-native?
>
> It's for mesa and nativesdk-mesa indeed and qemu-native with spice,
> virglrenderer and opengl support enabled.
>
> http://lists.openembedded.org/pipermail/openembedded-core/2017-September/142349.html
>
>> On Tue, 2018-07-10 at 08:07 +0000, Martin Jansa wrote:
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  meta/recipes-graphics/drm/libdrm_2.4.92.bb | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta/recipes-graphics/drm/libdrm_2.4.92.bb
>> > b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
>> > index 1526553254..b4d06d19a6 100644
>> > --- a/meta/recipes-graphics/drm/libdrm_2.4.92.bb
>> > +++ b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
>> > @@ -56,3 +56,5 @@ FILES_${PN}-kms = "${libdir}/libkms*.so.*"
>> >  FILES_${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"
>> >  FILES_${PN}-amdgpu = "${libdir}/libdrm_amdgpu.so.*"
>> >  FILES_${PN}-etnaviv = "${libdir}/libdrm_etnaviv.so.*"
>> > +
>> > +BBCLASSEXTEND = "native nativesdk"
>> > --
>> > 2.17.1
>> >
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

