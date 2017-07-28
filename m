Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1F51D78456
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 04:32:55 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y25so12360149pfk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 21:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=D7cMj/A9wUH4UPwmGjvrmlJUeZUBgdS/mS3SGmoygqY=;
	b=I670Q6BGpS8rkgRRZu+qEa9xKn2yJzR4/5m6TINCLrh1iDLjjk8lxfd0BEDP9Q04JH
	Lm8KE/Zp+jRnEUzODdEZoyVXR/fqxRYy0eeHdqzZrrcQJLKEyENDdybmhEjwG50AcPeX
	pa8IJrJXhVSifN4leOmvo1A6k1/hoXN4DqNDaPHBr+0RcURoQGHLn/dsftq5XQV13hRb
	NJ5/6Z9z3Iq1s6X6S5Qe0x3SWpIvldCUL0nizi9/+GtlVI1ZSgIl3+5K7+cMRAhGK4j9
	QeahEGjo6q1N5wRYRQOMTy+lVeWTPkGm7AuPQQLDhhV+OLrOP/LeF8f7nIBSrH41QV5I
	e+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D7cMj/A9wUH4UPwmGjvrmlJUeZUBgdS/mS3SGmoygqY=;
	b=OWs1oFuZtGsXULWZ83aOJwYz6iwpSbFOFkfFHTy3PyVnomKdgH0YxASoEERv+5NoyL
	7bVh07zDGB/uAkfT0eOabkXJATCMQxv+Q9DAeL12Jv39oINlvhGkIfCA68/bG2bFK1UE
	muebwsQJEKyruCbxloi5RVh7OcmyzL/h76YDaYs6Ls6W5qD3QN2iNNClCQPQOfjpOu4/
	HZg7Wt6nDvQSex+k9DcPNxu5BxlTThKu7G9QP9rsrEDJ4TtM0CeatkopFjKDhyuriUQX
	Qw4l1UwgFsghgR+MVAehDXNfyqEz2bcegp7CJiNlaOUd6yXnKxgZHXve+eSE6dbkonv5
	bXXw==
X-Gm-Message-State: AIVw113tdBVzMSgPCsoTHdA25b2lKnMdhj34MFV1rdJo7lwsRIJr5tKu
	7STFqc6NY/IwTmk/
X-Received: by 10.84.129.131 with SMTP id b3mr7013720plb.415.1501216376868;
	Thu, 27 Jul 2017 21:32:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	u184sm36036736pfb.37.2017.07.27.21.32.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 21:32:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 21:32:47 -0700
Message-Id: <cover.1501216255.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH 0/1] llvm: Add recipe for 5.0
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
X-List-Received-Date: Fri, 28 Jul 2017 04:32:56 -0000

Create a recipe just for building llvm, which is needed by many other packages e.g. mesa
can use it for llvmpipe

The following changes since commit 28fc6ba761ed4a47efa7c43e7f7dff5e2fe72b5e:

  core-image-minimal-initramfs: use initramfs-framework by default (2017-07-27 22:20:16 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/llvm
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/llvm

Khem Raj (1):
  llvm: Add recipe for 5.0

 ...LibraryInfo-Undefine-libc-functions-if-th.patch |  93 ++++++++++++
 .../0002-llvm-allow-env-override-of-exe-path.patch |  39 +++++
 meta/recipes-devtools/llvm/llvm_git.bb             | 169 +++++++++++++++++++++
 3 files changed, 301 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm_git.bb

-- 
2.13.3


