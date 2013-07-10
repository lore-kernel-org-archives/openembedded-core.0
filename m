Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id F240D621D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 08:25:45 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id x11so6171571pdj.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=cLILHMT5Hn0BbQ7gdrwZ71zot7ozENWIhBMSW0bG3aE=;
	b=ACvx+vodCzmMtmt8+pdhB8NLhRANViiB9UOZjWwBXgP3DGJ9WGFOf3yCv/atMrlL86
	/s1kIdW/XoVZzTSP1WV5ifBSUk62B8risC0tdqK5aY1W5jWTzol+zcs/PFh+OOaRuRwG
	MilcU6FPC8/23DGt5AvuViEKuwvIiOWEymY8DaIVBgmF6Wc43oYOdelm3gC3G7zB/Kvn
	mWqyenwHj0atec8kysprIjhPLNF0qdzvd72e+xs7H6UFEzQMEbKuUfy44tA+MnlBRLsJ
	SXJ0rU+oRuHWzAietK90jX6ra5ErJOvnsBCrNPXdH183SzMmdMXSsKxneaoazzS677KJ
	LDKw==
X-Received: by 10.68.180.34 with SMTP id dl2mr30703543pbc.57.1373444746366;
	Wed, 10 Jul 2013 01:25:46 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([222.94.225.252])
	by mx.google.com with ESMTPSA id
	ib9sm32701578pbc.43.2013.07.10.01.25.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 10 Jul 2013 01:25:45 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2013 16:21:02 +0800
Message-ID: <2457726.ZAE80f4V8O@yiqingliang-pc>
User-Agent: KMail/4.10.4 (Linux/3.9.8-1-ARCH; KDE/4.10.4; x86_64; ; )
MIME-Version: 1.0
Subject: boost 1.54 compile fail
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
X-List-Received-Date: Wed, 10 Jul 2013 08:25:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello!

after update poky to latest git version, I got failure when compiling boost:

the main error is: (indeed, and too many warning!)

| ./boost/atomic/atomic.hpp:202:16: error: 'uintptr_t' was not declared in 
this scope
|  typedef atomic<uintptr_t> atomic_uintptr_t;
|                 ^
| ./boost/atomic/atomic.hpp:202:25: error: template argument 1 is invalid
|  typedef atomic<uintptr_t> atomic_uintptr_t;
|                          ^
| ./boost/atomic/atomic.hpp:202:43: error: invalid type in declaration before 
';' token
|  typedef atomic<uintptr_t> atomic_uintptr_t;
|                                            ^
| In file included from ./boost/system/system_error.hpp:14:0,
|                  from ./boost/thread/exceptions.hpp:22,
|                  from ./boost/thread/pthread/thread_data.hpp:10,
|                  from ./boost/thread/thread_only.hpp:17,
|                  from libs/thread/src/pthread/thread.cpp:11:



-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com

