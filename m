Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id E2E957FE68
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:50:16 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id r67so591131pjb.0
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=semGvceRmDuX7FntPOWH59mK7Gl9kwubptYYf2tvmJc=;
	b=byzcZCmbzdzGy73+BS6p12zVAJNh/2s/O7maMe3h1+BvHCTuO2sdGOROiTjgpKHn6z
	uZkHh2Nsn9W1gGF+LaUiJL3N3ylwGgGQVNjvWXOFbJ1eIIgAfTVL5wmDRTxuxVFl3Zkp
	GWUpzP0jil6HcxJqZxgwVtZL4ICYLC4/mL0zCesuH2f0hn767pm/Q5mIgKPq3qb8BTQX
	ehL/xy2hHDOGJRfn3a3subSrWiD/HXjy19CywVYENesG/33sZjf7C/Ssr6qtyRN2BZWv
	61pVim4Uh6VJyiqfX4Er/UUl24WVlKKUgbCwZvTXYxa/1CmQvPgWd9mDEvhOY9zg0A2n
	6j0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=semGvceRmDuX7FntPOWH59mK7Gl9kwubptYYf2tvmJc=;
	b=au3pAuGYdsCVYmKj4hcNYpNSWCNd9c8D60CLaFcIkSBbX69qX3zJBCZMV78VYCTsto
	h5STRl5KgOVZmYogGnkE/1vffxGnpRxiQaaqyt1QISGR3NLF7tjcI54dfmellootWK4M
	D3hywi3Sx0HGW94ld5Vw8xW9z+jQSKh4lEKArUZCUhyB4piLM0oKbTl2y05LiE/NBx+e
	VAntOZH6c38ZsqpgtDQC1R9Cz527VkwkDsBSTXFvIgCK8Eayf9Vhn+/vCeixgatUSP2r
	wNWokxOsvHKlIOZMp1sPAqMb0V1c3sManUSZU44KX29QNKOa7ZUS2pm7rNiTIQv1vijB
	2KQA==
X-Gm-Message-State: APjAAAUIJSD2MNymxAx4ZMYUuIQafMzpNxJvpKg1A/h93fxzj3hIkdm8
	6K63yDtx29cRkwtD3gmHF+JV68UH
X-Google-Smtp-Source: APXvYqyUryh5utNHMmS5MP4KOJU5JDSoDgJgNXsDXgUJn4ROBVRCQtORWcUp4S0YlRl/OOPf/Bmskw==
X-Received: by 2002:a17:90a:e397:: with SMTP id
	b23mr2897281pjz.135.1578545417844; 
	Wed, 08 Jan 2020 20:50:17 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.50.16
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:50:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:43 -0800
Message-Id: <e6c4017727008ac2f665e843d59d53b584f3f1b3.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
Subject: [zeus 24/28] python3: RDEPEND on libgcc
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
X-List-Received-Date: Thu, 09 Jan 2020 04:50:17 -0000

From: Joshua Watt <jpewhacker@gmail.com>

=help>
List-Subscribe:
 <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
 <mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Sender: openembedded-core-bounces@lists.openembedded.org
Errors-To: openembedded-core-bounces@lists.openembedded.org
X-Virus-Scanned: clamav-milter 0.101.4 at dan
X-Virus-Status: Clean
X-Evolution-Source: 1525863794.3857.16@hex
Content-Transfer-Encoding: 8bit

Python uses features of glibc that require it to dynamically load (i.e.
dlopen()) libgcc_s at runtime. However, since this isn't a link time
dependency, it doesn't get picked up automatically by bitbake so
manually add it to RDEPENDS.

There is an outstanding bug in Python to make it explicitly link against
libgcc at link time which would remove the need for this. See:
https://bugs.python.org/issue37395

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df107f3a149b1e88d9f869e7ff87950ccf5aaee0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python3_3.7.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.7.6.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
index d3706cdf64..407c5a2bd9 100644
--- a/meta/recipes-devtools/python/python3_3.7.6.bb
+++ b/meta/recipes-devtools/python/python3_3.7.6.bb
@@ -322,6 +322,8 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MA
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
+# See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
+RDEPENDS_${PN} = "libgcc"
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
-- 
2.17.1


