Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 12F0161883
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 06:57:57 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fa11so7161293pad.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 23:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=wVsEWPSTs2vLuaDUTFkXAuCdVVjbiQy52OkjiO+5/3o=;
	b=MHZrOl8uwrEbBWJ2qbPKsAiOiR6ys1TNM8+jdXtJ4CPLI7ZkwAm1goa6HMoC48RNQq
	puOUs2DtvOb5l38A4jOUDHIEwYCl4rnm1fZjqVhlJfafatDSBDx2McyMpe6xPycp+bG9
	xWISr37lM2AWKaowyMxGnBZ5DedOKgDGvZAZ1IohWlROnNg9qc5me+2TaLeTfa2m2ISR
	irzBEs/uJKlPEN0G3VShCC5Ym+8Pg92ddwD8o7vHD1qpo/GIYsYL6CGjghycUIrTClm6
	acNVYKKS1nArpm11V0hkHBRBlbW0maGyRp9E3+mziRLffNa3Nj315lO+/z3JeumL5Jqq
	E6Gw==
X-Received: by 10.68.202.41 with SMTP id kf9mr32624384pbc.80.1372834678172;
	Tue, 02 Jul 2013 23:57:58 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([121.229.144.129])
	by mx.google.com with ESMTPSA id jb2sm30537767pbc.8.2013.07.02.23.57.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 23:57:57 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 03 Jul 2013 14:53:24 +0800
Message-ID: <3934280.MhQAtor7HF@yiqingliang-pc>
User-Agent: KMail/4.10.4 (Linux/3.9.6-1-ARCH; KDE/4.10.4; x86_64; ; )
MIME-Version: 1.0
Subject: nativesdk-dbus do_package error
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
X-List-Received-Date: Wed, 03 Jul 2013 06:57:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

I'm using 'systemd'
when building 'meta-toolchain-qte', got following error:

ERROR: QA Issue: nativesdk-dbus: Files/directories were installed but not 
shipped
  /run
  /run/dbus
ERROR: QA Issue: Found library in wrong location: 
/lib/systemd/system/dbus.socket
Found library in wrong location: 
/lib/systemd/system/dbus.target.wants/dbus.socket
Found library in wrong location: 
/lib/systemd/system/sockets.target.wants/dbus.socket
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in: /media/datum/repo/arm9plf-
build/tmp/work/x86_64-nativesdk-optimussdk-linux/nativesdk-dbus/1.6.8-
r6.0/temp/log.do_package.10490
ERROR: Task 1658 
(virtual:nativesdk:/media/datum/repo/optimus/poky/meta/recipes-
core/dbus/dbus_1.6.8.bb, do_package) failed with exit code '1'
NOTE: Tasks Summary: Attempted 4092 tasks of which 3232 didn't need to be 
rerun and 1 failed.



-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com

