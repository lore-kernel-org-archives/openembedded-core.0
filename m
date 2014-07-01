Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id CF7F56AC8F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 16:05:50 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id cc10so8114924wib.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jul 2014 09:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=j2XVMQg7irpcEdO9BApV0F4s3TAdXHctzu8LLnTC5bw=;
	b=OM+I4wsjx8WEvcfyObM6XP0P6WDoGu+rFV1S/+H1JzDyyRlEDBLjjO4/uqisXdDUZW
	PZGvN9f1uA+i/B32az6KSLybSEGhZGoAMgzJYVFNc+Ei+Av4rq2+c7PqMUFGUXgdRgfD
	qMpNFiwD7a1VMoajr73KL5ywBb5ybQXIEo8Aroth+H0C7Qae/IR68UADJN4sKOrlkWfi
	BfzanZgiyAlkXLsZCD8OopBQvDCbGE7r1chT0WK6CcBNvddSKKo6pPt4BWIstsg6GgQd
	t8fLIudqWIqj7kpbzQ/QWph2XPumqFHkrV0i+xo3STDsCMD+1ao5kGLtDl9QSedSNuGe
	ZePA==
X-Gm-Message-State: ALoCoQncIKyyhrtXcXjEgyhLpxoZ9BjrRMsLiwojgk4RyU2R2tsbXDkp8TsbocvYSkMfwrkvsOWC
X-Received: by 10.194.200.37 with SMTP id jp5mr4081860wjc.120.1404230363425;
	Tue, 01 Jul 2014 08:59:23 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id bq7sm44688087wib.7.2014.07.01.08.59.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jul 2014 08:59:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Jul 2014 16:59:14 +0100
Message-Id: <1404230354-3771-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] glib-2.0: silence QA warnings about libraries outside ${libdir}
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
X-List-Received-Date: Tue, 01 Jul 2014 16:05:51 -0000

The test suite is installed into ${libexecdir} and as that may be outside of
${libdir} the QA test needs to be silenced.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index e2b130b..2eda8a1 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -96,3 +96,5 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
             eglibc-charmap-invariant \
             eglibc-localedata-translit-cjk-variants \
            "
+
+INSANE_SKIP_${PN}-ptest += "libdir"
-- 
1.7.10.4


