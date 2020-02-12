Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3176012D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 08:59:55 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id i11so1318143ioi.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 00:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Wn8j+mzE4ohHzmh85kSSD9hbmVBcsL53VxCEaX2ZbGc=;
	b=uCql4fYz4fC8rixdwN/t8A8qZGJkdYbhKuzSSrTG8/Efkemal4u0enoK/yUVLfY1Hs
	6KwvRshJGCsCuK9PoCuBPVxuJBGLNzgb4wwO4gvg3HjXXinmZI0PjXlRleYo9kGYuFnn
	tlgRVTwqwPdLPOhfrmIkVDhMwiaLc5YBHbnvrzh8G6gxnD1sbBP+1RVio5llujQO+jU3
	4mywQ8mG36tAR3lHQniqhyySCUjVIFND/h6cmTFtZtabVd5m39vyhOc1YM/jOdYPC9Br
	S749bqaVs2AX86Lx1p+EKfkYwLbq1ZxDbHAOrZMqn918ZDIUw9ZlcR5XjEF4qMuGarDA
	8dPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Wn8j+mzE4ohHzmh85kSSD9hbmVBcsL53VxCEaX2ZbGc=;
	b=mAMnstAT0SMbfNWQ2h4iwj5sNDpVqcazKRggGb0S1QgZDrEQfTY76dD7J2lstxYAOJ
	FKYdVPsJjRrjuykuRo4QhczJJNHTk1D9E5HyhiI6zNxysNxSzTW4qUj8tJk2l5caJhpx
	9RIrdavHJYKaLd2TfhvCUgQi9ROoLRxgvhvkhtcTozHNnaR5rebxUlWSuXtyuKwXebbq
	8qJnSwGp1oQiYUSGzREZjtaiEgztW11i4qdhCEsJjTnaHzBC9Zfv2P8KfI0zlQjiL8GN
	Lu1PcD2ZaU0ZO7Y7w1x+jrroCuel3bkocOrm9jJtSDAS5g2/86rjaRZFkpqgsyosvK7D
	Si0w==
X-Gm-Message-State: APjAAAVrGh1g4o1b3WVhS5afx2obcM+7QwBxuScLK4yqot4vm9kfIPAY
	/8i56flRgcP988PPVrSarw3jMumH/KMp4pZGyV4=
X-Google-Smtp-Source: APXvYqy/T477HdDl9KMt6+LU4H8l1/MNPtFXIcEt8atiTaLRW29XVwGz/7UeiPPiYUpPtl0Z2O9J+80P0MXsizKO760=
X-Received: by 2002:a5d:8856:: with SMTP id t22mr5406089ios.217.1581497995999; 
	Wed, 12 Feb 2020 00:59:55 -0800 (PST)
MIME-Version: 1.0
References: <20200212071511.120383-1-alex.kiernan@gmail.com>
	<CANNYZj-vDJomqCm202vvLa=fFaXmp8Pppe53EowUepVwf_9eqQ@mail.gmail.com>
In-Reply-To: <CANNYZj-vDJomqCm202vvLa=fFaXmp8Pppe53EowUepVwf_9eqQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 12 Feb 2020 08:59:44 +0000
Message-ID: <CAO5Uq5TMZkPy3Ts8ukskw3fRvpmPAr-LrA7yVqPuifSzRBu2dw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 12 Feb 2020 08:59:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2020 at 7:20 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I think 244.3 is latest?
>

Looks like upstream's done something funky... the tag's been pushed,
but not the branch :|

I'll pull it in later.

> Alex
>
> On Wed 12. Feb 2020 at 8.15, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>>
>> Commits from v244-stable:
>>
>>   77c04ce5c270 hwdb: update to v245-rc1
>>   b4eb8848240c Fix typo in function name
>>   e2d4cb9843c5 polkit: when authorizing via PK let's re-resolve callback=
/userdata instead of caching it
>>   83bfc0d8dd02 sd-bus: introduce API for re-enqueuing incoming messages
>>   5926f9f1723f polkit: use structured initialization
>>   0697d0d972c8 polkit: on async pk requests, re-validate action/details
>>   2589995acdb2 polkit: reuse some common bus message appending code
>>   5b2442d5c3ec bus-polkit: rename return error parameter to ret_error
>>   0a19ff7004e4 shared: split out polkit stuff from bus-util.c =E2=86=92 =
bus-polkit.c
>>   1325dfb5778d test: adapt to the new capsh format
>>   3538fafb4714 meson: update efi path detection to gnu-efi-3.0.11
>>   3034855a5b62 presets: "disable" all passive targets by default
>>   c2e304681929 shared/sysctl-util: normalize repeated slashes or dots to=
 a single value
