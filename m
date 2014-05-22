Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (unknown [209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 20FF566070
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 18:27:57 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id a41so3332598yho.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 11:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=99ylo9nJj3aImt2DXca2IRqe5INN/AZl16/lFtO5AcM=;
	b=mnBksD9qhCcxmWe+l5UgyETzKgdbq2+N0h3wDaGCSCpaTVvVwYnWkQ+E23ZCiaBCpi
	3LSPY3xS2z52rT7flX68KzcNS7YTIJNapoK8txuTQngPoifxKctIgZQUe+BxClDapitQ
	rJLiKfg+q4OG4Fmk7bCEQRjhZHTrub6GfMQqMAjEpewe5V5TFepkWK9P8VxRnC58tPF2
	Q3txhZrejMrzCfb2OPhBdZsz0ONvJWCOZ0NZpLgkDA3K7IO2gzeqy5ux1UPAp0LaTUxP
	/8Anak9yTbF2la36rTDIx2N4nW1mXXTHOnEQMELlqkE7RteNXjX5MSsL6o7OiJJ6FqC4
	mxqA==
X-Received: by 10.236.53.69 with SMTP id f45mr88067010yhc.53.1400783278537;
	Thu, 22 May 2014 11:27:58 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id k50sm835809yhc.21.2014.05.22.11.27.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 May 2014 11:27:58 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id CBC881B13ADB5; Thu, 22 May 2014 15:27:54 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 15:27:48 -0300
Message-Id: <1400783274-7258-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [daisy-backport][PATCH 0/6] Daisy backports
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
X-List-Received-Date: Thu, 22 May 2014 18:28:00 -0000

Hello,

Those are the changes I have in my local backport branch which I run
on top of 'sgw/daisy' branch.

Chen Qi (2):
  tcf-agent: add systemd support
  gdb: add PACKAGECONFIG for babeltrace

Denys Dmytriyenko (3):
  cryptodev-linux: move to recipes-kernel to be shared with module and
    tests
  cryptodev-linux: create common .inc file to be shared by module and
    tests
  cryptodev-tests: recipe for cryptodev test suite based on OpenSSL

Tudor Florea (1):
  curl: remove inapporpriate file from curl release

 .../openssl/cryptodev-linux_1.6.bb                 |   22 -
 meta/recipes-devtools/gdb/gdb_7.6.2.bb             |    1 +
 .../tcf-agent/tcf-agent/tcf-agent.service          |   10 +
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    8 +-
 .../cryptodev/cryptodev-linux_1.6.bb               |   15 +
 .../cryptodev/cryptodev-tests_1.6.bb               |   23 +
 meta/recipes-kernel/cryptodev/cryptodev_1.6.inc    |   11 +
 ...pile-and-install-rules-for-cryptodev-test.patch |   69 +
 ...ests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch |   29 +
 .../curl/remove_inappropriate_file_from_rel.patch  | 8203 ++++++++++++++++++++
 meta/recipes-support/curl/curl_7.35.0.bb           |    1 +
 11 files changed, 8369 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/cryptodev-linux_1.6.bb
 create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
 create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
 create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
 create mode 100644 meta/recipes-kernel/cryptodev/cryptodev_1.6.inc
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
 create mode 100644 meta/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch
 create mode 100644 meta/recipes-support/curl/curl/remove_inappropriate_file_from_rel.patch

-- 
2.0.0.rc2


