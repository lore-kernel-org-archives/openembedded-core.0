Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id AF3107FDE2
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:35:00 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id r11so27778256pgf.1
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=semGvceRmDuX7FntPOWH59mK7Gl9kwubptYYf2tvmJc=;
	b=kpfakCvu6rnVzWTsTT8uWuyQCBAnTd4vWR3j6mJX5RBU2vjXH1zq8OwtlhNu1YYeGn
	byN2eVUdijXP8QmeAXoJROiMwprWiPGEOPriqd15kY3TEve/ZdiNKZkNFpraTZKMkrIX
	1p7gKStrSd5aTnFSSoXki9DpAGw17mSoJFqp1UNe9mL8BYdzli6JIOPz1+LwPG22J4Ki
	dAJH89imzOYvpd4sdMIOAyC80myvxB7kOO7qmNAY+e8lanm534/W+bXcJC/qzJ/i4j9P
	FwVRPiC63b7EpElKAYOzaTbI9WA7r7HJ+a1ol5eJq4tKyp/h/J2BUT+SlAdelNIyrxSo
	gHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=semGvceRmDuX7FntPOWH59mK7Gl9kwubptYYf2tvmJc=;
	b=nwFuWtMZNRnFEJjDIxg/Mn9GVDzJKyDqzFcGEVTKf3201JsWN4BN6KtyV236N/cltE
	U4WsXf4BV7jsjEweEYRyx568KEZg+39hnzmPAXhTEqWfsYvupQedAZXDXU6jYDT5A13O
	HEzjJ5wHwYfQje2r/RkqvWtexe590vSUNWA4vHVsdkx/usBZB+mV4uYMNDi0jVlbvjlM
	gztC5nRNP98HCTozMEU0GgC3MsIQRydEGoZNdEd4tWEhd8hdrkboZP6PqepZpw2gCy8h
	ktslExi1vjshv11DeK0h+n9JZiAdINGjk9p9FSQYH/lxSD0W/KivhoU7acalG3rTgTqN
	USiw==
X-Gm-Message-State: APjAAAW3j47DjZOUsDrLbNeUsV4z/xh7a3QbxUidhV2Q6Qri6swgoIwH
	0HBGNfCVaG9ARFKcAR6iWbJZMheF
X-Google-Smtp-Source: APXvYqxS2ZZWLGkteAKgFmUOWdeGY8pTAUfpLWGcg5Qj4R7k8ezM/jPLctisWD+IuDcLBOOM7T3oIg==
X-Received: by 2002:a63:7705:: with SMTP id s5mr111926956pgc.379.1578364501575;
	Mon, 06 Jan 2020 18:35:01 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.35.00
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:35:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:29 -0800
Message-Id: <df689f9fc4a76491f9611b94287f3f17d146ba1c.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
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
X-List-Received-Date: Tue, 07 Jan 2020 02:35:01 -0000

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


