Return-Path: <fdk17@ftml.net>
X-Greylist: delayed 340 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Dec 2019 11:56:03 UTC
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4B76079F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Dec 2019 11:56:03 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id A1DBA210DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Dec 2019 06:50:22 -0500 (EST)
Received: from imap7 ([10.202.2.57])
	by compute6.internal (MEProxy); Wed, 25 Dec 2019 06:50:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftml.net; h=
	mime-version:message-id:date:from:to:subject:content-type; s=
	fm2; bh=JOyFkkwn430/e2PCEIAFZiwi8wlGDa2JfBOIqWx8peQ=; b=mEHekMS2
	n1RwLs9PIgW7gybCxRFHRUw5wCsPxSgxiaWU0i+H3Y51IEkkBo9s5Zw6pWbjnNSY
	QwiNPd4CVIoeRGrLmIcb8C1pP7A5LcnSDSiD0u4BqSrzsNeAep27nG65OtjpXq9R
	EicCFQbr+HvUqZeM7Ooi45FlTisM50w53C43XGyw7pjeBvtNhzlIHsm4goLEGfUX
	m8sdvuubJ/fdlKeWCMF7vd7NLKs0Ur4JpQjB76pyAgtXzxg3rC7msJhOujxk9Qcp
	qeD1anwupn6xtxTQfyJqcTObjdHN6In2yp7DMi+40C50pylFas1sdcQSPyqivBfP
	S6Nh7IOOtK3AOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=JOyFkkwn430/e2PCEIAFZiwi8wlGD
	a2JfBOIqWx8peQ=; b=dW17WKE1hUHNUvJSGJXryuXsGadnAmcy1hDLgdBkFdFcb
	gLI8PAssezlkww7ZiJjfLnxu9du45dH+ICxRk67GnZIkkBXh9JxmaH009wrb/kYR
	I7xDb5sGFS05F6DF6CQijH3a0FBm2RDQar3GT2Z+vw/6+RrBk4LfaBT3vEaupQik
	8MFVFAEn1wDG4mYuLBVkQL5IvBKRIaSntlTZEvsnus2AkPZx/76A7Lh+4LM8yplj
	Eyh4YiaAOoeQuYRRJiVmVftJTAmVwQ82tWhlzTYWElIMKNKxxRdzwdmVYP/cI7f9
	woD5QASvYOC1mab9/DlXjq59ZhnZJJRGE/wqxk9sQ==
X-ME-Sender: <xms:_kwDXjpmhg92I7k4B7uNJwFVNBb3XLa7XQ_QByK3Z8qxSlhrEddhpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvgedgfeefucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsegrtderre
	erredtnecuhfhrohhmpehfughkudejuceofhgukhdujeesfhhtmhhlrdhnvghtqeenucfr
	rghrrghmpehmrghilhhfrhhomhepfhgukhdujeesfhhtmhhlrdhnvghtnecuvehluhhsth
	gvrhfuihiivgeptd
X-ME-Proxy: <xmx:_kwDXoYYQy-mOwexIJC2lwFF8PW4uydek0FQ_vl9zqpxMK-OPVYPBw>
	<xmx:_kwDXpi_VsOmLK2jNqZbNCfPBMt7yI80tFRhS3-TvVYtG3xKeHCgGQ>
	<xmx:_kwDXlp0jYZY9pRVB2xKRSYD9dLHWvmGtmWXAjyjqgymbVEKq6zsRw>
	<xmx:_kwDXulex8gxqZA97RM9sa_Po2zs-06tlEYG4JEG1o8If1_aY8fFlA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5D8F01801C3; Wed, 25 Dec 2019 06:50:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-694-gd5bab98-fmstable-20191218v1
Mime-Version: 1.0
Message-Id: <1758bd87-e492-46bc-8aaa-514e802c5030@www.fastmail.com>
Date: Wed, 25 Dec 2019 06:49:11 -0500
From: fdk17 <fdk17@ftml.net>
To: openembedded-core@lists.openembedded.org
Subject: [meson][PATCH] meson: Allow for llvm-native tools to be used
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
X-List-Received-Date: Wed, 25 Dec 2019 11:56:04 -0000
Content-Type: multipart/alternative; boundary=ce2ab0c7a4c54df8adc75ddcc8edfc4c

--ce2ab0c7a4c54df8adc75ddcc8edfc4c
Content-Type: text/plain

I created a bbappend to build the LLVM recipe so that all the libraries were available for use on the host.
These libraries are then used by a host/sdk tool to prepare binary files for use by an application on the target.
When building our tool using meson it wasn't able to find the Yocto built LLLVM libraries.
This fixes the issue so meson uses the correct llvm-config tool.

