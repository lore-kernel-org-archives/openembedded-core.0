Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0DE7F74FE7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 19:43:51 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id w129-v6so7574460pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 12:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YwdoOr0r2Jl9kMykxd7S7ezQBdBlfK0YoYmXIj7MfsU=;
	b=p2PiZx0lOO5BMLiiLh5qfcXr9Zm1XOscpmDtW22HCEejT9GKI1USFqqMprpAao4hID
	wf1t+lwGMl7STHERZhfFleadx4pNm8ALSABzBGyayl28dJKLcEhR4mVUX219oXG5lTiw
	MLYhVujWtFdYevVovlPXLctKg7Ho2jzA4O0ua5vnYfRej6yUrjZ1/vr0JJXAjdobyqNk
	wcM4e3AZDIRrt7t0z3J7TdHwGRPr0f+0MLi3otcLZti56sgCkDwbS1+ZzHY+xvQ/4vw2
	EOeWZ+86o9Q30c7tE/1WbS+53NEx/mWVrghLnCL2D16/vqkNjj8D7r5h5NZ8gSoUJVkv
	81Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YwdoOr0r2Jl9kMykxd7S7ezQBdBlfK0YoYmXIj7MfsU=;
	b=sOs0gX1vVhmOA1W9/0cY44AoeYcfQHVRx3CaIK34YB6ZlsBj8q0gZ2zVf7COJE1AT7
	Fm/SYlRU8SIc65yTC47+s5z3ARPr45VozOapDyTN+0rraF2WbRayPC6g5tglZ2I98XSf
	Sel6+3KRATn9KFYAE7MCANLyu+MkeIzK7ycK54XhuFYpad9iM/CAp3/OWqwGPMcJnRly
	KZcrbMVQE8C5Ehg0uz593+uiHFX2LZF+wYnD7/w3PmPiNMO2KgRFG6C291/OH5DKO7YN
	L6r/hp71nV2+r8bZRH+38NdOrauCdZvYPd5J1ZNfDF/bbYWggpfak8d4OHrlzMfrDkaL
	wpJQ==
X-Gm-Message-State: ALKqPwf8+8G0GDefmwraklQx65WZZNRciUuVgjKDPki4+n/YmJKZbyBe
	7CvXEolasXLIz8BIOi5F5iWtww==
X-Google-Smtp-Source: AB8JxZqVDA+y0XIuNUA4VHq+J0S+MgPEUy/Kj1PYfDtRLVm/XkCgX8ZXOY3Og4gKDQ/yA7AFzi5pIg==
X-Received: by 2002:a63:7251:: with SMTP id
	c17-v6mr6979653pgn.196.1526931832813; 
	Mon, 21 May 2018 12:43:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:cda1:4d10:a5a1:339b])
	by smtp.gmail.com with ESMTPSA id
	v1-v6sm29723032pfd.2.2018.05.21.12.43.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 May 2018 12:43:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2018 12:43:48 -0700
Message-Id: <1526931828-20358-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526931828-20358-1-git-send-email-akuster808@gmail.com>
References: <1526931828-20358-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] python3-ply: add package needed by bind 9.12 update
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
X-List-Received-Date: Mon, 21 May 2018 19:43:52 -0000

move package from meta-python

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python-ply.inc     | 18 ++++++++++++++++++
 meta/recipes-devtools/python/python-ply_3.11.bb |  2 ++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-ply.inc
 create mode 100644 meta/recipes-devtools/python/python-ply_3.11.bb

diff --git a/meta/recipes-devtools/python/python-ply.inc b/meta/recipes-devtools/python/python-ply.inc
new file mode 100644
index 0000000..a744950
--- /dev/null
+++ b/meta/recipes-devtools/python/python-ply.inc
@@ -0,0 +1,18 @@
+SUMMARY = "Python Lex and Yacc"
+DESCRIPTION = "Python ply: PLY is yet another implementation of lex and yacc for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/ply"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://README.md;beginline=5;endline=32;md5=f5ee5c355c0e6719c787a71b8f0fa96c"
+
+SRC_URI[md5sum] = "6465f602e656455affcd7c5734c638f8"
+SRC_URI[sha256sum] = "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3"
+
+inherit pypi
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-shell \
+"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/python/python-ply_3.11.bb b/meta/recipes-devtools/python/python-ply_3.11.bb
new file mode 100644
index 0000000..2b6165c
--- /dev/null
+++ b/meta/recipes-devtools/python/python-ply_3.11.bb
@@ -0,0 +1,2 @@
+require python-ply.inc
+inherit setuptools
-- 
2.7.4


