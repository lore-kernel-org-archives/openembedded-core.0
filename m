Return-Path: <joseph-reynolds@charter.net>
X-Greylist: delayed 961 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Sep 2018 19:32:52 UTC
Received: from que001-public.msg.strl.va.charter.net
	(que001-public.msg.strl.va.charter.net [68.114.190.38])
	by mail.openembedded.org (Postfix) with ESMTP id 12E1A6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 19:32:52 +0000 (UTC)
Received: from impout004 ([68.114.189.19]) by mtaout003.msg.strl.va.charter.net
	(InterMail vM.9.00.023.01 201-2473-194) with ESMTP id
	<20180907191650.NZTS7355.mtaout003.msg.strl.va.charter.net@impout004>
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Sep 2018 14:16:50 -0500
Received: from localhost ([68.114.0.170]) by impout004 with charter.net
	id YjGq1y00H3g4RYs01jGq8X; Fri, 07 Sep 2018 14:16:50 -0500
X-Authority-Analysis: v=2.2 cv=Cat43Pjl c=1 sm=1 tr=0
	a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17
	a=2lbjVDu7A2UA:10 a=x7bEGLp0ZPQA:10 a=2Ev-Ocp92hkTL4OrrHUA:9
	a=QEXdDO2ut3YA:10 a=hOpmn2quAAAA:8 a=QxPnUlmBzHtLDsajCz0A:9
	a=9nCUo8GUUwNqz0qv:21 a=_W_S_7VecoQA:10 a=GyA-uvUxXSCciAkwuKQO:22
Message-ID: <YjGq1y00H3g4RYs01jGq8X@charter.net>
From: joseph-reynolds@charter.net
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
X-Mailer: Atmail 7.1.1.13434
X-Originating-IP: [97.86.254.207]
Date: Fri, 07 Sep 2018 14:16:50 -0500
MIME-Version: 1.0
Subject: [PATCH] disable medium-strength dropbear ssh ciphers
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
X-List-Received-Date: Fri, 07 Sep 2018 19:32:53 -0000
Content-Type: multipart/alternative;
	boundary="=_c06e39faff775aa0de8002df8c1caba5"

--=_c06e39faff775aa0de8002df8c1caba5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This changes the Dropbear SSH server configuration so it will not=0Aacce=
pt medium-strength encryption ciphers including: CBC mode, MD5,=0A96-bit=
 MAC, and triple DES.=0A=0AUpstream-Status: Pending=0A=0ASigned-off-by:=
 Joseph Reynolds =0A---=0A meta/recipes-core/dropbear/dropbear/localopti=
ons.h | 8 ++++++++=0A 1 file changed, 8 insertions(+)=0A create mode 100=
644 meta/recipes-core/dropbear/dropbear/localoptions.h=0A=0Adiff --git a=
/meta/recipes-core/dropbear/dropbear/localoptions.h=0Ab/meta/recipes-cor=
e/dropbear/dropbear/localoptions.h=0Anew file mode 100644=0Aindex 000000=
0..ec48c26=0A--- /dev/null=0A+++ b/meta/recipes-core/dropbear/dropbear/l=
ocaloptions.h=0A@@ -0,0 +1,8 @@=0A+/* Customize dropbear per default_opt=
ions.h in the dropbear project=0A*/=0A+=0A+/* Disable insecure ciphers *=
/=0A+#define DROPBEAR_TWOFISH256 0=0A+#define DROPBEAR_TWOFISH128 0=0A+#=
define DROPBEAR_ENABLE_CBC_MODE 0=0A+#define DROPBEAR_SHA1_HMAC 0=0A+#de=
fine DROPBEAR_SHA1_96_HMAC 0=0A-- =0A2.7.2=0A=0A

--=_c06e39faff775aa0de8002df8c1caba5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body>This changes the Dropbear SSH server configuration so it wil=
l not<br><div>accept medium-strength encryption ciphers including: CBC m=
ode, MD5,<br>96-bit MAC, and triple DES.<br><br>Upstream-Status: Pending=
<br><br>Signed-off-by: Joseph Reynolds &lt;joseph-reynolds@charter.net&g=
t;<br>---<br>&nbsp;meta/recipes-core/dropbear/dropbear/localoptions.h |=
 8 ++++++++<br>&nbsp;1 file changed, 8 insertions(+)<br>&nbsp;create mod=
e 100644 meta/recipes-core/dropbear/dropbear/localoptions.h<br><br>diff=
 --git a/meta/recipes-core/dropbear/dropbear/localoptions.h b/meta/recip=
es-core/dropbear/dropbear/localoptions.h<br>new file mode 100644<br>inde=
x 0000000..ec48c26<br>--- /dev/null<br>+++ b/meta/recipes-core/dropbear/=
dropbear/localoptions.h<br>@@ -0,0 +1,8 @@<br>+/* Customize dropbear per=
 default_options.h in the dropbear project */<br>+<br>+/* Disable insecu=
re ciphers */<br>+#define DROPBEAR_TWOFISH256 0<br>+#define DROPBEAR_TWO=
FISH128 0<br>+#define DROPBEAR_ENABLE_CBC_MODE 0<br>+#define DROPBEAR_SH=
A1_HMAC 0<br>+#define DROPBEAR_SHA1_96_HMAC 0<br>-- <br>2.7.2<br><br><br=
></div></body></html>

--=_c06e39faff775aa0de8002df8c1caba5--
