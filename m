Return-Path: <sumit.garg@linaro.org>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id C09DD7F827
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 11:55:27 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id o13so26170008ljg.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 03:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JV0poA3wirS/v3oODsVpRt4mQuu+RlLRLwFnXP1Dx1o=;
	b=bW5QL3orp9fmd3qZqEnS4L85Y4TlGHusddYGWUzEqrvNr4lMDlziNDFVA9CVoVD7DC
	uj7CRQvIViUb1go0HEQ2vBLuOeKYkqrlVYfALBsmU34u3rfVAkZsaXfBi/ZCqNvCpGEJ
	R/g6iEbqS6YzurQJk/XTaJQ2JYf71ekg/WS1WRyVU9STU3MewzAMfM9DNkSzkIrGTwY7
	rfA3DYesfVBEM3LzOSDojSQcyOXPbADUYO1W5KIylbVCBBxE7sf9r/qP5fk++6eHFSRl
	/sg+V/4X2BEL4rmzsKoVV0nHUUKhIfeIyBxfNMFWc52YLmvrkrRc16Ys4Ij9QrJBofQr
	RTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JV0poA3wirS/v3oODsVpRt4mQuu+RlLRLwFnXP1Dx1o=;
	b=QBuRGZ7vps7lhVdJbQVqZjJm0HUYb7NCNZlBkSM83PsD6p1eQyhGrHYYfBMhBkwFoA
	fYSLkOUzSaukRLFVUVq26IXg5WzZ6hdscTvPKTC/E72+KsmRRIzN37FN+KvleAglrwyX
	ajmC+K1uqsNpp+kHWAVcx8awzMUFmmJYohe6y/3wOu8l7RUr0c1b863JnySvQ35xvHTu
	/chqzb9fX6UQ+OSS0+or0lzLGu0pNXJVjCphsP83RbWeP5nSedpUpnQtFN1lncSe06B2
	hUMDIQymuTu6Kxu1U4d0W1x0y0YSGodbULOSMrPN3M4VNqmjeXb4vK5JmsTRj65nPxPF
	ZSuQ==
X-Gm-Message-State: APjAAAX0ZBOxb2h1alrj0NDyUP/HD10rH2kVNa4Spel+ZxVsiKEuMRgg
	epk5RF6QfnLrF/Lww76e1UH8/6UfPoztGVYJCo20czlCV50=
X-Google-Smtp-Source: APXvYqwgl7s4dpxNt7VEK9QGH9m97cQOSTiyFr4dy/e08nDRscwjRa9Nwi9Vi8WJOdTLK/XqCXw6Ox3UVxriFP8rNcc=
X-Received: by 2002:a2e:9b05:: with SMTP id u5mr5434095lji.59.1579262126773;
	Fri, 17 Jan 2020 03:55:26 -0800 (PST)
MIME-Version: 1.0
References: <1579244354-13596-1-git-send-email-sumit.garg@linaro.org>
	<b21d1a39c0c1e5585e72586ca806967bae37decf.camel@linuxfoundation.org>
In-Reply-To: <b21d1a39c0c1e5585e72586ca806967bae37decf.camel@linuxfoundation.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 17 Jan 2020 17:25:15 +0530
Message-ID: <CAFA6WYOm4a8_mqyNA+zkFHPznN10SyKb4atiCtmS=qabZzyM+A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core: recipes: fix some native tools dependencies
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
X-List-Received-Date: Fri, 17 Jan 2020 11:55:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jan 2020 at 16:21, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-01-17 at 12:29 +0530, Sumit Garg wrote:
> > Some native tools dependency issues were seen while building with
> > external GCC tool-set rather than source GCC tool-set. While building
> > with source tool-set these dependencies were implicitly met which is not
> > the case with external tool-set. So explicitly state these native tools
> > dependencies.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  meta/classes/autotools.bbclass                     | 2 +-
> >  meta/recipes-extended/man-db/man-db_2.9.0.bb       | 2 +-
> >  meta/recipes-graphics/xorg-app/xorg-app-common.inc | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> > index 3d22ad0..4c71be2 100644
> > --- a/meta/classes/autotools.bbclass
> > +++ b/meta/classes/autotools.bbclass
> > @@ -10,7 +10,7 @@ def autotools_dep_prepend(d):
> >      deps += 'autoconf-native automake-native '
> >
> >      if not pn in ['libtool', 'libtool-native'] and not pn.endswith("libtool-cross"):
> > -        deps += 'libtool-native '
> > +        deps += 'libtool-native xz-native '
> >          if not bb.data.inherits_class('native', d) \
> >                          and not bb.data.inherits_class('nativesdk', d) \
> >                          and not bb.data.inherits_class('cross', d) \
>
> Where does autotools depend on xz? I don't really understand that
> dependency. What kind of failures was this causing?
>

Here is one of the failures I observed:

| /home/sumit.garg/T2502/poky/build/tmp/work/aarch64-poky-linux/psmisc/23.2-r0/recipe-sysroot-native/usr/bin/autopoint:
485: /home/sumit.garg/T2502/poky/build/tmp/work/aarch64-poky-linux/psmisc/23.2-r0/recipe-sysroot-native/usr/bin/autopoint:
xz: not found
| tar: This does not look like a tar archive
| tar: gettext-0.19.3: Not found in archive
| tar: Exiting with failure status due to previous errors
| autopoint: *** infrastructure files for version 0.19.3 not found;
this is autopoint from GNU gettext-tools 0.19.8.1
| autopoint: *** Stop.
| autoreconf: autopoint failed with exit status: 1
| WARNING: exit code 1 from a shell command.

But looking at this failure again it seems like "autopoint" is
provided by gettext rather than autotools. So yes, I think you are
right and "xz-native" dependency should go in
meta/classes/gettext.bbclass instead as follows:

diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index be2ef3b311..443c9c4cb0 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -2,8 +2,8 @@ def gettext_dependencies(d):
     if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d,
'cross-canadian'):
         return ""
     if d.getVar('USE_NLS') == 'no':
-        return "gettext-minimal-native"
-    return "gettext-native"
+        return "gettext-minimal-native xz-native"
+    return "gettext-native xz-native"

 def gettext_oeconf(d):
     if d.getVar('USE_NLS') == 'no':

-Sumit

> Cheers,
>
> Richard
>

