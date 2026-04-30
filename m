Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA657FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 14:25:12 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21972.1777559110307754828
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 07:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ExxsNMWX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d77f60944so706132f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777559109; x=1778163909; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+OI9Obm3SO6FklQxJfl3gKeHYfjTj5sqpLSTQGSscw=;
        b=ExxsNMWXLVprULxUTZV7ruNlh+rh5IRCL1+jwZ5lPZOxVUemk8exvU3fdzXLZKplfT
         4FV8SZk6nCnP14djiSKjbc0O3GaUFDFvmo/ZwExJG1vxtP/axYHpBPKicRlLsuC7erH1
         7Q+Uo6v6UnXQZEhiUu1aZ3U0GOHipcgAS5Yqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777559109; x=1778163909;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N+OI9Obm3SO6FklQxJfl3gKeHYfjTj5sqpLSTQGSscw=;
        b=SiNULcGd540OkRDvyONBGNmqr20xCoBKfQvMc+RbvRL1OT6s/98kBVyUM9tMud6DXH
         f+mdHpctnUCAaan1SMvnTcb5WwuWz437aIdRgQ4cVazwe+L4WWapOfY4y4Ts4rgpviVk
         lMaogftPYBcz3DSkUps+fXIp+fVpo0SctD2c+1+c1jXx3UYRy2YPAx+96f5YFSawioQL
         yVURgrYU0BgLc5xbQtzMyEDYLGV/PlJIWnyquOqIR9XvzTB6ZnhkmH9kp4RIIgc93J0Q
         4vfqp5IhzeTAYqHlt4zPONMQQRzjJjtdq/+4G/sQpXGrBU7gChByxH191MS4aNYuK9sB
         Bmiw==
X-Forwarded-Encrypted: i=1; AFNElJ/FbEYtGDk+ia1qqmqFzrJTPFHMHoviEzBk3AYSx1QqniKEQ7lbEIYTSXkPttSnRkZFFNYFiaqpyhPwQq+S51usXg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyA3PBNHK/tcu2EKv4CoNAhWg4oZYxjTZCmqe6iiactlS89AGl/
	mulwXEIfusKHwkx8GBCbdjxG4X+0yth+vjq9eWYHv/t0/arlpw0DfpA/DM8twKv4T7s=
X-Gm-Gg: AeBDievqmK9gTClyxQZFabX/uj4accWkphbmExcBZDBaDIKwrjwkHydPGcr6C+PBN7f
	K9qWbMV/hiCh4WDbECWJh4m7iWhJ+m+0dFU56o47a1kr82y99app5VlR9xLuxXiUcRyyS+a4XbG
	wnVzAfXKTpyfjmaLWg5kBwLFf9RnGdao5rTFIGTAO5qW+UfoXjLc5x5oD3zKJV11O0i9/NAF0Yb
	YSsVebd8lxdo35SsZarrZZ1u6Jn9TgBwdm5TkIti36sjxhM3cWxoFZzLqHwoQEIKqQjOdu2iY7W
	cTzAjML2/qmgeKdWL5hKQKBQcorovRH1WvC08zyCmo1ZLM8zmvCDj+x0OXMmOjIUNgTk6zrnW/K
	nxz3sIgfw/dsmshT55Oo1qrGOD2Ib4bimPQX7GFQdoR6YtO4pIrYEP3UyalW7+AG87jOiqtKeNa
	10LUtcY+au0hVMY/W4rXn/YxhjUKYKFyOTAh0NZsWDUZKDSAQZc5JVNUfBr4Yq6qEbF72ISDhLP
	EkUK7/OOQZE9r+rDMu7nwYcBL4RZEBloKk=
