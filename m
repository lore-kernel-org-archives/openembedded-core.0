Return-Path: <nick83ola@gmail.com>
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
	[209.85.210.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8C665C8F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 09:49:39 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id i10-v6so10625544oth.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 02:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=1dRWAyp8CVOFcWOBhZWFTU0boSkDV4TukUFIfs3GsiI=;
	b=HA+aaAXXXNDwD7lBfTZBck/qFQnXn4qyQsiMIsOKixobwWoi2zWtzZ5p720Oijc2/s
	Ux6XGjv5Rd14xKavyjeuT4MD4ZaZqy/q9G53r92oyjioV/rF9BGRymEB/dmY2hDhUuad
	ZuyUzHhmoY57zm5qwEDtGh4UHQvgWn0r3LP8tsJ8pRunW65+OfIZxcOXVjzGgq7dxQnF
	XYL3FHT89JCNKADtaIP2Ti3KE5OiBue/z04f2lZkQxl3DaEIDF6XTdwY1dvpaYJhNuJH
	2Cye1JsEFHA+XugWzy33hyhtW+NAItb8ew/xeLf7vhbVNQV1Qu6AbCyIsV69BTEyLI/H
	d9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=1dRWAyp8CVOFcWOBhZWFTU0boSkDV4TukUFIfs3GsiI=;
	b=TRTEIxld4ObJJWoi1zCANfdt0lUGL8qtf+mvXoaNudWqBwPEjxcD3YxI+XDTDpqBjh
	E/m2dzzSEo2VNbjXhZ0Z3B0oIv7C0Y45olLKAiloLDbzw0h+wIDZzjhlgDEtMqqZdii0
	VNc7z+IO+5YInO/Br39jHoBontd0RtWsNw8FHNWTk1d9vyBIGiuCz4ccGUxeklrETmnq
	oYTt7+jtsVJrICWCNjXjf4fOavEKL2+lOyWI0xi+ZtcYElhZvkkrZ+uMbjoueO+f3f43
	WVpfUzVTndEbC8E7Y3xrfxVDQYDDMUGT5cwdK9R7lJZK74jLPKIF/JmsdzxbI4cCnWRV
	+Eww==
X-Gm-Message-State: APzg51C6w5E+3c9e+YThF9x9La/emeT9HkodG02CiY++KhKvD1hww1D8
	i4tCX04W2kjTHWQ7xiUrhkfPRPGPaVF5WCqAmVVVKegt
X-Google-Smtp-Source: ANB0VdZ0NZa8LWg22nk1xPiu5Cr/dI/Q0KUJsgM3eUoid6mcl1EMbgpmkUKVnv2iyI/UUE+1chu+5xAdv+Wm1oCaHno=
X-Received: by 2002:a9d:2811:: with SMTP id
	m17-v6mr11359180otb.254.1537177780663; 
	Mon, 17 Sep 2018 02:49:40 -0700 (PDT)
MIME-Version: 1.0
From: nick83ola <nick83ola@gmail.com>
Date: Mon, 17 Sep 2018 10:49:29 +0100
Message-ID: <CABPh3UMsMQZ+39c2GL1H88YjzZh4q-Bbe-4T4_HUzQZPxvc8kA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky][meta][os-release] Error building after commit c539765288bf3bc2c8578e037ce8fc9c2323b745
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
X-List-Received-Date: Mon, 17 Sep 2018 09:49:40 -0000
Content-Type: multipart/alternative; boundary="00000000000092ba5905760e17bd"

--00000000000092ba5905760e17bd
Content-Type: text/plain; charset="UTF-8"

Hi,
after this patch I get this build error.
If I revert this all disappear.


system: docker image from crops (ubuntu 16.04)

Regards
Nicola Lunghi

=============================================

ERROR: os-release-1.0-r0 do_install: Function failed: do_install (log file
is located at
/workspace/vegas-demo/build-imx7/tmp/work/all-poky-linux/os-release/1.0-r0/temp/log.do_install.169)

