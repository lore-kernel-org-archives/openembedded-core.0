Received: from mail-wg0-f51.google.com ([74.125.82.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UaLpY-0002va-ML
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 10:04:02 +0200
Received: by mail-wg0-f51.google.com with SMTP id b13so2759933wgh.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 00:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=N+NOi86uchoynHM3Gf8XmL0scuSAfSkJDPM7xtMUblc=;
	b=O6FRCYl5T1kmloJO2wkYB0MZkK4vDuuM8MXndmd8zpj1t8W7mOtp0pmwsB7av82dCj
	hzRi+tY0No87pJ+jk48sZG6egXzmSwN+0Q6MewsR0pjpll884dEagRBdxjsg9eF4aZvJ
	WiW+xKOI9qJQVaPzbiDNLEqM53ZIskR0VgMsMli8KFwd0stblcqjXvL/0qtb+bPOKSox
	M1sL/DloAY5O4Rm5qbFGVP6NqMYzxxgJw9/A4I5WU5GYfrGzcEkegRYeiMDdUZPcqJWx
	vANKbw0/IJXOePhpNmizUnN6zjzp7Mwy4k0eIV8TrIlElR5VpXGk/tdynRJZiBg6+MQW
	P7rQ==
X-Received: by 10.180.183.139 with SMTP id em11mr26931694wic.16.1368085557411; 
	Thu, 09 May 2013 00:45:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.6.38 with HTTP; Thu, 9 May 2013 00:45:37 -0700 (PDT)
In-Reply-To: <518A625D.5060301@linux.intel.com>
References: <1368019997-2015-1-git-send-email-bogdan.a.marinescu@intel.com>
	<518A625D.5060301@linux.intel.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Thu, 9 May 2013 10:45:37 +0300
Message-ID: <CAMZjud2v566sxnfBY8oHLSbngmo1b=2hqk8tc03zHr7Ejpj0zw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQluZD6KxTJ9OsAd78bjQ5RRMrS0tIsXZuDNBgFAzOpAOUXALSu7cLPk8aHblNIhd/cj0Fs5
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] btrfs-tools: upgraded to 0.20-rc1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 08:04:09 -0000
X-List-Received-Date: Thu, 09 May 2013 08:04:09 -0000
Content-Type: multipart/alternative; boundary=001a11c222baac18ed04dc443d04

--001a11c222baac18ed04dc443d04
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 8, 2013 at 5:34 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/08/2013 06:33 AM, Bogdan Marinescu wrote:
>
>> 'fix_use_of_gcc.patch' was integrated in the main repository.
>>
>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> ---
>>   .../btrfs-tools/btrfs-tools/**fix_use_of_gcc.patch   |   31
>> --------------------
>>   .../btrfs-tools/btrfs-tools_**git.bb <http://btrfs-tools_git.bb>
>>           |    9 ++----
>>   2 files changed, 3 insertions(+), 37 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/btrfs-**
>> tools/btrfs-tools/fix_use_of_**gcc.patch
>>
>> diff --git a/meta/recipes-devtools/btrfs-**tools/btrfs-tools/fix_use_of_*
>> *gcc.patch b/meta/recipes-devtools/btrfs-**tools/btrfs-tools/fix_use_of_*
>> *gcc.patch
>> deleted file mode 100644
>> index 7f6594a..0000000
>> --- a/meta/recipes-devtools/btrfs-**tools/btrfs-tools/fix_use_of_**
>> gcc.patch
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -Nitin A Kamble <nitin.a.kamble@intel.com> 2011/06/09
>> -Upstream-Status: Pending
>> -
>> -Avoid these kinds of errors while doing cross build:
>> -
>> -| ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/**build0/tmp/sysroots/qemux86
>> -Wp,-MMD,./.btrfsctl.o.d,-MT,**btrfsctl.o -Wall -D_FILE_OFFSET_BITS=64
>> -D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types -c
>> btrfsctl.c
>> -| gcc -O2 -pipe -g -feliminate-unused-debug-types -o btrfsctl btrfsctl.o
>> ctree.o disk-io.o radix-tree.o extent-tree.o print-tree.o root-tree.o
>> dir-item.o file-item.o inode-item.o inode-map.o crc32c.o rbtree.o
>> extent-cache.o extent_io.o volumes.o utils.o btrfs-list.o -Wl,-O1
>>  -Wl,--as-needed -luuid
>> -| /usr/bin/ld: i386 architecture of input file `btrfsctl.o' is
>> incompatible with i386:x86-64 output
>> -| /usr/bin/ld: i386 architecture of input file `ctree.o' is incompatible
>> with i386:x86-64 output
>> -
>> -Index: git/Makefile
>> -=============================**==============================**========
>> ---- git.orig/Makefile
>> -+++ git/Makefile
>> -@@ -41,13 +41,13 @@ btrfs: $(objects) btrfs.o btrfs_cmds.o s
>> -               $(objects) $(LDFLAGS) $(LIBS)
>> -
>> - calc-size: $(objects) calc-size.o
>> --      gcc $(CFLAGS) -o calc-size calc-size.o $(objects) $(LDFLAGS)
>> $(LIBS)
>> -+      $(CC) $(CFLAGS) -o calc-size calc-size.o $(objects) $(LDFLAGS)
>> $(LIBS)
>> -
>> - find-root: $(objects) find-root.o
>> --      gcc $(CFLAGS) -o find-root find-root.o $(objects) $(LDFLAGS)
>> $(LIBS)
>> -+      $(CC) $(CFLAGS) -o find-root find-root.o $(objects) $(LDFLAGS)
>> $(LIBS)
>> -
>> - restore: $(objects) restore.o
>> --      gcc $(CFLAGS) -o restore restore.o $(objects) $(LDFLAGS) $(LIBS)
>> $(RESTORE_LIBS)
>> -+      $(CC) $(CFLAGS) -o restore restore.o $(objects) $(LDFLAGS)
>> $(LIBS) $(RESTORE_LIBS)
>> -
>> - btrfsctl: $(objects) btrfsctl.o
>> -       $(CC) $(CFLAGS) -o btrfsctl btrfsctl.o $(objects) $(LDFLAGS)
>> $(LIBS)
>> diff --git a/meta/recipes-devtools/btrfs-**tools/btrfs-tools_git.bbb/meta/recipes-devtools/btrfs-
>> **tools/btrfs-tools_git.bb
>> index ef575ae..51c1b08 100644
>> --- a/meta/recipes-devtools/btrfs-**tools/btrfs-tools_git.bb
>> +++ b/meta/recipes-devtools/btrfs-**tools/btrfs-tools_git.bb
>> @@ -12,17 +12,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=**
>> fcb02dc552a041dee27e4b85c73960**67"
>>   SECTION = "base"
>>   DEPENDS = "util-linux attr"
>>
>> -SRCREV = "**fdb6c0402337d9607c7a39155088ea**f033742752"
>> +SRCREV = "**89fe5b5f666c247aa3173745fb87c7**10f3a71a4a"
>>   SRC_URI = "git://git.kernel.org/pub/scm/**linux/kernel/git/mason/btrfs-
>> **progs.git;protocol=git<http://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;protocol=git>
>> "
>>
>>   S = "${WORKDIR}/git"
>>
>> -PV = "0.19+git${SRCPV}"
>> +PV = "0.20-rc1+git${SRCPV}"
>>
>>
> Is there a reason we are moving to an "rc1" instead of waiting for the
> final version to be released?
>

This was the version suggested by the package reporting system.


>
> Sau!
>
>
>  -PR = "r6"
>> -
>> -SRC_URI += " file://fix_use_of_gcc.patch \
>> -        file://weak-defaults.patch \
>> +SRC_URI += " file://weak-defaults.patch \
>>          file://fix_race_condition_**with_multithreaded_make.patch "
>>
>>   SRC_URI[md5sum] = "**78b1700d318de8518abfaab71f99a8**85"
>>
>>

--001a11c222baac18ed04dc443d04
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, May 8, 2013 at 5:34 PM, Saul Wold <span dir=3D"ltr">&lt;<a =
href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</=
a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 0=
5/08/2013 06:33 AM, Bogdan Marinescu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
&#39;fix_use_of_gcc.patch&#39; was integrated in the main repository.<br>
<br>
Signed-off-by: Bogdan Marinescu &lt;<a href=3D"mailto:bogdan.a.marinescu@in=
tel.com" target=3D"_blank">bogdan.a.marinescu@intel.com</a>&gt;<br>
---<br>
=A0 .../btrfs-tools/btrfs-tools/<u></u>fix_use_of_gcc.patch =A0 | =A0 31 --=
------------------<br>
=A0 .../btrfs-tools/<a href=3D"http://btrfs-tools_git.bb" target=3D"_blank"=
>btrfs-tools_<u></u>git.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A09 +=
+----<br>
=A0 2 files changed, 3 insertions(+), 37 deletions(-)<br>
=A0 delete mode 100644 meta/recipes-devtools/btrfs-<u></u>tools/btrfs-tools=
/fix_use_of_<u></u>gcc.patch<br>
<br>
diff --git a/meta/recipes-devtools/btrfs-<u></u>tools/btrfs-tools/fix_use_o=
f_<u></u>gcc.patch b/meta/recipes-devtools/btrfs-<u></u>tools/btrfs-tools/f=
ix_use_of_<u></u>gcc.patch<br>
deleted file mode 100644<br>
index 7f6594a..0000000<br>
--- a/meta/recipes-devtools/btrfs-<u></u>tools/btrfs-tools/fix_use_of_<u></=
u>gcc.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-Nitin A Kamble &lt;<a href=3D"mailto:nitin.a.kamble@intel.com" target=3D"_=
blank">nitin.a.kamble@intel.com</a>&gt; 2011/06/09<br>
-Upstream-Status: Pending<br>
-<br>
-Avoid these kinds of errors while doing cross build:<br>
-<br>
-| ccache i586-poky-linux-gcc -march=3Di586 --sysroot=3D/disk0/pokybuild/<u=
></u>build0/tmp/sysroots/qemux86 -Wp,-MMD,./.btrfsctl.o.d,-MT,<u></u>btrfsc=
tl.o -Wall -D_FILE_OFFSET_BITS=3D64 -D_FORTIFY_SOURCE=3D2 -O2 -pipe -g -fel=
iminate-unused-debug-types -c btrfsctl.c<br>


-| gcc -O2 -pipe -g -feliminate-unused-debug-types -o btrfsctl btrfsctl.o c=
tree.o disk-io.o radix-tree.o extent-tree.o print-tree.o root-tree.o dir-it=
em.o file-item.o inode-item.o inode-map.o crc32c.o rbtree.o extent-cache.o =
extent_io.o volumes.o utils.o btrfs-list.o -Wl,-O1 =A0-Wl,--as-needed -luui=
d<br>


-| /usr/bin/ld: i386 architecture of input file `btrfsctl.o&#39; is incompa=
tible with i386:x86-64 output<br>
-| /usr/bin/ld: i386 architecture of input file `ctree.o&#39; is incompatib=
le with i386:x86-64 output<br>
-<br>
-Index: git/Makefile<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/Makefile<br>
-+++ git/Makefile<br>
-@@ -41,13 +41,13 @@ btrfs: $(objects) btrfs.o btrfs_cmds.o s<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(objects) $(LDFLAGS) $(LIBS)<br>
-<br>
- calc-size: $(objects) calc-size.o<br>
-- =A0 =A0 =A0gcc $(CFLAGS) -o calc-size calc-size.o $(objects) $(LDFLAGS) =
$(LIBS)<br>
-+ =A0 =A0 =A0$(CC) $(CFLAGS) -o calc-size calc-size.o $(objects) $(LDFLAGS=
) $(LIBS)<br>
-<br>
- find-root: $(objects) find-root.o<br>
-- =A0 =A0 =A0gcc $(CFLAGS) -o find-root find-root.o $(objects) $(LDFLAGS) =
$(LIBS)<br>
-+ =A0 =A0 =A0$(CC) $(CFLAGS) -o find-root find-root.o $(objects) $(LDFLAGS=
) $(LIBS)<br>
-<br>
- restore: $(objects) restore.o<br>
-- =A0 =A0 =A0gcc $(CFLAGS) -o restore restore.o $(objects) $(LDFLAGS) $(LI=
BS) $(RESTORE_LIBS)<br>
-+ =A0 =A0 =A0$(CC) $(CFLAGS) -o restore restore.o $(objects) $(LDFLAGS) $(=
LIBS) $(RESTORE_LIBS)<br>
-<br>
- btrfsctl: $(objects) btrfsctl.o<br>
- =A0 =A0 =A0 $(CC) $(CFLAGS) -o btrfsctl btrfsctl.o $(objects) $(LDFLAGS) =
$(LIBS)<br>
diff --git a/meta/recipes-devtools/btrfs-<u></u>tools/<a href=3D"http://btr=
fs-tools_git.bb" target=3D"_blank">btrfs-tools_git.bb</a> b/meta/recipes-de=
vtools/btrfs-<u></u>tools/<a href=3D"http://btrfs-tools_git.bb" target=3D"_=
blank">btrfs-tools_git.bb</a><br>


index ef575ae..51c1b08 100644<br>
--- a/meta/recipes-devtools/btrfs-<u></u>tools/<a href=3D"http://btrfs-tool=
s_git.bb" target=3D"_blank">btrfs-tools_git.bb</a><br>
+++ b/meta/recipes-devtools/btrfs-<u></u>tools/<a href=3D"http://btrfs-tool=
s_git.bb" target=3D"_blank">btrfs-tools_git.bb</a><br>
@@ -12,17 +12,14 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<u></u>=
fcb02dc552a041dee27e4b85c73960<u></u>67&quot;<br>
=A0 SECTION =3D &quot;base&quot;<br>
=A0 DEPENDS =3D &quot;util-linux attr&quot;<br>
<br>
-SRCREV =3D &quot;<u></u>fdb6c0402337d9607c7a39155088ea<u></u>f033742752&qu=
ot;<br>
+SRCREV =3D &quot;<u></u>89fe5b5f666c247aa3173745fb87c7<u></u>10f3a71a4a&qu=
ot;<br>
=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/linux/=
kernel/git/mason/btrfs-progs.git;protocol=3Dgit" target=3D"_blank">git.kern=
el.org/pub/scm/<u></u>linux/kernel/git/mason/btrfs-<u></u>progs.git;protoco=
l=3Dgit</a>&quot;<br>


<br>
=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-PV =3D &quot;0.19+git${SRCPV}&quot;<br>
+PV =3D &quot;0.20-rc1+git${SRCPV}&quot;<br>
<br>
</blockquote>
<br></div></div>
Is there a reason we are moving to an &quot;rc1&quot; instead of waiting fo=
r the final version to be released?<br></blockquote><div><br></div><div sty=
le>This was the version suggested by the package reporting system.</div>

<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
-PR =3D &quot;r6&quot;<br>
-<br>
-SRC_URI +=3D &quot; file://fix_use_of_gcc.patch \<br>
- =A0 =A0 =A0 =A0file://weak-defaults.patch \<br>
+SRC_URI +=3D &quot; file://weak-defaults.patch \<br>
=A0 =A0 =A0 =A0 =A0file://fix_race_condition_<u></u>with_multithreaded_make=
.patch &quot;<br>
<br>
=A0 SRC_URI[md5sum] =3D &quot;<u></u>78b1700d318de8518abfaab71f99a8<u></u>8=
5&quot;<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div></div>

--001a11c222baac18ed04dc443d04--
