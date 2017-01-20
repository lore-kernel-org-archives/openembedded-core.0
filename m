Return-Path: <ross.burton@intel.com>
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
	[209.85.161.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA8A73196
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 11:48:36 +0000 (UTC)
Received: by mail-yw0-f174.google.com with SMTP id v200so82782826ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 03:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NB4lHP+nklh2v8Q2Oojs8w3A3QygEzlSu6Kdb3dmYsw=;
	b=R3QsQvFf3g2YL+l+VeupIwJsHS99FwV1RSqOXGuEwOgkrHc6FQ+uDxfISGdomgJmxM
	bwwivoNkUs1BE+HK/Rvc/tCeApdnEwTh4B/COfpO33iVOs/wqFhAG46IIVoF+wgKOMhx
	oVakVAABlh9ftRJ3ZxhCjMI+OVlppQlc0jap/evvf6SP0H7TO7519jQL4KVc4KO9IYg4
	IKYvf+vKFGJLV/VL9LBRokXQLmxIw51ibOdXmXQT86bVgVfo74EZf+ADFFtnYggBSO/Y
	UhEw4ZzGXlpGnsElzdZmKw5DZrXktNNevBhjQTtYGqn346QjUNtftrWqkE9dwNCzxmV3
	FrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NB4lHP+nklh2v8Q2Oojs8w3A3QygEzlSu6Kdb3dmYsw=;
	b=aHdQMLF4+1o1CJT2fioBgNzLz74QDeOwxp0yAk2bVCSyOUU/KzEVBdibUd8xQJgQTG
	oFYxqOorZ9WCu/pGhrLmoIgIgSda5lAtRhUq8IncPDWXNRo6rtX/wFihoOXTpXbchSi+
	qLi+zluQ5mCnbOVmEP/qPRN42FWzDN1E/RKMQWSbXlzz9FZB303C7AZaW62bJU8Fvx8H
	VCwqi9avHaq2mciDloePkPLyv2x88pdLJkuJoYRs9r9PpbNTZssy9ojxWPoNrbEEA89J
	xcvMzPxRuAXjgUlO8FNpt95c2k4uov4IKjj518QeO1eQZQTYDg+IKLClrjFfYjxg5w7d
	VhiA==
X-Gm-Message-State: AIkVDXKPP9sSKJaa7b5mGMuzgZNvSNGCEsvzQnzQYz16que6r/cf5yc40mxRa0XBF8EGzS0xeVcHlCuuS7X+Nwcc
X-Received: by 10.55.47.4 with SMTP id v4mr11994004qkh.77.1484912916700; Fri,
	20 Jan 2017 03:48:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 20 Jan 2017 03:48:16 -0800 (PST)
In-Reply-To: <be9e6961aeb991fc0e0acc1118aa01cefe945593.1484866303.git.randy.e.witt@linux.intel.com>
References: <cover.1484866303.git.randy.e.witt@linux.intel.com>
	<be9e6961aeb991fc0e0acc1118aa01cefe945593.1484866303.git.randy.e.witt@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Jan 2017 11:48:16 +0000
Message-ID: <CAJTo0LYz7AdJQWZApSA+YXZC3Sn3UVfjuVRdugpBqd+x6kDnMw@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/3] selftest/containerimage.py: Add container IMAGE_FSTYPES test
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
X-List-Received-Date: Fri, 20 Jan 2017 11:48:36 -0000
Content-Type: multipart/alternative; boundary=001a114f4108ec4e4e0546853a25

--001a114f4108ec4e4e0546853a25
Content-Type: text/plain; charset=UTF-8

The test fetches bitbake variables and then changes the configuration, so
it fails if the user's MACHINE isn't qemux86.  I've changed this locally
and now its failing differently:

First extra element 18:
./etc/systemd/system/sysinit.target.wants/opkg-configure.service

Looks like you want to lock the configuration to sysvinit.

Ross

On 19 January 2017 at 22:52, Randy Witt <randy.e.witt@linux.intel.com>
wrote:

