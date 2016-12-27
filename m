Return-Path: <skrishnakar@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 43C8B60589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2016 09:49:29 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id a197so258041941wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2016 01:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iTDMqDOLy7gsTbNy7wZl2/AL7CDpy6NuWlAz5oDeZXM=;
	b=VJTPwc4WdCfNb6Qh8jDaky+JRNlZcqkDh4e6A30Y/nnBlKmvtd+1x9MbxGrgCRKBMn
	dhuo8t6/4elBq5PMZn5qLoXmKKdVOCz6ejwvrARxTlqVVkM9x++1pwaEnaX75sG8mnRB
	JpxeU9jToMY3ULq40Imj7+silXKtH5qj8KyItKcxzivIGs/MuQAquOM8Ols+n7ElTp4E
	SzhTleHr7tHPG83rQImWX6FwAx8JN2fGLfU8NE2/oexgv6GcXhry91OxOL+IbfidSvpa
	GY0IWwb/wmhk4lald+OsVjPAfhd+n/t941KzeaNl3oCbPAqW0owkWNE0OE8gtN3irJxT
	Zahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iTDMqDOLy7gsTbNy7wZl2/AL7CDpy6NuWlAz5oDeZXM=;
	b=ooRRDrA0hpBrhj4jUOafIouC3gww6IWNnR0m0zSBK/PicEGeRdlW6sgr0ghwSgZGSo
	iEQ5kE1iu7W6eZMabtG6xDlv/0kaiim6UJih047yeZpTWCEqX6VDej7Ot0FvLTL/znT2
	DMinLHNxiLAflg2543VG7zIj+furbAObucF4Kf4aqt3RiACbU3Nw4Mk4Yqs4i1LofSXR
	B7Htdo0KKAuLoTWCkBQm+Kg5IbUFgbWjBn99i0siFw7njlhIxddNn0j0xV2n/ou/Mfdt
	ZfDZukCIMzKqY/rUX0KphIX0G14HOzkp1rQwNquecrjAFL64kJySURzrfBhtsBeRcfP/
	ukqA==
X-Gm-Message-State: AIkVDXLOa6qLNMp9cYhfRZBN1UFGU4T5cxV2Ap0TR6pRYdxEVjLSlJL6/se9PqsT5oh1HxrWJYYc78GX/tAssg==
X-Received: by 10.28.136.198 with SMTP id k189mr26745913wmd.24.1482832170747; 
	Tue, 27 Dec 2016 01:49:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.134.9 with HTTP; Tue, 27 Dec 2016 01:48:50 -0800 (PST)
In-Reply-To: <CALDxG5hjMaUwmRTR9GLoYb7nmvMUKi08ZMNog5jviJrnJ42naw@mail.gmail.com>
References: <CALDxG5gxGqHP7S1fK-NmFrvQt9KRgjH+u4t+xHF=3m=UvUY=bQ@mail.gmail.com>
	<1482748609.9843.136.camel@linuxfoundation.org>
	<CALDxG5h=3iZTJp=d_4RKGs6pOC=W6MJeFeJ6_-ykayqWv1i3nw@mail.gmail.com>
	<CALDxG5hjMaUwmRTR9GLoYb7nmvMUKi08ZMNog5jviJrnJ42naw@mail.gmail.com>
From: srikanth krishnakar <skrishnakar@gmail.com>
Date: Tue, 27 Dec 2016 15:18:50 +0530
Message-ID: <CALDxG5ihGZU3f4ipau1nm19_p-C+XRTGxq71OvapTC6J4-8yMQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Yocto-2.2 build failures on Ubuntu 14.04.5 & 16.04.x hosts due to crash of unity-settings-daemon followed by restart of lightdm
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
X-List-Received-Date: Tue, 27 Dec 2016 09:49:30 -0000
Content-Type: multipart/alternative; boundary=001a11443a8acc8d5b0544a0c41e

--001a11443a8acc8d5b0544a0c41e
Content-Type: text/plain; charset=UTF-8

Hello Richard,

I was under impression that installing Ubuntu-14.04.4 (+lastest updates)
would give me stable build environment, unfortunately that is not the case
! I could see the logout issue on this installation too. So I believe that
issue should be reproducible on any 14.04.x installation including 16.04.x
with all latest updates installed. The second attempt of build on
"Ubuntu-14.04.4" shows the status of bitbake as halted at libvorbis when
logout happened:

---------------------------------------------------------
NOTE: Running task 2460 of 4212
(/home/poky/meta/recipes-core/ncurses/ncurses_6.0+20160625.bb:
do_packagedata)
NOTE: recipe ncurses-6.0+20160625-r0: task do_packagedata: Started
NOTE: recipe ncurses-6.0+20160625-r0: task do_packagedata: Succeeded
NOTE: Running task 2461 of 4212
(/home/poky/meta/recipes-core/readline/readline_6.3.bb:do_package)
NOTE: recipe libjpeg-turbo-1_1.5.0-r0: task do_package: Succeeded
NOTE: Running task 2462 of 4212
(/home/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.0.bb:
do_packagedata)
NOTE: recipe libjpeg-turbo-1_1.5.0-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_1.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2463 of 4212
(/home/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb:do_package)
NOTE: recipe readline-6.3-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.5-r0: task do_package: Started
---------------------------------------------------------

