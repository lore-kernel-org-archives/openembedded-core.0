Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48])
	by mail.openembedded.org (Postfix) with ESMTP id 924CA7EC92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 15:31:39 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id f17so47938678otq.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 08:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dxcFmyFnlfz3jAar3WQI1jt6vrRz439CgDgsati8VuA=;
	b=PVPq/SV45dFQX/nrjSW/yo+RTvN/CNZFYifbboiQGmqV6kYITUlXNgokk+X7LVovlb
	2Xyc05JrkNA8IfM/Rc7ZqqGqAxD6oJ9EmNTLWhPKPpNxe+1YypvxTMoEBVX43BdMybhZ
	7DrNjXPeJVf4Q54uQvHJlybRKf7t4U1iM96B3/rB2cAi+7h+p5hj4qKFht3rgv+uUQZH
	GgimnhtbnmMhqwJ94vEHlSp73OxyuFIjKS9hwdsSNKlFdS7u6DJHuPEXRjF2CYJ9s2pU
	nW87JYKRNlRcE2hDh9HRtwFmrZ7A7MwuaKzyTwWjpXrlWrC+GoVqlc6LCR5yyqzBfBL4
	DKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dxcFmyFnlfz3jAar3WQI1jt6vrRz439CgDgsati8VuA=;
	b=IE3McytEx4hH+vlJmvdsKX4HaDW9hnQpwMbWZmo/VUohP7fj5QBcL0Xq31gqULIyiH
	IYpIWF6Gw6JV5GGpLZW8B1aja6tLJzRiB8bHb/yeGtEFUFYOOnQU0NFpYSO/9WbuzEDl
	aIXjAwUco8zxO5T8Sm1xiJYhP+ECvf4ICUknSwmIh15SR04pGDjnrP8m6Luy0Zd9yFGm
	1xtxda8SAlxVZQwpncysMMUd3jOb7jN3gcOr4ltK64ZmrivJVwlVuobIFi6KRkKJvzsO
	yRIbLjafAONcZKlMT4RTFK6JWWFPLmwytg4CQUv+Gobxx9YYKyNU0GkLCFBOVcKDY480
	jS1g==
X-Gm-Message-State: APjAAAXFTfWvWv/DdqMozq6NxANR+iXFnhd8I+Z5e+xgqqGHswYmFzyI
	xrg1ABvm07Ld2i1FM4g9AnY=
X-Google-Smtp-Source: APXvYqw8RgoQVtal4pfBDYAOcu0IrmDSkKsOLJ88t2iYL+BsP+Yj5PsOohl80FDrmKhGBPYmUZQGpg==
X-Received: by 2002:a5d:960f:: with SMTP id w15mr536896iol.24.1565796700444;
	Wed, 14 Aug 2019 08:31:40 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id 8sm224570ion.26.2019.08.14.08.31.38
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 08:31:38 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Aug 2019 11:31:30 -0400
Message-Id: <4a83447ee45ae8d1b0c169371777c49369651e2a.1565796002.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1565796002.git.bruce.ashfield@gmail.com>
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] kern-tools: Add SPDX license headers to source files
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
X-List-Received-Date: Wed, 14 Aug 2019 15:31:39 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit:

    Add SPDX license headers to source files

    Kconfiglib/* were under ISC license before they were imported
    here from https://github.com/ulfalizer/Kconfiglib
    Adjusting SPDX header to reflect that fact.

    tools/* all have some sort of GPLv2 headers; adding SPDX header
    to make it obvious.

    This address bug #13334 :
    https://bugzilla.yoctoproject.org/show_bug.cgi?id=13334

    Change-Id: I243f2dd266a398f982798b771e74a67be70ecb52
    Signed-off-by: William Bourque <wbourque@gmail.com>

Signed-off-by: William Bourque <wbourque@gmail.com>
Signen-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 5c1d7f691f..c8e736a987 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Tools for managing Yocto Project style branched kernels"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1bda400e2828845ba0d06c"
+LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249624278c3e343e501"
 
 DEPENDS = "git-native"
 
-SRCREV = "af1a779f662c81da521e4d602f3c6446547d12a2"
+SRCREV = "7604d2d1a49d88e38d5b5854209dc1435b790893"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1


