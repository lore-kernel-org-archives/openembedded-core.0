Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id BC4797FCA3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 18:37:59 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id m30so9998591lfp.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 10:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=/i1BksheISY2sSAHbYPLZzgAe9LiHbSwkwKXbCHF8PY=;
	b=jjksPV/nDHbIzzzuJNbynGDTbJ3t9QIr9luV/RSSkwgp0kL+LnqtdTH1Us4JNXqFkW
	6gKGvltX8/KIm8qJUhF2hHWmDHqV2Ovdm5zJR1hMshu9kYpmZ1941DAEMK6wmgdWNOvw
	g14ALKQ9DcASAtlIzWcKYhOoaF/W/y+rAywWQ8YB5jDLwAEuY/vW1H2l53koaaw0gwN9
	4JBZrF3rbA7+YQkrRf2kXwq4F3AHXeTrZ+VjErn0506Dre1DU1Fumv7AbWCix0P4GM8B
	L0ApfUOY1yiD7FGOIfcNIjgXBtGyb75MobqAFzv7Q4DPT6fINm7FIyMmnrb76FAyzVyy
	TjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=/i1BksheISY2sSAHbYPLZzgAe9LiHbSwkwKXbCHF8PY=;
	b=d2L5t+MxFqSM2YogfnFuVB9W5UpgLFQGdq6NIBEwQWQoL5+sw4xryK+vKQw71vXBiH
	20jFOIDJgAPA2A/cSyz0O2iMnk4LNj8KYpiTneGLhvIcmKSfy1CqswuEdWKzWBKhvAx9
	WW8FoqOvQ1W01ZXtzMbfcbltcBoaotTRWWtbxdL9OHaoWjaeTH6Piewd5oOTEXLltwMC
	5kTKeZf58I0YmHToIMJjdhpyXCah/fbjSozcFsVjX+3b60iGokW9eHERPp+DVgUsfXXK
	cnkdqzFd3I+27vrgbllEXyAbuAZjan70pFH6/iGQzikpbaMrL0O59YccxUKJ4D5ZRi0E
	e0AQ==
X-Gm-Message-State: APjAAAWSPv9G5zlwqnM0/zPu4DtG4qBkc6L0+DZCN2LnpTnTyRg6kPAG
	rHgKyG7SStcn7u0eCUXufJXsIqD7dHZxUWSwGz3QnQQ2
X-Google-Smtp-Source: APXvYqxRQ+m56LRQ6PAh8EDACKW+ZmSAZeoSgu7GGoQRSn2IMgLKpmeOcHp8LAW99gbe18Ng6yxOZu8squWCeMitXlc=
X-Received: by 2002:ac2:43c7:: with SMTP id u7mr21191554lfl.71.1574707079449; 
	Mon, 25 Nov 2019 10:37:59 -0800 (PST)
MIME-Version: 1.0
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 26 Nov 2019 07:37:48 +1300
Message-ID: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Very large size of libraries in core-image-minimal rootfs
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
X-List-Received-Date: Mon, 25 Nov 2019 18:38:00 -0000
Content-Type: multipart/alternative; boundary="00000000000018917605983010f6"

--00000000000018917605983010f6
Content-Type: text/plain; charset="UTF-8"

Hi,

Based upon "thud" branch, I created core-image-minimal for am335x-evm board
and resulting image size is very big (71M)

/lib dir is 39M and /usr/lib is 24M.

How can the libraries be trimmed down to fit image inside 40M partition? I
can see duplicacy in /usr/lib and symlink should help but that would reduce
12M. I need to reduce further 20M.

When I was using "daisy" branch, resulting image was much tiny but world
has changed since then. Any help is much appreciated as I am now blocked
and looking for some help.

