Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6EF1E60E68
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 10:16:44 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id u14so1293485lbd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 03:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zQUuiodZgduwWtC6yYdr9GUgF4629au5jTExuRpf/ZQ=;
	b=ejIqQa+bRY2tgBpZIJbLq+H+j2dda5pMQ2tOO5tvw55vUKW/pEudgJW+2ChuTMszhY
	hDxR0JDt4Mi08cDggJap26OzokeDtqBmrl5Rta9u6GJ7WZ4WWtTRQCmR+5TLXaT8b5+b
	iq6Cg+psjAcxV+9/qvGiuDJk2F/2N2TdLsinaXRPyEzEJBEazzHPC8WdAzJfPJauQCK7
	Jwmco7P4S++hcAXt7QKsOUKZKrZQ6k1KYbKCsIkodSg1lq1BXc/z8rPjRRp88//j409O
	trFMteNnhV8kcVvyBSm87PivC7A3jbihvHAyOXeZ9lC1H4kJgp9M/wRTgZZvYbHR6SF8
	ucxA==
MIME-Version: 1.0
X-Received: by 10.112.56.148 with SMTP id a20mr1003132lbq.44.1395829004991;
	Wed, 26 Mar 2014 03:16:44 -0700 (PDT)
Received: by 10.112.53.73 with HTTP; Wed, 26 Mar 2014 03:16:44 -0700 (PDT)
In-Reply-To: <1601339.XSqVGrrJet@yiqingliang-pc>
References: <1601339.XSqVGrrJet@yiqingliang-pc>
Date: Wed, 26 Mar 2014 11:16:44 +0100
Message-ID: <CAPbeDCmZHNygetsodUNXMKKsPw3NYZO4eqw7Vcfm251rEqR+Ow@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
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
X-List-Received-Date: Wed, 26 Mar 2014 10:16:45 -0000
Content-Type: multipart/alternative; boundary=001a113393c80280d104f57fc439

--001a113393c80280d104f57fc439
Content-Type: text/plain; charset=ISO-8859-1

Hi Yi,

On Wed, Mar 26, 2014 at 11:06 AM, Yi Qingliang <niqingliang2003@gmail.com>wrote:

> Hi,
>         after update to the latest git version of poky, my image can't
> start
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
> systemd[1]: Starting Dispatch Password Requests to Console Directory
> Watch.
> systemd[1]: Started Dispatch Password Requests to Console Directory
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
>          Starting Remount Root and Kernel File Systems...
>
>
I had a very similar problem on my Wandboard, using latest systemd 211.
The solution for me was to enable CONFIG_FHANDLE in the kernel
configuration.
Maybe that could work for you aswell.
Which makes me wonder if there is any sort infrastructre for handling
kernel config. deps.
/Jacob

--001a113393c80280d104f57fc439
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Yi,<br></div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Wed, Mar 26, 2014 at 11:06 AM, Yi Qingli=
ang <span dir=3D"ltr">&lt;<a href=3D"mailto:niqingliang2003@gmail.com" targ=
et=3D"_blank">niqingliang2003@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
=A0 =A0 =A0 =A0 after update to the latest git version of poky, my image ca=
n&#39;t start<br>
the serial console, =A0i.e. I can&#39;t login, I&#39;m using systemd as the=
 init<br>