>>   6f4364046f90 dhcp6: do not use T1 and T2 longer than one provided by t=
he lease
>>   0ed6cda28dff network: fix implicit type conversion warning by GCC-10
>>   f6a5c02d26b1 bootspec: parse random-seed-mode line in loader.conf
>>   ddc5dca8a73b sd-boot: fix typo
>>   2bbbe9ae41ab test: Synchronize journal before reading from it
>>   072485d661d7 sd-bus: fix introspection bug in signal parameter names
>>   80af3cf5e36b efi: fix build.
>>   d7ede1ade564 generator: order growfs for the root fs after systemd-rem=
ount-fs
>>   e9904998213d loginctl: use /org/freedesktop/login1/session/auto when "=
lock-session" is called without argument
>>   82dd4caf014c Documentation update for x-systemd.{before,after}
>>   a60459764d9d man: fix typo in systemd.netdev Xfrm example
>>   fc053e2dfb3f timesyncd: log louder when we refuse a server due to root=
 distance
>>   af0e630693fa resolved: drop DNSSEC root key that is not valid anymore
>>   ae59f1666ca6 journal: don't use startswith() on something that is not =
a NUL-terminated string
>>   536ef6d72bc6 test: add test for https://github.com/systemd/systemd/iss=
ues/14560
>>   b78fe3c1b1a8 core: make sure StandardInput=3Dfile: doesn't get dup'ed =
to stdout/stderr by default
>>   a1561a08f2d5 pkgconf: add full generator paths
>>   e5f2d11489ec tree-wide: we forgot to destroy some bus errors
>>   ea67fd42067b mount: make checks on perpetual mount units more lax
>>   2f23c648bce4 core: never allow perpetual units to be masked
>>   9ba11dffb09a typo: "May modify to" -> "May modify"
>>   84c048799a78 Disable reading SystemdOptions EFI Var when in SecureBoot=
 mode