$ ls -al lib/
total 38712
drwxr-xr-x  4 ankur ankur     4096 Nov 26 07:13 .
drwxr-xr-x 17 ankur ankur     4096 Nov 26 07:13 ..
-rwxr-xr-x  1 ankur ankur  1347940 Nov 26 06:41 ld-2.28.so
lrwxrwxrwx  1 ankur ankur       10 Nov 26 06:41 ld-linux-armhf.so.3 ->
ld-2.28.so
-rwxr-xr-x  1 ankur ankur   133528 Nov 26 06:41 libanl.so.1
lrwxrwxrwx  1 ankur ankur       16 Nov 26 06:41 libattr.so.1 ->
libattr.so.1.1.0
-rw-r--r--  1 ankur ankur    13736 Nov 26 06:41 libattr.so.1.1.0
lrwxrwxrwx  1 ankur ankur       17 Nov 26 06:44 libblkid.so.1 ->
libblkid.so.1.1.0
-rwxr-xr-x  1 ankur ankur   195404 Nov 26 06:44 libblkid.so.1.1.0
-rwxr-xr-x  1 ankur ankur    25392 Nov 26 06:41 libBrokenLocale.so.1
-rwxr-xr-x  1 ankur ankur   153372 Nov 26 06:41 libcrypt.so.1
-rwxr-xr-x  1 ankur ankur *16537400* Nov 26 06:41 libc.so.6
-rwxr-xr-x  1 ankur ankur   225508 Nov 26 06:41 libdl.so.2
-rw-r--r--  1 ankur ankur      132 Nov 26 06:40 libgcc_s.so
-rw-r--r--  1 ankur ankur  *9063520* Nov 26 06:40 libgcc_s.so.1
-rwxr-xr-x  1 ankur ankur  *6416640* Nov 26 06:41 libm.so.6
-rwxr-xr-x  1 ankur ankur   722176 Nov 26 06:41 libnsl.so.1
-rwxr-xr-x  1 ankur ankur   178932 Nov 26 06:41 libnss_compat.so.2
-rwxr-xr-x  1 ankur ankur   122236 Nov 26 06:41 libnss_dns.so.2
-rwxr-xr-x  1 ankur ankur   373084 Nov 26 06:41 libnss_files.so.2
-rwxr-xr-x  1 ankur ankur   115836 Nov 26 06:41 libnss_hesiod.so.2
lrwxrwxrwx  1 ankur ankur       17 Nov 26 06:44 libpamc.so.0 ->
libpamc.so.0.82.1
-rwxr-xr-x  1 ankur ankur     9592 Nov 26 06:44 libpamc.so.0.82.1
lrwxrwxrwx  1 ankur ankur       21 Nov 26 06:44 libpam_misc.so.0 ->
libpam_misc.so.0.82.1
-rwxr-xr-x  1 ankur ankur     9628 Nov 26 06:44 libpam_misc.so.0.82.1
lrwxrwxrwx  1 ankur ankur       16 Nov 26 06:44 libpam.so.0 ->
libpam.so.0.84.2
-rwxr-xr-x  1 ankur ankur    34396 Nov 26 06:44 libpam.so.0.84.2
-rwxr-xr-x  1 ankur ankur  *2742208* Nov 26 06:41 libpthread.so.0
-rwxr-xr-x  1 ankur ankur   436644 Nov 26 06:41 libresolv.so.2
-rwxr-xr-x  1 ankur ankur   424948 Nov 26 06:41 librt.so.1
lrwxrwxrwx  1 ankur ankur       12 Nov 26 06:45 libudev.so.0 -> libudev.so.1
lrwxrwxrwx  1 ankur ankur       16 Nov 26 06:45 libudev.so.1 ->
libudev.so.1.6.3
-rwxr-xr-x  1 ankur ankur    88176 Nov 26 06:45 libudev.so.1.6.3
lrwxrwxrwx  1 ankur ankur       19 Nov 26 07:13 libusb-1.0.so.0 ->
libusb-1.0.so.0.1.0
-rwxr-xr-x  1 ankur ankur    67292 Nov 26 07:13 libusb-1.0.so.0.1.0
-rwxr-xr-x  1 ankur ankur    40320 Nov 26 06:41 libutil.so.1
lrwxrwxrwx  1 ankur ankur       16 Nov 26 06:44 libuuid.so.1 ->
libuuid.so.1.3.0
-rwxr-xr-x  1 ankur ankur    22108 Nov 26 06:44 libuuid.so.1.3.0
lrwxrwxrwx  1 ankur ankur       14 Nov 26 06:40 libz.so.1 -> libz.so.1.2.11
-rwxr-xr-x  1 ankur ankur    63012 Nov 26 06:40 libz.so.1.2.11
drwxr-xr-x  2 ankur ankur     4096 Nov 26 07:13 security
drwxr-xr-x  3 ankur ankur     4096 Nov 26 06:45 udev

