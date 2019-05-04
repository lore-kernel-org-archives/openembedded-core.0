Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 28F737D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:43 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z3so509001pgp.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qQxCzIMju/4N0U2B3GqUBoH+ufq9omsvCSRYk2F5RWU=;
	b=LM3JcNbFYxfCis6mMh47aiSsIgMseBP5ensMUd5P6smpWwvC20CQef7zJZtI0Qd3Wl
	2h+4eQYYve3K/piVOp5YMlX55ri7ck53Rln7nq23nvQH2sG/fRgDoVNP+NJdYVjC8ksB
	FLmxm/1O7WTwT0r/7tdAwYxccLPa6lZmsb585KH2yUJEDsC/eHz+/U49aqGEsuA2OOB7
	cMO4J7W66SehPzx/9qtcdWGWqWhMuWUu2xg83R9Y0yxxs8B3XUm8sY4VLeBEnxnZaHr5
	r/lN+OXpqWQBNRMaLrSz1TopoS4fr4UUOpifdPsbd+gRkbOaHhCS3/udnDZvUJVvoW6z
	0QZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qQxCzIMju/4N0U2B3GqUBoH+ufq9omsvCSRYk2F5RWU=;
	b=Z+zGZ1W0aik+iq2rOo2UpufoCjyVszw6iXH/7Y7tUXIm6utqvSBjQ/dzg7vBRCOYT1
	xphx87bKeP5mqhzkR36/GgvMdYDKze9eT1zBZjI2o90Y4e47hP2Rh8Myem+QHUKGMTey
	hgwicx5Ce6T9An7v6ekIY1mDE+20UHkiQmTE3HUtIaQ2RQHBmIN71Hzzi1fAInXUfDDp
	25m9k6sGN3hQWBcgA1xkUcrOe/eSRXLp4dUonDyvsQ8QsBEt4Qta1cPhF1zccTpssJ0g
	q9ef8pVQK5SQOyDO9cTr2mOoJhUH9IPdqSbt/Wxpiy5XhBEMMzoCPaRKm/6PUn/Y0V18
	WbgQ==
X-Gm-Message-State: APjAAAX8CSuL8EcEm/IFggHKDp6j3EWs5W34NksmduTt7Z/cj+959/Zl
	3cl4+qWZtvPdqWzzsBasHjDluRbg
X-Google-Smtp-Source: APXvYqy9oKhpqD7Ws0uaZYk1yW40dIGIZjWkhvqX6kD92w57myjKPWUOQ4qnwVOLZFDDL5kkoDfYuQ==
X-Received: by 2002:a63:4c06:: with SMTP id z6mr9318085pga.296.1556983664263; 
	Sat, 04 May 2019 08:27:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:54 -0700
Message-Id: <e30cd19250c14112a96a2e89327fd75933016469.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 18/43] icecc.bbclass: stop causing everything to be effectivelly MACHINE_ARCH
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
X-List-Received-Date: Sat, 04 May 2019 15:27:43 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* since this change:
  commit d2fcaeb153fdc3f8d7143ea823139f1537055ff1
  Author: Douglas Royds <douglas.royds@taitradio.com>
  Date:   Thu Dec 20 11:59:47 2018 +1300

    icecc: Don't generate recipe-sysroot symlinks at recipe-parsing time

  the set_icecc_env function depends on KERNEL_CC variable even for recipes
  like linux-libc-headers

* KERNEL_CC variable depends on STAGING_KERNEL_DIR:
  Variable KERNEL_CC value is ${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}
  List of dependencies for variable KERNEL_CC is {'STAGING_KERNEL_DIR', 'HOST_PREFIX', 'DEBUG_PREFIX_MAP', 'HOST_CC_KERNEL_ARCH', 'KERNEL_SRC_PATH'}

  which depends on MACHINE:
  Variable STAGING_KERNEL_DIR value is ${TMPDIR}/work-shared/${MACHINE}/kernel-source
  List of dependencies for variable STAGING_KERNEL_DIR is {'MACHINE'}

* as detected with:
  openembedded-core/scripts/sstate-diff-machines.sh --tmpdir=tmp-glibc --machines="qemux86 qemux86copy qemuarm" --targets=glibc --analyze

  ERROR: linux-libc-headers different signature for task do_configure.sigdata between qemux86 and qemux86copy
  NOTE: Starting bitbake server...
  basehash changed from 3146f4ffeb002bd69fed7656a4b896365b2e2a00071c69e1afbb672889e754ee to f1a5160e39912e61389b6f9fe68d61146a2be91716ac37e4a32ecf4c09b2b5fa
  Variable MACHINE value changed from 'qemux86' to 'qemux86copy'

  $ bitbake-diffsigs /OE/build/oe-core/tmp-glibc/sstate-diff/1556122458/qemux86*/*/linux-libc-headers/*do_configure.sigdata*
  NOTE: Starting bitbake server...
  basehash changed from f1a5160e39912e61389b6f9fe68d61146a2be91716ac37e4a32ecf4c09b2b5fa to 3146f4ffeb002bd69fed7656a4b896365b2e2a00071c69e1afbb672889e754ee
  Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[commit in warrior]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/icecc.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 6d003dc..edb0e10 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -312,6 +312,7 @@ def set_icecc_env():
     # dummy python version of set_icecc_env
     return
 
+set_icecc_env[vardepsexclude] += "KERNEL_CC"
 set_icecc_env() {
     if [ "${@use_icecc(bb, d)}" = "no" ]
     then
-- 
2.7.4


