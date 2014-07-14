Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 17CDD60703
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 22:55:29 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id z6so2011535yhz.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 15:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=guRphATWkOroVbA4m2XiANKjeM3WXiAFwcpP9gJI3ig=;
	b=Oegii5YdSfguGzJNEMNMOq96rz/qOw8AJjRpU+d1odMjt7V3ztEkoCom4DM+x5XsIM
	4wNVJF3HUafLquINEbQ2e4sjkl7WcSEePqu+X/cFOX7Xm3VWr2KTXVxweP1t/7DdTl3N
	PYcqphSAZINLGUEUzv7CYZHvHua1z6H9eDOufW5u5tTuqnBnhD1tG+/OsFb/RFAacQi6
	Dhom962OMDWmn13fpuZcxuWg5WqIpXq31pM48eTvmUgUSY3EdsWF4SflF18udFfqBYTs
	bVGY8e7knVvgBvIE5eCLC6xEWfH2EXK+WEVdiAGtdi1/jF5hQmku7PHx4CS8rMwLlBb0
	uoeg==
X-Received: by 10.236.130.77 with SMTP id j53mr8620406yhi.139.1405378530836;
	Mon, 14 Jul 2014 15:55:30 -0700 (PDT)
Received: from localhost.localdomain ([201.53.220.248])
	by mx.google.com with ESMTPSA id f63sm23721868yhf.1.2014.07.14.15.55.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Jul 2014 15:55:29 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jul 2014 19:55:16 -0300
Message-Id: <1405378518-4832-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1404266329-13524-1-git-send-email-joaohf@gmail.com>
References: <1404266329-13524-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: [PATCH v2 0/2] add nativesdk to BBCLASSEXTEND to python-distribute and to fix the side effect of it.
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
X-List-Received-Date: Mon, 14 Jul 2014 22:55:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v2:

 - Use 'find -print' instead of an extra fork to protect path
 
 - Replace sha-bang for easy_python version variant

Test steps:

1- apply the two patches

2- include the package 'nativesdk-python-distribute to TOOLCHAIN_HOST_TASK in meta/recipes-core/meta/buildtools-tarball.bb

3- run 'bitbake buildtools-tarball'

4- install the created SDK

Files from python-distribute has space in three filenames and the SDK step will not claim about it.

João Henrique Ferreira de Freitas (2):
  python-distribute: add nativesdk to BBCLASSEXTEND
  populate_sdk_base: ensure that filenames with empty space character
    are handled

 meta/classes/populate_sdk_base.bbclass                   | 4 ++--
 meta/recipes-devtools/python/python-distribute_0.6.32.bb | 8 +++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
1.9.1


