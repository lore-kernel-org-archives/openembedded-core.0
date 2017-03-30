Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8442B77BD9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:19:13 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k6so8507621wre.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rfkPe6qfCZx3IfD3l9M1s+U/i90m357FKlEhRmdu4XI=;
	b=uhzj61xKTNAMkJCYsb5Oa/tNV6qEQVqQ+sW1gBO+n5uTrfb+vJ1qM8iamD5/v/HgPf
	QIXDLCcvl8tni8tlTS5k/bDVQDbIkUNSRC678PtuzHzqrOWdoFqImpK0dogd7o2UyJWf
	94csLS96S3FLWfEyrPp3qGeCWdKI51nX89A5jJo4magfFJYJT/L/+zQ51/ClAJ3tW6q8
	xqEc8/KHSpKu1llZkQ1uSqbQJ4LYnPsIUiwkT54GmEhCiwPvpEJ8yqsei04CD/tMzyb6
	M8ZKIyyPEUKmQNAXes10rZrToKj5Ip2Ew7j4ofvpDXVxteOnB+p8WRtXAutYX7k3h3HF
	ksRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rfkPe6qfCZx3IfD3l9M1s+U/i90m357FKlEhRmdu4XI=;
	b=dtsrT57v732DfPUDw3KyYumbIIOZYrx45s+Qdg0XtuAGpcNcyf3Gx6qKT5e9eGS+w8
	98Yv8LLjOjGuohnq575ukBkAYVhgiSWO5qkoQiKZSPywioPi6DQ1Vg2++qJnc9iOnh7h
	7VVk9NgZAs35qoM9zNr6lJf2WmvxakYRhISMPVACzbuktfwEPhfjVF6rCrdAMj80uiuh
	uXBxjpgxjSsR7fNIKO4Fh7oAl29G3qZnVf201uxRPZcIcOgtpvJwZN+27jfreuy1Z+L0
	I8Tk6o8vzbOpYiEejQcqhjvvJwa0Nhosr2ex6DqWfK7hfgPcEs18s3SoP4QZGVQ7vDBX
	uviw==
X-Gm-Message-State: AFeK/H3cU4tvj8yJGACyYBGppoY+8S81r+OPz4y79aMVHkQu0ofmviAdIB5y38bBdtwHjQ==
X-Received: by 10.28.73.84 with SMTP id w81mr2159423wma.113.1490861954169;
	Thu, 30 Mar 2017 01:19:14 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.223.149])
	by smtp.gmail.com with ESMTPSA id q29sm1816289wrc.1.2017.03.30.01.19.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Mar 2017 01:19:13 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 10:18:55 +0200
Message-Id: <1490861937-2394-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V5 0/2] Fix some issues of kernel/image recipes (initramfs bundled kernel packaging)
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
X-List-Received-Date: Thu, 30 Mar 2017 08:19:13 -0000

From: Ming Liu <liu.ming50@gmail.com>

Changes in patch set 5:
1 Add [ Yocto #9233] in commit message.
2 Drop the patches not related to fixing this bug, will send them separately.
3 I had sent a wrong patch in V4, the summary: 'kernel-initramfs: add recipe'
  fix it in this V5.

Ming Liu (2):
  image.bbclass: remove initramfs bundle related code
  kernel-initramfs: add recipe

 meta/classes/image.bbclass                    | 13 ----
 meta/recipes-kernel/linux/kernel-initramfs.bb | 95 +++++++++++++++++++++++++++
 2 files changed, 95 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb

-- 
2.7.4


