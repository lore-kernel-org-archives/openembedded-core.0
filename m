Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f172.google.com (mail-it1-f172.google.com
	[209.85.166.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4CAE57CE73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 13:16:03 +0000 (UTC)
Received: by mail-it1-f172.google.com with SMTP id w18so4122921itj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 06:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4HkYv8ZoQdkiz/Pf5UgjafkfeMJ/b1Eh1Bb8Xl44Ywk=;
	b=MViLRFOSqXkZMlyDCzW8tbDcfb6PddX5uUD0lOEtkyu9xaES7Ss5/uRMaxvVzL2TBP
	BuFEFyxj4cr/zB9Az5rhmg9RyXYTGGCn14rBclLE6czM9v41E9GgyciYUiXGFnttCyQa
	JBvFXpurgbaqGXNoV9Yo8ELI0bJKImHaJwOiEh720qDdxeqU3zFz/1ROrARL65c4G5l6
	/T7mCl7HgHkBiER3jCBTEPWbvdORy/QDtw9CUKXwomm3Ql15yWEKH8IUoZ8UAnuf9DI1
	9rONHcIoA1uVl1R356IvnSscVokksWK8xV8daN3dTUwwpHLDi5+xg8b/giUuw43QLDoJ
	cK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4HkYv8ZoQdkiz/Pf5UgjafkfeMJ/b1Eh1Bb8Xl44Ywk=;
	b=Sq49lruocnpnTlgT2RdFfVL5xOYsLXlNmGzBt1eSNU02don7vBHDMBxBPWQ4xXs8/o
	i1RZ2OQSK7qGO1JP1bPDWojnUceYs3YdCgMzrg/vYqzl4/QsIBf9VXgiKfK9GhmWoX8C
	HXT0AnNLjP/CRhB6QsvaPZkjP5cIDpYAJ09kBT3meKBwzKY4i0L2D+PUZGFrSJYIJDVx
	B4Z9TsHN0lomskV8e0D6GOMjywHKhc4LRbpiXwdnisYbuWvgh843x9/PUB8xc4l4H7yZ
	T4DzkMPFOMHTzu2pUY1Ys+aSB2ldTGKlHxyCwt64t6hTUjc9LyVZQyj6aYMuoB/uuyEZ
	Np8A==
X-Gm-Message-State: APjAAAUomst3lOxc9l9BwHW9g6bLyQxq6NGan/Olvhjys1s7raN5IPe9
	DGLud7NG85OgCHC1CiciwMg5FKwbrQK2sgUqxr2AKA==
X-Google-Smtp-Source: APXvYqzD0SZyb/n42RYKaVDZUVgboMyHZ+B7DfJf/gnGqXbebIFRZduRMAOpdxIdldMZw9lDY4yQrsh78R0sE5UdbXM=
X-Received: by 2002:a02:960a:: with SMTP id c10mr2718674jai.31.1553174163110; 
	Thu, 21 Mar 2019 06:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190321130812.7452-1-schnitzeltony@gmail.com>
In-Reply-To: <20190321130812.7452-1-schnitzeltony@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Mar 2019 13:15:51 +0000
Message-ID: <CAJTo0LZx=DUC2EaTUEsu-_a=+gvJAP9o1wZL=A6wbbV3Y88KSg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glew: Fix build errors at recipes depending on glew
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
X-List-Received-Date: Thu, 21 Mar 2019 13:16:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The patch itself is missing your SOB.

Ross

On Thu, 21 Mar 2019 at 13:08, Andreas M=C3=BCller <schnitzeltony@gmail.com>=
 wrote:
>
> Glew headers override mesa headers by setting mesa's include guards. This
> stopped working since mesa renamed them.
>
> Fixes errors like this in depending recipes:
>
> | <...>/recipe-sysroot/usr/include/GL/glext.h:12066:105: error: conflicti=
ng declaration 'typedef void (* PFNGLFRAGMENTLIGHTFVSGIXPROC)(GLenum, GLenu=
m, const GLfloat*)'
> |  typedef void (APIENTRYP PFNGLFRAGMENTLIGHTFVSGIXPROC) (GLenum light, G=
Lenum pname, const GLfloat *params);
> |                                                                        =
                                  ^
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...mpilation-with-current-mesa-versions.patch | 71 +++++++++++++++++++
>  meta/recipes-graphics/glew/glew_2.1.0.bb      |  3 +-
>  2 files changed, 73 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/glew/glew/0001-Fixed-compilatio=
n-with-current-mesa-versions.patch
>
> diff --git a/meta/recipes-graphics/glew/glew/0001-Fixed-compilation-with-=
current-mesa-versions.patch b/meta/recipes-graphics/glew/glew/0001-Fixed-co=
mpilation-with-current-mesa-versions.patch
> new file mode 100644
> index 0000000000..6ab1794fd1
> --- /dev/null
> +++ b/meta/recipes-graphics/glew/glew/0001-Fixed-compilation-with-current=
-mesa-versions.patch
> @@ -0,0 +1,71 @@
> +From 7f65a36866f4e24dd1446fe1c9d21424f28bcabd Mon Sep 17 00:00:00 2001
> +From: Deve <deveee@gmail.com>
> +Date: Wed, 14 Nov 2018 21:07:29 +0100
> +Subject: [PATCH] Fixed compilation with current mesa versions.
> +
> +As you can see in
> +https://cgit.freedesktop.org/mesa/mesa/tree/include/GL/glext.h
> +now the file uses __gl_glext_h_ instead of __glext_h_
> +It's precisely caused by commit f7d42ee7d319256608ad60778f6787c140badada
> +
> +Backoprt notes:
> +
> +* The original patch adjusts auto/src/glew_head.h only
> +* include/GL/glew.h is not part of git repo and gets created on tarball
> +  creation
> +
> +=3D> patch include/GL/glew.h either to cause the desired fix
> +
> +Upstream-Status: Backport [1]
> +
> +[1] https://github.com/nigels-com/glew/commit/7f65a36866f4e24dd1446fe1c9=
d21424f28bcabd
> +---
> + auto/src/glew_head.h | 3 ++-
> + include/GL/glew.h    | 3 ++-
> + 2 files changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/auto/src/glew_head.h b/auto/src/glew_head.h
> +index c19cefb..8f313d9 100644
> +--- a/auto/src/glew_head.h
> ++++ b/auto/src/glew_head.h
> +@@ -14,7 +14,7 @@
> + #if defined(__REGAL_H__)
> + #error Regal.h included before glew.h
> + #endif
> +-#if defined(__glext_h_) || defined(__GLEXT_H_)
> ++#if defined(__glext_h_) || defined(__GLEXT_H_) || defined(__gl_glext_h_=
)
> + #error glext.h included before glew.h
> + #endif
> + #if defined(__gl_ATI_h_)
> +@@ -30,6 +30,7 @@
> + #define __X_GL_H
> + #define __glext_h_
> + #define __GLEXT_H_
> ++#define __gl_glext_h_
> + #define __gl_ATI_h_
> +
> + #if defined(_WIN32)
> +diff --git a/include/GL/glew.h b/include/GL/glew.h
> +index b5b6987..a9f9e4b 100644
> +--- a/include/GL/glew.h
> ++++ b/include/GL/glew.h
> +@@ -93,7 +93,7 @@
> + #if defined(__REGAL_H__)
> + #error Regal.h included before glew.h
> + #endif
> +-#if defined(__glext_h_) || defined(__GLEXT_H_)
> ++#if defined(__glext_h_) || defined(__GLEXT_H_) || defined(__gl_glext_h_=
)
> + #error glext.h included before glew.h
> + #endif
> + #if defined(__gl_ATI_h_)
> +@@ -109,6 +109,7 @@
> + #define __X_GL_H
> + #define __glext_h_
> + #define __GLEXT_H_
> ++#define __gl_glext_h_
> + #define __gl_ATI_h_
> +
> + #if defined(_WIN32)
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-graphics/glew/glew_2.1.0.bb b/meta/recipes-grap=
hics/glew/glew_2.1.0.bb
> index be725e0530..18e6909aa7 100644
> --- a/meta/recipes-graphics/glew/glew_2.1.0.bb
> +++ b/meta/recipes-graphics/glew/glew_2.1.0.bb
> @@ -6,7 +6,8 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2ac251558de685c6b9478d89b=
e3149c2"
>
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tg=
z \
> -           file://no-strip.patch"
> +           file://no-strip.patch \
> +           file://0001-Fixed-compilation-with-current-mesa-versions.patc=
h"
>
>  SRC_URI[md5sum] =3D "b2ab12331033ddfaa50dc39345343980"
>  SRC_URI[sha256sum] =3D "04de91e7e6763039bc11940095cd9c7f880baba82196a776=
5f727ac05a993c95"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

