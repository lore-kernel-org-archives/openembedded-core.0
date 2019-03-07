Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 01BB37CE63
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 05:00:23 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id l139so13829813ita.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 21:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FHCju3XKRsVbbIWPSE8dYCodo3hFJO4dkwdmPj7LO5k=;
	b=jaiSQn41zx3OJz/B2jz9JTOv/sw0Y6fxjgvwUkIUEkzCOJzpMwl12Bpw4XR4xTSX+k
	R4NVgfP/WY6gOp2Vg7ITAkxruyhn+CTFd1Pi3e2s3nf/FroQUZwi+ElM0YRlSQ4bm6pX
	sKBDztKQHAqLk0Z4dUfMLz4xKVbUFPLqPsE+EG9MiPNos+0uV3Kb0pp2fo2e115xjCbo
	GHw6iFwGZTBryS3bv3qP3gcGwJ1J/hb3Txf3pbnN+rKWMj3W8OQSsyEsd5W1wbWOqTB8
	XFVY1NV0BT1qu+AX+SJWP2qqf/xGkKunurBv65o2ibQt1Zi0P4TQG3lunbeU2Kk/tHtz
	BJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FHCju3XKRsVbbIWPSE8dYCodo3hFJO4dkwdmPj7LO5k=;
	b=qJ+4RNbIX3NCxTMQNNj4tPHKk+8+sxdID9FzbBvpapuEQj6YAAV9hbh1eu2GU+p69Q
	9KhMdXsfhFdHTe+eq5BUs6ByU0ptPwHYSBV/pef62DMlfmRTxHK/7EXDqlg9DtXZQpNT
	SgrfOBg00W97fzZrzkzdRdfDaW97H0Me/JAUcaBeeErGP/GggynicFJl62rjmohaJyVU
	UU5o3MxMFi3oaOBDeUcRvZfXfaPUy0+qvv8kL8P2XhqhCwuN+cEn3vCMYy8mPaYwdDKL
	Rb9F74HGuyLowDXkz8hwiwg8KS/0aUg3BmeDACxjmnsnwptiwfxUHqFavbbw+Hh9nX1V
	r2EA==
X-Gm-Message-State: APjAAAWrUQF2gfy5n0VUc0dTYhL+NbvO3hqkBdiVhBNMMWJZZVhzk0tT
	ZsHkE2StMfIoJfQduuq4QqA=
X-Google-Smtp-Source: APXvYqxDyxKlBtrBO31/Nu2V9g3ySSzF2CoiZWElrj79/WOzwVXbdsQABq1EIZdzAx2P2tnVagDs3A==
X-Received: by 2002:a24:7a48:: with SMTP id a69mr4457383itc.142.1551934824844; 
	Wed, 06 Mar 2019 21:00:24 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	o141sm1811451ito.14.2019.03.06.21.00.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 21:00:23 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu,  7 Mar 2019 00:00:19 -0500
Message-Id: <20190307050019.23389-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190307050019.23389-1-bruce.ashfield@gmail.com>
References: <20190307050019.23389-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] kernel-devsrc: add files required for on-target build with 5.x
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
X-List-Received-Date: Thu, 07 Mar 2019 05:00:24 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Both powerpc and mips require a few new files for the scripts
and prepare targets to work with a 5.0 kernel. We add the required
files to the architecture specific blocks, with appropriate
backwards compatibility considerations.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 8fc0ffdbb3..cf2b476051 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -150,6 +150,13 @@ do_install() {
             cp -a --parents arch/arm64/kernel/module.lds $kerneldir/build/
 	fi
 
+	if [ "${ARCH}" = "powerpc" ]; then
+	    # 5.0 needs these files, but don't error if they aren't present in the source
+	    cp -a --parents arch/${ARCH}/kernel/syscalls/syscall.tbl $kerneldir/build/ 2>/dev/null || :
+	    cp -a --parents arch/${ARCH}/kernel/syscalls/syscalltbl.sh $kerneldir/build/ 2>/dev/null || :
+	    cp -a --parents arch/${ARCH}/kernel/syscalls/syscallhdr.sh $kerneldir/build/ 2>/dev/null || :
+	fi
+
 	# include the machine specific headers for ARM variants, if available.
 	if [ "${ARCH}" = "arm" ]; then
 	    cp -a --parents arch/${ARCH}/mach-*/include $kerneldir/build/
@@ -214,6 +221,9 @@ do_install() {
 	    cp -a --parents kernel/time/timeconst.bc $kerneldir/build
 	    cp -a --parents kernel/bounds.c $kerneldir/build
 	    cp -a --parents Kbuild $kerneldir/build
+	    cp -a --parents arch/mips/kernel/syscalls/*.sh $kerneldir/build
+	    cp -a --parents arch/mips/kernel/syscalls/*.tbl $kerneldir/build
+	    cp -a --parents arch/mips/tools/elf-entry.c $kerneldir/build 2>/dev/null || :
 	fi
 
         # required to build scripts/selinux/genheaders/genheaders
-- 
2.19.1