$ ls -al usr/lib/
total 23376
drwxr-xr-x  3 ankur ankur     4096 Nov 26 07:13 .
drwxr-xr-x 10 ankur ankur     4096 Nov 26 07:13 ..
lrwxrwxrwx  1 ankur ankur       15 Nov 26 07:12 libi2c.so.0 ->
libi2c.so.0.1.1
-rwxr-xr-x  1 ankur ankur     5292 Nov 26 07:12 libi2c.so.0.1.1
lrwxrwxrwx  1 ankur ankur       16 Nov 26 06:44 libkmod.so.2 ->
libkmod.so.2.3.3
-rwxr-xr-x  1 ankur ankur    46840 Nov 26 06:44 libkmod.so.2.3.3
-rwxr-xr-x  1 ankur ankur *11930116* Nov 26 06:43 libstdc++.so.6
-rwxr-xr-x  1 ankur ankur *11930116* Nov 26 06:43 libstdc++.so.6.0.25
-rw-r--r--  1 ankur ankur     2388 Nov 26 06:43 libstdc++.so.6.0.25-gdb.py
drwxr-xr-x  3 ankur ankur     4096 Nov 26 07:13 opkg

$ du -h
4.0K    ./sys
4.0K    ./boot
4.0K    ./dev
5.5M    ./sbin
612K    ./bin
4.0K    ./usr/share/dict
4.0K    ./usr/share/man
4.0K    ./usr/share/misc
4.0K    ./usr/share/info
20K    ./usr/share
208K    ./usr/libexec
824K    ./usr/sbin
520K    ./usr/bin
4.0K    ./usr/include
4.0K    ./usr/src
4.0K    ./usr/games
1.1M    ./usr/lib/opkg/alternatives
1.1M    ./usr/lib/opkg

*24M    ./usr/lib26M    ./usr*
4.0K    ./var/local
4.0K    ./var/spool/mail
8.0K    ./var/spool
4.0K    ./var/backups
4.0K    ./var/lib/opkg
4.0K    ./var/lib/misc
4.0K    ./var/lib/urandom
16K    ./var/lib
4.0K    ./var/volatile
4.0K    ./var/cache/opkg
8.0K    ./var/cache/ldconfig
16K    ./var/cache
56K    ./var
4.0K    ./mnt/.psplash
8.0K    ./mnt
4.0K    ./proc
4.0K    ./etc/network/if-up.d
4.0K    ./etc/network/if-down.d
4.0K    ./etc/network/if-post-down.d
8.0K    ./etc/network/if-pre-up.d
28K    ./etc/network
92K    ./etc/pam.d
4.0K    ./etc/rc2.d
140K    ./etc/init.d
4.0K    ./etc/rc6.d
12K    ./etc/skel
4.0K    ./etc/rc0.d
16K    ./etc/udev/rules.d
24K    ./etc/udev
4.0K    ./etc/rcS.d
4.0K    ./etc/security/limits.d
4.0K    ./etc/security/namespace.d
44K    ./etc/security
16K    ./etc/default/volatiles
36K    ./etc/default
4.0K    ./etc/rc1.d
4.0K    ./etc/rc5.d
4.0K    ./etc/rc3.d
8.0K    ./etc/ipk-postinsts
4.0K    ./etc/rc4.d
560K    ./etc
4.0K    ./run
4.0K    ./tmp
104K    ./lib/udev/rules.d
400K    ./lib/udev
172K    ./lib/security
*39M*    *./lib*
4.0K    ./media
4.0K    ./home/root
8.0K    ./home
*71M    .*

