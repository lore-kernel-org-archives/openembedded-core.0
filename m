Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA6B73206
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 00:59:55 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id e65so9167178pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 16:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=EwQG/+7Xuuel1qVKBR2lVSQyetHvmYiiwE+uA/neboQ=;
	b=wROTWk6dDF48dYwkISt4EI9ckvbh37RDotSoPVLCJVFN3Du1llHTzExmySc5OmcdCX
	ZM3LnSH99pr09jJ0tSsjfbY2j1i/AT3UePFHn0Hmmcf3me+EfjxUfL+nBs8/UKy1eD1G
	ZObx5R62ZQbw8E6wbSJ7C7P7KJ/6+h+WwGpp73Pf/wA71XZqRvpxDbjWOF+O15tKxiBf
	zwuCseFBmwIE5+G5097waNgjoFLtx2fH+XQuCZtd2+iZjvjmAxDoXYKfaAtNS2ua4xFa
	NGJLs3xAdH26QBgrR9FLjY3up/gICpl3K2J5vgjksmQC06cAdpKEyyBZXZ/2pkCSHY/m
	U64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EwQG/+7Xuuel1qVKBR2lVSQyetHvmYiiwE+uA/neboQ=;
	b=K7EzRAg18qk+LWcBIAgbcLmMyBMSkPg3Z7Z+uv6ewdMCp/2lMgSsidErhJz+XdY4Kb
	blo5Lidvub9hvMwZJhkgaVzBJTTpVKJUm0nO+HZZMsgb1bgRXz8Q+HASBhd2j/unz4EG
	0gMYbDtL/8cxeNq6nU9NXUqEVXTtjur8qh+GTHhRb+T9CYcuRMAOSie6N/KgGV3S30+8
	P/VniawHGkrUkKhytSJG2BhWeYJqG4IyU7ET6cmZtCDXStKd1/YoMR9tyQy/QDZdj7P4
	78BR/6Irn8RgXtK7G7Rb/I/50mGTFffyfEoJRdjTmKReBujQRfOm701uRwg3bmivJ50t
	5Fdw==
X-Gm-Message-State: ALoCoQmgkiBiYf6LhOeIh/EyPbQ39GkfUP1pFQQvMi1TOaHT9qgjfv7ViROrMsQIUDakryxBuTDT1glbFyQ1betF3SJuJNRnhQ==
X-Received: by 10.98.72.130 with SMTP id q2mr19179607pfi.154.1452905996718;
	Fri, 15 Jan 2016 16:59:56 -0800 (PST)
Received: from bigIsland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id
	i76sm17915055pfj.68.2016.01.15.16.59.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jan 2016 16:59:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2016 16:59:48 -0800
Message-Id: <1452905989-29316-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2][master][jetrho] openssh: CVE-2016-1907
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
X-List-Received-Date: Sat, 16 Jan 2016 00:59:56 -0000

Found two more commits for this CVE. 

Armin Kuster (1):
  openssh: CVE-2016-1907

 .../openssh/openssh/CVE-2016-1907_2.patch          |  65 ++++
 .../openssh/openssh/CVE-2016-1907_3.patch          | 329 +++++++++++++++++++++
 .../openssh/CVE-2016-1907_upstream_commit.patch    |  33 +++
 meta/recipes-connectivity/openssh/openssh_7.1p2.bb |   5 +-
 4 files changed, 431 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_3.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_upstream_commit.patch

-- 
1.9.1


