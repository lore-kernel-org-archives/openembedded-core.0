Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0C6687F3B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:27:02 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id p1so8649527pgi.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XcOancrhepmhoCwcUI4lujiuE1xxfe3NajkiNt6NWnk=;
	b=PEH5WfRvfhrWIBri+lMxf7GJqfKzVnjqwEgdPjNNETj5HJLwl839e4bdbEtiJYCGEt
	XJo62Kqinq5Lp+RhkFI0TGi+YmRFiNOwh0ZO/rapt1nRVkHDP3t+n1Dz+xX6qD0/aOmJ
	Qot7cB5uCY7Q1xIo2Xn0f91DSbtB5YJzjE3jIJsgtEIfsb0TnXf3glTWJKKee7O1Ut2d
	8KDoK6gts1kkTxd8aGxlFHs+aSKhXUZrFj61aCKI4tlecg2ypLxLBwr+HmCL58iX9P/U
	00/2fp5SIeRbH2MNjN6W2ZiJ3D4ZVT8pNC/9A5Ui276iGPhJXj6CXWXTGA9FQFrs+oIE
	eG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XcOancrhepmhoCwcUI4lujiuE1xxfe3NajkiNt6NWnk=;
	b=ryCTYt6TidkZNR/QOZCyFYIboLlAxA4PBL6JJ7ZTK3YKyW/XEKxAj0rwR3WFSYUKuB
	pps4susYhP/pWKZI0Regruzvp9tfUvNCIwrDr/f+0NK/RHBnJUFrW+4bI7kp6YQdcG78
	Lu7wwHOsG3xLQrS6IVZSW/BmTSjJ+ZQ9bC2MQzggKmDzOXLzxhgtQzzUVyiEPXhtHaUg
	qsUoXMGKqPorwmeMidXJijHMfFlY67qG9RK0e6cMTUxTMbI3tJs+07T3nHHEH1NGR2RN
	huMbvhzD/AmikoO0n9v37brMV4c+EPi+CRXzMoJgF7/mqb5jusGgB1u1fL7w7IKeNgcN
	TLeg==
X-Gm-Message-State: APjAAAU3c2xUB5GBT4UYT9oVpKZ1R4+a8xgixjshhW8FnmoHVcCG6CYz
	KwhXasETImxkXKOkVS19YsH9dZPQezs=
X-Google-Smtp-Source: APXvYqzWED/y1RyuQLdBWqVpVoAYwCIQG5QjhDPRYgR0zdo9wXNmBB/qM7+2L2TasMmmCIF13e1UVg==
X-Received: by 2002:a62:2ccf:: with SMTP id
	s198mr40399822pfs.216.1570548423135; 
	Tue, 08 Oct 2019 08:27:03 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	x18sm18420763pge.76.2019.10.08.08.27.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:27:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:26:44 -0700
Message-Id: <e6728a873f1eef335a9e21bdface304f13f0c952.1570548180.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570548180.git.akuster808@gmail.com>
References: <cover.1570548180.git.akuster808@gmail.com>
Subject: [thud 12/12] uninative: Update to 2.7 release
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
X-List-Received-Date: Tue, 08 Oct 2019 15:27:02 -0000

From: Michael Halstead <mhalstead@linuxfoundation.org>

The 2.7 release updates glibc to version 2.30. Recently added to openSUSE
Tumbleweed and needed for Fedora Core 31.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index df24346..ad75d3e 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.29"
+UNINATIVE_MAXGLIBCVERSION = "2.30"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.6/"
-UNINATIVE_CHECKSUM[aarch64] ?= "a37118fc8b423f48146120707b81dd15017512c3e8ef9e6ca2cb3a033f4f4046"
-UNINATIVE_CHECKSUM[i686] ?= "3234fc3ded810225071f23a0e9a99f4f8c2480059945a848eff076ce78122ade"
-UNINATIVE_CHECKSUM[x86_64] ?= "133387753a9acf3e1b788103c59fac91e968e2ee331d7a4b9498e926ada7be57"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.7/"
+UNINATIVE_CHECKSUM[aarch64] ?= "e76a45886ee8a0b3904b761c17ac8ff91edf9811ee455f1832d10763ba794dfc"
+UNINATIVE_CHECKSUM[i686] ?= "810d027dfb1c7675226afbcec07808770516c969ee7378f6d8240281083f8924"
+UNINATIVE_CHECKSUM[x86_64] ?= "9498d8bba047499999a7310ac2576d0796461184965351a56f6d32c888a1f216"
-- 
2.7.4