ERROR: Logfile of failure stored in:
/workspace/vegas-demo/build-imx7/tmp/work/all-poky-linux/os-release/1.0-r0/temp/log.do_install.169

Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are
['virtual:native:/workspace/vegas-demo/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot',
'/workspace/vegas-demo/poky/meta/recipes-devtools/quilt/quilt-native_0.65.bb:
do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['pseudo-native',
'quilt-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| mv:
'/workspace/vegas-demo/build-imx7/tmp/work/all-poky-linux/os-release/1.0-r0/image/etc/os-release'
and
'/workspace/vegas-demo/build-imx7/tmp/work/all-poky-linux/os-release/1.0-r0/image/usr/lib/os-release'
are the same file
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_install (log file is located at
/workspace/vegas-demo/build-imx7/tmp/work/all-poky-linux/os-release/1.0-r0/temp/log.do_install.169)

ERROR: Task
(/workspace/vegas-demo/poky/meta/recipes-core/os-release/os-release.bb:do_install)
failed with exit code
'1'

NOTE: Tasks Summary: Attempted 3835 tasks of which 3834 didn't need to be
rerun and 1 failed.
NOTE: Writing buildhistory

======================================================


commit c539765288bf3bc2c8578e037ce8fc9c2323b745
Author: Joshua Lock <joshua.g.lock@intel.com>
Date:   Tue Sep 4 16:50:00 2018 +0100

    os-release: fix to install in the expected location

    os-release (5) recommends that the os-release file be installed in
    /usr/lib/os-release and that /etc/os-release be a relative symlink to
it.

    (From OE-Core rev: 4feb8614ee25a3d3ceb7f5187120a1256a993155)

    Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/os-release/os-release.bb
b/meta/recipes-core/os-release/os-release.bb
index f988704756..bf4f815a10 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -1,7 +1,7 @@
 inherit allarch

 SUMMARY = "Operating system identification"
-DESCRIPTION = "The /etc/os-release file contains operating system
identification data."
+DESCRIPTION = "The /usr/lib/os-release file contains operating system
identification data."
 LICENSE = "MIT"
 INHIBIT_DEFAULT_DEPS = "1"

@@ -42,6 +42,9 @@ python do_compile () {
 do_compile[vardeps] += "${OS_RELEASE_FIELDS}"

 do_install () {
-    install -d ${D}${sysconfdir}
-    install -m 0644 os-release ${D}${sysconfdir}/
+    install -d ${D}${libdir} ${D}${sysconfdir}
+    install -m 0644 os-release ${D}${libdir}/
+    lnr ${D}${libdir}/os-release ${D}${sysconfdir}/os-release
 }
+
+FILES_${PN} += "${libdir}/os-release"

--00000000000092ba5905760e17bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, <br></div><div>after this patch I get this build =
error.</div><div>If I revert this all disappear.<br></div><div></div><div><=
br></div><div><br></div><div>system: docker image from crops (ubuntu 16.04)=
<br></div><div><br></div><div>Regards</div><div>Nicola Lunghi<br></div><div=
><br></div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br></div><div><br></div><div>ERROR: os-release-1.0-r0 do_install: Funct=
ion failed: do_install (log=20
file is located at=20
/workspace/vegas-demo/build-imx7/tmp/work/all-poky-linux/os-release/1.0-r0/=
temp/log.do_install.169)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
 =C2=A0</div>
<div>ERROR: Logfile of failure stored in:=20
/workspace/vegas-demo/build-imx7/tmp/work/all-poky-linux/os-release/1.0-r0/=
temp/log.do_install.169=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
 =C2=A0<br>
Log data follows:<br>
| DEBUG: Executing python function extend_recipe_sysroot<br>
| NOTE: Direct dependencies are=20
[&#39;virtual:native:/workspace/vegas-demo/poky/meta/recipes-devtools/pseud=
o/pseudo_git.bb:do_populate_sysroot&#39;,
=20
&#39;/workspace/vegas-demo/poky/meta/recipes-devtools/quilt/quilt-native_0.=
65.bb:do_populate_sysroot&#39;]<br>
| NOTE: Installed into sysroot: []<br>
| NOTE: Skipping as already exists in sysroot: [&#39;pseudo-native&#39;, &#=
39;quilt-native&#39;]<br>
| DEBUG: Python function extend_recipe_sysroot finished<br>
| DEBUG: Executing shell function do_install<br>
| <span style=3D"color:rgb(255,0,0)">mv:=20
&#39;/workspace/vegas-demo/build-imx7/tmp/work/all-poky-linux/os-release/1.=
0-r0/image/etc/os-release&#39;
 and=20
&#39;/workspace/vegas-demo/build-imx7/tmp/work/all-poky-linux/os-release/1.=
0-r0/image/usr/lib/os-release&#39;
 are the same file</span><br>
| WARNING: exit code 1 from a shell command.<br>
| ERROR: Function failed: do_install (log file is located at=20
/workspace/vegas-demo/build-imx7/tmp/work/all-poky-linux/os-release/1.0-r0/=
temp/log.do_install.169)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
 =C2=A0<br>
ERROR: Task=20
(/workspace/vegas-demo/poky/meta/recipes-core/os-release/os-release.bb:do_i=
nstall)
 failed with exit code=20
&#39;1&#39;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0
 =C2=A0<br>
NOTE: Tasks Summary: Attempted 3835 tasks of which 3834 didn&#39;t need to =
be rerun and 1 failed.<br>
NOTE: Writing buildhistory<br>
<br>
</div>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>
<p style=3D"margin-top:0px;margin-bottom:0px"><br>
</p>

<div>commit c539765288bf3bc2c8578e037ce8fc9c2323b745<br>
Author: Joshua Lock &lt;<a href=3D"mailto:joshua.g.lock@intel.com">joshua.g=
.lock@intel.com</a>&gt;<br>
Date:=C2=A0=C2=A0 Tue Sep 4 16:50:00 2018 +0100<br>
<br>
=C2=A0=C2=A0=C2=A0 os-release: fix to install in the expected location<br>
=C2=A0=C2=A0 =C2=A0<br>
=C2=A0=C2=A0=C2=A0 os-release (5) recommends that the os-release file be in=
stalled in<br>
=C2=A0=C2=A0=C2=A0 /usr/lib/os-release and that /etc/os-release be a relati=
ve symlink to it.<br>
=C2=A0=C2=A0 =C2=A0<br>
=C2=A0=C2=A0=C2=A0 (From OE-Core rev: 4feb8614ee25a3d3ceb7f5187120a1256a993=
155)<br>
=C2=A0=C2=A0 =C2=A0<br>
=C2=A0=C2=A0=C2=A0 Signed-off-by: Joshua Lock &lt;<a href=3D"mailto:joshua.=
g.lock@intel.com">joshua.g.lock@intel.com</a>&gt;<br>
=C2=A0=C2=A0=C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.bu=
rton@intel.com">ross.burton@intel.com</a>&gt;<br>
=C2=A0=C2=A0=C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:rich=
ard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
<br>
diff --git a/meta/recipes-core/os-release/<a href=3D"http://os-release.bb">=
os-release.bb</a> b/meta/recipes-core/os-release/<a href=3D"http://os-relea=
se.bb">os-release.bb</a><br>
index f988704756..bf4f815a10 100644<br>
--- a/meta/recipes-core/os-release/<a href=3D"http://os-release.bb">os-rele=
ase.bb</a><br>
+++ b/meta/recipes-core/os-release/<a href=3D"http://os-release.bb">os-rele=
ase.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0inherit allarch<br>
=C2=A0<br>
=C2=A0SUMMARY =3D &quot;Operating system identification&quot;<br>
-DESCRIPTION =3D &quot;The /etc/os-release file contains operating system i=
dentification data.&quot;<br>
+DESCRIPTION =3D &quot;The /usr/lib/os-release file contains operating syst=
em identification data.&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
=C2=A0<br>
@@ -42,6 +42,9 @@ python do_compile () {<br>
=C2=A0do_compile[vardeps] +=3D &quot;${OS_RELEASE_FIELDS}&quot;<br>
=C2=A0<br>
=C2=A0do_install () {<br>
-=C2=A0=C2=A0=C2=A0 install -d ${D}${sysconfdir}<br>
-=C2=A0=C2=A0=C2=A0 install -m 0644 os-release ${D}${sysconfdir}/<br>
+=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir} ${D}${sysconfdir}<br>
+=C2=A0=C2=A0=C2=A0 install -m 0644 os-release ${D}${libdir}/<br>
+=C2=A0=C2=A0=C2=A0 lnr ${D}${libdir}/os-release ${D}${sysconfdir}/os-relea=
se<br>
=C2=A0}<br>
+<br>
+FILES_${PN} +=3D &quot;${libdir}/os-release&quot;</div></div>

--00000000000092ba5905760e17bd--
