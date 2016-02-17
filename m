Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD4065C8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 19:02:18 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id ho8so16319817pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 11:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=YLN/yP321N8pKgHkatclsLAfBtj62ukcGR1Q7UVm9Kw=;
	b=GBjGFy7HExxPYrnCNwaQZPGV1ZVp4kMT8Wa8Cep6roEykr75VRcroEHFy+ZqquOi9U
	TWXuepyJHJwQ7Ucr+0PBVinNC+RiSQj9rvgcK9FUjtWI7bQJEncc26Mo1OMZp5kUYwsK
	8yOuSudDN3nEE0UnF5374KsPSblhP9Ppwz8lCW+ENfkEo0C2GpwFzhy7Ec/RM3CZZ0LD
	lr0KFJ8C9MCo8M3PL+Pbn11oVSZZuUnPjHSV+FOZP/C2tdjyEhTVKCX47mQgirDeqmK3
	9PZozltPXZYRECPPwDsZhhp3uMYwAwBIFhXX5YHuRxvFXzJix5AWvD/VlE6MrNSIeVaH
	/U5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=YLN/yP321N8pKgHkatclsLAfBtj62ukcGR1Q7UVm9Kw=;
	b=bWb0GOWtjvBVahfsao7wq3/fEBoqRhcJhSFqyxTOKl1Mp6E2AHlzY3FtFeeuZ556+3
	5PNpPnv0xqOOywFzhdFabUsYgveJZzi+4vOB8i3tnYpYLmTBS/IADEz6+bIoU1OzTBaP
	xPTz9C0wl07TmNPTOObNwwne3rZ104tRcq3ru8rQQ+TiuP2lssCR0fSkYtbUmh7rAEfV
	56xxAfm9uYBXUdIX6QMvtdfYMoasTh8yqqGazREVx3PqbjFdG7hskyaTbPZXhZ4IPE3b
	+2Fla9gwFZGgmf3IGKxsGUE2DLyywpdM4UkFTSvzh1iLz+X5svG2kiZe7i4A0d8HQmu/
	oH9w==
X-Gm-Message-State: AG10YOQJcWcVd9vHN4jwgeVm/2kqaanjIXVrXqwnniXtseCt3K5J1RTgomisTNzDpklztQ==
X-Received: by 10.66.155.232 with SMTP id vz8mr4328977pab.53.1455735738956;
	Wed, 17 Feb 2016 11:02:18 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	qy7sm1331379pab.34.2016.02.17.11.02.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Feb 2016 11:02:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 11:02:13 -0800
Message-Id: <1455735734-17911-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [jethro][PATCH v2] glibc CVE-2015-7547
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
X-List-Received-Date: Wed, 17 Feb 2016 19:02:18 -0000

V2  includes changes not committed  before sending.

This is being submitted to comply to Yocto compatability.

Master is affected but waiting for 2.23 to be merged before sending patches.

Armin Kuster (1):
  glibc: Security fix CVE-2015-7547

 meta/recipes-core/glibc/glibc/CVE-2015-7547.patch | 642 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb             |   1 +
 2 files changed, 643 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-7547.patch

-- 
2.3.5