Thanks
Ankur

--00000000000018917605983010f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br><div><span class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif">Based upon &quot;thud&quot; branch, </=
span>I created core-image-minimal for am335x-evm board and resulting image =
size is very big<span class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif"> (71M)</span><br></div><div><br></div><div><span class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">/</span=
>lib dir <span class=3D"gmail_default" style=3D"font-family:arial,helvetica=
,sans-serif">is</span> 39M and <span class=3D"gmail_default" style=3D"font-=
family:arial,helvetica,sans-serif">/</span>usr/lib <span class=3D"gmail_def=
ault" style=3D"font-family:arial,helvetica,sans-serif">i</span>s 24M.</div>=
<div style=3D"font-family:arial,helvetica,sans-serif" class=3D"gmail_defaul=
t"><br></div><div style=3D"font-family:arial,helvetica,sans-serif" class=3D=
"gmail_default">How can the libraries be trimmed down to fit image inside 4=
0M partition? I can see duplicacy in /usr/lib and symlink should help but t=
hat would reduce 12M. I need to reduce further 20M.</div><div style=3D"font=
-family:arial,helvetica,sans-serif" class=3D"gmail_default"><br></div><div =
style=3D"font-family:arial,helvetica,sans-serif" class=3D"gmail_default">Wh=
en I was using &quot;daisy&quot; branch, resulting image was much tiny but =
world has changed since then. Any help is much appreciated as I am now bloc=
ked and looking for some help.<br></div><br>$ ls -al lib/<br>total 38712<br=
>drwxr-xr-x =C2=A04 ankur ankur =C2=A0 =C2=A0 4096 Nov 26 07:13 .<br>drwxr-=
xr-x 17 ankur ankur =C2=A0 =C2=A0 4096 Nov 26 07:13 ..<br>-rwxr-xr-x =C2=A0=
1 ankur ankur =C2=A01347940 Nov 26 06:41 <a href=3D"http://ld-2.28.so">ld-2=
.28.so</a><br>lrwxrwxrwx =C2=A01 ankur ankur =C2=A0 =C2=A0 =C2=A0 10 Nov 26=
 06:41 ld-linux-armhf.so.3 -&gt; <a href=3D"http://ld-2.28.so">ld-2.28.so</=
a><br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 133528 Nov 26 06:41 libanl.so.1=
<br>lrwxrwxrwx =C2=A01 ankur ankur =C2=A0 =C2=A0 =C2=A0 16 Nov 26 06:41 lib=
attr.so.1 -&gt; libattr.so.1.1.0<br>-rw-r--r-- =C2=A01 ankur ankur =C2=A0 =
=C2=A013736 Nov 26 06:41 libattr.so.1.1.0<br>lrwxrwxrwx =C2=A01 ankur ankur=
 =C2=A0 =C2=A0 =C2=A0 17 Nov 26 06:44 libblkid.so.1 -&gt; libblkid.so.1.1.0=
<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 195404 Nov 26 06:44 libblkid.so.1=
.1.0<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 =C2=A025392 Nov 26 06:41 libB=
rokenLocale.so.1<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 153372 Nov 26 06:=
41 libcrypt.so.1<br>-rwxr-xr-x =C2=A01 ankur ankur <b>16537400</b> Nov 26 0=
6:41 libc.so.6<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 225508 Nov 26 06:41=
 libdl.so.2<br>-rw-r--r-- =C2=A01 ankur ankur =C2=A0 =C2=A0 =C2=A0132 Nov 2=