The "$HOME/.xsession-errors.old" file shows the message:
---------------------------------------------------------
Script for ibus started at run_im.
Script for auto started at run_im.
Script for default started at run_im.
init: at-spi2-registryd main process ended, respawning
init: at-spi2-registryd main process ended, respawning
init: at-spi2-registryd main process ended, respawning
init: at-spi2-registryd respawning too fast, stopped
init: indicator-messages main process (17542) killed by SEGV signal
init: indicator-messages main process ended, respawning
init: update-notifier-crash
(/var/crash/_usr_lib_x86_64-linux-gnu_indicator-messages_indicator-messages-service.1000.crash)
main process (18792) terminated with status 1
init: update-notifier-crash
(/var/crash/_usr_share_apport_apport-gtk.1000.crash) main process (21151)
terminated with status 1
init: unity-panel-service-lockscreen main process (29904) killed by KILL
signal
---------------------------------------------------------

It appears that lightdm is unable the handle the SIGNAL and restarting when
it receives them. Some of the most anticipated bugfixes patches for lightdm
yet to arrive in ubuntu-14.04.6 which are not released yet can be found
here:

https://launchpad.net/lightdm/+milestone/1.10.7

Current version of lightdm in ubuntu-14.04.4/5 -> 1.10.6

Thanks,
Srikant

On Mon, Dec 26, 2016 at 6:59 PM, srikanth krishnakar <skrishnakar@gmail.com>
wrote:

> Hello Richard,
>
> bitbake | cat shows that when this logout happened during build, log file
> captured below packages in process:
>
> ------------------------------------------------------------
> --------------------------------
> NOTE: Running task 1886 of 4212 (/home/builder/poky/meta/
> recipes-graphics/xorg-proto/kbproto_1.0.7.bb:do_packagedata)
> NOTE: recipe kbproto-1_1.0.7-r0: task do_packagedata: Started
> NOTE: recipe kbproto-1_1.0.7-r0: task do_packagedata: Succeeded
> NOTE: Running task 1887 of 4212 (/home/builder/poky/meta/
> recipes-support/libffi/libffi_3.2.1.bb:do_package)
> NOTE: recipe ncurses-6.0+20160625-r0: task do_package: Started
> NOTE: recipe libffi-3.2.1-r0: task do_package: Started
> NOTE: recipe libffi-3.2.1-r0: task do_package: Succeeded
> NOTE: Running task 1888 of 4212 (/home/builder/poky/meta/
> recipes-support/libffi/libffi_3.2.1.bb:do_packagedata)
> NOTE: recipe libffi-3.2.1-r0: task do_packagedata: Started
> NOTE: recipe libffi-3.2.1-r0: task do_packagedata: Succeeded
> NOTE: Running task 1889 of 4212 (/home/builder/poky/meta/
> recipes-extended/bzip2/bzip2_1.0.6.bb:do_package)
> NOTE: recipe bzip2-1.0.6-r5: task do_package: Started
> ------------------------------------------------------------
> -----------------------------------
>
> Also there was a crash file generated in "/var/crash" folder:
> /var/crash/_usr_lib_accountsservice_accounts-daemon.0.crash
>
> That has following information in it:
> ------------------------------------------------------------
> -------------------------------------
> ProblemType: Crash
> Architecture: amd64
> Date: Mon Dec 26 18:23:22 2016
> DistroRelease: Ubuntu 14.04
> ExecutablePath: /usr/lib/accountsservice/accounts-daemon
> ExecutableTimestamp: 1478200365
> ProcCmdline: /usr/lib/accountsservice/accounts-daemon
> ProcCwd: /
> ProcEnviron:
> ProcMaps:
>  00400000-00426000 r-xp 00000000 08:01 2626520
> /usr/lib/accountsservice/accounts-daemon
>  00625000-00628000 r--p 00025000 08:01 2626520
> /usr/lib/accountsservice/accounts-daemon
>  00628000-00629000 rw-p 00028000 08:01 2626520
> /usr/lib/accountsservice/accounts-daemon
>  024aa000-0252a000 rw-p 00000000 00:00 0
> [heap]
>  7fe460000000-7fe460022000 rw-p 00000000 00:00 0
>  7fe460022000-7fe464000000 ---p 00000000 00:00 0
>  7fe464000000-7fe464021000 rw-p 00000000 00:00 0
>  7fe464021000-7fe468000000 ---p 00000000 00:00 0
>  7fe469f56000-7fe469f60000 r-xp 00000000 08:01 1839849
> /lib/x86_64-linux-gnu/libnss_files-2.19.so
>  7fe469f60000-7fe46a15f000 ---p 0000a000 08:01 1839849
> /lib/x86_64-linux-gnu/libnss_files-2.19.so
>  7fe46a15f000-7fe46a160000 r--p 00009000 08:01 1839849
> /lib/x86_64-linux-gnu/libnss_files-2.19.so
> ...
> ...
>  7fe474b3e000-7fe474b40000 rw-p 00000000 00:00 0
>  7fe474b40000-7fe474b41000 r--p 00022000 08:01 1839750
> /lib/x86_64-linux-gnu/ld-2.19.so
>  7fe474b41000-7fe474b42000 rw-p 00023000 08:01 1839750
> /lib/x86_64-linux-gnu/ld-2.19.so
>  7fe474b42000-7fe474b43000 rw-p 00000000 00:00 0
>  7ffcaca64000-7ffcaca85000 rw-p 00000000 00:00 0
> [stack]
>  7ffcacaf5000-7ffcacaf7000 r--p 00000000 00:00 0
> [vvar]
>  7ffcacaf7000-7ffcacaf9000 r-xp 00000000 00:00 0
> [vdso]
>  ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0
> [vsyscall]
> ProcStatus:
>  Name:  accounts-daemon
>  State: D (disk sleep)
>  Tgid:  1248
>  Ngid:  0
>  Pid:   1248
>  PPid:  1
>  TracerPid:     0
>  Uid:   0       0       0       0
>  Gid:   0       0       0       0
>  FDSize:        64
>  Groups:        0
>  NStgid:        1248
>  NSpid: 1248
>  NSpgid:        795
>  NSsid: 795
>  VmPeak:          302404 kB
>  VmSize:          302368 kB
>  VmPin:        0 kB
>  VmHWM:    10128 kB
>  VmRSS:     4464 kB
>  VmData:          221944 kB
>  VmStk:      136 kB
>  VmExe:      152 kB
>  VmLib:    10140 kB
>  VmPTE:      200 kB
>  VmPMD:       12 kB
>  VmSwap:            2976 kB
>  HugetlbPages:         0 kB
>  Threads:       3
>  SigQ:  0/31670
>  SigPnd:        0000000000000000
>  ShdPnd:        0000000000000000
>  SigBlk:        0000000000000000
>  SigIgn:        0000000000001000
>  SigCgt:        0000000180004002
>  CapInh:        0000000000000000
>  CapPrm:        0000003fffffffff
>  CapEff:        0000003fffffffff
>  CapBnd:        0000003fffffffff
>  CapAmb:        0000000000000000
>  Seccomp:       0
>  Cpus_allowed:  ff
>  Cpus_allowed_list:     0-7
>  Mems_allowed:  00000000,00000001
>  Mems_allowed_list:     0
>  voluntary_ctxt_switches:       152
>  nonvoluntary_ctxt_switches:    2
> Signal: 7
> Uname: Linux 4.4.0-57-generic x86_64
> UserGroups:
> CoreDump: base64
> ------------------------------------------------------------
> -------------------------------------
>
> My machine is:
>
> *Quad-Core:* (0-8)
> ---------------------------------------
> $ cat /proc/cpuinfo
> processor    : 0
> vendor_id    : GenuineIntel
> cpu family    : 6
> model        : 42
> model name    : Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz
> -----
> $ cat /proc/meminfo
> MemTotal:        8132472 kB
> ----------------------------------------
>
> When I checked free memory just before the logout was about "125MB" out of
> 8GB RAM.
>
> NOTE: The Ubuntu-14.04.4 that had older graphics stack seem to work
> normally without any issue. The "ubuntu-14.04.5" & "16.04" came with latest
> graphics stack & kernel with removal of non-opensource fglrx drivers.
>
> Thanks for your patience!
>
> --
> Regards,
> Srikant
>
>
> On Mon, Dec 26, 2016 at 4:28 PM, srikanth krishnakar <
> skrishnakar@gmail.com> wrote:
>
>> Hello Richard,
>>
>> Sure, watching is best thing we can do, but it happens somewhere after
>> 2900 tasks i.e just after linux-yocto.
>> Screen recorders usually ask for file name and destination folder for
>> saving the file, will try to see if it works as you said.
>> "bitbake | cat" is the best method that we can get info from.
>>
>> The issue is noticeable only in ubuntu (unity) desktop's and not in
>> Kubuntu (KDE), Ubuntu-gnome (Gnome-3) or Xubuntu (XFCE) desktops.
>>
>> Will fetch more details as per your suggestion.
>>
>> Thank you !
>>
>> On Mon, Dec 26, 2016 at 4:06 PM, Richard Purdie <
>> richard.purdie@linuxfoundation.org> wrote:
>>
>>> On Mon, 2016-12-26 at 15:11 +0530, srikanth krishnakar wrote:
>>> > Environment: Ubuntu-14.04.5/16.04.1 (64-bit)
>>> > Yocto build: qemuarm
>>> > Target image: core-image-sato
>>> > Error nature: The lightdm restarts on its own and logs out by killing
>>> > processes running and brings up a login UI.
>>> >
>>> >
>>> > We have been observing yocto-2.2 build failures on Ubuntu 14.04.5 and
>>> > Ubuntu-16.04.1 hosts due to restart of "lightdm" (Light Desktop
>>> > Manager)  that is triggered by crash of "unity-settings-daemon", we
>>> > couldn't figure out any workaround so far to overcome the issue. The
>>> > build goes fine in the beginning but eventually the unity desktop
>>> > logs out and kills all the processes running in the user session
>>> > (including bitbake) and lands us into "Login screen" and when we
>>> > login its a new session where as the bitbake running in previous
>>> > session is killed and we need to continue the build. This is
>>> > happening consistently when the user logs into desktop via lightdm
>>> > and triggers a build.
>>> >
>>> > Another interesting thing to notice is the build goes fine if we
>>> > connect to host via. SSH session and invoke a bitbake build. We are
>>> > suspecting on unity-settings-daemon that is crashing consistently and
>>> > is evident from the ".xsession-errors" log file as shown below:
>>> >
>>> > builder@ubuntu:~$ cat .xsession-errors.old
>>> > Script for ibus started at run_im.
>>> > Script for auto started at run_im.
>>> > Script for default started at run_im.
>>> > init: Disconnected from notified D-Bus bus
>>> > init:"unity-settings-daemon main process (2076) terminated with
>>> > status 1"
>>> > init: indicator-bluetooth main process (2212) killed by TERM signal
>>> > init: indicator-power main process (2214) killed by TERM signal
>>> > init: indicator-datetime main process (2215) killed by TERM signal
>>> > init: indicator-printers main process (2222) killed by TERM signal
>>> > init: indicator-session main process (2245) killed by TERM signal
>>> > init: indicator-application main process (2270) killed by TERM signal
>>> >
>>> > Corresponding unity-settings-daemon bug reported in Launchpad:
>>> >
>>> > https://bugs.launchpad.net/ubuntu/+source/unity-settings-daemon/+bug/
>>> > 1546641
>>> >
>>> > Would anyone kindly confirm the logout behaviour during bitbake
>>> > process on Ubuntu-14.04.5 & Ubuntu-16.04.1 ? Since Yocto 2.2 mentions
>>> > both Ubuntu-14.04 & 16.04 as supported distributions this blocker
>>> > issue must be resolved at earliest.
>>> >
>>> > Appreciate your Inputs !
>>>
>>> What would really help is knowing what recipe is being built when this
>>> happens. There are a few ways you might be able to figure this out:
>>>
>>> a) Watching the screen to see which recipes were building when it
>>> happens
>>> b) Perhaps using some kind of screen recorder to automate this, you'd
>>> be able to review the recording to see when it breaks
>>> c) Looking at the bitbake/build logs to see what it was doing when the
>>> build broke (assuming bitbake stops when the session dies).
>>>
>>> "bitbake | cat" can provide better output for this since it will
>>> produce a scrolling log rather than the more interactive UI.
>>>
>>> Once you find the problematic recipe, a "bitbake XXX -c clean; bitbake
>>> XXX" should hopefully reproduce this more easily.
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>
>>
>

