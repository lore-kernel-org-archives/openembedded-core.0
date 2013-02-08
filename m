Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pmiscml@gmail.com>) id 1U3sJS-00069Q-Pv
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 19:04:39 +0100
Received: by mail-ee0-f41.google.com with SMTP id c13so2251648eek.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 09:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=vMlq4GFqRxLMMAu4lZaZTyFOVRiSXa5OLCPWQow4HMk=;
	b=HfxhZmo6rHeDLFEsmx0EmrflF+4Mato6/UZNslWUE8IPmQzkPsjlxwN54cfNIytakS
	eH131IXguZXSIfpjThWAb7tJN6f/drrB/vA4+J7LSQcr1ExZ7CGXMj85jv1wFokYSe0p
	q866RFnwaGmTDVkoj/3/t2QrB2ABgj2kSD0t3yQkfHgKLM0uRHWHXW6D2MWKP3dosRPN
	9ufKmitCARXGttLbJQNHmaur1tsA300FMhV2CDqrBrEmTbcYtvCERg/+/0c/91qQdh4h
	br4Jk/TEm2obE38aqnYJhea5JF0KsSJnL7awyvBc47G662PXTNQdye1KRIOcway1j2vO
	nyDw==
X-Received: by 10.14.209.131 with SMTP id s3mr18087381eeo.26.1360345724915;
	Fri, 08 Feb 2013 09:48:44 -0800 (PST)
Received: from x34f ([95.15.206.176])
	by mx.google.com with ESMTPS id o3sm48460643eem.15.2013.02.08.09.48.40
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 09:48:42 -0800 (PST)
Received: by x34f (sSMTP sendmail emulation); Fri, 08 Feb 2013 19:48:39 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 19:48:37 +0200
Message-Id: <0d914f6415e72c6d9999b0f2f5b3e6c8ec209363.1360332752.git.pfalcon@users.sourceforge.net>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360332752.git.pfalcon@users.sourceforge.net>
References: <cover.1360332752.git.pfalcon@users.sourceforge.net>
Subject: [PATCH 1/1] ccache.bbclass: Allow user to override CCACHE_DIR.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 18:04:39 -0000

For example, some users may want to use single cache directory (instead
of per-package) with known max size limit, to better control disk usage.

Signed-off-by: Paul Sokolovsky <pfalcon@users.sourceforge.net>
---
 meta/classes/ccache.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index cd06a4b..ca3ca43 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,5 +1,5 @@
 CCACHE = "${@bb.which(d.getVar('PATH', True), 'ccache') and 'ccache '}"
-export CCACHE_DIR = "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
+export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
 CCACHE_DISABLE[unexport] = "1"
 
 do_configure[dirs] =+ "${CCACHE_DIR}"
-- 
1.7.9.5