6 06:40 libgcc_s.so<br>-rw-r--r-- =C2=A01 ankur ankur =C2=A0<span class=3D"=
gmail_default" style=3D"font-family:arial,helvetica,sans-serif"></span><b>9=
063520</b> Nov 26 06:40 libgcc_s.so.1<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=
=A0<span class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-=
serif"></span><b>6416640</b> Nov 26 06:41 libm.so.6<br>-rwxr-xr-x =C2=A01 a=
nkur ankur =C2=A0 722176 Nov 26 06:41 libnsl.so.1<br>-rwxr-xr-x =C2=A01 ank=
ur ankur =C2=A0 178932 Nov 26 06:41 libnss_compat.so.2<br>-rwxr-xr-x =C2=A0=
1 ankur ankur =C2=A0 122236 Nov 26 06:41 libnss_dns.so.2<br>-rwxr-xr-x =C2=
=A01 ankur ankur =C2=A0 373084 Nov 26 06:41 libnss_files.so.2<br>-rwxr-xr-x=
 =C2=A01 ankur ankur =C2=A0 115836 Nov 26 06:41 libnss_hesiod.so.2<br>lrwxr=
wxrwx =C2=A01 ankur ankur =C2=A0 =C2=A0 =C2=A0 17 Nov 26 06:44 libpamc.so.0=
 -&gt; libpamc.so.0.82.1<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 =C2=A0 95=
92 Nov 26 06:44 libpamc.so.0.82.1<br>lrwxrwxrwx =C2=A01 ankur ankur =C2=A0 =
=C2=A0 =C2=A0 21 Nov 26 06:44 libpam_misc.so.0 -&gt; libpam_misc.so.0.82.1<=
br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 =C2=A0 9628 Nov 26 06:44 libpam_mi=
sc.so.0.82.1<br>lrwxrwxrwx =C2=A01 ankur ankur =C2=A0 =C2=A0 =C2=A0 16 Nov =
26 06:44 libpam.so.0 -&gt; libpam.so.0.84.2<br>-rwxr-xr-x =C2=A01 ankur ank=
ur =C2=A0 =C2=A034396 Nov 26 06:44 libpam.so.0.84.2<br>-rwxr-xr-x =C2=A01 a=
nkur ankur =C2=A0<span class=3D"gmail_default" style=3D"font-family:arial,h=
elvetica,sans-serif"></span><b>2742208</b> Nov 26 06:41 libpthread.so.0<br>=
-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 436644 Nov 26 06:41 libresolv.so.2<br=
>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 424948 Nov 26 06:41 librt.so.1<br>lr=
wxrwxrwx =C2=A01 ankur ankur =C2=A0 =C2=A0 =C2=A0 12 Nov 26 06:45 libudev.s=
o.0 -&gt; libudev.so.1<br>lrwxrwxrwx =C2=A01 ankur ankur =C2=A0 =C2=A0 =C2=
=A0 16 Nov 26 06:45 libudev.so.1 -&gt; libudev.so.1.6.3<br>-rwxr-xr-x =C2=
=A01 ankur ankur =C2=A0 =C2=A088176 Nov 26 06:45 libudev.so.1.6.3<br>lrwxrw=
xrwx =C2=A01 ankur ankur =C2=A0 =C2=A0 =C2=A0 19 Nov 26 07:13 libusb-1.0.so=
.0 -&gt; libusb-1.0.so.0.1.0<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 =C2=
=A067292 Nov 26 07:13 libusb-1.0.so.0.1.0<br>-rwxr-xr-x =C2=A01 ankur ankur=
 =C2=A0 =C2=A040320 Nov 26 06:41 libutil.so.1<br>lrwxrwxrwx =C2=A01 ankur a=
nkur =C2=A0 =C2=A0 =C2=A0 16 Nov 26 06:44 libuuid.so.1 -&gt; libuuid.so.1.3=
.0<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 =C2=A022108 Nov 26 06:44 libuui=
d.so.1.3.0<br>lrwxrwxrwx =C2=A01 ankur ankur =C2=A0 =C2=A0 =C2=A0 14 Nov 26=
 06:40 libz.so.1 -&gt; libz.so.1.2.11<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=