Author: Fred Baksik <fred.baksik@mrcy.com>
Date: Tue Dec 24 20:38:47 2019 -0500

 meson: Allow for llvm-native tools to be used

 Signed-off-by: Fred Baksik <fred.baksik@mrcy.com>

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index e1a13bbbf7..b5cd2ee8c4 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -33,6 +33,7 @@ EXTRA_OEMESON_append = " ${PACKAGECONFIG_CONFARGS}"
 MESON_CROSS_FILE = ""
 MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
 MESON_CROSS_FILE_class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
+MESON_CROSS_FILE_class-native = "--native-file ${WORKDIR}/meson.native"

 def meson_array(var, d):
 items = d.getVar(var).split()
@@ -110,6 +111,14 @@ endian = '${@meson_endian('TARGET', d)}'
 EOF
 }

+do_write_config_class-native() {
+ # This needs to be Py to split the args into single-element lists
+ cat >${WORKDIR}/meson.native <<EOF
+[binaries]
+llvm-config = 'llvm-config${LLVMVERSION}'
+EOF
+}
+
 CONFIGURE_FILES = "meson.build"

 meson_do_configure() {

--ce2ab0c7a4c54df8adc75ddcc8edfc4c
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>I created a bba=
ppend to build the LLVM recipe so that all the libraries were available =
for use on the host.<br></div><div>These libraries are then used by a ho=
st/sdk tool to prepare binary files for use by an application on the tar=
get.<br></div><div>When building our tool using meson it wasn't able to =
find the Yocto built LLLVM libraries.<br></div><div>This fixes the issue=
 so meson uses the correct llvm-config tool.<br></div><div><br></div><di=
v>Author: Fred Baksik &lt;<a href=3D"mailto:fred.baksik@mrcy.com">fred.b=
aksik@mrcy.com</a>&gt;<br></div><div>Date:&nbsp;&nbsp; Tue Dec 24 20:38:=
47 2019 -0500<br></div><div><br></div><div>&nbsp;&nbsp;&nbsp; meson: All=
ow for llvm-native tools to be used<br></div><div>&nbsp;&nbsp;&nbsp; <br=
></div><div>&nbsp;&nbsp;&nbsp; Signed-off-by: Fred Baksik &lt;<a href=3D=
"mailto:fred.baksik@mrcy.com">fred.baksik@mrcy.com</a>&gt;<br></div><div=
><br></div><div>diff --git a/meta/classes/meson.bbclass b/meta/classes/m=
eson.bbclass<br></div><div>index e1a13bbbf7..b5cd2ee8c4 100644<br></div>=
<div>--- a/meta/classes/meson.bbclass<br></div><div>+++ b/meta/classes/m=
eson.bbclass<br></div><div>@@ -33,6 +33,7 @@ EXTRA_OEMESON_append =3D " =
${PACKAGECONFIG_CONFARGS}"<br></div><div>&nbsp;MESON_CROSS_FILE =3D ""<b=
r></div><div>&nbsp;MESON_CROSS_FILE_class-target =3D "--cross-file ${WOR=
KDIR}/meson.cross"<br></div><div>&nbsp;MESON_CROSS_FILE_class-nativesdk =
=3D "--cross-file ${WORKDIR}/meson.cross"<br></div><div>+MESON_CROSS_FIL=
E_class-native =3D "--native-file ${WORKDIR}/meson.native"<br></div><div=
>&nbsp;<br></div><div>&nbsp;def meson_array(var, d):<br></div><div>&nbsp=
;&nbsp;&nbsp;&nbsp; items =3D d.getVar(var).split()<br></div><div>@@ -11=
0,6 +111,14 @@ endian =3D '${@meson_endian('TARGET', d)}'<br></div><div>=
&nbsp;EOF<br></div><div>&nbsp;}<br></div><div>&nbsp;<br></div><div>+do_w=
rite_config_class-native() {<br></div><div>+&nbsp;&nbsp;&nbsp; # This ne=
eds to be Py to split the args into single-element lists<br></div><div>+=
&nbsp;&nbsp;&nbsp; cat &gt;${WORKDIR}/meson.native &lt;&lt;EOF<br></div>=
<div>+[binaries]<br></div><div>+llvm-config =3D 'llvm-config${LLVMVERSIO=
N}'<br></div><div>+EOF<br></div><div>+}<br></div><div>+<br></div><div>&n=
bsp;CONFIGURE_FILES =3D "meson.build"<br></div><div>&nbsp;<br></div><div=
>&nbsp;meson_do_configure() {<br></div></body></html>

--ce2ab0c7a4c54df8adc75ddcc8edfc4c--