--001a11443a8acc8d5b0544a0c41e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:monospace,monospace">Hello Rich=
ard,</span><div><span style=3D"font-family:monospace,monospace"><br></span>=
</div><div><span style=3D"font-family:monospace,monospace">I was under impr=
ession that installing Ubuntu-14.04.4 (+lastest updates) would give me stab=
le build environment, unfortunately that is not the case ! I could see the =
logout issue on this installation too. So I believe that issue should be re=
producible on any 14.04.x installation including 16.04.x with all latest up=
dates installed. The second attempt of build on &quot;Ubuntu-14.04.4&quot; =
shows the status of bitbake as halted at libvorbis when logout happened:<br=
><br>---------------------------------------------------------<br>NOTE: Run=
ning task 2460 of 4212 (/home/poky/meta/recipes-core/ncurses/ncurses_6.0+20=
160625.bb:do_packagedata)<br>NOTE: recipe ncurses-6.0+20160625-r0: task do_=
packagedata: Started<br>NOTE: recipe ncurses-6.0+20160625-r0: task do_packa=
gedata: Succeeded<br>NOTE: Running task 2461 of 4212 (/home/poky/meta/recip=
es-core/readline/readline_6.3.bb:do_package)<br>NOTE: recipe libjpeg-turbo-=
1_1.5.0-r0: task do_package: Succeeded<br>NOTE: Running task 2462 of 4212 (=
/home/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.0.bb:do_packagedata=
)<br>NOTE: recipe libjpeg-turbo-1_1.5.0-r0: task do_packagedata: Started<br=
>NOTE: recipe libjpeg-turbo-1_1.5.0-r0: task do_packagedata: Succeeded<br>N=
OTE: Running task 2463 of 4212 (/home/poky/meta/recipes-multimedia/libvorbi=
s/libvorbis_1.3.5.bb:do_package)<br>NOTE: recipe readline-6.3-r0: task do_p=
ackage: Started<br>NOTE: recipe libvorbis-1.3.5-r0: task do_package: Starte=
d<br>---------------------------------------------------------<br><br></spa=
n></div><div><span style=3D"font-family:monospace,monospace">The &quot;$HOM=
E/.xsession-errors.old&quot; file shows the message:<br>-------------------=
--------------------------------------<br>Script for ibus started at run_im=
.<br>Script for auto started at run_im.<br>Script for default started at ru=
n_im.<br>init: at-spi2-registryd main process ended, respawning<br>init: at=
-spi2-registryd main process ended, respawning<br>init: at-spi2-registryd m=
ain process ended, respawning<br>init: at-spi2-registryd respawning too fas=
t, stopped<br>init: indicator-messages main process (17542) killed by SEGV =
signal<br>init: indicator-messages main process ended, respawning<br>init: =
update-notifier-crash (/var/crash/_usr_lib_x86_64-linux-gnu_indicator-messa=
ges_indicator-messages-service.1000.crash) main process (18792) terminated =
with status 1<br>init: update-notifier-crash (/var/crash/_usr_share_apport_=
apport-gtk.1000.crash) main process (21151) terminated with status 1<br>ini=
t: unity-panel-service-lockscreen main process (29904) killed by KILL signa=
l<br>---------------------------------------------------------<br><br></spa=
n></div><div><span style=3D"font-family:monospace,monospace">It appears tha=
t lightdm is unable the handle the SIGNAL and restarting when it receives t=
hem. Some of the most anticipated bugfixes patches for lightdm yet to arriv=
e in ubuntu-14.04.6 which are not released yet can be found here:<br><br><a=
 href=3D"https://launchpad.net/lightdm/+milestone/1.10.7">https://launchpad=