=A0 =C2=A063012 Nov 26 06:40 libz.so.1.2.11<br>drwxr-xr-x =C2=A02 ankur ank=
ur =C2=A0 =C2=A0 4096 Nov 26 07:13 security<br>drwxr-xr-x =C2=A03 ankur ank=
ur =C2=A0 =C2=A0 4096 Nov 26 06:45 udev<br><br>$ ls -al usr/lib/<br>total 2=
3376<br>drwxr-xr-x =C2=A03 ankur ankur =C2=A0 =C2=A0 4096 Nov 26 07:13 .<br=
>drwxr-xr-x 10 ankur ankur =C2=A0 =C2=A0 4096 Nov 26 07:13 ..<br>lrwxrwxrwx=
 =C2=A01 ankur ankur =C2=A0 =C2=A0 =C2=A0 15 Nov 26 07:12 libi2c.so.0 -&gt;=
 libi2c.so.0.1.1<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 =C2=A0 5292 Nov 2=
6 07:12 libi2c.so.0.1.1<br>lrwxrwxrwx =C2=A01 ankur ankur =C2=A0 =C2=A0 =C2=
=A0 16 Nov 26 06:44 libkmod.so.2 -&gt; libkmod.so.2.3.3<br>-rwxr-xr-x =C2=
=A01 ankur ankur =C2=A0 =C2=A046840 Nov 26 06:44 libkmod.so.2.3.3<br>-rwxr-=
xr-x =C2=A01 ankur ankur <span class=3D"gmail_default" style=3D"font-family=
:arial,helvetica,sans-serif"></span><b>11930116</b> Nov 26 06:43 libstdc++.=
so.6<br>-rwxr-xr-x =C2=A01 ankur ankur <span class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif"></span><b>11930116</b> Nov 26 0=
6:43 libstdc++.so.6.0.25<br>-rw-r--r-- =C2=A01 ankur ankur =C2=A0 =C2=A0 23=
88 Nov 26 06:43 libstdc++.<a href=3D"http://so.6.0.25-gdb.py">so.6.0.25-gdb=
.py</a><br>drwxr-xr-x =C2=A03 ankur ankur =C2=A0 =C2=A0 4096 Nov 26 07:13 o=
pkg<br><br>$ du -h<br>4.0K =C2=A0 =C2=A0./sys<br>4.0K =C2=A0 =C2=A0./boot<b=
r>4.0K =C2=A0 =C2=A0./dev<br>5.5M =C2=A0 =C2=A0./sbin<br>612K =C2=A0 =C2=A0=
./bin<br>4.0K =C2=A0 =C2=A0./usr/share/dict<br>4.0K =C2=A0 =C2=A0./usr/shar=
e/man<br>4.0K =C2=A0 =C2=A0./usr/share/misc<br>4.0K =C2=A0 =C2=A0./usr/shar=
e/info<br>20K =C2=A0 =C2=A0./usr/share<br>208K =C2=A0 =C2=A0./usr/libexec<b=
r>824K =C2=A0 =C2=A0./usr/sbin<br>520K =C2=A0 =C2=A0./usr/bin<br>4.0K =C2=
=A0 =C2=A0./usr/include<br>4.0K =C2=A0 =C2=A0./usr/src<br>4.0K =C2=A0 =C2=
=A0./usr/games<br>1.1M =C2=A0 =C2=A0./usr/lib/opkg/alternatives<br>1.1M =C2=
=A0 =C2=A0./usr/lib/opkg<br><b><span class=3D"gmail_default" style=3D"font-=
family:arial,helvetica,sans-serif"></span>24M =C2=A0 =C2=A0./usr/lib<br>26M=
 =C2=A0 =C2=A0./usr</b><br>4.0K =C2=A0 =C2=A0./var/local<br>4.0K =C2=A0 =C2=
