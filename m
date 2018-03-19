Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 66653788A1;
	Mon, 19 Mar 2018 17:38:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 10:38:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,331,1517904000"; d="scan'208,217";a="36299604"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by orsmga003.jf.intel.com with ESMTP; 19 Mar 2018 10:38:36 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.175]) by
	ORSMSX102.amr.corp.intel.com ([169.254.3.86]) with mapi id
	14.03.0319.002; Mon, 19 Mar 2018 10:38:35 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>, "Patches and discussions about the
	oe-core layer" <openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-commits] [openembedded-core] 02/03:
	reproducible_build_simple.bbclass: simple environment for reproducible
	binaries
Thread-Index: AQHTvsJgozuNr51FmEK0x15niF3TIKPWfkiAgAAChwCAAVH0HA==
Date: Mon, 19 Mar 2018 17:38:35 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64C673B99@ORSMSX112.amr.corp.intel.com>
References: <152089240195.19773.3751229902290225520@git.openembedded.org>
	<20180312220642.1D65C232B12@git.openembedded.org>
	<CA+chaQdN_qjQx_YSuD6RX5p=8OPNfv7OGdzrTqLfWMjnjfOxxQ@mail.gmail.com>
	<CA+chaQdQP3zTRXDz2S=Oypbe9BE5CN+rASraHdxT5vYeNLBpAg@mail.gmail.com>,
	<CA+chaQfJx-cuye=3HDTi4BHpY64kmihykiD8yeLAQnSaurfZVg@mail.gmail.com>
In-Reply-To: <CA+chaQfJx-cuye=3HDTi4BHpY64kmihykiD8yeLAQnSaurfZVg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.135]
MIME-Version: 1.0
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 02/03: reproducible_build_simple.bbclass: simple environment for reproducible binaries
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
X-List-Received-Date: Mon, 19 Mar 2018 17:38:35 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6E51916E4A1F32428260031F4C7CD2B64C673B99ORSMSX112amrcor_"

--_000_6E51916E4A1F32428260031F4C7CD2B64C673B99ORSMSX112amrcor_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Martin,
thanks for your feedback.
I will send to ML a new version of the patch within a day or two. The patch=
 you mentioned (v2) had a few short-comings, hopefully fixed in the next on=
e (currently being tested).
Meanwhile, you may want to have a look at the recently updated wiki page (a=
nd it will be updated again) how to build reproducible builds with "hard-co=
ded" SOURCE_DATE_EPOCH:
https://wiki.yoctoproject.org/wiki/Reproducible_Builds


Thanks
________________________________
From: Martin Jansa [martin.jansa@gmail.com]
Sent: Sunday, March 18, 2018 7:22 AM
To: Bystricky, Juro; Patches and discussions about the oe-core layer
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 02/03: reproducible_build_sim=
ple.bbclass: simple environment for reproducible binaries

SOURCE_DATE_EPOCH was supposed to be exported in this review:
https://patchwork.openembedded.org/patch/139558/
but it wasn't merged to master nor rocko.



On Sun, Mar 18, 2018 at 3:13 PM, Martin Jansa <martin.jansa@gmail.com<mailt=
o:martin.jansa@gmail.com>> wrote:
I've also noticed that the kernel.bbclass says:

                # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH=
 may not
                # be set....

but with git grep SOURCE_DATE_EPOCH I don't see any code in bitbake or oe-c=
ore where this would be set in do_unpack (in oe-core/master and oe-core/roc=
ko). Is this part still only in one of your contrib branches for reproducib=
le?

Regards,

On Sun, Mar 18, 2018 at 3:06 PM, Martin Jansa <martin.jansa@gmail.com<mailt=
o:martin.jansa@gmail.com>> wrote:
Hi,

There seems to be small issue when people set BUILD_REPRODUCIBLE_BINARIES =
=3D "1" without exporting SOURCE_DATE_EPOCH like this .bbclass does

In kernel.bbclass change from:
http://git.openembedded.org/openembedded-core/commit/meta/classes/kernel.bb=
class?id=3D012a70da7ae0617740cd0cf807d01c3cd912c823

you're comparing SOURCE_DATE_EPOCH with 0 which doesn't seem to be set anyw=
here, so by default it's empty which leads to kernel build failure like thi=
s:

DEBUG: Executing shell function do_compile
date: invalid date '@'
WARNING: exit code 1 from a shell command.

