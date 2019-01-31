Return-Path: <pb@pbcl.net>
X-Greylist: delayed 1943 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 31 Jan 2019 13:15:27 UTC
Received: from mail.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id BDAF87C3CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 13:15:27 +0000 (UTC)
Received: from [2a00:c60:0:cb01:d558:c1dc:bc72:63ce] (helo=phil-desktop)
	by mail.pbcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89) (envelope-from <pb@pbcl.net>) id 1gpBgN-0007lm-IH
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2019 13:43:05 +0100
Message-ID: <a8f5b5c4bf1d9004c564500f7b6f1fd3da1715b1.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Jan 2019 12:43:02 +0000
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: [PATCH] go, go-common: Add missing quotes in shell variable assignment
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
X-List-Received-Date: Thu, 31 Jan 2019 13:15:28 -0000
Content-Type: multipart/alternative; boundary="=-yTg7nCuAz3Sqt0RAG8M5"

--=-yTg7nCuAz3Sqt0RAG8M5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Otherwise we will lose if ${BUILD_CC} happens to contain a space.
Signed-off-by: Phil Blundell <pb@pbcl.net>--- meta/recipes-
devtools/go/go-common.inc | 2 +- meta/recipes-
devtools/go/go_1.9.bb     | 2 +- 2 files changed, 2 insertions(+), 2
deletions(-)
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-
devtools/go/go-common.incindex 11d55c4d36..d6dc455813 100644---
a/meta/recipes-devtools/go/go-common.inc+++ b/meta/recipes-
devtools/go/go-common.inc@@ -29,5 +29,5 @@ export GOCACHE = "off"
export CGO_ENABLED = "1"  do_compile_prepend() {-	BUILD_CC=${BUIL
D_CC}+	BUILD_CC="${BUILD_CC}" }diff --git a/meta/recipes-
devtools/go/go_1.9.bb b/meta/recipes-devtools/go/go_1.9.bbindex
ec5a314e7d..e121e2790f 100644--- a/meta/recipes-
devtools/go/go_1.9.bb+++ b/meta/recipes-devtools/go/go_1.9.bb@@ -9,7
+9,7 @@ export CXX_FOR_TARGET = "${CXX}" do_compile() { 	export
GOBIN="${B}/bin" 	export TMPDIR="$GOTMPDIR"-	export
CC=$BUILD_CC+	export CC="$BUILD_CC"  	cd src 	./make.bash-- 2.20.1


--=-yTg7nCuAz3Sqt0RAG8M5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><pre>Otherwise we will lose if ${BUILD_CC} happens to contain a space.<=
/pre><pre><br></pre><pre>Signed-off-by: Phil Blundell &lt;<a href=3D"mailto=
:pb@pbcl.net">pb@pbcl.net</a>&gt;</pre><pre>---</pre><pre> meta/recipes-dev=
tools/go/go-common.inc | 2 +-</pre><pre> meta/recipes-devtools/go/go_1.9.bb=
     | 2 +-</pre><pre> 2 files changed, 2 insertions(+), 2 deletions(-)</pr=
e><pre><br></pre><pre>diff --git a/meta/recipes-devtools/go/go-common.inc b=
/meta/recipes-devtools/go/go-common.inc</pre><pre>index 11d55c4d36..d6dc455=
813 100644</pre><pre>--- a/meta/recipes-devtools/go/go-common.inc</pre><pre=
>+++ b/meta/recipes-devtools/go/go-common.inc</pre><pre>@@ -29,5 +29,5 @@ e=
xport GOCACHE =3D "off"</pre><pre> export CGO_ENABLED =3D "1"</pre><pre> </=
pre><pre> do_compile_prepend() {</pre><pre>-	BUILD_CC=3D${BUILD_CC}</pre><p=
re>+	BUILD_CC=3D"${BUILD_CC}"</pre><pre> }</pre><pre>diff --git a/meta/reci=
pes-devtools/go/go_1.9.bb b/meta/recipes-devtools/go/go_1.9.bb</pre><pre>in=
dex ec5a314e7d..e121e2790f 100644</pre><pre>--- a/meta/recipes-devtools/go/=
go_1.9.bb</pre><pre>+++ b/meta/recipes-devtools/go/go_1.9.bb</pre><pre>@@ -=
9,7 +9,7 @@ export CXX_FOR_TARGET =3D "${CXX}"</pre><pre> do_compile() {</p=
re><pre> 	export GOBIN=3D"${B}/bin"</pre><pre> 	export TMPDIR=3D"$GOTMPDIR"=
</pre><pre>-	export CC=3D$BUILD_CC</pre><pre>+	export CC=3D"$BUILD_CC"</pre=
><pre> </pre><pre> 	cd src</pre><pre> 	./make.bash</pre><pre>-- </pre><pre>=
2.20.1</pre><pre><br></pre><pre></pre></body></html>

--=-yTg7nCuAz3Sqt0RAG8M5--
