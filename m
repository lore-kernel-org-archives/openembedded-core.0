Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4DA71A72
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 13:29:41 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r126so50455238wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 05:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hlgZPnY+S/vG0nBTJkBAJ20IdhhWSCQk2h7bKdDjbAM=;
	b=gXvxtyiB9p52Pp5M51SJxY3WALaiTtOfN1hZjGhK/YKM4A0vbXEoc/mWg9rJZFIEJe
	GeVRAW+rybEpgidPt7PEeFLg1qhruePjGV7aCrdVv9tQWqIEzxdhgamoOV1sHjgAqoM3
	gz++z4wHDsHFiJsjxcHxB8gKnynuGcM2YKJYMm6JUzR5Qqu+qJ8LqjR6vVmttCpcyu6k
	VwX6Za8iFuROOWAt/I3VI4a1HenPd88i1fFBU8TEXNjm5mcdV9wKx4SGNChNdRnF7/Qe
	6EQiwldfAJzMfIOgo5Z0ntUni5WW+tCgTjovCy3ePIG35R9VCJK/tVI5d3yuKl12krLj
	g0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hlgZPnY+S/vG0nBTJkBAJ20IdhhWSCQk2h7bKdDjbAM=;
	b=YaZZvCjy/KfSgtwTogi5e+hDE3ORpwrviyc02qbk1VnEOrWs6peTOoTDWomRmO/XrQ
	wh2+hLhoalOTlokEjhn84UmnxbVo5iM03VblkJA5Q+Y6qOQAYeOU73N8smbE0gD4AX7G
	pYtHo37hAwUWwUdixQCbJcj01YXwYr1l5j1NDshDc3/RS5ZqU/imDFFrBe1VF3QP/0ZH
	cb1OBAJ0xtqUxCBPm+vH+uXBlGeg1qB2r9sVMxaDsxf7nIHZtFvAN8v56lZSlNJf9Zsd
	A++4iN1anl8dRq3id8/JaTV0db0wFsbSHDwdF/v/IULZY9iA7EXo6EpThSEDvZn9wkoe
	xXWA==
X-Gm-Message-State: AIkVDXIvWtGlppJatLlXKFibqZc8r5gr2P2uAHsjF7dlL3/dxStPs9a6NOEUuKFPwcGlEg==
X-Received: by 10.28.225.215 with SMTP id y206mr2555676wmg.138.1485437381059; 
	Thu, 26 Jan 2017 05:29:41 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.150]) by smtp.gmail.com with ESMTPSA id
	a35sm2611227wra.21.2017.01.26.05.29.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 05:29:40 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 14:29:31 +0100
Message-Id: <1485437372-10456-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] meta: remove remaining True option to getVarFlag calls
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
X-List-Received-Date: Thu, 26 Jan 2017 13:29:41 -0000

From: Ming Liu <liu.ming50@gmail.com>

This is the V2 set of this patch, please ignore the origninal one, I had
some charset issues on my computer, so the patch was messed up, sorry for
the disturbing.

Ming Liu (1):
  meta: remove remaining True option to getVarFlag calls

 meta/lib/oe/data.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


