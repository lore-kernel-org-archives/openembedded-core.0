Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0E92277EA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 11:05:27 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id m62so30743046itc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 04:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sEgzLrJebcyQVFHtKngjk2Kk6ionOMjQFvqotpbY3Ks=;
	b=JuS6iwa7psuNqNHvheSOAAyZgZeHkMJQOUx8AcGhDn47R3/SDIarLLpx3QtoFgsBMD
	WQf70WfK+0GIcgZRNNr2ptR48hzvHA7m+ybTfJsD6UVGfP20ltGsjZJB/2wopUwOEn3i
	1UNqiPRZSCZL3KY3UhXKV+qiF9rRvoUef7KZBvkOZ7q810gQNFdFpDMdWaneVHx+qVHn
	AJ5UZhBtp+D+AIiY5DRY4+dnApCE7qmrvxoj0TqQvpLP8GF8FQGTNUYEQhIyp16Hqxs6
	ncCTmq7nknXOk5lmUWRlyywPuhqeGadcpIZrG7ERK9+R9VS7GvFbvDugMV2IYSE65C+9
	lnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sEgzLrJebcyQVFHtKngjk2Kk6ionOMjQFvqotpbY3Ks=;
	b=IMFJpFKN7zAkKQTIhoZ7K16vxUpcZ2QyaP4PYGyn6CdI0287G0ur8Ag73VWy32bfDD
	dvrUa72cLTm9F8UimM937JtoCJYlnDAmCaVDVrVrvAKgLeV+4vSIH2lYZXXORoTzrojf
	1lGn+hPd5NjaSZQM2HCur/3HrKPUhoc/KfSaVzt9EFMRxFvPQgjoS48JIPC7j2JUbLj3
	8+gxvD9MEY+ELWSQx6OHqOCzJoGO0iVDeuw/rm1GgI2Ht6o+XEig6y0ftU0zKAmKpWiK
	hOK7n0ImO6OeBTAIjuHjVhJiuCR/G6eiluisMNWPqipUp6/F4y3KJ9NvBUpRzk7EApgF
	+CyA==
X-Gm-Message-State: AKS2vOxPVLOvDeExGqVRdAPthJdJIKFCVMMZF9iTX09zqRmpMuyXoiBf
	eqTwC+q8TxZZ2xWDWPBMArjbqZrP0gM/
X-Received: by 10.36.219.197 with SMTP id c188mr8090639itg.17.1498043128419;
	Wed, 21 Jun 2017 04:05:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.130 with HTTP; Wed, 21 Jun 2017 04:04:58 -0700 (PDT)
In-Reply-To: <20170620135624.15549-2-alexander.kanavin@linux.intel.com>
References: <20170620135624.15549-1-alexander.kanavin@linux.intel.com>
	<20170620135624.15549-2-alexander.kanavin@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 21 Jun 2017 14:04:58 +0300
Message-ID: <CAHiDW_GeiApeT5=U-w3DB1xkC0PiGASBr19v+bx4CVbjNr_COg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 2/2] dnf: update to 2.5.1
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
X-List-Received-Date: Wed, 21 Jun 2017 11:05:28 -0000
Content-Type: multipart/alternative; boundary="94eb2c05f4d6872f01055276586b"

--94eb2c05f4d6872f01055276586b
Content-Type: text/plain; charset="UTF-8"

These sanity test failures look related.

https://autobuilder.yocto.io/builders/nightly-x86-64/builds/333/steps/Running%20Sanity%20Tests/logs/stdio

