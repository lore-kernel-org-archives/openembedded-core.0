Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6E67E60AFF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 07:20:17 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id u6so225958vkn.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 23:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aHGTHXEXuukZETU4GSemmPz4jg2+BTzuZLCDQHyQ+ZE=;
	b=iTpsB6+CeMsQ85BX8Q5d95+LWcdNuIXODxfevQmaALD2bLhfxVs5fDJLx0HtB/QVDc
	iWKvLTBXxlQFmSPofrCqlygNnzTisb0q7CygBfJ+/Z6Z1u7hPa/oPqz33R6FZRomUcTV
	CrMM6WlyH2r5BEnL8wrrp2v5rIAaIClbBNscHXHDTtN6oWsDcGzuJkG1L8ptehc2GMgZ
	GLuzkb7YIm8yvsRL7HIUanRGF1MZzVpD6XB7eB14/oDH+cxIry6eys3oHQCdZOn76057
	dMSdXHypFxLFSWFY9rNesuBd+QhnQvAzJga5xeC6CMr4bOs5WPugcMeCcZ3QIPt4NaaY
	hjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aHGTHXEXuukZETU4GSemmPz4jg2+BTzuZLCDQHyQ+ZE=;
	b=jMqCqb6Qe4qX/iWMZCC4mHAJsVAJf2j9fGBbVVED7xKufk1D4Emi+4+axRsgZpT+vn
	1bC+lCziP0NAocCfr1AVRz0Tq0F2Py0j01apUmeiPNs5SH50ANfT7dLlV40gaTvAS9eT
	APK91mgZSI2mss9SUKgxoWrYaGDemU5SsKE5hXdzoRBfg24AXU7z/uM7yiEDwPS4ZyqT
	C0GdXXdylo5YsV5+4FK0/hfI1NdCw9eh9UKppX7QJKMzbfU/QD6wZa73TZLzACss/1fv
	7nc1XjihQUpnVQm7yUcBIaSYYN2ISnakna3md36MmtyXBfuIwnw4GB5plrUI4pyCUyyi
	YyEw==
X-Gm-Message-State: APjAAAUqufohn/vOOU8CJESmMTkbLE4ki4Ie/W2NsktW5Svj5lhQ7ie0
	pkXMHaVp4dxTcnVmUPaIi9rbrLw9fH6gnuC3j1k=
X-Google-Smtp-Source: APXvYqxen+YeBlNkEQ42OPPQu7hKclpY/Sy4tVEq3ruq0Lix/PxzepUjvo4wMxcATX9PpXdo+ifrZJSdiZviWRyatzM=
X-Received: by 2002:a1f:7cc2:: with SMTP id x185mr6804216vkc.1.1581492018203; 
	Tue, 11 Feb 2020 23:20:18 -0800 (PST)
MIME-Version: 1.0
References: <20200212071511.120383-1-alex.kiernan@gmail.com>
In-Reply-To: <20200212071511.120383-1-alex.kiernan@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Feb 2020 08:20:07 +0100
Message-ID: <CANNYZj-vDJomqCm202vvLa=fFaXmp8Pppe53EowUepVwf_9eqQ@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: upgrade v244.1 -> v244.2
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
X-List-Received-Date: Wed, 12 Feb 2020 07:20:17 -0000
Content-Type: multipart/alternative; boundary="000000000000f5d49f059e5bcd84"

--000000000000f5d49f059e5bcd84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think 244.3 is latest?

Alex