> This test checks to make sure only the files expected exist in a
> container image. Currently only ROOTFS_BOOTSTRAP_INSTALL, gets added to
> all images without the user specifying it.
>
> But this test should help if a developer in the future ever silently
> adds more than just ROOTFS_BOOTSTRAP_INSTALL, and that the developer can
> make sure it also gets removed from a container image.
>
> [YOCTO #9502]
>
> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> ---
>  .../container-image/container-image-testpkg.bb     |  8 +++
>  .../container-image/container-test-image.bb        |  8 +++
>  meta/lib/oeqa/selftest/containerimage.py           | 82
> ++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 meta-selftest/recipes-test/container-image/container-
> image-testpkg.bb
>  create mode 100644 meta-selftest/recipes-test/container-image/container-
> test-image.bb
>  create mode 100644 meta/lib/oeqa/selftest/containerimage.py
>
> diff --git a/meta-selftest/recipes-test/container-image/container-
> image-testpkg.bb b/meta-selftest/recipes-test/container-image/container-
> image-testpkg.bb
> new file mode 100644
> index 0000000..f8dd229
> --- /dev/null
> +++ b/meta-selftest/recipes-test/container-image/container-
> image-testpkg.bb
> @@ -0,0 +1,8 @@
> +LICENSE = "MIT"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +do_install_append() {
> +    install -d ${D}${bindir}
> +    touch ${D}${bindir}/theapp
> +}
> diff --git a/meta-selftest/recipes-test/container-image/container-
> test-image.bb b/meta-selftest/recipes-test/container-image/container-
> test-image.bb
> new file mode 100644
> index 0000000..d5f939c
> --- /dev/null
> +++ b/meta-selftest/recipes-test/container-image/container-test-image.bb
> @@ -0,0 +1,8 @@
> +IMAGE_INSTALL += "container-image-testpkg"
> +
> +LICENSE = "MIT"
> +
> +IMAGE_FSTYPES = "container"
> +IMAGE_LINGUAS = ""
> +
> +inherit core-image
> diff --git a/meta/lib/oeqa/selftest/containerimage.py
> b/meta/lib/oeqa/selftest/containerimage.py
> new file mode 100644
> index 0000000..6a85222
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/containerimage.py
> @@ -0,0 +1,82 @@
> +import os
> +
> +from oeqa.selftest.base import oeSelfTest
> +from oeqa.utils.commands import bitbake, get_bb_vars, runCmd
> +
> +# This test builds an image with using the "container" IMAGE_FSTYPE, and
> +# ensures that then files in the image are only the ones expected.
> +#
> +# The only package added to the image is container_image_testpkg, which
> +# contains one file. However, due to some other things not cleaning up
> during
> +# rootfs creation, there is some cruft. Ideally bugs will be filed and the
> +# cruft removed, but for now we whitelist some known set.
> +#
> +# Also for performance reasons we're only checking the cruft when using
> ipk.
> +# When using deb, and rpm it is a bit different and we could test all
> +# of them, but this test is more to catch if other packages get added by
> +# default other than what is in ROOTFS_BOOTSTRAP_INSTALL.
> +#
> +class ContainerImageTests(oeSelfTest):
> +
> +    # Verify that when specifying a IMAGE_TYPEDEP_ of the form "foo.bar"
> that
> +    # the conversion type bar gets added as a dep as well
> +    def test_expected_files(self):
> +
> +        def get_each_path_part(path):
> +            if path:
> +                part = [ '.' + path + '/' ]
> +                result = get_each_path_part(path.rsplit('/', 1)[0])
> +                if result:
> +                    return part + result
> +                else:
> +                    return part
> +            else:
> +                return None
> +
> +        bbvars = get_bb_vars(['bindir', 'sysconfdir', 'localstatedir',
> +                              'DEPLOY_DIR_IMAGE'])
> +        expected_files = [
> +                    './',
> +                    '.{bindir}/theapp',
> +                    '.{sysconfdir}/default/',
> +                    '.{sysconfdir}/default/postinst',
> +                    '.{sysconfdir}/ld.so.cache',
> +                    '.{sysconfdir}/timestamp',
> +                    '.{sysconfdir}/version',
> +                    './run/',
> +                    '.{localstatedir}/cache/',
> +                    '.{localstatedir}/cache/ldconfig/',
> +                    '.{localstatedir}/cache/ldconfig/aux-cache',
> +                    '.{localstatedir}/cache/opkg/',
> +                    '.{localstatedir}/lib/',
> +                    '.{localstatedir}/lib/opkg/'
> +                ]
> +
> +        expected_files = [ x.format(bindir=bbvars['bindir'],
> +                                    sysconfdir=bbvars['sysconfdir'],
> +                                    localstatedir=bbvars['
> localstatedir'])
> +                                    for x in expected_files ]
> +
> +        # Since tar lists all directories individually, make sure each
> element
> +        # from bindir, sysconfdir, etc is added
> +        expected_files += get_each_path_part(bbvars['bindir'])
> +        expected_files += get_each_path_part(bbvars['sysconfdir'])
> +        expected_files += get_each_path_part(bbvars['localstatedir'])
> +
> +        expected_files = sorted(expected_files)
> +
> +
> +        self.write_config('PREFERRED_PROVIDER_virtual/kernel =
> "linux-dummy"')
> +        self.append_config('MACHINE = "qemux86"')
> +        self.append_config('IMAGE_FSTYPES = "container"')
> +        self.append_config('PACKAGE_CLASSES = "package_ipk"')
> +
> +        # Build the image of course
> +        bitbake('container-test-image')
> +
> +        image = os.path.join(bbvars['DEPLOY_DIR_IMAGE'],
> +                             'container-test-image-qemux86.tar.bz2')
> +
> +        # Ensure the files in the image are what we expect
> +        result = runCmd("tar tf {} | sort".format(image), shell=True)
> +        self.assertEqual(result.output.split('\n'), expected_files)
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114f4108ec4e4e0546853a25
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The test fetches bitbake variables and then changes the co=
nfiguration, so it fails if the user&#39;s MACHINE isn&#39;t qemux86.=C2=A0=
 I&#39;ve changed this locally and now its failing differently:<div><br></d=
iv><div><div>First extra element 18:</div><div>./etc/systemd/system/sysinit=
.target.wants/opkg-configure.service</div></div><div><br></div><div>Looks l=
ike you want to lock the configuration to sysvinit.</div><div><br></div><di=
v>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On 19 January 2017 at 22:52, Randy Witt <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:randy.e.witt@linux.intel.com" target=3D"_blank">randy.e.witt@linux.in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=
=3D"HOEnZb"><div class=3D"h5">This test checks to make sure only the files =
expected exist in a<br>
container image. Currently only ROOTFS_BOOTSTRAP_INSTALL, gets added to<br>
all images without the user specifying it.<br>
<br>
But this test should help if a developer in the future ever silently<br>
adds more than just ROOTFS_BOOTSTRAP_INSTALL, and that the developer can<br=
>
make sure it also gets removed from a container image.<br>
<br>
[YOCTO #9502]<br>
<br>
Signed-off-by: Randy Witt &lt;<a href=3D"mailto:randy.e.witt@linux.intel.co=
m">randy.e.witt@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0.../container-image/<a href=3D"http://container-image-testpkg.bb" rel=
=3D"noreferrer" target=3D"_blank">container-<wbr>image-testpkg.bb</a>=C2=A0=
 =C2=A0 =C2=A0|=C2=A0 8 +++<br>
=C2=A0.../container-image/<a href=3D"http://container-test-image.bb" rel=3D=
"noreferrer" target=3D"_blank">container-<wbr>test-image.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++<br>
=C2=A0meta/lib/oeqa/selftest/<wbr>containerimage.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 82 ++++++++++++++++++++++<br>
=C2=A03 files changed, 98 insertions(+)<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/<wbr>container-image/<a=
 href=3D"http://container-image-testpkg.bb" rel=3D"noreferrer" target=3D"_b=
lank">container-<wbr>image-testpkg.bb</a><br>
=C2=A0create mode 100644 meta-selftest/recipes-test/<wbr>container-image/<a=
 href=3D"http://container-test-image.bb" rel=3D"noreferrer" target=3D"_blan=
k">container-<wbr>test-image.bb</a><br>
=C2=A0create mode 100644 meta/lib/oeqa/selftest/<wbr>containerimage.py<br>
<br>
diff --git a/meta-selftest/recipes-test/<wbr>container-image/<a href=3D"htt=
p://container-image-testpkg.bb" rel=3D"noreferrer" target=3D"_blank">contai=
ner-<wbr>image-testpkg.bb</a> b/meta-selftest/recipes-test/<wbr>container-i=
mage/<a href=3D"http://container-image-testpkg.bb" rel=3D"noreferrer" targe=
t=3D"_blank">container-<wbr>image-testpkg.bb</a><br>
new file mode 100644<br>
index 0000000..f8dd229<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-test/<wbr>container-image/<a href=3D"http://con=
tainer-image-testpkg.bb" rel=3D"noreferrer" target=3D"_blank">container-<wb=
r>image-testpkg.bb</a><br>
@@ -0,0 +1,8 @@<br>
+LICENSE =3D &quot;MIT&quot;<br>
+<br>
+INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
+<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
+=C2=A0 =C2=A0 touch ${D}${bindir}/theapp<br>
+}<br>
diff --git a/meta-selftest/recipes-test/<wbr>container-image/<a href=3D"htt=
p://container-test-image.bb" rel=3D"noreferrer" target=3D"_blank">container=
-<wbr>test-image.bb</a> b/meta-selftest/recipes-test/<wbr>container-image/<=
a href=3D"http://container-test-image.bb" rel=3D"noreferrer" target=3D"_bla=
nk">container-<wbr>test-image.bb</a><br>
new file mode 100644<br>
index 0000000..d5f939c<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-test/<wbr>container-image/<a href=3D"http://con=
tainer-test-image.bb" rel=3D"noreferrer" target=3D"_blank">container-<wbr>t=
est-image.bb</a><br>
@@ -0,0 +1,8 @@<br>
+IMAGE_INSTALL +=3D &quot;container-image-testpkg&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+<br>
+IMAGE_FSTYPES =3D &quot;container&quot;<br>
+IMAGE_LINGUAS =3D &quot;&quot;<br>
+<br>
+inherit core-image<br>
diff --git a/meta/lib/oeqa/selftest/<wbr>containerimage.py b/meta/lib/oeqa/=
selftest/<wbr>containerimage.py<br>
new file mode 100644<br>
index 0000000..6a85222<br>
--- /dev/null<br>
+++ b/meta/lib/oeqa/selftest/<wbr>containerimage.py<br>
@@ -0,0 +1,82 @@<br>
+import os<br>
+<br>
+from oeqa.selftest.base import oeSelfTest<br>
+from oeqa.utils.commands import bitbake, get_bb_vars, runCmd<br>
+<br>
+# This test builds an image with using the &quot;container&quot; IMAGE_FST=
YPE, and<br>
+# ensures that then files in the image are only the ones expected.<br>
+#<br>
+# The only package added to the image is container_image_testpkg, which<br=
>
+# contains one file. However, due to some other things not cleaning up dur=
ing<br>
+# rootfs creation, there is some cruft. Ideally bugs will be filed and the=
<br>
+# cruft removed, but for now we whitelist some known set.<br>
+#<br>
+# Also for performance reasons we&#39;re only checking the cruft when usin=
g ipk.<br>
+# When using deb, and rpm it is a bit different and we could test all<br>
+# of them, but this test is more to catch if other packages get added by<b=
r>
+# default other than what is in ROOTFS_BOOTSTRAP_INSTALL.<br>
+#<br>
+class ContainerImageTests(<wbr>oeSelfTest):<br>
+<br>
+=C2=A0 =C2=A0 # Verify that when specifying a IMAGE_TYPEDEP_ of the form &=
quot;foo.bar&quot; that<br>
+=C2=A0 =C2=A0 # the conversion type bar gets added as a dep as well<br>
+=C2=A0 =C2=A0 def test_expected_files(self):<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def get_each_path_part(path):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if path:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 part =3D [ &#39;.&=
#39; + path + &#39;/&#39; ]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D get_eac=
h_path_part(path.<wbr>rsplit(&#39;/&#39;, 1)[0])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if result:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn part + result<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn part<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbvars =3D get_bb_vars([&#39;bindir&#39;, &#39=
;sysconfdir&#39;, &#39;localstatedir&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;DEPLOY_DIR_IMAGE&#39;])<br>
</div></div><span class=3D"">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_files =
=3D [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./&#39;,<br>
</span><span class=3D"">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;.{bindir}/theapp&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;.{sysconfdir}/default/&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;.{sysconfdir}/default/<wbr>postinst&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;.{sysconfdir}/ld.so.cache&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;.{sysconfdir}/timestamp&#39;,<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;.{sysconfdir}/version&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./run/&#39;,<br>
<div class=3D"HOEnZb"><div class=3D"h5">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;.{localstatedir}/cache/&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;.{localstatedir}/cache/<wbr>ldconfig/&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;.{localstatedir}/cache/<wbr>ldconfig/aux-cache&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;.{localstatedir}/cache/opkg/&#39;<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;.{localstatedir}/lib/&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;.{localstatedir}/lib/opkg/&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_files =3D [ x.format(bindir=3Dbbvars[=
&#39;<wbr>bindir&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysconfdir=3Dbbvars[&#=
39;sysconfdir&#39;<wbr>],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localstatedir=3Dbbvars=
[&#39;<wbr>localstatedir&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for x in expected_file=
s ]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Since tar lists all directories individually=
, make sure each element<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # from bindir, sysconfdir, etc is added<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_files +=3D get_each_path_part(bbvars[=
&#39;<wbr>bindir&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_files +=3D get_each_path_part(bbvars[=
&#39;<wbr>sysconfdir&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_files +=3D get_each_path_part(bbvars[=
&#39;<wbr>localstatedir&#39;])<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_files =3D sorted(expected_files)<br>
+<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&#39;PREFERRED_<wbr>PROVIDER=
_virtual/kernel =3D &quot;linux-dummy&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.append_config(&#39;MACHINE =3D &quot;qemu=
x86&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.append_config(&#39;IMAGE_<wbr>FSTYPES =3D=
 &quot;container&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.append_config(&#39;PACKAGE_<wbr>CLASSES =
=3D &quot;package_ipk&quot;&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Build the image of course<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;container-test-image&#39;<wbr>)<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image =3D os.path.join(bbvars[&#39;DEPLOY_<wbr=
>DIR_IMAGE&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;container-test-image-qemux86.<wbr>tar.b=
z2&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ensure the files in the image are what we ex=
pect<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&quot;tar tf {} | sort&quot;=
.format(image), shell=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(result.<wbr>output.split(&#39=
;\n&#39;), expected_files)<br>
--<br>
2.9.3<br>
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

--001a114f4108ec4e4e0546853a25--
