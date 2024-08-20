Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71613C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 21:25:09 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.5975.1724189101276839555
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 14:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L6Pfu34M;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3db1eb76702so4220153b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 14:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724189100; x=1724793900; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uQyZqQSSw3y6Z198LaOVXBJUdw58p0HD3BoZmPmhewk=;
        b=L6Pfu34MEmroa8dVymyFdm/2Y5nBVnGmiQxod9zAxka6md5cgeGs2cQgZol4Ctj8mI
         Cvx1GNp2Pme4uwyAyNG94jsTvieF3Uwn+bPoFinmfnY+op/nPiFovgsVU0tiDqr5Uhun
         m7+f4762zIWzTRkYM4zqQ2Jf1fNCwVXuFDlWRHY6BBDKywtHnCwDSNRXT13AsD/sTeAr
         0ZTPy3E1EYXdDwMvR1MmHR21I+Iwi8ipSect27fD8hP7Wbi7NOhvT36LyjTSAGI73lrQ
         a02rquVnbX9zV38DHn+saIr9ofcTxMZbDgdlEmP71oUbTEqNcEPDUMXua6LFjj5QmCfr
         m5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724189100; x=1724793900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQyZqQSSw3y6Z198LaOVXBJUdw58p0HD3BoZmPmhewk=;
        b=FrmN7kJerNF2j9+g4w5DRtQ9I8O5KbMZY4xA/7MKAObepF5w27TQQpz/KRkEZolLLQ
         m7KCCTMU6s7WxuZd+QC60mtB5dLy+E7A+R10erfdP4gc0k+8pSuXzgULD98raKXxw3Su
         u2hr6yDOakXouAftH3TqJIMlBVC9+x7x8eiMZ/ZTndHFSSs5EKveuOhRGXQD1R7PyFR9
         Rf0RTyzm3tBLxVWkQnRlD2+kuNhz1tL1/h9R4oJ0VEgN8zg4twO5k1bwE3VvZSqANypD
         hZQtQv1ymZNPogIxusWaE17eFfdnf4HAuTQDrCTahAtOQxSByWbuq4NcgrCS0z5oRJZL
         xxug==
X-Gm-Message-State: AOJu0YypDHn/rfstI50rIf56zL+diLqZaHyp70EZ+/Km8mfJz7IMAHly
	HefW1cNf4vElBfQlURfIYgQcxfVQA51VfqSUq7PxvVCrE3ETJDL0zPJH+YhdKtG/am+6bM+tZkW
	+PgasPPAXsMnswUObNdCVLC89x2Z0kA==
X-Google-Smtp-Source: AGHT+IGjFcroJ6pqLUIgJW5llz9c4WD/z/4sKpWhaB7593Jvdm6zzdJYczR0y/P+lQNKVal4HcLQPGwhUIE9yg4wkRE=
X-Received: by 2002:a05:6808:1507:b0:3da:b3b3:17f with SMTP id
 5614622812f47-3de1950e2fcmr740841b6e.25.1724189100459; Tue, 20 Aug 2024
 14:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240820203533.4166641-1-pkj@axis.com> <20240820203533.4166641-2-pkj@axis.com>
In-Reply-To: <20240820203533.4166641-2-pkj@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Aug 2024 14:24:48 -0700
Message-ID: <CAMKF1sreJ4c=OoqGgc68VFdJsWOypgf+z9wDccfMF2XO7=HH6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/selftest/bbclasses: Add tests for
 systemd and update-rc.d interaction
To: peter.kjellerstedt@axis.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dbcf810620240e8d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 21:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203570

--000000000000dbcf810620240e8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 1:35=E2=80=AFPM Peter Kjellerstedt via
lists.openembedded.org <peter.kjellerstedt=3Daxis.com@lists.openembedded.or=
g>
wrote:

> These tests verify that the correct files are left behind when systemd
> is inherited and depending on whether the systemd and/or sysvinit distro
> features are enabled.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  .../bbclasses/systemd-and-sysvinit.bb         |  15 +++
>  .../recipes-test/bbclasses/systemd-only.bb    |  10 ++
>  meta/lib/oeqa/selftest/cases/bbclasses.py     | 106 ++++++++++++++++++
>  3 files changed, 131 insertions(+)
>  create mode 100644 meta-selftest/recipes-test/bbclasses/
> systemd-and-sysvinit.bb
>  create mode 100644 meta-selftest/recipes-test/bbclasses/systemd-only.bb
>  create mode 100644 meta/lib/oeqa/selftest/cases/bbclasses.py
>
> diff --git a/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
> b/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
> new file mode 100644
> index 0000000000..b820a10528
> --- /dev/null
> +++ b/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
> @@ -0,0 +1,15 @@
> +LICENSE =3D "CLOSED"
> +
> +inherit allarch systemd update-rc.d
> +
> +do_install() {
> +       install -d ${D}${systemd_system_unitdir}
> +       touch ${D}${systemd_system_unitdir}/${BPN}.service
> +
> +       install -d ${D}${INIT_D_DIR}
> +       touch ${D}${INIT_D_DIR}/${BPN}
> +}
> +
> +INITSCRIPT_NAME =3D "${BPN}"
> +
> +SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
> diff --git a/meta-selftest/recipes-test/bbclasses/systemd-only.bb
> b/meta-selftest/recipes-test/bbclasses/systemd-only.bb
> new file mode 100644
> index 0000000000..3a28713cb5
> --- /dev/null
> +++ b/meta-selftest/recipes-test/bbclasses/systemd-only.bb
> @@ -0,0 +1,10 @@
> +LICENSE =3D "CLOSED"
> +


License is not conducive to project here so it has to change to something
open


