Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0F42177DA2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Apr 2017 16:43:52 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id t20so23890398wra.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Apr 2017 09:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nl0H9EU1RWyUpJRrGwIbWKR9qQNdECzhjPQ+xvlaAPs=;
	b=Ol0JxGIE9XNDj0a1cvrA83uWIyjqwrvG26c2/qcvYFSwG5P3a11lRRJbiVoLuC2tvI
	5cwJjawlilvJFPP8TQsJSgwtuUFgozX8HKSaJ7nDX6mSEqM6RW/y6PG7DHJj20nHprKv
	6M4VQfHf9T+pwzLLSKSaGfa1qvbnlRaF/kgWRZAgPevIcyN0T9Z2HKHXVFueYAbkvEaw
	jO9z1e1K86PWHUUXKv/UnzrrD07gyEXmI72qXzKlXDkLysUMo+DsNdM6L4gT3RVMWEbH
	sDVRL4w5ofLg0owwDdrmVtQFE6SOY9e/vPAKBWZ0+gFWC4u7n8cUsvCTys+TxfAWOuI5
	vifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nl0H9EU1RWyUpJRrGwIbWKR9qQNdECzhjPQ+xvlaAPs=;
	b=QJHISmIwya6yPuWXnxEAqwsfx+IoiXIOIrGMv9OkupHFjDLFHZbnz5GyRNczFeMK9K
	Hk0S231jKz2sAhV9hUpCflW8VKcOH11GnZHchT5plfudpF9NqQPqG98miAPBuafLgVxQ
	VQSvnKMagUw0pG60IVwKQIBOeNTW4mQ96BOgvxQeb5A/trH1vRNkkhLdUNDkWlzU6o2j
	mAvtyH62O/4DAMcjnukT1NDwyLg90niGrZDA+RAwOvZVIGc4wjWBvVFlBvJKjBNBPKoL
	n7tOSowgfdPKiyXW2GeF6wxzr4uvm6zJT/IlFkyuVMIa8LGEsCrYoUHtykkDm80sL1sV
	qOag==
X-Gm-Message-State: AFeK/H08CmvY9/0Int2bKfa7FBtua3baRjfZ1FyEXv8p+5vRoSRrBhyo5ITPi3hLtv0kNA==
X-Received: by 10.223.141.214 with SMTP id o80mr22250016wrb.110.1491669833634; 
	Sat, 08 Apr 2017 09:43:53 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.167]) by smtp.gmail.com with ESMTPSA id
	t16sm10441914wra.44.2017.04.08.09.43.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 08 Apr 2017 09:43:52 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Apr 2017 18:43:43 +0200
Message-Id: <1491669825-17958-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V6 0/2] Fix some issues of kernel/image recipes (initramfs bundled kernel packaging)
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
X-List-Received-Date: Sat, 08 Apr 2017 16:43:53 -0000

From: Ming Liu <liu.ming50@gmail.com>

Changes in patch set V6:
1 Change "d.getVar('KERNEL_PRIORITY')" > "d.getVar('KERNEL_PRIORITY', False)"
  to avoid running into a "basehash value changed" error, which is caused by
  KERNEL_VERSION is extracted from kernel headers at run time.

Ming Liu (2):
  image.bbclass: remove initramfs bundle related code
  kernel-initramfs: add recipe

 meta/classes/image.bbclass                    | 13 ----
 meta/recipes-kernel/linux/kernel-initramfs.bb | 95 +++++++++++++++++++++++++++
 2 files changed, 95 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb

-- 
2.7.4


