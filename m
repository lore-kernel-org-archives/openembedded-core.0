Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5929B6CA54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 10:36:19 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id rr13so1764961pbb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 03:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=4qcEXXTp98B/XMliCCGHHVedigCJ9KBAvf/gWCq0oIw=;
	b=lzoX9ZJoU/fTD3Nm1ec3k+UBSXwzGEljZ07N99wUw1FHzHPaEzoY/4hIrxwv7bxuCl
	tbD6iEdzrDHPTfOvEI3Grn3TFRLIDIlui0dlEy3Ibv6MF8nSit318mPd/++K2M3hH2y+
	NpKArkRmCBD9FYLpzdjFP5ppD9L0hPX9SEwiYBbWfF84Nzah34H3dYWHY2S84GuNcDoD
	yUk1xVwPTFarWnPQVB6IU24MdFm8N20EGBPMUvjnY0WutEMhi2Ks9f3K5XhqgHBsgwYr
	2p9mcfYLOOWRlCuX5QlDqJ6iO03ciS5Cw0jEg+YwPFMxI1DgUhNwkp7l4l4ucHDdwlZT
	I+3w==
X-Received: by 10.66.197.164 with SMTP id iv4mr84665671pac.18.1395830180642;
	Wed, 26 Mar 2014 03:36:20 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([121.229.158.174])
	by mx.google.com with ESMTPSA id
	op3sm56396456pbc.40.2014.03.26.03.36.07 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Mar 2014 03:36:19 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Date: Wed, 26 Mar 2014 18:35:18 +0800
Message-ID: <2168057.BSgia2fN0F@yiqingliang-pc>
User-Agent: KMail/4.12.3 (Linux/3.13.6-1-ARCH; KDE/4.12.3; x86_64; ; )
In-Reply-To: <CAPbeDCmZHNygetsodUNXMKKsPw3NYZO4eqw7Vcfm251rEqR+Ow@mail.gmail.com>
References: <1601339.XSqVGrrJet@yiqingliang-pc>
	<CAPbeDCmZHNygetsodUNXMKKsPw3NYZO4eqw7Vcfm251rEqR+Ow@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 26 Mar 2014 10:36:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, March 26, 2014 11:16:44 AM Jacob Kroon wrote:
> Hi Yi,
> 
> On Wed, Mar 26, 2014 at 11:06 AM, Yi Qingliang 
<niqingliang2003@gmail.com>wrote:
> > Hi,
> > 
> >         after update to the latest git version of poky, my image can't
> > 
> > start
> > the serial console,  i.e. I can't login, I'm using systemd as the init
> > manager. any idea?
> > 
> > log:
> > 
> > Freeing init memory: 132K
> > systemd[1]: systemd 211 running in system mode. (-PAM +LIBWRAP 
-
> > AUDIT -SELINUX +IMA +SYSVINIT -LIBCRYPTSETUP -GCRYPT +ACL +XZ 
-
> > SECCOMP -APPARMOR)
> > systemd[1]: Detected architecture 'arm'.
> > 
> > Welcome to Linux!
> > 
> > systemd[1]: Failed to insert module 'autofs4'
> > systemd[1]: Failed to insert module 'ipv6'
> > systemd[1]: Set hostname to <kl360>.
> > systemd[1]: Initializing machine ID from random generator.
> > systemd[1]: Starting Forward Password Requests to Wall Directory
> > Watch.
> > systemd[1]: Started Forward Password Requests to Wall Directory
> > Watch.
> > systemd[1]: Expecting device dev-ttySAC0.device...
> > 
> >          Expecting device dev-ttySAC0.device...
> > 
> > systemd[1]: Starting Remote File Systems.
> > [  OK  ] Reached target Remote File Systems.
> > systemd[1]: Reached target Remote File Systems.
> > systemd[1]: Starting Dispatch Password Requests to Console 
Directory
> > Watch.
> > systemd[1]: Started Dispatch Password Requests to Console 
Directory
> > Watch.
> > systemd[1]: Starting Paths.
> > [  OK  ] Reached target Paths.
> > systemd[1]: Reached target Paths.
> > systemd[1]: Set up automount Arbitrary Executable File Formats 
File
> > System Automount Point.
> > systemd[1]: Starting Swap.
> > [  OK  ] Reached target Swap.
> > systemd[1]: Reached target Swap.
> > systemd[1]: Starting Root Slice.
> > [  OK  ] Created slice Root Slice.
> > systemd[1]: Created slice Root Slice.
> > systemd[1]: Starting Journal Socket.
> > [  OK  ] Listening on Journal Socket.
> > systemd[1]: Listening on Journal Socket.
> > systemd[1]: Starting udev Control Socket.
> > [  OK  ] Listening on udev Control Socket.
> > systemd[1]: Listening on udev Control Socket.
> > systemd[1]: Starting Delayed Shutdown Socket.
> > [  OK  ] Listening on Delayed Shutdown Socket.
> > systemd[1]: Listening on Delayed Shutdown Socket.
> > systemd[1]: Starting /dev/initctl Compatibility Named Pipe.
> > [  OK  ] Listening on /dev/initctl Compatibility Named Pipe.
> > systemd[1]: Listening on /dev/initctl Compatibility Named Pipe.
> > systemd[1]: Starting udev Kernel Socket.
> > [  OK  ] Listening on udev Kernel Socket.
> > systemd[1]: Listening on udev Kernel Socket.
> > systemd[1]: Starting User and Session Slice.
> > [  OK  ] Created slice User and Session Slice.
> > systemd[1]: Created slice User and Session Slice.
> > systemd[1]: Starting System Slice.
> > [  OK  ] Created slice System Slice.
> > systemd[1]: Created slice System Slice.
> > systemd[1]: Started Set Up Additional Binary Formats.
> > systemd[1]: Starting Journal Service...
> > 
> >          Starting Journal Service...
> > 
> > [  OK  ] Started Journal Service.
> > systemd[1]: Started Journal Service.
> > 
> >          Starting Apply Kernel Variables...
> >          Mounting POSIX Message Queue File System...
> >          Starting Create list of required static device nodes...rrent
> > 
> > kernel...
> > 
> >          Starting udev Coldplug all Devices...
> >          Mounting Temporary Directory...
> >          Starting Remount Root and Kernel File Systems...
> 
> I had a very similar problem on my Wandboard, using latest systemd 
211.
> The solution for me was to enable CONFIG_FHANDLE in the kernel
> configuration.
> Maybe that could work for you aswell.
> Which makes me wonder if there is any sort infrastructre for handling
> kernel config. deps.
> /Jacob

thanks! it work now.

the kernel config is a problem. my own kernel can't follow the change 
closely.