.net/lightdm/+milestone/1.10.7</a><br><br></span></div><div><span style=3D"=
font-family:monospace,monospace">Current version of lightdm in ubuntu-14.04=
.4/5 -&gt; 1.10.6<br><br></span></div><div><span style=3D"font-family:monos=
pace,monospace">Thanks,<br></span></div><div><span style=3D"font-family:mon=
ospace,monospace">Srikant</span><br></div></div><div class=3D"gmail_extra">=
<br><div class=3D"gmail_quote">On Mon, Dec 26, 2016 at 6:59 PM, srikanth kr=
ishnakar <span dir=3D"ltr">&lt;<a href=3D"mailto:skrishnakar@gmail.com" tar=
get=3D"_blank">skrishnakar@gmail.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div dir=3D"ltr"><div><div><div><span style=3D"font-famil=
y:monospace,monospace">Hello Richard,<br><br></span></div><span style=3D"fo=
nt-family:monospace,monospace">bitbake | cat shows that when this logout ha=
ppened during build, log file captured below packages in process: <br><br>-=
-----------------------------<wbr>------------------------------<wbr>------=
------------------------<wbr>--<br>NOTE: Running task 1886 of 4212 (/home/b=
uilder/poky/meta/<wbr>recipes-graphics/xorg-proto/<wbr>kbproto_1.0.7.bb:do_=
<wbr>packagedata)<br>NOTE: recipe kbproto-1_1.0.7-r0: task do_packagedata: =
Started<br>NOTE: recipe kbproto-1_1.0.7-r0: task do_packagedata: Succeeded<=
br>NOTE: Running task 1887 of 4212 (/home/builder/poky/meta/<wbr>recipes-su=
pport/libffi/libffi_<wbr>3.2.1.bb:do_package)<br>NOTE: recipe ncurses-6.0+2=
0160625-r0: task do_package: Started<br>NOTE: recipe libffi-3.2.1-r0: task =
do_package: Started<br>NOTE: recipe libffi-3.2.1-r0: task do_package: Succe=
eded<br>NOTE: Running task 1888 of 4212 (/home/builder/poky/meta/<wbr>recip=
es-support/libffi/libffi_<wbr>3.2.1.bb:do_packagedata)<br>NOTE: recipe libf=
fi-3.2.1-r0: task do_packagedata: Started<br>NOTE: recipe libffi-3.2.1-r0: =
task do_packagedata: Succeeded<br>NOTE: Running task 1889 of 4212 (/home/bu=
ilder/poky/meta/<wbr>recipes-extended/bzip2/bzip2_<wbr>1.0.6.bb:do_package)=
<br>NOTE: recipe bzip2-1.0.6-r5: task do_package: Started<br>--------------=
----------------<wbr>------------------------------<wbr>-------------------=
-----------<wbr>-----<br><br></span></div><span style=3D"font-family:monosp=
ace,monospace">Also there was a crash file generated in &quot;/var/crash&qu=
ot; folder: /var/crash/_usr_lib_<wbr>accountsservice_accounts-<wbr>daemon.0=
.crash<br><br></span></div><span style=3D"font-family:monospace,monospace">=
That has following information in it: <br>------------------------------<wb=
r>------------------------------<wbr>------------------------------<wbr>---=
----<br>ProblemType: Crash<br>Architecture: amd64<br>Date: Mon Dec 26 18:23=
:22 2016<br>DistroRelease: Ubuntu 14.04<br>ExecutablePath: /usr/lib/account=
sservice/<wbr>accounts-daemon<br>ExecutableTimestamp: 1478200365<br>ProcCmd=
line: /usr/lib/accountsservice/<wbr>accounts-daemon<br>ProcCwd: /<br>ProcEn=
viron:<br>ProcMaps:<br>=C2=A000400000-00426000 r-xp 00000000 08:01 2626520=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=
=C2=A0=C2=A0=C2=A0 /usr/lib/accountsservice/<wbr>accounts-daemon<br>=C2=A00=
0625000-00628000 r--p 00025000 08:01 2626520=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0 /usr/lib/acc=
ountsservice/<wbr>accounts-daemon<br>=C2=A000628000-00629000 rw-p 00028000 =
08:01 2626520=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0 /usr/lib/accountsservice/<wbr>accounts-dae=
mon<br>=C2=A0024aa000-0252a000 rw-p 00000000 00:00 0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0 [heap]<br>=C2=A07fe460000000-7fe460022000 =
rw-p 00000000 00:00 0<br>=C2=A07fe460022000-7fe464000000 ---p 00000000 00:0=
0 0<br>=C2=A07fe464000000-7fe464021000 rw-p 00000000 00:00 0<br>=C2=A07fe46=
4021000-7fe468000000 ---p 00000000 00:00 0<br>=C2=A07fe469f56000-7fe469f600=
00 r-xp 00000000 08:01 1839849=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /lib/=
x86_64-linux-gnu/<a href=3D"http://libnss_files-2.19.so" target=3D"_blank">=
libnss_<wbr>files-2.19.so</a><br>=C2=A07fe469f60000-7fe46a15f000 ---p 0000a=
000 08:01 1839849=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /lib/x86_64-linux=
-gnu/<a href=3D"http://libnss_files-2.19.so" target=3D"_blank">libnss_<wbr>=
files-2.19.so</a><br>=C2=A07fe46a15f000-7fe46a160000 r--p 00009000 08:01 18=
39849=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /lib/x86_64-linux-gnu/<a href=
=3D"http://libnss_files-2.19.so" target=3D"_blank">libnss_<wbr>files-2.19.s=
o</a><br>...<br>...<br>=C2=A07fe474b3e000-7fe474b40000 rw-p 00000000 00:00 =
0<br>=C2=A07fe474b40000-7fe474b41000 r--p 00022000 08:01 1839750=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /lib/x86_64-linux-gnu/<a href=3D"http://ld-2=
.19.so" target=3D"_blank">ld-2.19.<wbr>so</a><br>=C2=A07fe474b41000-7fe474b=
42000 rw-p 00023000 08:01 1839750=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /l=
ib/x86_64-linux-gnu/<a href=3D"http://ld-2.19.so" target=3D"_blank">ld-2.19=
.<wbr>so</a><br>=C2=A07fe474b42000-7fe474b43000 rw-p 00000000 00:00 0<br>=
=C2=A07ffcaca64000-7ffcaca85000 rw-p 00000000 00:00 0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [stack]<br>=C2=A07ff=
cacaf5000-7ffcacaf7000 r--p 00000000 00:00 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [vvar]<br>=C2=A07ffcacaf7000-=
7ffcacaf9000 r-xp 00000000 00:00 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [vdso]<br>=C2=A0ffffffffff600000-<wbr>=
ffffffffff601000 r-xp 00000000 00:00 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [vsyscal=
l]<br>ProcStatus:<br>=C2=A0Name:=C2=A0 accounts-daemon<br>=C2=A0State: D (d=
isk sleep)<br>=C2=A0Tgid:=C2=A0 1248<br>=C2=A0Ngid:=C2=A0 0<br>=C2=A0Pid:=
=C2=A0=C2=A0 1248<br>=C2=A0PPid:=C2=A0 1<br>=C2=A0TracerPid:=C2=A0=C2=A0=C2=
=A0=C2=A0 0<br>=C2=A0Uid:=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0<br>=C2=A0Gid:=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0<b=
r>=C2=A0FDSize:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 64<br>=C2=A0Group=
s:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0<br>=C2=A0NStgid:=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1248<br>=C2=A0NSpid: 1248<br>=C2=A0NSpgid:=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 795<br>=C2=A0NSsid: 795<br>=C2=
=A0VmPeak:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 302404 kB<=
br>=C2=A0VmSize:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3023=
68 kB<br>=C2=A0VmPin:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 kB<br>=C2=
=A0VmHWM:=C2=A0=C2=A0=C2=A0 10128 kB<br>=C2=A0VmRSS:=C2=A0=C2=A0=C2=A0=C2=
=A0 4464 kB<br>=C2=A0VmData:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 221944 kB<br>=C2=A0VmStk:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 136 kB<br=
>=C2=A0VmExe:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 152 kB<br>=C2=A0VmLib:=C2=A0=C2=
=A0=C2=A0 10140 kB<br>=C2=A0VmPTE:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 200 kB<br>=
=C2=A0VmPMD:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12 kB<br>=C2=A0VmSwap:=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2976 kB<br>=
=C2=A0HugetlbPages:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 kB<br=
>=C2=A0Threads:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3<br>=C2=A0SigQ:=C2=A0 =
0/31670<br>=C2=A0SigPnd:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000000=
00000000<br>=C2=A0ShdPnd:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0000000=
000000000<br>=C2=A0SigBlk:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 000000=
0000000000<br>=C2=A0SigIgn:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000=
00000001000<br>=C2=A0SigCgt:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0000=
000180004002<br>=C2=A0CapInh:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 000=
0000000000000<br>=C2=A0CapPrm:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00=
00003fffffffff<br>=C2=A0CapEff:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
000003fffffffff<br>=C2=A0CapBnd:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0000003fffffffff<br>=C2=A0CapAmb:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0000000000000000<br>=C2=A0Seccomp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0<b=
r>=C2=A0Cpus_allowed:=C2=A0 ff<br>=C2=A0Cpus_allowed_list:=C2=A0=C2=A0=C2=
=A0=C2=A0 0-7<br>=C2=A0Mems_allowed:=C2=A0 00000000,00000001<br>=C2=A0Mems_=
allowed_list:=C2=A0=C2=A0=C2=A0=C2=A0 0<br>=C2=A0voluntary_ctxt_switches:=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0 152<br>=C2=A0nonvoluntary_ctxt_sw=
itches:=C2=A0=C2=A0<wbr>=C2=A0 2<br>Signal: 7<br>Uname: Linux 4.4.0-57-gene=
ric x86_64<br>UserGroups:<br>CoreDump: base64<br>--------------------------=
----<wbr>------------------------------<wbr>------------------------------<=
wbr>-------<br><br></span><div><div><span style=3D"font-family:monospace,mo=
nospace">My machine is: <br><br></span></div><div><span style=3D"font-famil=
y:monospace,monospace"><b>Quad-Core:</b> (0-8)<br></span></div><div><span s=
tyle=3D"font-family:monospace,monospace">------------------------------<wbr=
>---------<br>$ cat /proc/cpuinfo <br>processor=C2=A0=C2=A0=C2=A0 : 0<br>ve=
ndor_id=C2=A0=C2=A0=C2=A0 : GenuineIntel<br>cpu family=C2=A0=C2=A0=C2=A0 : =
6<br>model=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : 42<br>model name=C2=A0=C2=
=A0=C2=A0 : Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz<br>-----<br>$ cat /proc=
/meminfo<br>MemTotal:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8132472 kB<=
br>------------------------------<wbr>----------<br><br></span></div><div><=
span style=3D"font-family:monospace,monospace">When I checked free memory j=
ust before the logout was about &quot;125MB&quot; out of 8GB RAM. <br><br><=
/span></div><div><span style=3D"font-family:monospace,monospace">NOTE: The =
Ubuntu-14.04.4 that had older graphics stack seem to work normally without =
any issue. The &quot;ubuntu-14.04.5&quot; &amp; &quot;16.04&quot; came with=
 latest graphics stack &amp; kernel with removal of non-opensource fglrx dr=
