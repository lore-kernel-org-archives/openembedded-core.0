Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id AD5A36D58B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 23:29:13 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id q10so2060751pdj.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 15:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=oWKHwaxs3O+kzHYAo0S+abHlObJxnc6h8UG83lgNtc8=;
	b=OsdBuvBxnHZxgH4gFLvr0Rs9gwiRd2UfkYgT65mFqTxlcEuXHLcvISQSdCSvAuWgl4
	bZVXJJyOvl4UAwXdBQOzSGIYifrMRElr1wLjs20/MNRHwLe5wtaS4m82wlOVbkvLIGML
	624wNRK00SM+jzV5vj+1Ub+1hyCHtYyVs/ILKPHBjy1F5POecwshOhx+LM6pdbYfWwqa
	XFwW/fF3m81llX5gyHiMQup/4hM0Qu3XTVpTmwPudv81Lg9GxBS0ok4E12AnpANdKjwc
	arVYcEPRwpYOWlJXl3a+zAPFxny2qeZdDnhxQIP7d1dNoUIMCNC3fDu+V6o6f68j7p5b
	pqVQ==
X-Received: by 10.68.242.4 with SMTP id wm4mr15591420pbc.77.1384817355517;
	Mon, 18 Nov 2013 15:29:15 -0800 (PST)
Received: from yiqingliang-pc.localnet ([117.89.160.94])
	by mx.google.com with ESMTPSA id
	pl1sm25974853pbb.20.2013.11.18.15.29.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 15:29:14 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2013 07:21:42 +0800
Message-ID: <2838381.LbivOYPPzY@yiqingliang-pc>
User-Agent: KMail/4.11.3 (Linux/3.11.6-1-ARCH; KDE/4.11.3; x86_64; ; )
MIME-Version: 1.0
Subject: kernel build fail after update
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
X-List-Received-Date: Mon, 18 Nov 2013 23:29:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

after update poky, I got error when compile my own kernel, it looks like there 
is no directory '/mnt/src/kl360-build/tmp/work/kl360-jilong-linux-
gnueabi/linux-jilong/3.9.4-gitAUTOINC+5dbff4f559/image'.

in my bb file, I only inherit kernel.

I found one patch 'Use hardlinks for do_populate_sysroot for speed' may be 
related with this error.





ERROR: Error executing a python function in /mnt/src/optimus/poky/../meta-
jilong/recipes-kernel/linux/linux-jilong.bb:

The stack trace of python calls that resulted in this exception/failure was:
File: 'sysroot_stage_all', lineno: 6, function: <module>
     0002:def sysroot_stage_all(d):
     0003:    oe.path.copyhardlinktree(d.expand("/mnt/src/kl360-
build/tmp/work/kl360-jilong-linux-gnueabi/linux-jilong/3.9.4-
gitAUTOINC+5dbff4f559/image/usr/src/kernel"), d.expand("/mnt/src/kl360-
build/tmp/work/kl360-jilong-linux-gnueabi/linux-jilong/3.9.4-
gitAUTOINC+5dbff4f559/sysroot-destdir//usr/src/kernel"))
     0004:
     0005:
 *** 0006:sysroot_stage_all(d)
     0007:
File: 'sysroot_stage_all', lineno: 3, function: sysroot_stage_all
     0001:
     0002:def sysroot_stage_all(d):
 *** 0003:    oe.path.copyhardlinktree(d.expand("/mnt/src/kl360-
build/tmp/work/kl360-jilong-linux-gnueabi/linux-jilong/3.9.4-
gitAUTOINC+5dbff4f559/image/usr/src/kernel"), d.expand("/mnt/src/kl360-
build/tmp/work/kl360-jilong-linux-gnueabi/linux-jilong/3.9.4-
gitAUTOINC+5dbff4f559/sysroot-destdir//usr/src/kernel"))
     0004:
     0005:
     0006:sysroot_stage_all(d)
     0007:
File: '/mnt/src/optimus/poky/meta/lib/oe/path.py', lineno: 93, function: 
copyhardlinktree
     0089:    bb.utils.mkdirhier(dst)
     0090:    if os.path.isdir(src) and not len(os.listdir(src)):
     0091:        return
     0092:
 *** 0093:    if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
     0094:        # Need to copy directories only with tar first since cp will 
error if two
     0095:        # writers try and create a directory at the same time
     0096:        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --
files-from - --no-recursion | tar -xf - -C %s' % (src, src, dst)
     0097:        check_output(cmd, shell=True, stderr=subprocess.STDOUT)
Exception: OSError: [Errno 2] No such file or directory: '/mnt/src/kl360-
build/tmp/work/kl360-jilong-linux-gnueabi/linux-jilong/3.9.4-
gitAUTOINC+5dbff4f559/image/usr/src/kernel'

ERROR: Function failed: sysroot_stage_all
ERROR: Logfile of failure stored in: /mnt/src/kl360-build/tmp/work/kl360-
jilong-linux-gnueabi/linux-jilong/3.9.4-
gitAUTOINC+5dbff4f559/temp/log.do_populate_sysroot.5146
ERROR: Task 3 (/mnt/src/optimus/poky/../meta-jilong/recipes-
kernel/linux/linux-jilong.bb, do_populate_sysroot) failed with exit code '1'


-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com

