Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id D3C316EEF3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 10:08:17 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id v10so1672175pde.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 03:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=B7R0wPB/PjD4weDjMUz7rALmqJdzr3o9w2DBwsCrxm8=;
	b=PHo2vQSnxS7w8/37RrAVNc4IXzHt1kiaN2gkrJtZRwrIQ+QbuucQmES2izRT6rSjaM
	xbGtFLWK22/OeEiHfoy56UPzMHwGLq32MCgzx4cgAZSLoQe4pRWAC1dUPkTRu4bj+2r2
	VC319x9CCGy2yShgpAsFiMb7H7HepsOWOx560LLriiLPQLZztPN6CZXUV4Vz00HGJjid
	ysavepS1aS3FY+Xdqih5DgDYsjWXzKxRtMggtIOz1BVHxJI7vdpr2wLfeZE2dg8V7WQD
	+RvSLWewBSGVehOkoumyvQ5yRsG56W48AotjGsGjgtF9Puv3jRkkjhkkt++4K+WIjwHW
	/KiA==
X-Received: by 10.66.102.66 with SMTP id fm2mr3547155pab.51.1395828498384;
	Wed, 26 Mar 2014 03:08:18 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([121.229.158.174])
	by mx.google.com with ESMTPSA id
	iu7sm56062754pbc.60.2014.03.26.03.07.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Mar 2014 03:08:17 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 18:06:36 +0800
Message-ID: <1601339.XSqVGrrJet@yiqingliang-pc>
User-Agent: KMail/4.12.3 (Linux/3.13.6-1-ARCH; KDE/4.12.3; x86_64; ; )
MIME-Version: 1.0
Subject: serial console problem
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
X-List-Received-Date: Wed, 26 Mar 2014 10:08:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,
	after update to the latest git version of poky, my image can't start 
the serial console,  i.e. I can't login, I'm using systemd as the init 
manager. any idea?

log:

Freeing init memory: 132K
systemd[1]: systemd 211 running in system mode. (-PAM +LIBWRAP -
AUDIT -SELINUX +IMA +SYSVINIT -LIBCRYPTSETUP -GCRYPT +ACL +XZ -
SECCOMP -APPARMOR)
systemd[1]: Detected architecture 'arm'.

Welcome to Linux!

systemd[1]: Failed to insert module 'autofs4'
systemd[1]: Failed to insert module 'ipv6'
systemd[1]: Set hostname to <kl360>.
systemd[1]: Initializing machine ID from random generator.
systemd[1]: Starting Forward Password Requests to Wall Directory 
Watch.
systemd[1]: Started Forward Password Requests to Wall Directory 
Watch.
systemd[1]: Expecting device dev-ttySAC0.device...
         Expecting device dev-ttySAC0.device...
systemd[1]: Starting Remote File Systems.
[  OK  ] Reached target Remote File Systems.
systemd[1]: Reached target Remote File Systems.
systemd[1]: Starting Dispatch Password Requests to Console Directory 
Watch.
systemd[1]: Started Dispatch Password Requests to Console Directory 
Watch.
systemd[1]: Starting Paths.
[  OK  ] Reached target Paths.
systemd[1]: Reached target Paths.
systemd[1]: Set up automount Arbitrary Executable File Formats File 
System Automount Point.
systemd[1]: Starting Swap.
[  OK  ] Reached target Swap.
systemd[1]: Reached target Swap.
systemd[1]: Starting Root Slice.
[  OK  ] Created slice Root Slice.
systemd[1]: Created slice Root Slice.
systemd[1]: Starting Journal Socket.
[  OK  ] Listening on Journal Socket.
systemd[1]: Listening on Journal Socket.
systemd[1]: Starting udev Control Socket.
[  OK  ] Listening on udev Control Socket.
systemd[1]: Listening on udev Control Socket.
systemd[1]: Starting Delayed Shutdown Socket.
[  OK  ] Listening on Delayed Shutdown Socket.
systemd[1]: Listening on Delayed Shutdown Socket.
systemd[1]: Starting /dev/initctl Compatibility Named Pipe.
[  OK  ] Listening on /dev/initctl Compatibility Named Pipe.
systemd[1]: Listening on /dev/initctl Compatibility Named Pipe.
systemd[1]: Starting udev Kernel Socket.
[  OK  ] Listening on udev Kernel Socket.
systemd[1]: Listening on udev Kernel Socket.
systemd[1]: Starting User and Session Slice.
[  OK  ] Created slice User and Session Slice.
systemd[1]: Created slice User and Session Slice.
systemd[1]: Starting System Slice.
[  OK  ] Created slice System Slice.
systemd[1]: Created slice System Slice.
systemd[1]: Started Set Up Additional Binary Formats.
systemd[1]: Starting Journal Service...
         Starting Journal Service...
[  OK  ] Started Journal Service.
systemd[1]: Started Journal Service.
         Starting Apply Kernel Variables...
         Mounting POSIX Message Queue File System...
         Starting Create list of required static device nodes...rrent 
kernel...
         Starting udev Coldplug all Devices...
         Mounting Temporary Directory...
         Starting Remount Root and Kernel File Systems...


