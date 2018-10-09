Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6CF79894
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 01:53:46 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id c56-v6so23067835qtd.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 18:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=W4i6xkggcTzgXWv71MZHZeF3wVhVBPysUb4i24/54Bk=;
	b=ogYtx3NQFEysE2zP56968zUhizFRH+nxkZtUKMDHCBmYnvbr1wCdZbQrQaVfuefvJ2
	nmiEjVnutUYbfG/mxsZqCXN9tbQ7WNTHVWxLEVpy2z0vkpPoUj4x5Tke+wp+XuLCinSC
	rYUmSdxzd0gVcQqTq3E+Cgxrt+JclMtb/k3jKERJAkSocyGL/qK7FKu/NZIHodXDIuhx
	Ro5aOiX9q2Y1eCvT32UGvnqQh8DKyjywwz5dukAjsK2k6+/Tz+EfLGBmJhRCTU31eWil
	TTVSc9oG6SjhY03AtDOZwP9czrNt6sPMFZSP6q5JQyVW/+4N4ZOf5dT1fZTJQqCIjaKv
	8efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=W4i6xkggcTzgXWv71MZHZeF3wVhVBPysUb4i24/54Bk=;
	b=sTXqZHVQX4YteHNwMlCo83jWyHaDFeQOt9DtIRF6O5v5icUCEfCQn6xzvDLR8HWx7u
	B5Lpk7AOQlFefoHkSjNKyDIQNOnESzPEkLLABmk3y4CiEa8Tq+S0OCC+eCiNB3E1a0mO
	F+ATEjeJn7aT15mwsMIrytpoS+10tSu1e5Z63kY4mXZzEuNqyJValF10fDN1Q2RcsNe+
	sF4chzYhBr2b1+HfXdMcpjRVScGgWkQiMeyUq0fs7vPS9bFgwptEdtCGCsdtYArn3U6o
	ylELCl8cNPiGFGyru5s8pRQQZDQE8PsyBQVyWNAca97S75+0AGlMfEOnUIgvpx3T4OQA
	68HA==
X-Gm-Message-State: ABuFfohCOLXok6ek9Uw9IG9/4oWv3usufqGt4TZzqYTWLdmYeMrbnMI2
	PoLX0aVE3K2aOe1wWvGUIzp8Ebw0mugU+BIELPo=
X-Google-Smtp-Source: ACcGV60MgqyLjt9/MNQvIc4oCrFXd2MnR+ZRO06JMho46RRLWeoF2NA8MOx4CjRU8n9dBtE3mReX7TZMPR5QE5+v7cA=
X-Received: by 2002:ac8:435b:: with SMTP id
	a27-v6mr20891595qtn.295.1539050027066; 
	Mon, 08 Oct 2018 18:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <1535967326-32322-1-git-send-email-hongxu.jia@windriver.com>
	<2ef6aa73-a3bd-d14a-11ef-66b8c02aecc1@windriver.com>
In-Reply-To: <2ef6aa73-a3bd-d14a-11ef-66b8c02aecc1@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Oct 2018 18:53:20 -0700
Message-ID: <CAMKF1spfZM_hxKfRYtVPeT-8FZa3RUUOxSkd-Rmb9cajMrS0iQ@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] webkitgtk: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 09 Oct 2018 01:53:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 8, 2018 at 6:47 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
> ping
>
> I think webkitgtk does require the 'opengl' distro feature.
>
> We have in mesa.inc:
> PACKAGECONFIG ??= ".... \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'opengl egl gles gbm dri', '', d)} \
>                     ..."
>
> PROVIDES = " \
>      ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl',
> '', d)} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1
> virtual/libgles2', '', d)} \
>      ..."
>
> And webkitgtk's source codes are like:
> #if USE(LIBEPOXY)
> // libepoxy headers have to be included before <ANGLE/ShaderLang.h> in
> order to avoid
> // picking up khrplatform.h inclusion that's done in ANGLE.
> #include <epoxy/gl.h>
> #endif
>
> #include <ANGLE/ShaderLang.h>
> #include <wtf/text/WTFString.h>
>
> #if PLATFORM(IOS)
> #import <OpenGLES/ES2/glext.h>
> #elif PLATFORM(MAC)
> #include <OpenGL/gl.h>
> #elif PLATFORM(WIN)
> #include "OpenGLESShims.h"
> #elif USE(LIBEPOXY)
> // <epoxy/gl.h> already included above.
> #elif USE(OPENGL_ES_2)
> #include <GLES2/gl2.h>
> #else
> #include "OpenGLShims.h"
> #endif
>
> And libepoxy is wrapper around libgl.
>
> So I think we can conclude 'opengl' is required distro feature for
> webkitgkt? At least this is the current situation in OE.

some sort of GL is needed yes. We indicate that with opengl losely
in OE

>
> Best Regards,
> Chen Qi
>
> On 09/03/2018 05:35 PM, Hongxu Jia wrote:
> > They can't be built without opengl in DISTRO_FEATURES.
> > [snip]
> > |webkitgtk-2.20.3/Source/WebCore/platform/graphics/OpenGLShims.h:23:10:
> > fatal error: GL/gl.h: No such file or directory
> > [snip]
> >
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >   meta/recipes-sato/webkit/webkitgtk_2.20.3.bb | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
> > index a528c5d..93d74bb 100644
> > --- a/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
> > @@ -29,8 +29,7 @@ SRC_URI[sha256sum] = "579b307d78fa16a73f112790178022166d7ad17d4147492ced9b9fba48
> >
> >   inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
> >
> > -# depends on libxt
> > -REQUIRED_DISTRO_FEATURES = "x11"
> > +REQUIRED_DISTRO_FEATURES = "x11 opengl"
> >
> >   DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
> >              gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