> +inherit allarch systemd
> +
> +do_install() {
> +       install -d ${D}${systemd_system_unitdir}
> +       touch ${D}${systemd_system_unitdir}/${BPN}.service
> +}
> +
> +SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
> diff --git a/meta/lib/oeqa/selftest/cases/bbclasses.py
> b/meta/lib/oeqa/selftest/cases/bbclasses.py
> new file mode 100644
> index 0000000000..10545ebe65
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/bbclasses.py
> @@ -0,0 +1,106 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import get_bb_vars, bitbake
> +
> +class Systemd(OESelftestTestCase):
> +    """
> +    Tests related to the systemd bbclass.
> +    """
> +
> +    def getVars(self, recipe):
> +        self.bb_vars =3D get_bb_vars(
> +            [
> +                'BPN',
> +                'D',
> +                'INIT_D_DIR',
> +                'prefix',
> +                'systemd_system_unitdir',
> +                'sysconfdir',
> +            ],
> +            recipe,
> +        )
> +
> +    def fileExists(self, filename):
> +        self.assertExists(filename.format(**self.bb_vars))
> +
> +    def fileNotExists(self, filename):
> +        self.assertNotExists(filename.format(**self.bb_vars))
> +
> +    def test_systemd_in_distro(self):
> +        """
> +        Summary:    Verify that no sysvinit files are installed when the
> +                    systemd distro feature is enabled, but sysvinit is
> not.
> +        Expected:   Systemd service file exists, but /etc does not.
> +        Product:    OE-Core
> +        Author:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +        """
> +
> +        self.write_config("""
> +DISTRO_FEATURES:append =3D " systemd usrmerge"
> +DISTRO_FEATURES:remove =3D "sysvinit"
> +VIRTUAL-RUNTIME_init_manager =3D "systemd"
> +""")
> +        bitbake("systemd-only systemd-and-sysvinit -c install")
> +
> +        self.getVars("systemd-only")
> +        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
> +
> +        self.getVars("systemd-and-sysvinit")
> +        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
> +        self.fileNotExists("{D}{sysconfdir}")
> +
> +    def test_systemd_and_sysvinit_in_distro(self):
> +        """
> +        Summary:    Verify that both systemd and sysvinit files are
> installed
> +                    when both the systemd and sysvinit distro features a=
re
> +                    enabled.
> +        Expected:   Systemd service file and sysvinit initscript exist.
> +        Product:    OE-Core
> +        Author:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +        """
> +
> +        self.write_config("""
> +DISTRO_FEATURES:append =3D " systemd sysvinit usrmerge"
> +VIRTUAL-RUNTIME_init_manager =3D "systemd"
> +""")
> +        bitbake("systemd-only systemd-and-sysvinit -c install")
> +
> +        self.getVars("systemd-only")
> +        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
> +
> +        self.getVars("systemd-and-sysvinit")
> +        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
> +        self.fileExists("{D}{INIT_D_DIR}/{BPN}")
> +
> +    def test_sysvinit_in_distro(self):
> +        """
> +        Summary:    Verify that no systemd service files are installed
> when the
> +                    sysvinit distro feature is enabled, but systemd is
> not.
> +        Expected:   The systemd  service file does not exist, nor does
> /usr.
> +                    The sysvinit initscript exists.
> +        Product:    OE-Core
> +        Author:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +        """
> +
> +        self.write_config("""
> +DISTRO_FEATURES:remove =3D "systemd"
> +DISTRO_FEATURES:append =3D " sysvinit usrmerge"
> +VIRTUAL-RUNTIME_init_manager =3D "sysvinit"
> +""")
> +        bitbake("systemd-only systemd-and-sysvinit -c install")
> +
> +        self.getVars("systemd-only")
> +        self.fileNotExists("{D}{systemd_system_unitdir}/{BPN}.service")
> +        self.fileNotExists("{D}{prefix}")
> +        self.fileNotExists("{D}{sysconfdir}")
> +        self.fileExists("{D}")
> +
> +        self.getVars("systemd-and-sysvinit")
> +        self.fileNotExists("{D}{systemd_system_unitdir}/{BPN}.service")
> +        self.fileNotExists("{D}{prefix}")
> +        self.fileExists("{D}{INIT_D_DIR}/{BPN}")
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203568):
> https://lists.openembedded.org/g/openembedded-core/message/203568
> Mute This Topic: https://lists.openembedded.org/mt/108008174/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000dbcf810620240e8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Aug 20, 2024 at 1:35=E2=80=AFPM Peter Kjellerstedt =
via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &l=
t;peter.kjellerstedt=3D<a href=3D"mailto:axis.com@lists.openembedded.org">a=
xis.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">These tests verify that the correct files are left behind when s=
ystemd<br>
is inherited and depending on whether the systemd and/or sysvinit distro<br=
>
features are enabled.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
=C2=A0.../bbclasses/<a href=3D"http://systemd-and-sysvinit.bb" rel=3D"noref=
errer" target=3D"_blank">systemd-and-sysvinit.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 15 +++<br>
=C2=A0.../recipes-test/bbclasses/<a href=3D"http://systemd-only.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd-only.bb</a>=C2=A0 =C2=A0 |=C2=A0 10 +=
+<br>
=C2=A0meta/lib/oeqa/selftest/cases/bbclasses.py=C2=A0 =C2=A0 =C2=A0| 106 ++=
++++++++++++++++<br>
=C2=A03 files changed, 131 insertions(+)<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/bbclasses/<a href=3D"ht=
tp://systemd-and-sysvinit.bb" rel=3D"noreferrer" target=3D"_blank">systemd-=
and-sysvinit.bb</a><br>
=C2=A0create mode 100644 meta-selftest/recipes-test/bbclasses/<a href=3D"ht=
tp://systemd-only.bb" rel=3D"noreferrer" target=3D"_blank">systemd-only.bb<=
/a><br>
=C2=A0create mode 100644 meta/lib/oeqa/selftest/cases/bbclasses.py<br>
<br>
diff --git a/meta-selftest/recipes-test/bbclasses/<a href=3D"http://systemd=
-and-sysvinit.bb" rel=3D"noreferrer" target=3D"_blank">systemd-and-sysvinit=
.bb</a> b/meta-selftest/recipes-test/bbclasses/<a href=3D"http://systemd-an=
d-sysvinit.bb" rel=3D"noreferrer" target=3D"_blank">systemd-and-sysvinit.bb=
</a><br>
new file mode 100644<br>
index 0000000000..b820a10528<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-test/bbclasses/<a href=3D"http://systemd-and-sy=
svinit.bb" rel=3D"noreferrer" target=3D"_blank">systemd-and-sysvinit.bb</a>=
<br>
@@ -0,0 +1,15 @@<br>
+LICENSE =3D &quot;CLOSED&quot;<br>
+<br>
+inherit allarch systemd update-rc.d<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${systemd_system_unitdir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0touch ${D}${systemd_system_unitdir}/${BPN}.serv=
ice<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${INIT_D_DIR}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0touch ${D}${INIT_D_DIR}/${BPN}<br>
+}<br>
+<br>
+INITSCRIPT_NAME =3D &quot;${BPN}&quot;<br>
+<br>
+SYSTEMD_SERVICE:${PN} =3D &quot;${BPN}.service&quot;<br>
diff --git a/meta-selftest/recipes-test/bbclasses/<a href=3D"http://systemd=
-only.bb" rel=3D"noreferrer" target=3D"_blank">systemd-only.bb</a> b/meta-s=
elftest/recipes-test/bbclasses/<a href=3D"http://systemd-only.bb" rel=3D"no=
referrer" target=3D"_blank">systemd-only.bb</a><br>
new file mode 100644<br>
index 0000000000..3a28713cb5<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-test/bbclasses/<a href=3D"http://systemd-only.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd-only.bb</a><br>
@@ -0,0 +1,10 @@<br>
+LICENSE =3D &quot;CLOSED&quot;<br>
+</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">License is not =
conducive to project here so it has to change to something open=C2=A0</div>=
<div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br=
>
+inherit allarch systemd<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${systemd_system_unitdir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0touch ${D}${systemd_system_unitdir}/${BPN}.serv=
ice<br>
+}<br>
+<br>
+SYSTEMD_SERVICE:${PN} =3D &quot;${BPN}.service&quot;<br>
diff --git a/meta/lib/oeqa/selftest/cases/bbclasses.py b/meta/lib/oeqa/self=
test/cases/bbclasses.py<br>
new file mode 100644<br>
index 0000000000..10545ebe65<br>
--- /dev/null<br>
+++ b/meta/lib/oeqa/selftest/cases/bbclasses.py<br>
@@ -0,0 +1,106 @@<br>
+#<br>
+# Copyright OpenEmbedded Contributors<br>
+#<br>
+# SPDX-License-Identifier: MIT<br>
+#<br>
+<br>
+from oeqa.selftest.case import OESelftestTestCase<br>
+from oeqa.utils.commands import get_bb_vars, bitbake<br>
+<br>
+class Systemd(OESelftestTestCase):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Tests related to the systemd bbclass.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 def getVars(self, recipe):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.bb_vars =3D get_bb_vars(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;BPN&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;D&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;INIT_D_DIR&#3=
9;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;prefix&#39;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;systemd_syste=
m_unitdir&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;sysconfdir&#3=
9;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 def fileExists(self, filename):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertExists(filename.format(**self.bb_va=
rs))<br>
+<br>
+=C2=A0 =C2=A0 def fileNotExists(self, filename):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertNotExists(filename.format(**self.bb=
_vars))<br>
+<br>
+=C2=A0 =C2=A0 def test_systemd_in_distro(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0 Verify that no sysvinit =
files are installed when the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syst=
emd distro feature is enabled, but sysvinit is not.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 =C2=A0Systemd service file exi=
sts, but /etc does not.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Product:=C2=A0 =C2=A0 OE-Core<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Author:=C2=A0 =C2=A0 =C2=A0Peter Kjellerstedt =
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.=
kjellerstedt@axis.com</a>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&quot;&quot;&quot;<br>
+DISTRO_FEATURES:append =3D &quot; systemd usrmerge&quot;<br>
+DISTRO_FEATURES:remove =3D &quot;sysvinit&quot;<br>
+VIRTUAL-RUNTIME_init_manager =3D &quot;systemd&quot;<br>
+&quot;&quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;systemd-only systemd-and-sysvini=
t -c install&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.getVars(&quot;systemd-only&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fileExists(&quot;{D}{systemd_system_unitd=
ir}/{BPN}.service&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.getVars(&quot;systemd-and-sysvinit&quot;)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fileExists(&quot;{D}{systemd_system_unitd=
ir}/{BPN}.service&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fileNotExists(&quot;{D}{sysconfdir}&quot;=
)<br>
+<br>
+=C2=A0 =C2=A0 def test_systemd_and_sysvinit_in_distro(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0 Verify that both systemd=
 and sysvinit files are installed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 when=
 both the systemd and sysvinit distro features are<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enab=
led.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 =C2=A0Systemd service file and=
 sysvinit initscript exist.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Product:=C2=A0 =C2=A0 OE-Core<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Author:=C2=A0 =C2=A0 =C2=A0Peter Kjellerstedt =
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.=
kjellerstedt@axis.com</a>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&quot;&quot;&quot;<br>
+DISTRO_FEATURES:append =3D &quot; systemd sysvinit usrmerge&quot;<br>
+VIRTUAL-RUNTIME_init_manager =3D &quot;systemd&quot;<br>
+&quot;&quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;systemd-only systemd-and-sysvini=
t -c install&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.getVars(&quot;systemd-only&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fileExists(&quot;{D}{systemd_system_unitd=
ir}/{BPN}.service&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.getVars(&quot;systemd-and-sysvinit&quot;)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fileExists(&quot;{D}{systemd_system_unitd=
ir}/{BPN}.service&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fileExists(&quot;{D}{INIT_D_DIR}/{BPN}&qu=
ot;)<br>
+<br>
+=C2=A0 =C2=A0 def test_sysvinit_in_distro(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0 Verify that no systemd s=
ervice files are installed when the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysv=
init distro feature is enabled, but systemd is not.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 =C2=A0The systemd=C2=A0 servic=
e file does not exist, nor does /usr.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The =
sysvinit initscript exists.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Product:=C2=A0 =C2=A0 OE-Core<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Author:=C2=A0 =C2=A0 =C2=A0Peter Kjellerstedt =
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.=
kjellerstedt@axis.com</a>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&quot;&quot;&quot;<br>
+DISTRO_FEATURES:remove =3D &quot;systemd&quot;<br>
+DISTRO_FEATURES:append =3D &quot; sysvinit usrmerge&quot;<br>
+VIRTUAL-RUNTIME_init_manager =3D &quot;sysvinit&quot;<br>
+&quot;&quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;systemd-only systemd-and-sysvini=
t -c install&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.getVars(&quot;systemd-only&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fileNotExists(&quot;{D}{systemd_system_un=
itdir}/{BPN}.service&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fileNotExists(&quot;{D}{prefix}&quot;)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fileNotExists(&quot;{D}{sysconfdir}&quot;=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fileExists(&quot;{D}&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.getVars(&quot;systemd-and-sysvinit&quot;)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fileNotExists(&quot;{D}{systemd_system_un=
itdir}/{BPN}.service&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fileNotExists(&quot;{D}{prefix}&quot;)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fileExists(&quot;{D}{INIT_D_DIR}/{BPN}&qu=
ot;)<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#203568): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/203568" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/203568</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108008174/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108008174/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000dbcf810620240e8d--

