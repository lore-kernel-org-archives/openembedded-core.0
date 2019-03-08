Return-Path: <rosbrookn@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id CB4AC71CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 15:08:46 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id a48so21527682qtb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 07:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=GAXDVACQqjGYRCGWXKQpsLkdEpBkQzK6VseBOH4dSBI=;
	b=m5X5nhpnUw6AWruFeGqsLe9908MIlVd5heEP38ta6wNTpB5aEkEI2oGSj6OY+ucjmj
	z5IVXbgHbtBpVow1Y94oMC29mJDL+/ApBjelfuC3gHftlouhsottYo3+rAeARSTjufTA
	/mOST1XLGed3QcyklByT9fOZ4Lh6PhJWqcpPsL62pNUxdApTfgySi63Bbb0xuuTVXa4C
	laG93qoBT+ArVaYTFnGo7d64G0aNyxWbDmslTZKbOSrO0KNv63oYl2AHPJk4v/ht0r3F
	9YzqOvSYXg1jm19C0TFKA//fmWVIH8VcHPSXsj/+7uCcNq52zJKMxqn2RXY+9Ebo+eP7
	N8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GAXDVACQqjGYRCGWXKQpsLkdEpBkQzK6VseBOH4dSBI=;
	b=RdcBGNVz5JEc086WcApSwbyx3ytTCkYFmAhsMbI9/YJisFQCwUARyGZFt++JgETTwK
	S6Romw5sRFtJnvs8dE57/v7LN31ChSOOiE+CCJZ6dZSlYkky/CGZuFc7gHbxqEkvdjYg
	iPByxhM6QiFrVTkE9+BNZYSzmP8Ef247mH9W2bDrauU84RSjeMs6HM4OUt2GM7ZdckP6
	MaDiAJ5ltMrw2PdNUT3rx1XelA6hV0+PH53QIIPKxkcgwJ0TiK+GbFZklJ7eLeaG2bJo
	wQzTUgOJSdIbmf2LBjvJmpFVeCiEbuplukLm4pb3rYYmxX9grgtDFXbRlEmXfMl8GNSK
	dmHw==
X-Gm-Message-State: APjAAAW4U/SdnoBNU3MqyQmHxvsNhZ5arl3xx1Nn74xYFCdTu/+4McYp
	hANKzu2WA3HO4EifWuraK/EzjDiu
X-Google-Smtp-Source: APXvYqzBcI4LpPhDAXezNIdiIBWIqeJD65VQ+y4PVTuQQXaj6a0dVAf93V2KoxnWjtTRLFVnwW8xrQ==
X-Received: by 2002:aed:3ac9:: with SMTP id o67mr2222638qte.64.1552057727420; 
	Fri, 08 Mar 2019 07:08:47 -0800 (PST)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	j17sm1739368qtj.61.2019.03.08.07.08.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 07:08:46 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2019 10:08:35 -0500
Message-Id: <cover.1551991645.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/1] adwaita-icon-theme: use scalable symbolic icons
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
X-List-Received-Date: Fri, 08 Mar 2019 15:08:47 -0000

The following changes since commit cd8aedc408afa4f8589f79e4d85befc7cac76ac6:

  metadata.py: return info after fallback methods (2019-03-07 12:59:22 +0000)

are available in the Git repository at:

  git://github.com/enr0n/openembedded-core adwaita-icon-update
  https://github.com/enr0n/openembedded-core/tree/adwaita-icon-update

Nick Rosbrook (1):
  adwaita-icon-theme: use scalable symbolic icons

 .../gnome/adwaita-icon-theme_3.30.1.bb            | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

-- 
2.17.1


