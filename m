Return-Path: <george.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 175F372150
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 07:49:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Nov 2014 23:49:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,415,1413270000"; 
	d="scan'208,217";a="610277774"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
	by orsmga001.jf.intel.com with ESMTP; 18 Nov 2014 23:49:10 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.93]) by
	IRSMSX151.ger.corp.intel.com ([163.33.192.59]) with mapi id
	14.03.0195.001; Wed, 19 Nov 2014 07:49:08 +0000
From: "Musat, George L" <george.l.musat@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] oequa/runtime: Added check for ptest-runner to see if
	it ran correctly
Thread-Index: AdADzUBxLuE5RaUdSDes7ijpeMFLog==
Date: Wed, 19 Nov 2014 07:49:07 +0000
Message-ID: <042E875E1B5D414CA9BB78B7D4FA691C13CE7004@IRSMSX102.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: [PATCH] oequa/runtime: Added check for ptest-runner to see if it ran correctly
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
X-List-Received-Date: Wed, 19 Nov 2014 07:49:42 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_042E875E1B5D414CA9BB78B7D4FA691C13CE7004IRSMSX102gercor_"

--_000_042E875E1B5D414CA9BB78B7D4FA691C13CE7004IRSMSX102gercor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

And modified condition to install complementary packages.



Signed-off-by: Lucian Musat <george.l.musat@intel.com<mailto:george.l.musat=
@intel.com>>

---

meta/lib/oeqa/runtime/_ptest.py | 10 +++++++---

1 file changed, 7 insertions(+), 3 deletions(-)



diff --git a/meta/lib/oeqa/runtime/_ptest.py b/meta/lib/oeqa/runtime/_ptest=
.py index 4c58dc1..76b6e2b 100644

--- a/meta/lib/oeqa/runtime/_ptest.py

+++ b/meta/lib/oeqa/runtime/_ptest.py

@@ -106,12 +106,16 @@ class PtestRunnerTest(oeRuntimeTest):

     @skipUnlessPassed('test_ssh')

     def test_ptestrunner(self):

         self.add_smart_channel()

-        cond =3D oeRuntimeTest.hasPackage("ptest-runner") and oeRuntimeTes=
t.hasFeature("ptest") and oeRuntimeTest.hasPackage("-ptest")

-        if not cond:

+        #cond =3D oeRuntimeTest.hasPackage("ptest-runner") and oeRuntimeTe=
st.hasFeature("ptest") and oeRuntimeTest.hasPackage("-ptest")

+        #if not cond:

+        (status, result) =3D self.target.run('smart query ptest-runner', 0=
)

+        if (status !=3D 0):

             self.install_packages(self.install_complementary("*-ptest"))

             self.install_packages(['ptest-runner'])

-        self.target.run('/usr/bin/ptest-runner > /tmp/ptest.log 2>&1', 0)

+        (status, result) =3D self.target.run('/usr/bin/ptest-runner > /tmp=
/ptest.log 2>&1', 0)

+        self.assertEqual(status, 0 , msg=3D"Ptest-Runner failed to run!")

+

         self.target.copy_from('/tmp/ptest.log', self.ptest_log)

         shutil.copyfile(self.ptest_log, os.path.join(self.buildhist_dir, "=
ptest.log"))

--

1.9.1


--_000_042E875E1B5D414CA9BB78B7D4FA691C13CE7004IRSMSX102gercor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">And modified condition to install complementary p=
ackages.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Signed-off-by: Lucian Musat &lt;<a href=3D"mailto=
:george.l.musat@intel.com">george.l.musat@intel.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">---<o:p></o:p></p>
<p class=3D"MsoPlainText">meta/lib/oeqa/runtime/_ptest.py | 10 &#43;&#43;&#=
43;&#43;&#43;&#43;&#43;---<o:p></o:p></p>
<p class=3D"MsoPlainText">1 file changed, 7 insertions(&#43;), 3 deletions(=
-)<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">diff --git a/meta/lib/oeqa/runtime/_ptest.py b/me=
ta/lib/oeqa/runtime/_ptest.py index 4c58dc1..76b6e2b 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">--- a/meta/lib/oeqa/runtime/_ptest.py<o:p></o:p><=
/p>
<p class=3D"MsoPlainText">&#43;&#43;&#43; b/meta/lib/oeqa/runtime/_ptest.py=
<o:p></o:p></p>
<p class=3D"MsoPlainText">@@ -106,12 &#43;106,16 @@ class PtestRunnerTest(o=
eRuntimeTest):<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp; @skipUnlessPassed('test_=
ssh')<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp; def test_ptestrunner(sel=
f):<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
self.add_smart_channel()<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cond =
=3D oeRuntimeTest.hasPackage(&quot;ptest-runner&quot;) and oeRuntimeTest.ha=
sFeature(&quot;ptest&quot;) and oeRuntimeTest.hasPackage(&quot;-ptest&quot;=
)<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if no=
t cond:<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #=
cond =3D oeRuntimeTest.hasPackage(&quot;ptest-runner&quot;) and oeRuntimeTe=
st.hasFeature(&quot;ptest&quot;) and oeRuntimeTest.hasPackage(&quot;-ptest&=
quot;)<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #=
if not cond:<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;(=
status, result) =3D self.target.run('smart query ptest-runner', 0)<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (status !=3D 0):<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; self.install_packages(self.install_complementary(&q=
uot;*-ptest&quot;))<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; self.install_packages(['ptest-runner'])<o:p></o:p><=
/p>
<p class=3D"MsoPlainText"><o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.=
target.run('/usr/bin/ptest-runner &gt; /tmp/ptest.log 2&gt;&amp;1', 0)<o:p>=
</o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (=
status, result) =3D self.target.run('/usr/bin/ptest-runner &gt; /tmp/ptest.=
log 2&gt;&amp;1', 0)<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
elf.assertEqual(status, 0 , msg=3D&quot;Ptest-Runner failed to run!&quot;)<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
self.target.copy_from('/tmp/ptest.log', self.ptest_log)<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
shutil.copyfile(self.ptest_log, os.path.join(self.buildhist_dir, &quot;ptes=
t.log&quot;))<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p></o:p></p>
<p class=3D"MsoPlainText">--<o:p></o:p></p>
<p class=3D"MsoPlainText">1.9.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_042E875E1B5D414CA9BB78B7D4FA691C13CE7004IRSMSX102gercor_--
