Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 77AD86E898
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 00:20:49 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id i57so9414233yha.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 16:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=d0tuSI+L/2bLBJS/NsL19Kv8P8EFGuD1BRWKpdL6udM=;
	b=Hil9C1xB8E/XMWdnKtqFxe+quLORkBR4ohoF+4YQlWt4kAihELBSXNC9ZSvGGuudEx
	WK+1RtH/YT3/Tum9f1hU1nqcioR3V/1Qn/7QH1tvWFE/W6lTCSQo6OkdXgYYmlRP52lK
	0FPyjXWWYz0cTpYVmcqmpWAILCt5Ju6E3k0zsy3EHVaqwwN2iWnZ1FYQOaiZcvGRDzUX
	p6VEdGvDxoOfrobu/5eZfB40cASfroLIDD6JR+Dvd7oYBz7zDLbPxMXdqSTQmbYbdgSp
	8/22LjpEKUdBO5E6zDVxoZtbS1T4+sDISlWULcnKQC0nC5heVtx7QyjzjRVIiEuLYsOH
	4dkA==
X-Received: by 10.236.30.2 with SMTP id j2mr4935858yha.73.1392250849748;
	Wed, 12 Feb 2014 16:20:49 -0800 (PST)
Received: from localhost.localdomain ([201.53.197.242])
	by mx.google.com with ESMTPSA id a67sm162469yhj.10.2014.02.12.16.20.47
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 16:20:49 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2014 22:20:17 -0200
Message-Id: <1392250819-10123-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 0/2] Add task to create kernel config fragments
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
X-List-Received-Date: Thu, 13 Feb 2014 00:20:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

These patches add a new task called fragmentconfig which should be used
when the user need to extract a diff between two kernel config files.

For instance:

  bitbake -c menuconfig linux-yoco

  [do some changes and save]

  bitbake -c fragmentconfig linux-yocto

See the fragment.cfg in $WORKDIR/fragment.cfg

This closes [YOCTO #3862]

Thanks.

João Henrique Ferreira de Freitas (2):
  kernel-yocto: Add do_fragmentconfig task
  cml1.bbclass: Add fragmentconfig task to cml1

 meta/classes/cml1.bbclass         | 35 +++++++++++++++++++++++++++++++++++
 meta/classes/kernel-yocto.bbclass |  2 ++
 2 files changed, 37 insertions(+)

-- 
1.8.3.2