On 20 June 2017 at 16:56, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Drop 0001-Revert-proper-check-of-releasever-when-using-install.patch
> as the problem has been solved upstream.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  ...er-check-of-releasever-when-using-install.patch | 105
> ---------------------
>  .../dnf/{dnf_git.bb => dnf_2.5.1.bb}               |   4 +-
>  2 files changed, 1 insertion(+), 108 deletions(-)
>  delete mode 100644 meta/recipes-devtools/dnf/dnf/
> 0001-Revert-proper-check-of-releasever-when-using-install.patch
>  rename meta/recipes-devtools/dnf/{dnf_git.bb => dnf_2.5.1.bb} (94%)
>
> diff --git a/meta/recipes-devtools/dnf/dnf/0001-Revert-proper-check-
> of-releasever-when-using-install.patch b/meta/recipes-devtools/dnf/
> dnf/0001-Revert-proper-check-of-releasever-when-using-install.patch
> deleted file mode 100644
> index 879ecfa30d7..00000000000
> --- a/meta/recipes-devtools/dnf/dnf/0001-Revert-proper-check-
> of-releasever-when-using-install.patch
> +++ /dev/null
> @@ -1,105 +0,0 @@
> -From 8cd0503612573c455f34db74cd1c2216ed25b69c Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 12 Apr 2017 15:42:06 +0300
> -Subject: [PATCH] Revert "proper check of releasever, when using
> installroot
> - (RhBug:1417542)"
> -
> -This reverts commit 3ddf684b7c67a2b384aa99dde53d8a43218f2e68, as it's
> causing
> -breakage when installing packages into a pristin rootfs. Upstream has
> been notified:
> -https://bugzilla.redhat.com/show_bug.cgi?id=1441636
> -
> -Upstream-Status: Inappropriate [pending proper fix]
> -Signed-off-by: Alex Kanavin <alex.kanavin@gmail.com>
> ----
> - dnf/rpm/__init__.py | 59 +++++++++++++++++++++++++-----
> -----------------------
> - doc/command_ref.rst |  3 +--
> - 2 files changed, 29 insertions(+), 33 deletions(-)
> -
> -diff --git a/dnf/rpm/__init__.py b/dnf/rpm/__init__.py
> -index 5976acd6..1d50e6a0 100644
> ---- a/dnf/rpm/__init__.py
> -+++ b/dnf/rpm/__init__.py
> -@@ -30,38 +30,35 @@ def detect_releasever(installroot):
> -     # :api
> -     """Calculate the release version for the system."""
> -
> --    # if installroot is empty dir releasever is None,
> --    # that's why releasever is checked from '/'
> --    for root in [installroot, "/"]:
> --        ts = transaction.initReadOnlyTransaction(root=root)
> --        ts.pushVSFlags(~(rpm._RPMVSF_NOSIGNATURES |
> rpm._RPMVSF_NODIGESTS))
> --        for distroverpkg in dnf.const.DISTROVERPKG:
> --            try:
> --                idx = ts.dbMatch('provides', distroverpkg)
> --            except (TypeError, rpm.error) as e:
> --                raise dnf.exceptions.Error('Error: %s' % str(e))
> --            if not len(idx):
> --                continue
> --            try:
> --                hdr = next(idx)
> --            except StopIteration:
> --                msg = 'Error: rpmdb failed to list provides. Try: rpm
> --rebuilddb'
> --                raise dnf.exceptions.Error(msg)
> --            releasever = hdr['version']
> --            try:
> --                off = hdr[rpm.RPMTAG_PROVIDENAME].index(distroverpkg)
> --                flag = hdr[rpm.RPMTAG_PROVIDEFLAGS][off]
> --                ver = hdr[rpm.RPMTAG_PROVIDEVERSION][off]
> --                if flag == rpm.RPMSENSE_EQUAL and ver:
> --                    if hdr['name'] != distroverpkg:
> --                        # override the package version
> --                        releasever = ver
> --            except (ValueError, KeyError, IndexError):
> --                pass
> -+    ts = transaction.initReadOnlyTransaction(root=installroot)
> -+    ts.pushVSFlags(~(rpm._RPMVSF_NOSIGNATURES | rpm._RPMVSF_NODIGESTS))
> -+    for distroverpkg in dnf.const.DISTROVERPKG:
> -+        try:
> -+            idx = ts.dbMatch('provides', distroverpkg)
> -+        except (TypeError, rpm.error) as e:
> -+            raise dnf.exceptions.Error('Error: %s' % str(e))
> -+        if not len(idx):
> -+            continue
> -+        try:
> -+            hdr = next(idx)
> -+        except StopIteration:
> -+            msg = 'Error: rpmdb failed to list provides. Try: rpm
> --rebuilddb'
> -+            raise dnf.exceptions.Error(msg)
> -+        releasever = hdr['version']
> -+        try:
> -+            off = hdr[rpm.RPMTAG_PROVIDENAME].index(distroverpkg)
> -+            flag = hdr[rpm.RPMTAG_PROVIDEFLAGS][off]
> -+            ver = hdr[rpm.RPMTAG_PROVIDEVERSION][off]
> -+            if flag == rpm.RPMSENSE_EQUAL and ver:
> -+                if hdr['name'] != distroverpkg:
> -+                    # override the package version
> -+                    releasever = ver
> -+        except (ValueError, KeyError, IndexError):
> -+            pass
> -
> --            if is_py3bytes(releasever):
> --                releasever = str(releasever, "utf-8")
> --            return releasever
> -+        if is_py3bytes(releasever):
> -+            releasever = str(releasever, "utf-8")
> -+        return releasever
> -     return None
> -
> -
> -diff --git a/doc/command_ref.rst b/doc/command_ref.rst
> -index 77e885ab..3dd451b5 100644
> ---- a/doc/command_ref.rst
> -+++ b/doc/command_ref.rst
> -@@ -205,8 +205,7 @@ Options
> -  Note: You may also want to use the command-line option
> -  ``--releasever=<release>`` when creating the installroot otherwise the
> -  *$releasever* value is taken from the rpmdb within the installroot (and
> thus
> -- it is empty at time of creation and *$releasever* is taken from rpmdb
> using
> -- installroot=/).
> -+ it is empty at time of creation, the transaction will fail).
> -  The new installroot path at time of creation do not contain
> *repository*,
> -  *releasever*, and *dnf.conf* file.
> -
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/dnf/dnf_git.bb
> b/meta/recipes-devtools/dnf/dnf_2.5.1.bb
> similarity index 94%
> rename from meta/recipes-devtools/dnf/dnf_git.bb
> rename to meta/recipes-devtools/dnf/dnf_2.5.1.bb
> index c975900f85e..a07a509b768 100644
> --- a/meta/recipes-devtools/dnf/dnf_git.bb
> +++ b/meta/recipes-devtools/dnf/dnf_2.5.1.bb
> @@ -10,11 +10,9 @@ SRC_URI = "git://github.com/rpm-
> software-management/dnf.git \
>             file://0001-Do-not-prepend-installroot-to-logdir.patch \
>             file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
> \
>             file://0001-Corretly-install-tmpfiles.d-configuration.patch \
> -           file://0001-Revert-proper-check-of-releasever-when-using-install.patch
> \
>             "
>
> -PV = "2.3.0"
> -SRCREV = "242079563b54b4714c889fd4ee32e8dd9960f3b8"
> +SRCREV = "32e6ffdc8902b868cd8f98f9c399c98c9de0c7b8"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
>
>  S = "${WORKDIR}/git"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c05f4d6872f01055276586b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>These sanity test failures look related.</div><div><b=
r></div><a href=3D"https://autobuilder.yocto.io/builders/nightly-x86-64/bui=
lds/333/steps/Running%20Sanity%20Tests/logs/stdio">https://autobuilder.yoct=
o.io/builders/nightly-x86-64/builds/333/steps/Running%20Sanity%20Tests/logs=
/stdio</a><br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On 20 June 2017 at 16:56, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><span class=3D"">Drop 0001-Revert-proper-check-of-<wbr>releasever-when=
-using-install.<wbr>patch<br>
as the problem has been solved upstream.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0...er-check-of-releasever-<wbr>when-using-install.patch | 105 -------=
--------------<br>
</span>=C2=A0.../dnf/{<a href=3D"http://dnf_git.bb" rel=3D"noreferrer" targ=
et=3D"_blank">dnf_git.bb</a> =3D&gt; <a href=3D"http://dnf_2.5.1.bb" rel=3D=
"noreferrer" target=3D"_blank">dnf_2.5.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A02 files changed, 1 insertion(+), 108 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/dnf/dnf/<wbr>0001-Revert-pro=
per-check-of-<wbr>releasever-when-using-install.<wbr>patch<br>
=C2=A0rename meta/recipes-devtools/dnf/{<a href=3D"http://dnf_git.bb" rel=
=3D"noreferrer" target=3D"_blank">dnf<wbr>_git.bb</a> =3D&gt; <a href=3D"ht=
tp://dnf_2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">dnf_2.5.1.bb</a>} (=
94%)<br>
<div><div class=3D"h5"><br>
diff --git a/meta/recipes-devtools/dnf/<wbr>dnf/0001-Revert-proper-check-<w=
br>of-releasever-when-using-<wbr>install.patch b/meta/recipes-devtools/dnf/=
<wbr>dnf/0001-Revert-proper-check-<wbr>of-releasever-when-using-<wbr>instal=
l.patch<br>
deleted file mode 100644<br>
index 879ecfa30d7..00000000000<br>
--- a/meta/recipes-devtools/dnf/<wbr>dnf/0001-Revert-proper-check-<wbr>of-r=
eleasever-when-using-<wbr>install.patch<br>
+++ /dev/null<br>
@@ -1,105 +0,0 @@<br>
-From 8cd0503612573c455f34db74cd1c22<wbr>16ed25b69c Mon Sep 17 00:00:00 200=
1<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
-Date: Wed, 12 Apr 2017 15:42:06 +0300<br>
-Subject: [PATCH] Revert &quot;proper check of releasever, when using insta=
llroot<br>
- (RhBug:1417542)&quot;<br>
-<br>
-This reverts commit 3ddf684b7c67a2b384aa99dde53d8a<wbr>43218f2e68, as it&#=
39;s causing<br>
-breakage when installing packages into a pristin rootfs. Upstream has been=
 notified:<br>
-<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1441636" rel=3D"n=
oreferrer" target=3D"_blank">https://bugzilla.redhat.com/<wbr>show_bug.cgi?=
id=3D1441636</a><br>
-<br>
-Upstream-Status: Inappropriate [pending proper fix]<br>
-Signed-off-by: Alex Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">=
alex.kanavin@gmail.com</a>&gt;<br>
----<br>
- dnf/rpm/__init__.py | 59 +++++++++++++++++++++++++-----<wbr>-------------=
----------<br>
- doc/command_ref.rst |=C2=A0 3 +--<br>
- 2 files changed, 29 insertions(+), 33 deletions(-)<br>
-<br>
-diff --git a/dnf/rpm/__init__.py b/dnf/rpm/__init__.py<br>
-index 5976acd6..1d50e6a0 100644<br>
---- a/dnf/rpm/__init__.py<br>
-+++ b/dnf/rpm/__init__.py<br>
-@@ -30,38 +30,35 @@ def detect_releasever(installroot)<wbr>:<br>
-=C2=A0 =C2=A0 =C2=A0# :api<br>
-=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Calculate the release version for th=
e system.&quot;&quot;&quot;<br>
-<br>
--=C2=A0 =C2=A0 # if installroot is empty dir releasever is None,<br>
--=C2=A0 =C2=A0 # that&#39;s why releasever is checked from &#39;/&#39;<br>
--=C2=A0 =C2=A0 for root in [installroot, &quot;/&quot;]:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 ts =3D transaction.<wbr>initReadOnlyTransacti=
on(root=3D<wbr>root)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.pushVSFlags(~(rpm._RPMVSF_<wbr>NOSIGNATURE=
S | rpm._RPMVSF_NODIGESTS))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 for distroverpkg in dnf.const.DISTROVERPKG:<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 idx =3D ts.dbMatc=
h(&#39;provides&#39;, distroverpkg)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except (TypeError, rpm.error) a=
s e:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise dnf.excepti=
ons.Error(&#39;Error: %s&#39; % str(e))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not len(idx):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hdr =3D next(idx)=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except StopIteration:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &#39;Erro=
r: rpmdb failed to list provides. Try: rpm --rebuilddb&#39;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise dnf.excepti=
ons.Error(msg)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 releasever =3D hdr[&#39;version=
&#39;]<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 off =3D hdr[rpm.R=
PMTAG_PROVIDENAME].<wbr>index(distroverpkg)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flag =3D hdr[rpm.=
RPMTAG_PROVIDEFLAGS][<wbr>off]<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ver =3D hdr[rpm.R=
PMTAG_PROVIDEVERSION]<wbr>[off]<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if flag =3D=3D rp=
m.RPMSENSE_EQUAL and ver:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
hdr[&#39;name&#39;] !=3D distroverpkg:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # override the package version<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 releasever =3D ver<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except (ValueError, KeyError, I=
ndexError):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
-+=C2=A0 =C2=A0 ts =3D transaction.<wbr>initReadOnlyTransaction(root=3D<wbr=
>installroot)<br>
-+=C2=A0 =C2=A0 ts.pushVSFlags(~(rpm._RPMVSF_<wbr>NOSIGNATURES | rpm._RPMVS=
F_NODIGESTS))<br>
-+=C2=A0 =C2=A0 for distroverpkg in dnf.const.DISTROVERPKG:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 idx =3D ts.dbMatch(&#39;provide=
s&#39;, distroverpkg)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except (TypeError, rpm.error) as e:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise dnf.exceptions.Error(&#39=
;Error: %s&#39; % str(e))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not len(idx):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hdr =3D next(idx)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except StopIteration:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &#39;Error: rpmdb faile=
d to list provides. Try: rpm --rebuilddb&#39;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise dnf.exceptions.Error(msg)=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 releasever =3D hdr[&#39;version&#39;]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 off =3D hdr[rpm.RPMTAG_PROVIDEN=
AME].<wbr>index(distroverpkg)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flag =3D hdr[rpm.RPMTAG_PROVIDE=
FLAGS][<wbr>off]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ver =3D hdr[rpm.RPMTAG_PROVIDEV=
ERSION]<wbr>[off]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if flag =3D=3D rpm.RPMSENSE_EQU=
AL and ver:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if hdr[&#39;name&=
#39;] !=3D distroverpkg:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # o=
verride the package version<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rel=
easever =3D ver<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except (ValueError, KeyError, IndexError):<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if is_py3bytes(releasever):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 releasever =3D st=
r(releasever, &quot;utf-8&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return releasever<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if is_py3bytes(releasever):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 releasever =3D str(releasever, =
&quot;utf-8&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return releasever<br>
-=C2=A0 =C2=A0 =C2=A0return None<br>
-<br>
-<br>
-diff --git a/doc/command_ref.rst b/doc/command_ref.rst<br>
-index 77e885ab..3dd451b5 100644<br>
---- a/doc/command_ref.rst<br>
-+++ b/doc/command_ref.rst<br>
-@@ -205,8 +205,7 @@ Options<br>
-=C2=A0 Note: You may also want to use the command-line option<br>
-=C2=A0 ``--releasever=3D&lt;release&gt;`` when creating the installroot ot=
herwise the<br>
-=C2=A0 *$releasever* value is taken from the rpmdb within the installroot =
(and thus<br>
-- it is empty at time of creation and *$releasever* is taken from rpmdb us=
ing<br>
-- installroot=3D/).<br>
-+ it is empty at time of creation, the transaction will fail).<br>
-=C2=A0 The new installroot path at time of creation do not contain *reposi=
tory*,<br>
-=C2=A0 *releasever*, and *dnf.conf* file.<br>
-<br>
---<br>
-2.11.0<br>
-<br>
</div></div>diff --git a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">dn<wbr>f_git.bb</a> b/meta/recip=
es-devtools/dnf/<a href=3D"http://dnf_2.5.1.bb" rel=3D"noreferrer" target=
=3D"_blank">dn<wbr>f_2.5.1.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-devtools/dnf/<a href=3D"http://dnf_git.bb" rel=3D"=
noreferrer" target=3D"_blank">dnf_<wbr>git.bb</a><br>
rename to meta/recipes-devtools/dnf/<a href=3D"http://dnf_2.5.1.bb" rel=3D"=
noreferrer" target=3D"_blank">dnf_<wbr>2.5.1.bb</a><br>
index c975900f85e..a07a509b768 100644<br>
--- a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">dn<wbr>f_git.bb</a><br>
+++ b/meta/recipes-devtools/dnf/<a href=3D"http://dnf_2.5.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">dn<wbr>f_2.5.1.bb</a><br>
@@ -10,11 +10,9 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm=
-software-management/dnf.git" rel=3D"noreferrer" target=3D"_blank">github.c=
om/rpm-<wbr>software-management/dnf.git</a> \<br>
<span class=3D"im HOEnZb">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://=
0001-Do-not-prepend-<wbr>installroot-to-logdir.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-hardcode-<wbr>=
etc-and-systemd-unit-<wbr>directories.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Corretly-install-<wbr=
>tmpfiles.d-configuration.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Revert-proper-<wbr>ch=
eck-of-releasever-when-<wbr>using-install.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-PV =3D &quot;2.3.0&quot;<br>
-SRCREV =3D &quot;<wbr>242079563b54b4714c889fd4ee32e8<wbr>dd9960f3b8&quot;<=
br>
</span><div class=3D"HOEnZb"><div class=3D"h5">+SRCREV =3D &quot;<wbr>32e6f=
fdc8902b868cd8f98f9c399c9<wbr>8c9de0c7b8&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)&quot=
;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c05f4d6872f01055276586b--
