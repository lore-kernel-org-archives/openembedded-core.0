Received: from mail-gg0-f176.google.com ([209.85.161.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tyrzu-000878-Du
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 23:43:46 +0100
Received: by mail-gg0-f176.google.com with SMTP id q6so141705ggc.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 14:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=DyoZO0zX3iRtBrWrsY5OX9K3nhaqP5po9yC9XqJxzv0=;
	b=jRc0uZ8dvxulFNvUw5nhN0rnyC7/BxgXQlTpSG/oqVv5M58M9MjgcfdRQeLsJaaYhy
	w7HKRasXz3KZHIcmTWBeg7YdD1mCc/N/M5yI3F5LJ1rrqBK0JGKWV2o6q4ihRzG2resD
	KdOzO91xmYcXIiimK4/O0VZJ8zFLDQM+HgELuOL8aF1et9pLlbKHcSyY1KceUR9+RoeR
	do3HNGX44uQOq07wGXoxRPsB8uxz+47IkqvjDlKb6aGI83GfGbfLSMaxu5M+7EGIwUaM
	TZFXrxbvLn+d5hTyO9o+nVCzjetvqgqZVKjsR7K9DUHl7BwtBIDk7BhE7/hOqfd5jqcw
	5cgQ==
X-Received: by 10.236.149.100 with SMTP id w64mr7758207yhj.125.1359152890940; 
	Fri, 25 Jan 2013 14:28:10 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.35.66.48])
	by mx.google.com with ESMTPS id h4sm2336383yhi.18.2013.01.25.14.28.08
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 14:28:10 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 20:32:20 -0200
Message-Id: <1359153142-13425-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 0/2] Improve DRI handling support flexibility
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 22:43:47 -0000

There're some processors which provide binary blobs for DRI and GPU
support which need to be build in BSP; to avoid some dirt and ugly
hacks in BSP we ought to be flexible.

We splitted the glx and dri PACKAGECONFIG options and added a
virtual/dri provider so BSP can override it, if need.

Otavio Salvador (2):
  mesa: Add virtual/dri provides
  xserver-xorg: Split 'glx' and 'dri' PACKAGECONFIG options

 meta/recipes-graphics/mesa/mesa-common.inc          |  4 ++--
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 13 ++++++++-----
 2 files changed, 10 insertions(+), 7 deletions(-)

-- 
1.8.1



