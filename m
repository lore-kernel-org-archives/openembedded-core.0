Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f172.google.com (mail-it1-f172.google.com
	[209.85.166.172])
	by mail.openembedded.org (Postfix) with ESMTP id 63A857BFF8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 11:17:43 +0000 (UTC)
Received: by mail-it1-f172.google.com with SMTP id h65so8858413ith.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 03:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/YLMofH+SyxMokvApP/QHSYUHxVm+NIlXCYpeN4J+eI=;
	b=Pd6BOHVCYHp6Cg2rxC7kHbak2A1g3BhYs3cotKHrJCeFqkRNeaJBPYL9yAL5/l6NJF
	SeLlhv7DSmimP7XIkum7sZ1p8O1pDssigM65Sy644eW5B8FpbxhkgMmFjoT9idjpYiFD
	pdXZ6xYheb6JETWvYaOBdh9DHpCZBBjgZWr5LU0atnPh8TAyfaDO72JQYGVchS7X64K4
	pmFyujuIo1Jf0QTnPY8ZdOkWg9puZBeST9jhhS8kDguMfSpSgEn2z/ELHIgP476bQEqK
	VUkUNOn7uP4pVNx2AgqiQzBX+PTVHMzcy1yVGvPp4v+0ytKJuA5wp5JT2HA5xBvdXgJT
	y6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/YLMofH+SyxMokvApP/QHSYUHxVm+NIlXCYpeN4J+eI=;
	b=CG7/+KoVXKUy9OyDyc3rBV7JqLkH1jl95ZjdOdI4SinCu9ZekbDkx9owcOkR4usden
	48IyxDjZNg5EDTvRK2Tj7KigI3xjg/WvIcUchpxc5hJ0BEMA6O8oFgflzZalVxde385O
	m/RWW69UNslg7Ey8D0Fd+CCKKX0M+kOxuote/AewGsSDv3oAC1eGFa544f7Nzn3kGk8k
	a772XIqrRX12hDHLHaTNyurHvoGdWrpL7hJZsxFaqh7UxEFzg6RyiQ+h3Z5bJkM2G2Zo
	lPWilq+WU6MkWGdvhYqnIL/1QPHATxDR74bnRKoJMPXSXUZzNakUF0bxcyhRq3JTfHwu
	lpEg==
X-Gm-Message-State: AA+aEWYXREAfQnVdWraY1DrLf0m84J+g+dACmvDlN3bX+a4aB2bj8SpQ
	Y7rxGiNiRCG+q+K1j2Ddzeuk1s+nPD0IFnTBDK2Wgg==
X-Google-Smtp-Source: AFSGD/WcNyFXXp1zEsE41Qz7ofWKwGi7SjLaYBoBbxkaDI/w9GVmOJvTZLitJW2YIasH4+ixDg6Ykj5a6yYjcqUolAQ=
X-Received: by 2002:a24:8e43:: with SMTP id h64mr5778873ite.26.1545218264358; 
	Wed, 19 Dec 2018 03:17:44 -0800 (PST)
MIME-Version: 1.0
References: <1544525848-72525-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1BBD245@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B1BBD245@G08CNEXMBPEKD01.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Dec 2018 11:17:32 +0000
Message-ID: <CAJTo0Lb+ibZRCJsumRqYACE9kdo1haoZA8kM2EaArwqP3WAufg@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH v2] createrepo-c: Fix setup of logging (log domains)
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
X-List-Received-Date: Wed, 19 Dec 2018 11:17:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There's an upgrade for createrepo-c on the list, does that supersede this p=
atch?