ivers. <br><br></span></div><div><span style=3D"font-family:monospace,monos=
pace">Thanks for your patience! <br><br>--<br></span></div><div><span style=
=3D"font-family:monospace,monospace">Regards,<br></span></div><div><span st=
yle=3D"font-family:monospace,monospace">Srikant</span><br></div><div><br></=
div></div></div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On Mon, Dec 26, 2016 at 4:28 PM, sri=
kanth krishnakar <span dir=3D"ltr">&lt;<a href=3D"mailto:skrishnakar@gmail.=
com" target=3D"_blank">skrishnakar@gmail.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"ltr"><font face=3D"monospace, monospa=
ce">Hello Richard,</font><div><font face=3D"monospace, monospace"><br></fon=
t></div><div><font face=3D"monospace, monospace">Sure, watching is best thi=
ng we can do, but it happens somewhere after 2900 tasks i.e just after linu=
x-yocto.=C2=A0</font></div><div><font face=3D"monospace, monospace">Screen =
recorders usually ask for file name and destination folder for saving the f=
ile, will try to see if it works as you said.=C2=A0</font></div><div><font =
face=3D"monospace, monospace">&quot;bitbake | cat&quot; is the best method =
that we can get info from.=C2=A0</font></div><div><font face=3D"monospace, =
monospace"><br></font></div><div><font face=3D"monospace, monospace">The is=
sue is noticeable=C2=A0only in ubuntu (unity) desktop&#39;s and not in Kubu=
ntu (KDE), Ubuntu-gnome (Gnome-3) or Xubuntu (XFCE) desktops.=C2=A0</font><=
/div><div><font face=3D"monospace, monospace"><br></font></div><div><font f=
ace=3D"monospace, monospace">Will fetch more details as per your suggestion=
.=C2=A0</font></div><div><font face=3D"monospace, monospace"><br></font></d=
iv><div><font face=3D"monospace, monospace">Thank you !</font></div></div><=
div class=3D"m_55862884651501980HOEnZb"><div class=3D"m_55862884651501980h5=
"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Dec 26,=
 2016 at 4:06 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfou=
