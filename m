Return-Path: <joseph-reynolds@charter.net>
Received: from mtaout003-public.msg.strl.va.charter.net
	(mtaout003-public.msg.strl.va.charter.net [68.114.190.28])
	by mail.openembedded.org (Postfix) with ESMTP id 3FED7796BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 21:56:01 +0000 (UTC)
Received: from impout001 ([68.114.189.16]) by mtaout003.msg.strl.va.charter.net
	(InterMail vM.9.00.023.01 201-2473-194) with ESMTP id
	<20180912215602.RBLE7355.mtaout003.msg.strl.va.charter.net@impout001>
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 16:56:02 -0500
Received: from localhost ([68.114.5.35]) by impout001 with charter.net
	id alw21y00P0lLAyC01lw2NN; Wed, 12 Sep 2018 16:56:02 -0500
X-Authority-Analysis: v=2.2 cv=ffHd8wYF c=1 sm=1 tr=0
	a=VBTjg2AHeJkaqYfRu568yw==:117 a=VBTjg2AHeJkaqYfRu568yw==:17
	a=fJkqCKB1fTMA:10 a=x7bEGLp0ZPQA:10 a=2Ev-Ocp92hkTL4OrrHUA:9
	a=QEXdDO2ut3YA:10 a=hOpmn2quAAAA:8 a=F7oAa8SlOOytzr_kxB0A:9
	a=AIbNWFdzChcxaYu-:21 a=_W_S_7VecoQA:10 a=GyA-uvUxXSCciAkwuKQO:22
Message-ID: <alw21y00P0lLAyC01lw2NN@charter.net>
From: joseph-reynolds@charter.net
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
X-Mailer: Atmail 7.1.1.13434
X-Originating-IP: [129.42.161.36]
Date: Wed, 12 Sep 2018 16:56:02 -0500
MIME-Version: 1.0
Subject: [PATCH v2] dropbear: disable medium-strength ssh ciphers
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
X-List-Received-Date: Wed, 12 Sep 2018 21:56:02 -0000
Content-Type: multipart/alternative;
	boundary="=_de1dc46ff47303c96ab776841d0f2ee9"

--=_de1dc46ff47303c96ab776841d0f2ee9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This changes the Dropbear SSH server configuration so it will not=0Aacce=
pt medium-strength encryption ciphers including: CBC mode, MD5,=0A96-bit=
 MAC, and triple DES. This is consistent with the default=0Asupported Op=
enSSH ciphers.=0A=0AUpstream-Status: Pending=0A=0ASigned-off-by: Joseph=
 Reynolds =0A---=0A meta/recipes-core/dropbear/dropbear/localoptions.h |=
 8 ++++++++=0A 1 file changed, 8 insertions(+)=0A create mode 100644 met=
a/recipes-core/dropbear/dropbear/localoptions.h=0A=0Adiff --git a/meta/r=
ecipes-core/dropbear/dropbear/localoptions.h=0Ab/meta/recipes-core/dropb=
ear/dropbear/localoptions.h=0Anew file mode 100644=0Aindex 0000000..ec48=
c26=0A--- /dev/null=0A+++ b/meta/recipes-core/dropbear/dropbear/localopt=
ions.h=0A@@ -0,0 +1,8 @@=0A+/* Customize dropbear per default_options.h=
 in the dropbear project=0A*/=0A+=0A+/* Disable insecure ciphers */=0A+#=
define DROPBEAR_TWOFISH256 0=0A+#define DROPBEAR_TWOFISH128 0=0A+#define=
 DROPBEAR_ENABLE_CBC_MODE 0=0A+#define DROPBEAR_SHA1_HMAC 0=0A+#define D=
ROPBEAR_SHA1_96_HMAC 0=0A-- =0A1.8.3.1=0A=0A

--=_de1dc46ff47303c96ab776841d0f2ee9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body>This changes the Dropbear SSH server configuration so it wil=
l not<br>accept medium-strength encryption ciphers including: CBC mode,=
 MD5,<br>96-bit MAC, and triple DES.&nbsp; This is consistent with the d=
efault<br>supported OpenSSH ciphers.<br><br>Upstream-Status: Pending<br>=
<br>Signed-off-by: Joseph Reynolds &lt;joseph-reynolds@charter.net&gt;<b=
r>---<br>&nbsp;meta/recipes-core/dropbear/dropbear/localoptions.h | 8 ++=
++++++<br>&nbsp;1 file changed, 8 insertions(+)<br>&nbsp;create mode 100=
644 meta/recipes-core/dropbear/dropbear/localoptions.h<br><br>diff --git=
 a/meta/recipes-core/dropbear/dropbear/localoptions.h b/meta/recipes-cor=
e/dropbear/dropbear/localoptions.h<br>new file mode 100644<br>index 0000=
000..ec48c26<br>--- /dev/null<br>+++ b/meta/recipes-core/dropbear/dropbe=
ar/localoptions.h<br>@@ -0,0 +1,8 @@<br>+/* Customize dropbear per defau=
lt_options.h in the dropbear project */<br>+<br>+/* Disable insecure cip=
hers */<br>+#define DROPBEAR_TWOFISH256 0<br>+#define DROPBEAR_TWOFISH12=
8 0<br>+#define DROPBEAR_ENABLE_CBC_MODE 0<br>+#define DROPBEAR_SHA1_HMA=
C 0<br>+#define DROPBEAR_SHA1_96_HMAC 0<br>-- <br>1.8.3.1<br><br></body>=
</html>

--=_de1dc46ff47303c96ab776841d0f2ee9--
