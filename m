Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id D2A766B118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:03:26 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id k10so3228757wiv.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 07:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=b4TcI89BBDM7bH0lyfn2/1avK+jZL3JodKjcnwSQ5N8=;
	b=bIAm2bUVZPDpVd9fvQGgpWJWuF3p/yB2CXOclKGiMZxO4LF7qIrps5IzqqE+AB2GYp
	BHSgkqZuCdF5OI/sBgM/3ppRFc7HSjdZ4R/hdNV4VAGu0FM1JP0UGLq5EKqAdWmL3Bbs
	ZhDj1b+kUheB4aBs7unWGFy+Zim5z9eoZm7MaVqekMo0EulicZ1fA2scXglyU1GCNzCg
	vRB0n5IwVPUmzXzlmJL3vD+KhBq+iyCtfPGIJsdPXX1a5Da7n8sHn6c+7mp1IPPy6xxy
	5dMlpSTIHonRZZRjOjSMBofzr8t2wEYZwy6kHniOYEVRgeaasH85ZgqCHVdRgsh0S1P8
	MnGQ==
X-Received: by 10.180.9.242 with SMTP id d18mr19327440wib.18.1374156206686;
	Thu, 18 Jul 2013 07:03:26 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id b20sm16805749wiw.4.2013.07.18.07.03.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Jul 2013 07:03:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 14:59:41 +0100
Message-Id: <1374155982-23797-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnfKivBB9b+JQsfTRjw0QJG2ezj2N0iUJquHkJJBYQr9Cdd7wSdd5VuTCvI7daCdVUA7J5T
Subject: [RFC][PATCH] initrdscripts: mount / as read-only when live-booting
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
X-List-Received-Date: Thu, 18 Jul 2013 14:03:27 -0000

Hi,

I noticed that our live image boot mounts / as read-write straight away, which
seems to be the wrong thing to do as it means init can't do a fsck if required.
From what I can tell both our sysvinit and systemd boots remount as rw once
they've started so this should be safe, but I've not given this massive amounts
of testing yet.

Consider this a Request For Comments/Testing, mainly as I'm going away for a few
days from tomorrow.

Ross

