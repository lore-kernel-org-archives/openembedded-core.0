Return-Path: <danismostlikely@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3F8731D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 20:47:06 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n128so7727045pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=C8Aza4PHXVzmaYraRPQ6NnUmUCWaOqqLvMn7hQxjCmE=;
	b=LimNsjqsziVjOitaOiFDAsnPZKPUnJHek00yYjOCPsQO63uwC11XIXejh0alAJqiHm
	8+0CP3+7ATyHKgaF3gDWfMS8TVMD2OF9pI1aO69BtrLlmutqx1bAkoZ2HF9eQa3JWh7H
	sTNd2a8nvFImeRrN1nelxzoBvu+cnWVBjioW3lyPYiDIInxoed88cXdl7C19REd2IhK9
	LHpwaWGDauOYVz7DTBD6nEzlx2G7YsOO/i/D5S+B29ZepvpMmx0By7eESQefBQ9+09nb
	Hdnyjj3VMzLGL1a4dhIvXUQhczz6CrWDL6gcTT7tG/zUATDMkIFSCQ+js6R5Zq6QabTX
	JelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=C8Aza4PHXVzmaYraRPQ6NnUmUCWaOqqLvMn7hQxjCmE=;
	b=gE9DmIlr14mHQtyr4EYOoB4/7qNC98W2FYpOF9O3ndebePkQvwYtFV2QK+FoEnd5ed
	qshXj57VvOimG0peU7wzXFPjXL5kmmIah+OLxRtv6ppssSKslsagQFNJN1G/AXZLrGpZ
	5ArnBcjWlmNeOL6qbRRDWU0hk2A2CLPS7fv2FB8N5o4gU1S7U+z3cdTleZW8xEyAzHhj
	otJMVfxMURm/urwiWeIKp/hLaU2ox8k12yg1Qpdin/4Jk+7jpzvWgWdcNEvje8id5E9Z
	XH3WoQ74EytXHISQeS2nrEfqs0/dDeFWaBLbyTW9pXdbBCR3BcW2Ct1bDDVAqefZy745
	F81A==
X-Gm-Message-State: ALoCoQk4nL+rlzU2XjTFcTJKufToJHbn8ODVKs+OQuvrWhx7YUIsQ3BlcFO6AASG1ucKWJHSyDljanraRasdzJDz66RUEqRKSA==
X-Received: by 10.98.18.208 with SMTP id 77mr9161743pfs.94.1452804427729;
	Thu, 14 Jan 2016 12:47:07 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74]) by smtp.gmail.com with ESMTPSA id
	f21sm11290704pfd.6.2016.01.14.12.47.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jan 2016 12:47:07 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:47:02 -0600
Message-Id: <1452804424-17632-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 0/2] BASELIB != lib fixes
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
X-List-Received-Date: Thu, 14 Jan 2016 20:47:07 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

These solve a few issues when libdir is /usr/lib64. The
commits are also available in the git repository at:

git://git.openembedded.org/openembedded-core-contrib.git dankm/libdir

Daniel McGregor (2):
  bitbake.conf: make localedir nonarch
  opkg-utils: store alternatives in nonarch_libdir

 meta/conf/bitbake.conf                             | 2 +-
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.0


