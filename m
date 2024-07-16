Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647DEC3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 22:20:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.2555.1721168422515134875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 15:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dZGxmIxE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-367a464e200so3672870f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 15:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721168421; x=1721773221; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xvXdPr+pkDCZJ8GSASXGiYiLZHj4d1oIwiQDIxBp+FI=;
        b=dZGxmIxE+tpQqEjOg19E6jrXUfJ542JPNDmUHHcmUS1FaYchOGuxekWXWobZbT8UuJ
         /KhPCTMklGklXQKuK80Yw3z3f9cSXR/z+N5nlFwuu+Fjkf8YVTKjEftWttLViDHSlQwY
         oD0GmyWhIHlV0PnAEj6YWipbLZynxR5GTKMEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721168421; x=1721773221;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xvXdPr+pkDCZJ8GSASXGiYiLZHj4d1oIwiQDIxBp+FI=;
        b=XDb9xTL3Pdo19KsoZjwi5VPpC6/tXcXJW5oOX9+LbOdct/LJD/FfypnqSoJ53OX6/A
         UyJC7TqCqDpVGYe4+8VHiIg/yxx5oxunKtx+ipnMdW5tY9zdOKkPqxxidFKJFJGcxIJJ
         aloRArG0aWX1OwiBkUzxe1j9EmfC7R9BeadXoCFNmGrGprUfGKrtUSI3jVsz++DGyp31
         ybgIaqAs2KsNiHyfGI3xOFLahTBa+/v6Vtx1TKQYjKl/Wh7Iz/w/bSrHLNOnoyTsgDdl
         QDCH8pjxf7awLuOzb8oeO91RPZYys9+CSdbFqKH31pGk4IRjoidMfcM/ZGiL02BFhKq+
         3kVg==
X-Gm-Message-State: AOJu0YwC2pL8tfzEzLKqfOFBEnSzfvEasVDswZMCbVt/53oRyZXxW8sU
	gZFroLPlbbVms9PwecZnCT7qM1mBJ1zzVJ/xLp21tjO5KnrkhFDcrnt4W7Cio3I=
X-Google-Smtp-Source: AGHT+IHJiQ97PAovDJnhgyd1s9wcMF2oBqh4w55LYjyK16P8MKpkHIvqcvRIy1rAjS5bMS6Mq4oV1w==
X-Received: by 2002:a05:6000:1861:b0:367:89d3:5d3e with SMTP id ffacd0b85a97d-368260b7804mr2572864f8f.12.1721168420768;
        Tue, 16 Jul 2024 15:20:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8b91:48d:3c07:2ab4? ([2001:8b0:aba:5f3c:8b91:48d:3c07:2ab4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabf445sm10231231f8f.46.2024.07.16.15.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 15:20:20 -0700 (PDT)
Message-ID: <fb9d881167100638252795c3a21a17419f112314.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] llvm: extend llvm-config reproducivility fix
 to all classes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: denis@denix.org
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2024 23:20:19 +0100
In-Reply-To: <20240716221135.GC17572@denix.org>
References: <20240716013642.3050435-1-denis@denix.org>
	 <725daf1938215f5228a29b272f446ad37d96d58e.camel@linuxfoundation.org>
	 <20240716221135.GC17572@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 22:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202130

On Tue, 2024-07-16 at 18:11 -0400, Denys Dmytriyenko via
lists.openembedded.org wrote:
> On Tue, Jul 16, 2024 at 08:12:25AM +0100, Richard Purdie wrote:
> > On Mon, 2024-07-15 at 21:36 -0400, Denys Dmytriyenko via
> > lists.openembedded.org wrote:
> > > It's not limited to "target", but also happens to e.g. nativesdk:
> > >=20
> > > ERROR: nativesdk-llvm-18.1.8-r0 do_package_qa: QA Issue: File
> > > /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-
> > > linux/usr/bin/llvm-config in package nativesdk-llvm contains
> > > reference to TMPDIR [buildpaths]
> > >=20
> > > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > > ---
> > > =C2=A0meta/recipes-devtools/llvm/llvm_18.1.8.bb | 2 +-
> > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-devtools/llvm/llvm_18.1.8.bb
> > > b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
> > > index 8dad952923..6afca9c7d7 100644
> > > --- a/meta/recipes-devtools/llvm/llvm_18.1.8.bb
> > > +++ b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
> > > @@ -95,7 +95,7 @@ EXTRA_OECMAKE:append:class-nativesdk =3D "\
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > > =C2=A0
> > > =C2=A0# patch out build host paths for reproducibility
> > > -do_compile:prepend:class-target() {
> > > +do_compile:prepend() {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e "s,${WORKD=
IR},,g" ${B}/tools/llvm-
> > > config/BuildVariables.inc
> > > =C2=A0}
> > > =C2=A0
> >=20
> >=20
> > Do we need those buildpaths in llvm-native?
>=20
> I'm not really sure, but I can spin up a v2.

I'm just not sure if that is going to break something or not in the
native case. I worry a bit that it might :(

Cheers,

Richard