=A0./var/spool/mail<br>8.0K =C2=A0 =C2=A0./var/spool<br>4.0K =C2=A0 =C2=A0.=
/var/backups<br>4.0K =C2=A0 =C2=A0./var/lib/opkg<br>4.0K =C2=A0 =C2=A0./var=
/lib/misc<br>4.0K =C2=A0 =C2=A0./var/lib/urandom<br>16K =C2=A0 =C2=A0./var/=
lib<br>4.0K =C2=A0 =C2=A0./var/volatile<br>4.0K =C2=A0 =C2=A0./var/cache/op=
kg<br>8.0K =C2=A0 =C2=A0./var/cache/ldconfig<br>16K =C2=A0 =C2=A0./var/cach=
e<br>56K =C2=A0 =C2=A0./var<br>4.0K =C2=A0 =C2=A0./mnt/.psplash<br>8.0K =C2=
=A0 =C2=A0./mnt<br>4.0K =C2=A0 =C2=A0./proc<br>4.0K =C2=A0 =C2=A0./etc/netw=
ork/if-up.d<br>4.0K =C2=A0 =C2=A0./etc/network/if-down.d<br>4.0K =C2=A0 =C2=
=A0./etc/network/if-post-down.d<br>8.0K =C2=A0 =C2=A0./etc/network/if-pre-u=
p.d<br>28K =C2=A0 =C2=A0./etc/network<br>92K =C2=A0 =C2=A0./etc/pam.d<br>4.=
0K =C2=A0 =C2=A0./etc/rc2.d<br>140K =C2=A0 =C2=A0./etc/init.d<br>4.0K =C2=
=A0 =C2=A0./etc/rc6.d<br>12K =C2=A0 =C2=A0./etc/skel<br>4.0K =C2=A0 =C2=A0.=
/etc/rc0.d<br>16K =C2=A0 =C2=A0./etc/udev/rules.d<br>24K =C2=A0 =C2=A0./etc=
/udev<br>4.0K =C2=A0 =C2=A0./etc/rcS.d<br>4.0K =C2=A0 =C2=A0./etc/security/=
limits.d<br>4.0K =C2=A0 =C2=A0./etc/security/namespace.d<br>44K =C2=A0 =C2=
=A0./etc/security<br>16K =C2=A0 =C2=A0./etc/default/volatiles<br>36K =C2=A0=
 =C2=A0./etc/default<br>4.0K =C2=A0 =C2=A0./etc/rc1.d<br>4.0K =C2=A0 =C2=A0=
./etc/rc5.d<br>4.0K =C2=A0 =C2=A0./etc/rc3.d<br>8.0K =C2=A0 =C2=A0./etc/ipk=
-postinsts<br>4.0K =C2=A0 =C2=A0./etc/rc4.d<br>560K =C2=A0 =C2=A0./etc<br>4=
.0K =C2=A0 =C2=A0./run<br>4.0K =C2=A0 =C2=A0./tmp<br>104K =C2=A0 =C2=A0./li=
b/udev/rules.d<br>400K =C2=A0 =C2=A0./lib/udev<br>172K =C2=A0 =C2=A0./lib/s=
ecurity<br><b><span class=3D"gmail_default" style=3D"font-family:arial,helv=
etica,sans-serif"></span>39M</b> =C2=A0 =C2=A0<span class=3D"gmail_default"=
 style=3D"font-family:arial,helvetica,sans-serif"></span><b>./lib</b><br>4.=
0K =C2=A0 =C2=A0./media<br>4.0K =C2=A0 =C2=A0./home/root<br>8.0K =C2=A0 =C2=
=A0./home<br><div><b><span class=3D"gmail_default" style=3D"font-family:ari=
al,helvetica,sans-serif"></span>71M =C2=A0 =C2=A0.</b></div><div><br></div>=
<div><div style=3D"font-family:arial,helvetica,sans-serif" class=3D"gmail_d=
efault">Thanks</div><div style=3D"font-family:arial,helvetica,sans-serif" c=
lass=3D"gmail_default">Ankur</div><br></div></div>

--00000000000018917605983010f6--
