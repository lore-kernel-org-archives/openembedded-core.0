Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id A21896F9F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 10:28:39 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id hz1so1743906pad.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 03:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type;
	bh=y2UTVO4z/9WBNrDx2VYG1QXyh5TV8e4hA0rZUbWEdPU=;
	b=MD4P4sC3Dg+ipMHgmsLQ4sCrtPFqE2SoFXPjtae33o3XWFN9cnKWT9PLyn5dxWw2SV
	KXkaC660OTydcAfUYKaYqgvfIwwWKz1dQB/guapJK9IRvsOHiXVNZaW0MSp6alguUbR1
	xmFFcpY1SwRMzhRc7Y/zo3urCqDAaJREkbIO1HPaDVtxXb8oM0mtekKo11m75MCaE1FO
	Wl+XyepeGetXXw9ghuTlO13mlHj79AJs8iHEpXVaVHEBAwWBJ/m6N1LGAQLREVS/q6w+
	/PsV820Vpitkh4xu++sXnTUbJspwf/0X9+FfcEA9k/OqvA7tbStL6y55wpCURBkkHFjx
	Ob7w==
X-Received: by 10.66.228.201 with SMTP id sk9mr3583187pac.134.1395829720528;
	Wed, 26 Mar 2014 03:28:40 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([121.229.158.174])
	by mx.google.com with ESMTPSA id yx3sm56322777pbb.6.2014.03.26.03.28.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Mar 2014 03:28:39 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 18:27:39 +0800
Message-ID: <1603178.8LiZNp1sQv@yiqingliang-pc>
User-Agent: KMail/4.12.3 (Linux/3.13.6-1-ARCH; KDE/4.12.3; x86_64; ; )
In-Reply-To: <1601339.XSqVGrrJet@yiqingliang-pc>
References: <1601339.XSqVGrrJet@yiqingliang-pc>
MIME-Version: 1.0
Subject: Re: serial console problem
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
X-List-Received-Date: Wed, 26 Mar 2014 10:28:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, March 26, 2014 06:06:36 PM Yi Qingliang wrote:
> Hi,
> 	after update to the latest git version of poky, my image can't start
> the serial console,  i.e. I can't login, I'm using systemd as the init
> manager. any idea?
> 
> log:
> 
> Freeing init memory: 132K
> systemd[1]: systemd 211 running in system mode. (-PAM +LIBWRAP -
> AUDIT -SELINUX +IMA +SYSVINIT -LIBCRYPTSETUP -GCRYPT +ACL +XZ -
> SECCOMP -APPARMOR)
> systemd[1]: Detected architecture 'arm'.
> 
> Welcome to Linux!
> 
> systemd[1]: Failed to insert module 'autofs4'
> systemd[1]: Failed to insert module 'ipv6'
> systemd[1]: Set hostname to <kl360>.
> systemd[1]: Initializing machine ID from random generator.
> systemd[1]: Starting Forward Password Requests to Wall Directory
> Watch.
> systemd[1]: Started Forward Password Requests to Wall Directory
> Watch.
> systemd[1]: Expecting device dev-ttySAC0.device...
>          Expecting device dev-ttySAC0.device...
> systemd[1]: Starting Remote File Systems.
> [  OK  ] Reached target Remote File Systems.
> systemd[1]: Reached target Remote File Systems.
> systemd[1]: Starting Dispatch Password Requests to Console 
Directory
> Watch.
> systemd[1]: Started Dispatch Password Requests to Console 
Directory
> Watch.
> systemd[1]: Starting Paths.
> [  OK  ] Reached target Paths.
> systemd[1]: Reached target Paths.
> systemd[1]: Set up automount Arbitrary Executable File Formats File
> System Automount Point.
> systemd[1]: Starting Swap.
> [  OK  ] Reached target Swap.
> systemd[1]: Reached target Swap.
> systemd[1]: Starting Root Slice.
> [  OK  ] Created slice Root Slice.
> systemd[1]: Created slice Root Slice.
> systemd[1]: Starting Journal Socket.
> [  OK  ] Listening on Journal Socket.
> systemd[1]: Listening on Journal Socket.
> systemd[1]: Starting udev Control Socket.
> [  OK  ] Listening on udev Control Socket.
> systemd[1]: Listening on udev Control Socket.
> systemd[1]: Starting Delayed Shutdown Socket.
> [  OK  ] Listening on Delayed Shutdown Socket.
> systemd[1]: Listening on Delayed Shutdown Socket.
> systemd[1]: Starting /dev/initctl Compatibility Named Pipe.
> [  OK  ] Listening on /dev/initctl Compatibility Named Pipe.
> systemd[1]: Listening on /dev/initctl Compatibility Named Pipe.
> systemd[1]: Starting udev Kernel Socket.
> [  OK  ] Listening on udev Kernel Socket.
> systemd[1]: Listening on udev Kernel Socket.
> systemd[1]: Starting User and Session Slice.
> [  OK  ] Created slice User and Session Slice.
> systemd[1]: Created slice User and Session Slice.
> systemd[1]: Starting System Slice.
> [  OK  ] Created slice System Slice.
> systemd[1]: Created slice System Slice.
> systemd[1]: Started Set Up Additional Binary Formats.
> systemd[1]: Starting Journal Service...
>          Starting Journal Service...
> [  OK  ] Started Journal Service.
> systemd[1]: Started Journal Service.
>          Starting Apply Kernel Variables...
>          Mounting POSIX Message Queue File System...
>          Starting Create list of required static device nodes...rrent
> kernel...
>          Starting udev Coldplug all Devices...
>          Mounting Temporary Directory...
>          Starting Remount Root and Kernel File Systems..
>

after CONFIG_FHANDLE=y in kernel, everything OK!
please refer:
http://lists.freedesktop.org/archives/systemd-devel/2014-February/016927.html