ndatio<wbr>n.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv class=3D"m_55862884651501980m_-395161690401130742HOEnZb"><div class=3D"m=
_55862884651501980m_-395161690401130742h5">On Mon, 2016-12-26 at 15:11 +053=
0, srikanth krishnakar wrote:<br>
&gt; Environment: Ubuntu-14.04.5/16.04.1 (64-bit)<br>
&gt; Yocto build: qemuarm<br>
&gt; Target image: core-image-sato<br>
&gt; Error nature: The lightdm restarts on its own and logs out by killing<=
br>
&gt; processes running and brings up a login UI.=C2=A0<br>
&gt;<br>
&gt;<br>
&gt; We have been observing yocto-2.2 build failures on Ubuntu 14.04.5 and<=
br>
&gt; Ubuntu-16.04.1 hosts due to restart of &quot;lightdm&quot; (Light Desk=
top<br>
&gt; Manager) =C2=A0that is triggered by crash of &quot;unity-settings-daem=
on&quot;, we<br>
&gt; couldn&#39;t figure out any workaround so far to overcome the issue. T=
he<br>
&gt; build goes fine in the beginning but eventually the unity desktop<br>
&gt; logs out and kills all the processes running in the user session<br>
&gt; (including bitbake) and lands us into &quot;Login screen&quot; and whe=
n we<br>
&gt; login its a new session where as the bitbake running in previous<br>
&gt; session is killed and we need to continue the build. This is<br>
&gt; happening consistently when the user logs into desktop via lightdm<br>
&gt; and triggers a build.=C2=A0<br>
&gt;<br>
&gt; Another interesting thing to notice is the build goes fine if we<br>
&gt; connect to host via. SSH session and invoke a bitbake build. We are<br=
>
&gt; suspecting on unity-settings-daemon that is crashing consistently and<=
br>
&gt; is evident from the &quot;.xsession-errors&quot; log file as shown bel=
ow:<br>
&gt;<br>
&gt; builder@ubuntu:~$ cat .xsession-errors.old<br>
&gt; Script for ibus started at run_im.<br>
&gt; Script for auto started at run_im.<br>
&gt; Script for default started at run_im.<br>
&gt; init: Disconnected from notified D-Bus bus<br>
&gt; init:&quot;unity-settings-daemon main process (2076) terminated with<b=
r>
&gt; status 1&quot;<br>
&gt; init: indicator-bluetooth main process (2212) killed by TERM signal<br=
>
&gt; init: indicator-power main process (2214) killed by TERM signal<br>
&gt; init: indicator-datetime main process (2215) killed by TERM signal<br>
&gt; init: indicator-printers main process (2222) killed by TERM signal<br>
&gt; init: indicator-session main process (2245) killed by TERM signal<br>
&gt; init: indicator-application main process (2270) killed by TERM signal<=
br>
&gt;<br>
&gt; Corresponding unity-settings-daemon bug reported in Launchpad:<br>
&gt;<br>
&gt; <a href=3D"https://bugs.launchpad.net/ubuntu/+source/unity-settings-da=
emon/+bug/" rel=3D"noreferrer" target=3D"_blank">https://bugs.launchpad.net=
/ubu<wbr>ntu/+source/unity-settings-dae<wbr>mon/+bug/</a><br>
&gt; 1546641<br>
&gt;<br>
&gt; Would anyone kindly confirm the logout behaviour during bitbake<br>
&gt; process on Ubuntu-14.04.5 &amp; Ubuntu-16.04.1 ? Since Yocto 2.2 menti=
ons<br>
&gt; both Ubuntu-14.04 &amp; 16.04 as supported distributions this blocker<=
br>
&gt; issue must be resolved at earliest.=C2=A0<br>
&gt;<br>
&gt; Appreciate your Inputs !<br>
<br>
</div></div>What would really help is knowing what recipe is being built wh=
en this<br>
happens. There are a few ways you might be able to figure this out:<br>
<br>
a) Watching the screen to see which recipes were building when it<br>
happens<br>
b) Perhaps using some kind of screen recorder to automate this, you&#39;d<b=
r>
be able to review the recording to see when it breaks<br>
c) Looking at the bitbake/build logs to see what it was doing when the<br>
build broke (assuming bitbake stops when the session dies).<br>
<br>
&quot;bitbake | cat&quot; can provide better output for this since it will<=
br>
produce a scrolling log rather than the more interactive UI.<br>
<br>
Once you find the problematic recipe, a &quot;bitbake XXX -c clean; bitbake=
<br>
XXX&quot; should hopefully reproduce this more easily.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a11443a8acc8d5b0544a0c41e--