>>   4c2d72b53091 sysctl: downgrade message when we have no permission
>>   c001a285a3a2 Clarify journald.conf MaxLevelStore documentation
>>   45d52c7615fd logind: refuse overriding idle hint on tty sessions
>>   b1a0be45b4ee cgroup: update only siblings that got realized once
>>   e6d694254fe1 mount: mark an existing "mounting" unit from /proc/self/m=
ountinfo as "just_mounted"
>>   d8fd38769c36 journalctl: Correctly handle combination of --reverse and=
 --lines (fixes #1596)
>>   cd19bd31d808 journalctl: Correctly handle --show-cursor in combination=
 with --until or --since and --reverse
>>   1320aa92dc0a core: fix re-realization of cgroup siblings
>>   14164ec6bc77 core: propagate service state to socket in more load stat=
es
>>   c22bf6b31a45 man: describe "symlink" and "systemctl link" explicitly i=
n UNIT FILE LOAD PATH
>>   26f3a534f1ab core: be more restrictive on the dependency types we allo=
w to be created transiently
>>   377cc5d91ea5 udev: don't import parent ID_FS_ data on partitions
>>   7d5060d53994 man: fix option name
>>   98c03090274a Support Plugable UD-PRO8 dock
>>   e9687d09dccf gpt-auto: don't assume XBOOTLDR is vfat
>>   7057fe863007 man: fix documentation of IBM VIO device naming
>>   f8d1df1045be man: slightly extend documentation on difference between =
ID_NET_NAME_ONBOARD and ID_NET_LABEL_ONBOARD
>>   1faf5dde4d4a boot: fix osrel parser
>>   65d247af1786 udev: do not use exact match of file permission
>>   6da978f89b48 network: lower the log-level of harmless message
>>   5d8a614f926c hwdb: ignore keys added in kernel 5.5
>>   8b1bd1746989 systemctl: skip non-existent units in the 'cat' verb
>>   b2f342f92b54 systemd.exec: document the file system for EnvironmentFil=
e paths
>>   945f3a231f6f systemd-analyze: fixed typo in documentation
>>   2c8ae283b0ee test-condition: fix group check condition
>>   6b48479f4582 umount: show correct error message
>>   faba5b2ba8c9 Revert "Drop dbus activation stub service"
>>   3dd98f1998f9 man: add section about user manager units
>>   1c80a8ced006 man: add remote-*.targets to the bootup sequence
>>   9afd65f15e93 time-util: also use 32bit hack on EOVERFLOW
>>   561923291383 [man] note which UID ranges will get user journals
>>   588a23ef2684 [man] fix URL
>>   0130a03179f6 analyze: badness if neither of RootImage and RootDirector=
y exists
>>   93074c962e3a network: introduce AddPrefixRoute=3D and deprecate Prefix=
Route=3D
>>   a8ad020ea0ba shared/dropin: fix assert for invalid drop-in
>>   946cdba156dd initrd: make udev cleanup service confict trigger and set=
tle too
>>   c0a8a92e6027 man: we support growing xfs too these days
>>   608d88273494 time-util: deal with systems where userspace has 64bit ti=
me_t but kernel does not
>>   cfced59a4bd8 [import] fix stdin/stdout pipe behavior in import/export =
tar/raw
>>   73435b219553 systemctl: show what verbs support --dry-run in the help =
page
>>   dc56b94e1308 cryptsetup-generator: unconfuse writing of the device tim=
eout
>>   0757ad565573 shared/install: log syntax error for invalid DefaultInsta=
nce=3D
>>   d2471109d999 shared/install: provide a nicer error message for invalid=
 WantedBy=3D/Required=3D values
>>
>> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>> ---
>>
>>  .../systemd/{systemd-boot_244.1.bb =3D> systemd-boot_244.2.bb}    | 0
>>  .../systemd/{systemd-conf_244.1.bb =3D> systemd-conf_244.2.bb}    | 0
>>  meta/recipes-core/systemd/systemd.inc                           | 2 +-
>>  .../recipes-core/systemd/{systemd_244.1.bb =3D> systemd_244.2.bb} | 0
>>  4 files changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-core/systemd/{systemd-boot_244.1.bb =3D> systemd-bo=
ot_244.2.bb} (100%)
>>  rename meta/recipes-core/systemd/{systemd-conf_244.1.bb =3D> systemd-co=
nf_244.2.bb} (100%)
>>  rename meta/recipes-core/systemd/{systemd_244.1.bb =3D> systemd_244.2.b=
b} (100%)
>>
>> diff --git a/meta/recipes-core/systemd/systemd-boot_244.1.bb b/meta/reci=
pes-core/systemd/systemd-boot_244.2.bb
>> similarity index 100%
>> rename from meta/recipes-core/systemd/systemd-boot_244.1.bb
>> rename to meta/recipes-core/systemd/systemd-boot_244.2.bb
>> diff --git a/meta/recipes-core/systemd/systemd-conf_244.1.bb b/meta/reci=
pes-core/systemd/systemd-conf_244.2.bb
>> similarity index 100%
>> rename from meta/recipes-core/systemd/systemd-conf_244.1.bb
>> rename to meta/recipes-core/systemd/systemd-conf_244.2.bb
>> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/s=
ystemd/systemd.inc
>> index 8c05a96ecc4f..549147c1874d 100644
>> --- a/meta/recipes-core/systemd/systemd.inc
>> +++ b/meta/recipes-core/systemd/systemd.inc
>> @@ -14,7 +14,7 @@ LICENSE =3D "GPLv2 & LGPLv2.1"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaa=
baa882bbe \
>>                      file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd2559510790=
08b364516c"
>>
>> -SRCREV =3D "639dc9f4bfd2c09535bee079ae9bc7006b520a66"
>> +SRCREV =3D "3ca4db9469dce2c0914933db4948456a367c5dc7"
>>  SRCBRANCH =3D "v244-stable"
>>  SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dgit=
;branch=3D${SRCBRANCH}"
>>
>> diff --git a/meta/recipes-core/systemd/systemd_244.1.bb b/meta/recipes-c=
ore/systemd/systemd_244.2.bb
>> similarity index 100%
>> rename from meta/recipes-core/systemd/systemd_244.1.bb
>> rename to meta/recipes-core/systemd/systemd_244.2.bb
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
Alex Kiernan