On Wed 12. Feb 2020 at 8.15, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> Commits from v244-stable:
>
>   77c04ce5c270 hwdb: update to v245-rc1
>   b4eb8848240c Fix typo in function name
>   e2d4cb9843c5 polkit: when authorizing via PK let's re-resolve
> callback/userdata instead of caching it
>   83bfc0d8dd02 sd-bus: introduce API for re-enqueuing incoming messages
>   5926f9f1723f polkit: use structured initialization
>   0697d0d972c8 polkit: on async pk requests, re-validate action/details
>   2589995acdb2 polkit: reuse some common bus message appending code
>   5b2442d5c3ec bus-polkit: rename return error parameter to ret_error
>   0a19ff7004e4 shared: split out polkit stuff from bus-util.c =E2=86=92
> bus-polkit.c
>   1325dfb5778d test: adapt to the new capsh format
>   3538fafb4714 meson: update efi path detection to gnu-efi-3.0.11
>   3034855a5b62 presets: "disable" all passive targets by default
>   c2e304681929 shared/sysctl-util: normalize repeated slashes or dots to =
a
> single value
>   6f4364046f90 dhcp6: do not use T1 and T2 longer than one provided by th=
e
> lease
>   0ed6cda28dff network: fix implicit type conversion warning by GCC-10
>   f6a5c02d26b1 bootspec: parse random-seed-mode line in loader.conf
>   ddc5dca8a73b sd-boot: fix typo
>   2bbbe9ae41ab test: Synchronize journal before reading from it
>   072485d661d7 sd-bus: fix introspection bug in signal parameter names
>   80af3cf5e36b efi: fix build.
>   d7ede1ade564 generator: order growfs for the root fs after
> systemd-remount-fs
>   e9904998213d loginctl: use /org/freedesktop/login1/session/auto when
> "lock-session" is called without argument
>   82dd4caf014c Documentation update for x-systemd.{before,after}
>   a60459764d9d man: fix typo in systemd.netdev Xfrm example
>   fc053e2dfb3f timesyncd: log louder when we refuse a server due to root
> distance
>   af0e630693fa resolved: drop DNSSEC root key that is not valid anymore
>   ae59f1666ca6 journal: don't use startswith() on something that is not a
> NUL-terminated string
>   536ef6d72bc6 test: add test for
> https://github.com/systemd/systemd/issues/14560
>   b78fe3c1b1a8 core: make sure StandardInput=3Dfile: doesn't get dup'ed t=
o
> stdout/stderr by default
>   a1561a08f2d5 pkgconf: add full generator paths
>   e5f2d11489ec tree-wide: we forgot to destroy some bus errors
>   ea67fd42067b mount: make checks on perpetual mount units more lax
>   2f23c648bce4 core: never allow perpetual units to be masked
>   9ba11dffb09a typo: "May modify to" -> "May modify"
>   84c048799a78 Disable reading SystemdOptions EFI Var when in SecureBoot
> mode
>   4c2d72b53091 sysctl: downgrade message when we have no permission
>   c001a285a3a2 Clarify journald.conf MaxLevelStore documentation
>   45d52c7615fd logind: refuse overriding idle hint on tty sessions
>   b1a0be45b4ee cgroup: update only siblings that got realized once
>   e6d694254fe1 mount: mark an existing "mounting" unit from
> /proc/self/mountinfo as "just_mounted"
>   d8fd38769c36 journalctl: Correctly handle combination of --reverse and
> --lines (fixes #1596)
>   cd19bd31d808 journalctl: Correctly handle --show-cursor in combination
> with --until or --since and --reverse
>   1320aa92dc0a core: fix re-realization of cgroup siblings
>   14164ec6bc77 core: propagate service state to socket in more load state=
s
>   c22bf6b31a45 man: describe "symlink" and "systemctl link" explicitly in
> UNIT FILE LOAD PATH
>   26f3a534f1ab core: be more restrictive on the dependency types we allow
> to be created transiently
>   377cc5d91ea5 udev: don't import parent ID_FS_ data on partitions
>   7d5060d53994 man: fix option name
>   98c03090274a Support Plugable UD-PRO8 dock
>   e9687d09dccf gpt-auto: don't assume XBOOTLDR is vfat
>   7057fe863007 man: fix documentation of IBM VIO device naming
>   f8d1df1045be man: slightly extend documentation on difference between
> ID_NET_NAME_ONBOARD and ID_NET_LABEL_ONBOARD
>   1faf5dde4d4a boot: fix osrel parser
>   65d247af1786 udev: do not use exact match of file permission
>   6da978f89b48 network: lower the log-level of harmless message
>   5d8a614f926c hwdb: ignore keys added in kernel 5.5
>   8b1bd1746989 systemctl: skip non-existent units in the 'cat' verb
>   b2f342f92b54 systemd.exec: document the file system for EnvironmentFile
> paths
>   945f3a231f6f systemd-analyze: fixed typo in documentation
>   2c8ae283b0ee test-condition: fix group check condition
>   6b48479f4582 umount: show correct error message
>   faba5b2ba8c9 Revert "Drop dbus activation stub service"
>   3dd98f1998f9 man: add section about user manager units
>   1c80a8ced006 man: add remote-*.targets to the bootup sequence
>   9afd65f15e93 time-util: also use 32bit hack on EOVERFLOW
>   561923291383 [man] note which UID ranges will get user journals
>   588a23ef2684 [man] fix URL
>   0130a03179f6 analyze: badness if neither of RootImage and RootDirectory
> exists
>   93074c962e3a network: introduce AddPrefixRoute=3D and deprecate
> PrefixRoute=3D
>   a8ad020ea0ba shared/dropin: fix assert for invalid drop-in
>   946cdba156dd initrd: make udev cleanup service confict trigger and
> settle too
>   c0a8a92e6027 man: we support growing xfs too these days
>   608d88273494 time-util: deal with systems where userspace has 64bit
> time_t but kernel does not
>   cfced59a4bd8 [import] fix stdin/stdout pipe behavior in import/export
> tar/raw
>   73435b219553 systemctl: show what verbs support --dry-run in the help
> page
>   dc56b94e1308 cryptsetup-generator: unconfuse writing of the device
> timeout
>   0757ad565573 shared/install: log syntax error for invalid
> DefaultInstance=3D
>   d2471109d999 shared/install: provide a nicer error message for invalid
> WantedBy=3D/Required=3D values
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  .../systemd/{systemd-boot_244.1.bb =3D> systemd-boot_244.2.bb}    | 0
>  .../systemd/{systemd-conf_244.1.bb =3D> systemd-conf_244.2.bb}    | 0
>  meta/recipes-core/systemd/systemd.inc                           | 2 +-
>  .../recipes-core/systemd/{systemd_244.1.bb =3D> systemd_244.2.bb} | 0
>  4 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/systemd/{systemd-boot_244.1.bb =3D>
> systemd-boot_244.2.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd-conf_244.1.bb =3D>
> systemd-conf_244.2.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd_244.1.bb =3D> systemd_244.2.bb=
}
> (100%)
>
> diff --git a/meta/recipes-core/systemd/systemd-boot_244.1.bb
> b/meta/recipes-core/systemd/systemd-boot_244.2.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot_244.1.bb
> rename to meta/recipes-core/systemd/systemd-boot_244.2.bb
> diff --git a/meta/recipes-core/systemd/systemd-conf_244.1.bb
> b/meta/recipes-core/systemd/systemd-conf_244.2.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-conf_244.1.bb
> rename to meta/recipes-core/systemd/systemd-conf_244.2.bb
> diff --git a/meta/recipes-core/systemd/systemd.inc
> b/meta/recipes-core/systemd/systemd.inc
> index 8c05a96ecc4f..549147c1874d 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -14,7 +14,7 @@ LICENSE =3D "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa882bbe \
>
>  file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c"
>
> -SRCREV =3D "639dc9f4bfd2c09535bee079ae9bc7006b520a66"
> +SRCREV =3D "3ca4db9469dce2c0914933db4948456a367c5dc7"
>  SRCBRANCH =3D "v244-stable"
>  SRC_URI =3D "git://
> github.com/systemd/systemd-stable.git;protocol=3Dgit;branch=3D${SRCBRANCH=
}
> <http://github.com/systemd/systemd-stable.git;protocol=3Dgit;branch=3D$%7=
BSRCBRANCH%7D>
> "
>
> diff --git a/meta/recipes-core/systemd/systemd_244.1.bb
> b/meta/recipes-core/systemd/systemd_244.2.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd_244.1.bb
> rename to meta/recipes-core/systemd/systemd_244.2.bb
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000f5d49f059e5bcd84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I think 244.3 is latest?</div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed 12. Feb 2020 at 8.15, Alex Ki=
ernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">alex.kiernan@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Commits from v244-st=
able:<br>
<br>
=C2=A0 77c04ce5c270 hwdb: update to v245-rc1<br>
=C2=A0 b4eb8848240c Fix typo in function name<br>
=C2=A0 e2d4cb9843c5 polkit: when authorizing via PK let&#39;s re-resolve ca=
llback/userdata instead of caching it<br>
=C2=A0 83bfc0d8dd02 sd-bus: introduce API for re-enqueuing incoming message=
s<br>
=C2=A0 5926f9f1723f polkit: use structured initialization<br>
=C2=A0 0697d0d972c8 polkit: on async pk requests, re-validate action/detail=
s<br>
=C2=A0 2589995acdb2 polkit: reuse some common bus message appending code<br=
>
=C2=A0 5b2442d5c3ec bus-polkit: rename return error parameter to ret_error<=
br>
=C2=A0 0a19ff7004e4 shared: split out polkit stuff from bus-util.c =E2=86=
=92 bus-polkit.c<br>
=C2=A0 1325dfb5778d test: adapt to the new capsh format<br>
=C2=A0 3538fafb4714 meson: update efi path detection to gnu-efi-3.0.11<br>
=C2=A0 3034855a5b62 presets: &quot;disable&quot; all passive targets by def=
ault<br>
=C2=A0 c2e304681929 shared/sysctl-util: normalize repeated slashes or dots =
to a single value<br>
=C2=A0 6f4364046f90 dhcp6: do not use T1 and T2 longer than one provided by=
 the lease<br>
=C2=A0 0ed6cda28dff network: fix implicit type conversion warning by GCC-10=
<br>
=C2=A0 f6a5c02d26b1 bootspec: parse random-seed-mode line in loader.conf<br=
>
=C2=A0 ddc5dca8a73b sd-boot: fix typo<br>
=C2=A0 2bbbe9ae41ab test: Synchronize journal before reading from it<br>
=C2=A0 072485d661d7 sd-bus: fix introspection bug in signal parameter names=
<br>
=C2=A0 80af3cf5e36b efi: fix build.<br>
=C2=A0 d7ede1ade564 generator: order growfs for the root fs after systemd-r=
emount-fs<br>
=C2=A0 e9904998213d loginctl: use /org/freedesktop/login1/session/auto when=
 &quot;lock-session&quot; is called without argument<br>
=C2=A0 82dd4caf014c Documentation update for x-systemd.{before,after}<br>
=C2=A0 a60459764d9d man: fix typo in systemd.netdev Xfrm example<br>
=C2=A0 fc053e2dfb3f timesyncd: log louder when we refuse a server due to ro=
ot distance<br>
=C2=A0 af0e630693fa resolved: drop DNSSEC root key that is not valid anymor=
e<br>
=C2=A0 ae59f1666ca6 journal: don&#39;t use startswith() on something that i=
s not a NUL-terminated string<br>
=C2=A0 536ef6d72bc6 test: add test for <a href=3D"https://github.com/system=
d/systemd/issues/14560" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/systemd/systemd/issues/14560</a><br>
=C2=A0 b78fe3c1b1a8 core: make sure StandardInput=3Dfile: doesn&#39;t get d=
up&#39;ed to stdout/stderr by default<br>
=C2=A0 a1561a08f2d5 pkgconf: add full generator paths<br>
=C2=A0 e5f2d11489ec tree-wide: we forgot to destroy some bus errors<br>
=C2=A0 ea67fd42067b mount: make checks on perpetual mount units more lax<br=
>
=C2=A0 2f23c648bce4 core: never allow perpetual units to be masked<br>
=C2=A0 9ba11dffb09a typo: &quot;May modify to&quot; -&gt; &quot;May modify&=
quot;<br>
=C2=A0 84c048799a78 Disable reading SystemdOptions EFI Var when in SecureBo=
ot mode<br>
=C2=A0 4c2d72b53091 sysctl: downgrade message when we have no permission<br=
>
=C2=A0 c001a285a3a2 Clarify journald.conf MaxLevelStore documentation<br>
=C2=A0 45d52c7615fd logind: refuse overriding idle hint on tty sessions<br>
=C2=A0 b1a0be45b4ee cgroup: update only siblings that got realized once<br>
=C2=A0 e6d694254fe1 mount: mark an existing &quot;mounting&quot; unit from =
/proc/self/mountinfo as &quot;just_mounted&quot;<br>
=C2=A0 d8fd38769c36 journalctl: Correctly handle combination of --reverse a=
nd --lines (fixes #1596)<br>
=C2=A0 cd19bd31d808 journalctl: Correctly handle --show-cursor in combinati=
on with --until or --since and --reverse<br>
=C2=A0 1320aa92dc0a core: fix re-realization of cgroup siblings<br>
=C2=A0 14164ec6bc77 core: propagate service state to socket in more load st=
ates<br>
=C2=A0 c22bf6b31a45 man: describe &quot;symlink&quot; and &quot;systemctl l=
ink&quot; explicitly in UNIT FILE LOAD PATH<br>
=C2=A0 26f3a534f1ab core: be more restrictive on the dependency types we al=
low to be created transiently<br>
=C2=A0 377cc5d91ea5 udev: don&#39;t import parent ID_FS_ data on partitions=
<br>
=C2=A0 7d5060d53994 man: fix option name<br>
=C2=A0 98c03090274a Support Plugable UD-PRO8 dock<br>
=C2=A0 e9687d09dccf gpt-auto: don&#39;t assume XBOOTLDR is vfat<br>
=C2=A0 7057fe863007 man: fix documentation of IBM VIO device naming<br>
=C2=A0 f8d1df1045be man: slightly extend documentation on difference betwee=
n ID_NET_NAME_ONBOARD and ID_NET_LABEL_ONBOARD<br>
=C2=A0 1faf5dde4d4a boot: fix osrel parser<br>
=C2=A0 65d247af1786 udev: do not use exact match of file permission<br>
=C2=A0 6da978f89b48 network: lower the log-level of harmless message<br>
=C2=A0 5d8a614f926c hwdb: ignore keys added in kernel 5.5<br>
=C2=A0 8b1bd1746989 systemctl: skip non-existent units in the &#39;cat&#39;=
 verb<br>
=C2=A0 b2f342f92b54 systemd.exec: document the file system for EnvironmentF=
ile paths<br>
=C2=A0 945f3a231f6f systemd-analyze: fixed typo in documentation<br>
=C2=A0 2c8ae283b0ee test-condition: fix group check condition<br>
=C2=A0 6b48479f4582 umount: show correct error message<br>
=C2=A0 faba5b2ba8c9 Revert &quot;Drop dbus activation stub service&quot;<br=
>
=C2=A0 3dd98f1998f9 man: add section about user manager units<br>
=C2=A0 1c80a8ced006 man: add remote-*.targets to the bootup sequence<br>
=C2=A0 9afd65f15e93 time-util: also use 32bit hack on EOVERFLOW<br>
=C2=A0 561923291383 [man] note which UID ranges will get user journals<br>
=C2=A0 588a23ef2684 [man] fix URL<br>
=C2=A0 0130a03179f6 analyze: badness if neither of RootImage and RootDirect=
ory exists<br>
=C2=A0 93074c962e3a network: introduce AddPrefixRoute=3D and deprecate Pref=
ixRoute=3D<br>
=C2=A0 a8ad020ea0ba shared/dropin: fix assert for invalid drop-in<br>
=C2=A0 946cdba156dd initrd: make udev cleanup service confict trigger and s=
ettle too<br>
=C2=A0 c0a8a92e6027 man: we support growing xfs too these days<br>
=C2=A0 608d88273494 time-util: deal with systems where userspace has 64bit =
time_t but kernel does not<br>
=C2=A0 cfced59a4bd8 [import] fix stdin/stdout pipe behavior in import/expor=
t tar/raw<br>
=C2=A0 73435b219553 systemctl: show what verbs support --dry-run in the hel=
p page<br>
=C2=A0 dc56b94e1308 cryptsetup-generator: unconfuse writing of the device t=
imeout<br>
=C2=A0 0757ad565573 shared/install: log syntax error for invalid DefaultIns=
tance=3D<br>
=C2=A0 d2471109d999 shared/install: provide a nicer error message for inval=
id WantedBy=3D/Required=3D values<br>
<br>
Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" t=
arget=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
---<br>
<br>
=C2=A0.../systemd/{<a href=3D"http://systemd-boot_244.1.bb" rel=3D"noreferr=
er" target=3D"_blank">systemd-boot_244.1.bb</a> =3D&gt; <a href=3D"http://s=
ystemd-boot_244.2.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_244=
.2.bb</a>}=C2=A0 =C2=A0 | 0<br>
=C2=A0.../systemd/{<a href=3D"http://systemd-conf_244.1.bb" rel=3D"noreferr=
er" target=3D"_blank">systemd-conf_244.1.bb</a> =3D&gt; <a href=3D"http://s=
ystemd-conf_244.2.bb" rel=3D"noreferrer" target=3D"_blank">systemd-conf_244=
.2.bb</a>}=C2=A0 =C2=A0 | 0<br>
=C2=A0meta/recipes-core/systemd/systemd.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br=
>
=C2=A0.../recipes-core/systemd/{<a href=3D"http://systemd_244.1.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_244.1.bb</a> =3D&gt; <a href=3D"http:=
//systemd_244.2.bb" rel=3D"noreferrer" target=3D"_blank">systemd_244.2.bb</=
a>} | 0<br>
=C2=A04 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd-boot_244.=
1.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_244.1.bb</a> =3D&gt=
; <a href=3D"http://systemd-boot_244.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">systemd-boot_244.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd-conf_244.=
1.bb" rel=3D"noreferrer" target=3D"_blank">systemd-conf_244.1.bb</a> =3D&gt=
; <a href=3D"http://systemd-conf_244.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">systemd-conf_244.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd_244.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_244.1.bb</a> =3D&gt; <a href=
=3D"http://systemd_244.2.bb" rel=3D"noreferrer" target=3D"_blank">systemd_2=
44.2.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_244.1=
.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_244.1.bb</a> b/meta/=
recipes-core/systemd/<a href=3D"http://systemd-boot_244.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">systemd-boot_244.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd-boot_244.1.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_244.1.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd-boot_244.2.bb=
" rel=3D"noreferrer" target=3D"_blank">systemd-boot_244.2.bb</a><br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-conf_244.1=
.bb" rel=3D"noreferrer" target=3D"_blank">systemd-conf_244.1.bb</a> b/meta/=
recipes-core/systemd/<a href=3D"http://systemd-conf_244.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">systemd-conf_244.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd-conf_244.1.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd-conf_244.1.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd-conf_244.2.bb=
" rel=3D"noreferrer" target=3D"_blank">systemd-conf_244.2.bb</a><br>
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc<br>
index 8c05a96ecc4f..549147c1874d 100644<br>
--- a/meta/recipes-core/systemd/systemd.inc<br>
+++ b/meta/recipes-core/systemd/systemd.inc<br>
@@ -14,7 +14,7 @@ LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL2;md5=3D751419260aa95449=
9f7abaabaa882bbe \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c&quot;<br>
<br>
-SRCREV =3D &quot;639dc9f4bfd2c09535bee079ae9bc7006b520a66&quot;<br>
+SRCREV =3D &quot;3ca4db9469dce2c0914933db4948456a367c5dc7&quot;<br>
=C2=A0SRCBRANCH =3D &quot;v244-stable&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/systemd/systemd-=
stable.git;protocol=3Dgit;branch=3D$%7BSRCBRANCH%7D" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/systemd/systemd-stable.git;protocol=3Dgit;branch=
=3D${SRCBRANCH}</a>&quot;<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_244.1.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_244.1.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_244.2.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_244.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd_244.1.bb" r=
el=3D"noreferrer" target=3D"_blank">systemd_244.1.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd_244.2.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_244.2.bb</a><br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000f5d49f059e5bcd84--