Ross
On Wed, 19 Dec 2018 at 07:12, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com> w=
rote:
>
> Ping
>
> --------------------------------------------------
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
> > -----Original Message-----
> > From: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6
> > Sent: Tuesday, December 11, 2018 6:57 PM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu=
.com>
> > Subject: [OE-core][thud][PATCH v2] createrepo-c: Fix setup of logging (=
log
> > domains)
> >
> > New debug messages were added into GLib library. These messages come fr=
om
> > the "GLib" log domain and were not hidden in the standard and quiet mod=
e of
> > the application.
> > This fix hides log messages regardless on source log domain.
> >
> > Backport from 80810f04f2de6bae6e394f52ad9cdd2189862f74.
> >
> > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > ---
> >  ...etup-of-logging-log-domains-RhBug-1645897.patch | 73
> > ++++++++++++++++++++++
> >  .../createrepo-c/createrepo-c_git.bb               |  1 +
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/000=
1-
> > Fix-setup-of-logging-log-domains-RhBug-1645897.patch
> >
> > diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Fix-s=
etup-of-
> > logging-log-domains-RhBug-1645897.patch b/meta/recipes-devtools/creater=
epo-
> > c/createrepo-c/0001-Fix-setup-of-logging-log-domains-RhBug-1645897.patc=
h
> > new file mode 100644
> > index 0000000..6de9c05
> > --- /dev/null
> > +++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Fix-setup-of=
-
> > +++ logging-log-domains-RhBug-1645897.patch
> > @@ -0,0 +1,73 @@
> > +From 80810f04f2de6bae6e394f52ad9cdd2189862f74 Mon Sep 17 00:00:00 2001
> > +From: Jaroslav Rohel <jrohel@redhat.com>
> > +Date: Fri, 9 Nov 2018 07:35:13 +0100
> > +Subject: [PATCH] Fix setup of logging (log domains) (RhBug:1645897)
> > +
> > +New debug messages were added into GLib library. These messages come
> > +from the "GLib" log domain and were not hidden in the standard and
> > +quiet mode of the application.
> > +This fix hides log messages regardless on source log domain.
> > +
> > +Upstream-Status: Backport
> > +
> > +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > +---
> > + src/createrepo_shared.c | 19 ++++++-------------
> > + src/misc.c              |  5 ++++-
> > + 2 files changed, 10 insertions(+), 14 deletions(-)
> > +
> > +diff --git a/src/createrepo_shared.c b/src/createrepo_shared.c index
> > +8a26787..7cb8ba8 100644
> > +--- a/src/createrepo_shared.c
> > ++++ b/src/createrepo_shared.c
> > +@@ -270,24 +270,17 @@ cr_lock_repo(const gchar *repo_dir,  void
> > +cr_setup_logging(gboolean quiet, gboolean verbose)  {
> > +-    g_log_set_default_handler (cr_log_fn, NULL);
> > +-
> > +     if (quiet) {
> > +         // Quiet mode
> > +-        GLogLevelFlags levels =3D G_LOG_LEVEL_MESSAGE | G_LOG_LEVEL_I=
NFO |
> > +-                                G_LOG_LEVEL_DEBUG | G_LOG_LEVEL_WARNI=
NG;
> > +-        g_log_set_handler(NULL, levels, cr_null_log_fn, NULL);
> > +-        g_log_set_handler("C_CREATEREPOLIB", levels, cr_null_log_fn, =
NULL);
> > ++        GLogLevelFlags hidden_levels =3D G_LOG_LEVEL_MESSAGE |
> > G_LOG_LEVEL_INFO |
> > ++                                       G_LOG_LEVEL_DEBUG | G_LOG_LEVE=
L_WARNING;
> > ++        g_log_set_default_handler (cr_log_fn,
> > ++ GINT_TO_POINTER(hidden_levels));
> > +     } else if (verbose) {
> > +         // Verbose mode
> > +-        GLogLevelFlags levels =3D G_LOG_LEVEL_MESSAGE | G_LOG_LEVEL_I=
NFO |
> > +-                                G_LOG_LEVEL_DEBUG | G_LOG_LEVEL_WARNI=
NG;
> > +-        g_log_set_handler(NULL, levels, cr_log_fn, NULL);
> > +-        g_log_set_handler("C_CREATEREPOLIB", levels, cr_log_fn, NULL)=
;
> > ++        g_log_set_default_handler (cr_log_fn, GINT_TO_POINTER(0));
> > +     } else {
> > +         // Standard mode
> > +-        GLogLevelFlags levels =3D G_LOG_LEVEL_DEBUG;
> > +-        g_log_set_handler(NULL, levels, cr_null_log_fn, NULL);
> > +-        g_log_set_handler("C_CREATEREPOLIB", levels, cr_null_log_fn, =
NULL);
> > ++        GLogLevelFlags hidden_levels =3D G_LOG_LEVEL_DEBUG;
> > ++        g_log_set_default_handler (cr_log_fn,
> > ++ GINT_TO_POINTER(hidden_levels));
> > +     }
> > + }
> > +diff --git a/src/misc.c b/src/misc.c
> > +index 9937480..9549a44 100644
> > +--- a/src/misc.c
> > ++++ b/src/misc.c
> > +@@ -912,8 +912,11 @@ void
> > + cr_log_fn(const gchar *log_domain,
> > +           GLogLevelFlags log_level,
> > +           const gchar *message,
> > +-          G_GNUC_UNUSED gpointer user_data)
> > ++          gpointer user_data)
> > + {
> > ++    gint hidden_log_levels =3D GPOINTER_TO_INT(user_data);
> > ++    if (log_level & hidden_log_levels)
> > ++        return;
> > +     switch(log_level) {
> > +         case G_LOG_LEVEL_ERROR:
> > +             if (log_domain) g_printerr("%s: ", log_domain);
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
> > b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
> > index 2960811..08766b3 100644
> > --- a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
> > +++ b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
> > @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> >  SRC_URI =3D "git://github.com/rpm-software-management/createrepo_c \
> >             file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python=
.patch \
> >             file://0001-Correctly-install-the-shared-library.patch \
> > +
> > + file://0001-Fix-setup-of-logging-log-domains-RhBug-1645897.patch \
> >             "
> >
> >  PV =3D "0.11.1+git${SRCPV}"
> > --
> > 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