X-Received: by 2002:a05:6000:26ca:b0:442:d9c0:799c with SMTP id ffacd0b85a97d-449399ba255mr5231801f8f.0.1777559108381;
        Thu, 30 Apr 2026 07:25:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c98d:ac74:daf:72a1? ([2001:8b0:aba:5f3c:c98d:ac74:daf:72a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216dedsm14859813f8f.13.2026.04.30.07.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 07:25:07 -0700 (PDT)
Message-ID: <64eb162c5c22721ff9d11d9c1f0d6c15aea3640a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/7] Remove 'extend_recipe_sysroot' from
 'BB_HASHEXCLUDE_COMMON'
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adam.blank.g@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2026 15:25:06 +0100
In-Reply-To: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
References: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236172

On Sat, 2026-04-18 at 20:34 +0200, Adam Blank via lists.openembedded.org wr=
ote:
> It has lain there for a while, obscuring certain aspects of
> how task signatures are calculated.
>=20
> This changeset does not change the current status quo, but
> rather changes the way in which it is implemented. It can be
> followed by changes which further refine what is excluded and
> how, from those tasks which refer to 'extend_recipe_sysroot'.
>=20
> Related discussion:
> https://lore.kernel.org/openembedded-core/aa893eb861bf4dd18e3e84e6bbebdee=
3b0367d1b.camel@linuxfoundation.org/
>=20
> Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
> ---
> Adam Blank (7):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 package_pkgdata: fix typo to stop calling =
undefined function
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 staging: add 'vardepsexclude' to 'staging_=
populate_sysroot_dir'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 staging: add 'extend_recipe_sysroot' to 'v=
ardepsexclude'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cross: add 'extend_recipe_sysroot' to 'var=
depsexclude'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 native: add 'extend_recipe_sysroot' to 'va=
rdepsexclude'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wic-tool: add 'extend_recipe_sysroot' to '=
vardepsexclude'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake.conf: remove 'extend_recipe_sysroo=
t' from
> BB_HASHEXCLUDE_COMMON

This change does have much wider impact than it would first appear.
Even just looking at one of the first tasks in a build, quilt-
native:do_fetch, generating sig data before and after these patches
shows:

bitbake-diffsigs tmp/stamps/x86_64-linux/quilt-native/0.69.do_fetch.sigdata=
.*
NOTE: Starting bitbake server...
basehash_ignore_vars changed from 'frozenset({'LOGNAME', 'BUILD_ARCH', 'PAR=
ALLEL_MAKE', 'USER', 'PRSERV_LOCKDOWN', 'BB_WORKERCONTEXT', 'RUST_BUILD_SYS=
', 'THISDIR', 'COREBASE', 'EXTERNAL_TOOLCHAIN', 'WARN_QA', 'FILESPATH', 'CC=
ACHE_NOHASHDIR', 'BBPATH', 'SHELL', 'STAMPCLEAN', 'CCACHE', 'DEPLOY_DIR', '=
LICENSE_PATH', 'OMP_NUM_THREADS', 'SSTATE_PKGARCH', 'STAGING_DIR_HOST', 'PR=
SERV_HOST', 'BUILDHISTORY_DIR', 'SOURCE_DATE_EPOCH', 'BBSERVER', 'BB_LIMITE=
DDEPS', 'HOME', 'BB_HASHSERVE', 'BB_TASKHASH', 'PATH', 'STAGING_DIR_TARGET'=
, 'STAMPS_DIR', 'GIT_CEILING_DIRECTORIES', 'PRSERV_DUMPFILE', 'extend_recip=
e_sysroot', 'RUST_HOST_SYS', 'TMPDIR', 'CCACHE_DIR', 'SSTATE_HASHEQUIV_OWNE=
R', 'DL_DIR', 'FILESEXTRAPATHS', 'SSTATE_DIR', 'FILE', 'PWD', 'SSTATE_HASHE=
QUIV_METHOD', 'FILE_DIRNAME', 'PSEUDO_INCLUDE_PATHS', 'WORKDIR', 'CCACHE_TO=
P_DIR', 'PRSERV_DUMPDIR', 'SDKPKGSUFFIX', 'SSTATE_HASHEQUIV_REPORT_TASKDATA=
', 'BB_CURRENTTASK', 'PKGDATA_DIR', 'RUST_TARGET_SYS', 'BB_UNIHASH'})' to '=
frozenset({'LOGNAME', 'BUILD_ARCH', 'PARALLEL_MAKE', 'USER', 'PRSERV_LOCKDO=
WN', 'BB_WORKERCONTEXT', 'RUST_BUILD_SYS', 'THISDIR', 'COREBASE', 'EXTERNAL=
_TOOLCHAIN', 'WARN_QA', 'FILESPATH', 'CCACHE_NOHASHDIR', 'BBPATH', 'SHELL',=
 'STAMPCLEAN', 'CCACHE', 'DEPLOY_DIR', 'LICENSE_PATH', 'OMP_NUM_THREADS', '=
SSTATE_PKGARCH', 'STAGING_DIR_HOST', 'PRSERV_HOST', 'BUILDHISTORY_DIR', 'SO=
URCE_DATE_EPOCH', 'BBSERVER', 'BB_LIMITEDDEPS', 'HOME', 'BB_HASHSERVE', 'BB=
_TASKHASH', 'PATH', 'STAGING_DIR_TARGET', 'STAMPS_DIR', 'GIT_CEILING_DIRECT=
ORIES', 'PRSERV_DUMPFILE', 'RUST_HOST_SYS', 'TMPDIR', 'CCACHE_DIR', 'SSTATE=
_HASHEQUIV_OWNER', 'DL_DIR', 'FILESEXTRAPATHS', 'SSTATE_DIR', 'FILE', 'PWD'=
, 'SSTATE_HASHEQUIV_METHOD', 'FILE_DIRNAME', 'PSEUDO_INCLUDE_PATHS', 'WORKD=
IR', 'CCACHE_TOP_DIR', 'PRSERV_DUMPDIR', 'SDKPKGSUFFIX', 'SSTATE_HASHEQUIV_=
REPORT_TASKDATA', 'BB_CURRENTTASK', 'PKGDATA_DIR', 'RUST_TARGET_SYS', 'BB_U=
NIHASH'})'
changed items: frozenset({'extend_recipe_sysroot'})
Task dependencies changed from:
['OE_SHARED_UMASK', 'PV', 'SRC_URI', 'SRC_URI[sha256sum]', 'base_do_fetch',=
 'do_fetch[network]', 'do_fetch[umask]', 'fetcher_hashes_dummyfunc']
to:
['BB_RUNTASK', 'COMPONENTS_DIR', 'OE_SHARED_UMASK', 'PN', 'PV', 'RECIPE_SYS=
ROOT', 'RECIPE_SYSROOT_MANIFEST_SUBDIR', 'RECIPE_SYSROOT_NATIVE', 'SRC_URI'=
, 'SRC_URI[sha256sum]', 'SSTATETASKS', 'STAGING_DIR', 'base_do_fetch', 'do_=
fetch[network]', 'do_fetch[umask]', 'extend_recipe_sysroot', 'fetcher_hashe=
s_dummyfunc', 'oe.path.remove', 'oe.sstatesig.find_sstate_manifest', 'oe.ut=
ils.get_multilib_datastore', 'setscene_depvalid', 'sstate_clean_manifest', =
'staging_copydir', 'staging_copyfile', 'staging_populate_sysroot_dir', 'sta=
ging_processfixme']
basehash changed from fa1058e1378b6cf06cae11a9e251b7ada2d7f81a0de75644c1f69=
3ac842576c0 to a11321c2775abee7697344dca7a79211c5de79a5de60f1e767ed9556ab43=
4982
Dependency on variable BB_RUNTASK was added
Dependency on variable COMPONENTS_DIR was added
Dependency on variable PN was added
Dependency on variable RECIPE_SYSROOT was added
Dependency on variable RECIPE_SYSROOT_MANIFEST_SUBDIR was added
Dependency on variable RECIPE_SYSROOT_NATIVE was added
Dependency on variable SSTATETASKS was added
Dependency on variable STAGING_DIR was added
Dependency on variable extend_recipe_sysroot was added
Dependency on variable oe.path.remove was added
Dependency on variable oe.sstatesig.find_sstate_manifest was added
Dependency on variable oe.utils.get_multilib_datastore was added
Dependency on variable setscene_depvalid was added
Dependency on variable sstate_clean_manifest was added
Dependency on variable staging_copydir was added
Dependency on variable staging_copyfile was added
Dependency on variable staging_populate_sysroot_dir was added
Dependency on variable staging_processfixme was added

which is a lot of non-trivial change and a lot of extra data in the
sigdata file.

Do we really want all of this data to be added into every signature
computation?

Are we 100% sure that add the newly added variable dependencies are
"safe" and won't trigger sstate cache reuse issues?

Right now, I'm very nervous about this.

Cheers,

Richard