manager. any idea?<br>
<br>
log:<br>
<br>
Freeing init memory: 132K<br>
systemd[1]: systemd 211 running in system mode. (-PAM +LIBWRAP -<br>
AUDIT -SELINUX +IMA +SYSVINIT -LIBCRYPTSETUP -GCRYPT +ACL +XZ -<br>
SECCOMP -APPARMOR)<br>
systemd[1]: Detected architecture &#39;arm&#39;.<br>
<br>
Welcome to Linux!<br>
<br>
systemd[1]: Failed to insert module &#39;autofs4&#39;<br>
systemd[1]: Failed to insert module &#39;ipv6&#39;<br>
systemd[1]: Set hostname to &lt;kl360&gt;.<br>
systemd[1]: Initializing machine ID from random generator.<br>
systemd[1]: Starting Forward Password Requests to Wall Directory<br>
Watch.<br>
systemd[1]: Started Forward Password Requests to Wall Directory<br>
Watch.<br>
systemd[1]: Expecting device dev-ttySAC0.device...<br>
=A0 =A0 =A0 =A0 =A0Expecting device dev-ttySAC0.device...<br>
systemd[1]: Starting Remote File Systems.<br>
[ =A0OK =A0] Reached target Remote File Systems.<br>
systemd[1]: Reached target Remote File Systems.<br>
systemd[1]: Starting Dispatch Password Requests to Console Directory<br>
Watch.<br>
systemd[1]: Started Dispatch Password Requests to Console Directory<br>
Watch.<br>
systemd[1]: Starting Paths.<br>
[ =A0OK =A0] Reached target Paths.<br>
systemd[1]: Reached target Paths.<br>
systemd[1]: Set up automount Arbitrary Executable File Formats File<br>
System Automount Point.<br>
systemd[1]: Starting Swap.<br>
[ =A0OK =A0] Reached target Swap.<br>
systemd[1]: Reached target Swap.<br>
systemd[1]: Starting Root Slice.<br>
[ =A0OK =A0] Created slice Root Slice.<br>
systemd[1]: Created slice Root Slice.<br>
systemd[1]: Starting Journal Socket.<br>
[ =A0OK =A0] Listening on Journal Socket.<br>
systemd[1]: Listening on Journal Socket.<br>
systemd[1]: Starting udev Control Socket.<br>
[ =A0OK =A0] Listening on udev Control Socket.<br>
systemd[1]: Listening on udev Control Socket.<br>
systemd[1]: Starting Delayed Shutdown Socket.<br>
[ =A0OK =A0] Listening on Delayed Shutdown Socket.<br>
systemd[1]: Listening on Delayed Shutdown Socket.<br>
systemd[1]: Starting /dev/initctl Compatibility Named Pipe.<br>
[ =A0OK =A0] Listening on /dev/initctl Compatibility Named Pipe.<br>
systemd[1]: Listening on /dev/initctl Compatibility Named Pipe.<br>
systemd[1]: Starting udev Kernel Socket.<br>
[ =A0OK =A0] Listening on udev Kernel Socket.<br>
systemd[1]: Listening on udev Kernel Socket.<br>
systemd[1]: Starting User and Session Slice.<br>
[ =A0OK =A0] Created slice User and Session Slice.<br>
systemd[1]: Created slice User and Session Slice.<br>
systemd[1]: Starting System Slice.<br>
[ =A0OK =A0] Created slice System Slice.<br>
systemd[1]: Created slice System Slice.<br>
systemd[1]: Started Set Up Additional Binary Formats.<br>
systemd[1]: Starting Journal Service...<br>
=A0 =A0 =A0 =A0 =A0Starting Journal Service...<br>
[ =A0OK =A0] Started Journal Service.<br>
systemd[1]: Started Journal Service.<br>
=A0 =A0 =A0 =A0 =A0Starting Apply Kernel Variables...<br>
=A0 =A0 =A0 =A0 =A0Mounting POSIX Message Queue File System...<br>
=A0 =A0 =A0 =A0 =A0Starting Create list of required static device nodes...r=
rent<br>
kernel...<br>
=A0 =A0 =A0 =A0 =A0Starting udev Coldplug all Devices...<br>
=A0 =A0 =A0 =A0 =A0Mounting Temporary Directory...<br>
=A0 =A0 =A0 =A0 =A0Starting Remount Root and Kernel File Systems...<br>
<span class=3D""><font color=3D"#888888"><br></font></span></blockquote><di=
v><br>I had a very similar problem on my Wandboard, using latest systemd 21=
1.<br>The solution for me was to enable CONFIG_FHANDLE in the kernel config=
uration.<br>
</div><div>Maybe that could work for you aswell.<br></div><div>Which makes =
me wonder if there is any sort infrastructre for handling kernel config. de=
ps.<br></div><div>/Jacob</div></div></div></div>

--001a113393c80280d104f57fc439--