because empty SOURCE_DATE_EPOCH is used in "ts=3D`LC_ALL=3DC date -d @$SOUR=
CE_DATE_EPOCH`". Testing SOURCE_DATE_EPOCH for empty or "0" allows to use R=
EPRODUCIBLE_TIMESTAMP_ROOTFS as a default value again.

These build failures seem to be triggered in all my builds since kernel.bbc=
lass was fixed to respect BUILD_REPRODUCIBLE_BINARIES in:
http://git.openembedded.org/openembedded-core/commit/meta/classes/kernel.bb=
class?id=3D27f87bbc8395a2481ef808465a62d213a6b678ac

One way to fit it would be to inherit reproducible_build_simple.bbclass, bu=
t this requirement to set exported SOURCE_DATE_EPOCH doesn't seem to be doc=
umented anywhere and looking at kernel.bbclass changes it probably wasn't e=
ven intended like that.

Thanks

On Mon, Mar 12, 2018 at 11:06 PM, <git@git.openembedded.org<mailto:git@git.=
openembedded.org>> wrote:
This is an automated email from the git hooks/post-receive script.

rpurdie pushed a commit to branch master
in repository openembedded-core.

commit 5c2685c5ee2f8210a36b9a8591491b6af0482084
Author: Juro Bystricky <juro.bystricky@intel.com<mailto:juro.bystricky@inte=
l.com>>
AuthorDate: Sat Mar 10 10:57:49 2018 -0800

    reproducible_build_simple.bbclass: simple environment for reproducible =
binaries

    Export environmental variables needed for binary reproducibility with c=
onsistent values.

    This class can be used either directly via:
    INHERIT +=3D "reproducible_build_simple"

    or can be inherited by a more complex/complete bbclass, for example a b=
blass which
    will crack SOURCE_DATE_EPOCH for each recipe.

    Signed-off-by: Juro Bystricky <juro.bystricky@intel.com<mailto:juro.bys=
tricky@intel.com>>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org<mailt=
o:richard.purdie@linuxfoundation.org>>
---
 meta/classes/reproducible_build_simple.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/reproducible_build_simple.bbclass b/meta/classes/=
reproducible_build_simple.bbclass
new file mode 100644
index 0000000..dd11cd9
--- /dev/null
+++ b/meta/classes/reproducible_build_simple.bbclass
@@ -0,0 +1,11 @@
+# Setup default environment for reproducible builds.
+
+BUILD_REPRODUCIBLE_BINARIES =3D "1"
+
+export PYTHONHASHSEED =3D "0"
+export PERL_HASH_SEED =3D "0"
+export TZ =3D 'UTC'
+export SOURCE_DATE_EPOCH ??=3D "1520598896"
+
+REPRODUCIBLE_TIMESTAMP_ROOTFS ??=3D "1520598896"
+

--
To stop receiving notification emails like this one, please contact
the administrator of this repository.
--
_______________________________________________
Openembedded-commits mailing list
Openembedded-commits@lists.openembedded.org<mailto:Openembedded-commits@lis=
ts.openembedded.org>
http://lists.openembedded.org/mailman/listinfo/openembedded-commits




--_000_6E51916E4A1F32428260031F4C7CD2B64C673B99ORSMSX112amrcor_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" id=3D"owaParaStyle">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Hi Martin,<br>
thanks for your feedback.<br>
I will send to ML a new version of the patch within a day or two. The patch=
 you mentioned (v2) had a few short-comings, hopefully fixed in the next on=
e (currently being tested).<br>
Meanwhile, you may want to have a look at the recently updated wiki page (a=
nd it will be updated again) how to build reproducible builds with &quot;ha=
rd-coded&quot; SOURCE_DATE_EPOCH:<br>
<a href=3D"https://wiki.yoctoproject.org/wiki/Reproducible_Builds" target=
=3D"_blank">https://wiki.yoctoproject.org/wiki/Reproducible_Builds</a><br>
<br>
<br>
Thanks<br>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div id=3D"divRpF587482" style=3D"direction: ltr;"><font size=3D"2" face=3D=
"Tahoma" color=3D"#000000"><b>From:</b> Martin Jansa [martin.jansa@gmail.co=
m]<br>
<b>Sent:</b> Sunday, March 18, 2018 7:22 AM<br>
<b>To:</b> Bystricky, Juro; Patches and discussions about the oe-core layer=
<br>
<b>Cc:</b> openembedded-commits@lists.openembedded.org<br>
<b>Subject:</b> Re: [oe-commits] [openembedded-core] 02/03: reproducible_bu=
ild_simple.bbclass: simple environment for reproducible binaries<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">
<div><span style=3D"color:rgb(34,34,34); font-family:arial,sans-serif; font=
-size:small; font-style:normal; font-weight:400; letter-spacing:normal; tex=
t-align:start; text-indent:0px; text-transform:none; white-space:normal; wo=
rd-spacing:0px; background-color:rgb(255,255,255); float:none; display:inli=
ne">SOURCE_DATE_EPOCH
 was supposed to be exported in this review:</span><br>
</div>
<a href=3D"https://patchwork.openembedded.org/patch/139558/" target=3D"_bla=
nk">https://patchwork.openembedded.org/patch/139558/</a><br>
<div>but it wasn't merged to master nor rocko.<br>
</div>
<div><br>
</div>
<div><br>
</div>
</div>
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On Sun, Mar 18, 2018 at 3:13 PM, Martin Jansa <s=
pan dir=3D"ltr">
&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jans=
a@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
<div dir=3D"ltr">I've also noticed that the kernel.bbclass says:
<div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # kernel sourc=
es do not use do_unpack, so SOURCE_DATE_EPOCH may not</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # be set....</=
div>
</div>
<div><br>
</div>
<div>but with git grep&nbsp;<span style=3D"color:rgb(34,34,34); font-family=
:arial,sans-serif; font-size:small; font-style:normal; font-weight:400; let=
ter-spacing:normal; text-align:start; text-indent:0px; text-transform:none;=
 white-space:normal; word-spacing:0px; background-color:rgb(255,255,255); f=
loat:none; display:inline">SOURCE_DATE_EPOCH
 I don't see any code in bitbake or oe-core where this would be set in do_u=
npack (in oe-core/master and oe-core/rocko). Is this part still only in one=
 of your contrib branches for reproducible?</span></div>
<div><span style=3D"color:rgb(34,34,34); font-family:arial,sans-serif; font=
-size:small; font-style:normal; font-weight:400; letter-spacing:normal; tex=
t-align:start; text-indent:0px; text-transform:none; white-space:normal; wo=
rd-spacing:0px; background-color:rgb(255,255,255); float:none; display:inli=
ne"><br>
</span></div>
<div><span style=3D"color:rgb(34,34,34); font-family:arial,sans-serif; font=
-size:small; font-style:normal; font-weight:400; letter-spacing:normal; tex=
t-align:start; text-indent:0px; text-transform:none; white-space:normal; wo=
rd-spacing:0px; background-color:rgb(255,255,255); float:none; display:inli=
ne">Regards,</span></div>
</div>
<div class=3D"HOEnZb">
<div class=3D"h5">
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On Sun, Mar 18, 2018 at 3:06 PM, Martin Jansa <s=
pan dir=3D"ltr">
&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jans=
a@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
<div dir=3D"ltr">
<div>Hi,</div>
<div><br>
</div>
There seems to be small issue when people set&nbsp;<span style=3D"color:rgb=
(34,34,34); font-family:arial,sans-serif; font-size:12.8px; font-style:norm=
al; font-weight:400; letter-spacing:normal; text-align:start; text-indent:0=
px; text-transform:none; white-space:normal; word-spacing:0px; background-c=
olor:rgb(255,255,255); float:none; display:inline">BUILD_REPRODUCIBLE_BINAR=
IE<wbr>S
 =3D &quot;1&quot; without exporting&nbsp;<span style=3D"color:rgb(34,34,34=
); font-family:arial,sans-serif; font-size:12.8px; font-style:normal; font-=
weight:400; letter-spacing:normal; text-align:start; text-indent:0px; text-=
transform:none; white-space:normal; word-spacing:0px; background-color:rgb(=
255,255,255); float:none; display:inline">SOURCE_DATE_EPOCH
 like this .bbclass does</span></span>
<div><span style=3D"font-size:12.8px"><br>
</span></div>
<div><span style=3D"font-size:12.8px">In kernel.bbclass change from:<br>
</span><span style=3D"color:rgb(34,34,34); font-family:arial,sans-serif; fo=
nt-size:12.8px; font-style:normal; font-weight:400; letter-spacing:normal; =
text-align:start; text-indent:0px; text-transform:none; white-space:normal;=
 word-spacing:0px; background-color:rgb(255,255,255); float:none; display:i=
nline"></span>
<div><a href=3D"http://git.openembedded.org/openembedded-core/commit/meta/c=
lasses/kernel.bbclass?id=3D012a70da7ae0617740cd0cf807d01c3cd912c823" target=
=3D"_blank">http://git.openembedded.org/op<wbr>enembedded-core/commit/meta/=
cl<wbr>asses/kernel.bbclass?id=3D012a70<wbr>da7ae0617740cd0cf807d01c3cd912<=
wbr>c823</a><br>
</div>
</div>
<div><br>
</div>
<div>you're comparing&nbsp;<span style=3D"color:rgb(34,34,34); font-family:=
arial,sans-serif; font-size:12.8px; font-style:normal; font-weight:400; let=
ter-spacing:normal; text-align:start; text-indent:0px; text-transform:none;=
 white-space:normal; word-spacing:0px; background-color:rgb(255,255,255); f=
loat:none; display:inline">SOURCE_DATE_EPOCH
 with 0 which doesn't seem to be set anywhere, so by default it's empty whi=
ch leads to kernel build failure like this:</span></div>
<div><span style=3D"text-align:start; text-indent:0px; background-color:rgb=
(255,255,255); float:none; display:inline">
<div><span style=3D"font-size:12.8px"><br>
</span></div>
<div><span style=3D"font-size:12.8px">DEBUG: Executing shell function do_co=
mpile</span></div>
<div><span style=3D"font-size:12.8px">date: invalid date '@'</span></div>
<div><span style=3D"font-size:12.8px">WARNING: exit code 1 from a shell com=
mand.</span></div>
<div style=3D"color:rgb(34,34,34); font-family:arial,sans-serif; font-size:=
12.8px; font-style:normal; font-weight:400; letter-spacing:normal; text-tra=
nsform:none; white-space:normal; word-spacing:0px">
<br>
</div>
<div style=3D"color:rgb(34,34,34); font-family:arial,sans-serif; font-size:=
12.8px; font-style:normal; font-weight:400; letter-spacing:normal; text-tra=
nsform:none; white-space:normal; word-spacing:0px">
because empty SOURCE_DATE_EPOCH is used in &quot;ts=3D`LC_ALL=3DC date -d @=
$SOURCE_DATE_EPOCH`&quot;. Testing SOURCE_DATE_EPOCH for empty or &quot;0&q=
uot; allows to use&nbsp;REPRODUCIBLE_TIMESTAMP_ROO<wbr>TFS as a default val=
ue again.</div>
<div style=3D"color:rgb(34,34,34); font-family:arial,sans-serif; font-size:=
12.8px; font-style:normal; font-weight:400; letter-spacing:normal; text-tra=
nsform:none; white-space:normal; word-spacing:0px">
<br>
</div>
<div style=3D"color:rgb(34,34,34); font-family:arial,sans-serif; font-size:=
12.8px; font-style:normal; font-weight:400; letter-spacing:normal; text-tra=
nsform:none; white-space:normal; word-spacing:0px">
These build failures seem to be triggered in all my builds since kernel.bbc=
lass was fixed to respect BUILD_REPRODUCIBLE_BINARIES in:</div>
<div><span style=3D"font-size:12.8px"><a href=3D"http://git.openembedded.or=
g/openembedded-core/commit/meta/classes/kernel.bbclass?id=3D27f87bbc8395a24=
81ef808465a62d213a6b678ac" target=3D"_blank">http://git.openembedded.org/op=
<wbr>enembedded-core/commit/meta/cl<wbr>asses/kernel.bbclass?id=3D27f87b<wb=
r>bc8395a2481ef808465a62d213a6b6<wbr>78ac</a></span><br>
</div>
<div><span style=3D"font-size:12.8px"><br>
</span></div>
<div><span style=3D"font-size:12.8px">One way to fit it would be to inherit=
&nbsp;<span style=3D"color:rgb(34,34,34); font-family:arial,sans-serif; fon=
t-size:12.8px; font-style:normal; font-weight:400; letter-spacing:normal; t=
ext-align:start; text-indent:0px; text-transform:none; white-space:normal; =
word-spacing:0px; background-color:rgb(255,255,255); float:none; display:in=
line">reproducible_</span><span style=3D"color:rgb(34,34,34); font-family:a=
rial,sans-serif; font-size:12.8px; font-style:normal; font-weight:400; lett=
er-spacing:normal; text-align:start; text-indent:0px; text-transform:none; =
white-space:normal; word-spacing:0px; background-color:rgb(255,255,255); fl=
oat:none; display:inline">build_sim<wbr>ple.bbclass,
 but this requirement to set exported SOURCE_DATE_EPOCH doesn't seem to be =
documented anywhere and looking at kernel.bbclass changes it probably wasn'=
t even intended like that.</span></span></div>
<div><span style=3D"font-size:12.8px"><span style=3D"color:rgb(34,34,34); f=
ont-family:arial,sans-serif; font-size:12.8px; font-style:normal; font-weig=
ht:400; letter-spacing:normal; text-align:start; text-indent:0px; text-tran=
sform:none; white-space:normal; word-spacing:0px; background-color:rgb(255,=
255,255); float:none; display:inline"><br>
</span></span></div>
<div><span style=3D"font-size:12.8px"><span style=3D"color:rgb(34,34,34); f=
ont-family:arial,sans-serif; font-size:12.8px; font-style:normal; font-weig=
ht:400; letter-spacing:normal; text-align:start; text-indent:0px; text-tran=
sform:none; white-space:normal; word-spacing:0px; background-color:rgb(255,=
255,255); float:none; display:inline">Thanks</span></span></div>
</span></div>
</div>
<div class=3D"m_-8114575700723207354HOEnZb">
<div class=3D"m_-8114575700723207354h5">
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On Mon, Mar 12, 2018 at 11:06 PM, <span dir=3D"l=
tr">&lt;<a href=3D"mailto:git@git.openembedded.org" target=3D"_blank">git@g=
it.openembedded.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
This is an automated email from the git hooks/post-receive script.<br>
<br>
rpurdie pushed a commit to branch master<br>
in repository openembedded-core.<br>
<br>
commit 5c2685c5ee2f8210a36b9a8591491b<wbr>6af0482084<br>
Author: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.com" targ=
et=3D"_blank">juro.bystricky@intel.com</a>&gt;<br>
AuthorDate: Sat Mar 10 10:57:49 2018 -0800<br>
<br>
&nbsp; &nbsp; reproducible_build_simple.bbcl<wbr>ass: simple environment fo=
r reproducible binaries<br>
<br>
&nbsp; &nbsp; Export environmental variables needed for binary reproducibil=
ity with consistent values.<br>
<br>
&nbsp; &nbsp; This class can be used either directly via:<br>
&nbsp; &nbsp; INHERIT &#43;=3D &quot;reproducible_build_simple&quot;<br>
<br>
&nbsp; &nbsp; or can be inherited by a more complex/complete bbclass, for e=
xample a bblass which<br>
&nbsp; &nbsp; will crack SOURCE_DATE_EPOCH for each recipe.<br>
<br>
&nbsp; &nbsp; Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.byst=
ricky@intel.com" target=3D"_blank">juro.bystricky@intel.com</a>&gt;<br>
&nbsp; &nbsp; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundatio<=
wbr>n.org</a>&gt;<br>
---<br>
&nbsp;meta/classes/reproducible_bui<wbr>ld_simple.bbclass | 11 &#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 11 insertions(&#43;)<br>
<br>
diff --git a/meta/classes/reproducible_bu<wbr>ild_simple.bbclass b/meta/cla=
sses/reproducible_bu<wbr>ild_simple.bbclass<br>
new file mode 100644<br>
index 0000000..dd11cd9<br>
--- /dev/null<br>
&#43;&#43;&#43; b/meta/classes/reproducible_bu<wbr>ild_simple.bbclass<br>
@@ -0,0 &#43;1,11 @@<br>
&#43;# Setup default environment for reproducible builds.<br>
&#43;<br>
&#43;BUILD_REPRODUCIBLE_BINARIES =3D &quot;1&quot;<br>
&#43;<br>
&#43;export PYTHONHASHSEED =3D &quot;0&quot;<br>
&#43;export PERL_HASH_SEED =3D &quot;0&quot;<br>
&#43;export TZ =3D 'UTC'<br>
&#43;export SOURCE_DATE_EPOCH ??=3D &quot;1520598896&quot;<br>
&#43;<br>
&#43;REPRODUCIBLE_TIMESTAMP_ROOTFS ??=3D &quot;1520598896&quot;<br>
&#43;<br>
<span class=3D"m_-8114575700723207354m_-2939368165476955101HOEnZb"><font co=
lor=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org" target=3D"_b=
lank">Openembedded-commits@lists.ope<wbr>nembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote>
</div>
<br>
</div>
</div>
</div>
</blockquote>
</div>
<br>
</div>
</div>
</div>
</blockquote>
</div>
<br>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_6E51916E4A1F32428260031F4C7CD2B64C673B99ORSMSX112amrcor_--
