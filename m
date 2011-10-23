Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RI6jp-0006Yx-Sh
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 00:41:54 +0200
Received: by ggnj1 with SMTP id j1so3587821ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2011 15:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0uS00Eaq3SUrS5zcbx277C5enNgpqSnGsjGsyccFAxY=;
	b=uP20psFuRxVuYTqlG2pB24DBGIBnsY5jv81X5WgY+Evbm/APaMLRIAH4t3e8s1sl6O
	3+voRuVoF16tuEyb3YsCfLPVURed85JVIyGqteFLhpbuFlaU6E95jbOH9zA+VB0lrSNl
	n4gxNbVlFrk2tibsTbRra/IMCi0/nQOEzajg4=
MIME-Version: 1.0
Received: by 10.68.17.225 with SMTP id r1mr44139133pbd.64.1319409356383; Sun,
	23 Oct 2011 15:35:56 -0700 (PDT)
Received: by 10.68.48.230 with HTTP; Sun, 23 Oct 2011 15:35:56 -0700 (PDT)
In-Reply-To: <4EA4757A.5010106@intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
	<9d70a72f5ab24bc0424f11311c8eb6b19f3d2987.1319394187.git.sgw@linux.intel.com>
	<CAMKF1soJ1Kv77_dNijQTWjzk8W+M5z2+yg2SUPxZtADLgum2CA@mail.gmail.com>
	<4EA4757A.5010106@intel.com>
Date: Sun, 23 Oct 2011 15:35:56 -0700
Message-ID: <CAMKF1sp9_6KVmQC1r4DYAPr6FSZLC54-41QoRN9-qhbhA1XKpA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Saul Wold <saul.wold@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 24/27] texi2html: Added recipe from OE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Oct 2011 22:41:54 -0000
Content-Type: multipart/alternative; boundary=bcaec520ea8500266a04affeee3e

--bcaec520ea8500266a04affeee3e
Content-Type: text/plain; charset=UTF-8

On Sunday, October 23, 2011, Saul Wold <saul.wold@intel.com> wrote:
> On 10/23/2011 01:06 PM, Khem Raj wrote:
>>
>>
>> On Sunday, October 23, 2011, Saul Wold <sgw@linux.intel.com
>> <mailto:sgw@linux.intel.com>> wrote:
>>  > Needed to build oe-core with oe-core
>>
> Nope, this is needed on the target image to build OE-core with an OE-Core
image.

Ok
>
> Sau!
>>
>> Oe-Core with oe-core did u mean meta-oe in one place ?
>>  >
>>  > Signed-off-by: Saul Wold <sgw@linux.intel.com
>> <mailto:sgw@linux.intel.com>>
>>  > ---
>>  >  meta/recipes-extended/texi2html/texi2html_1.82.bb
>> <http://texi2html_1.82.bb> |   14 ++++++++++++++
>>  >  1 files changed, 14 insertions(+), 0 deletions(-)
>>  >  create mode 100644 meta/recipes-extended/texi2html/texi2html_1.82.bb
>> <http://texi2html_1.82.bb>
>>  >
>>  > diff --git a/meta/recipes-extended/texi2html/texi2html_1.82.bb
>> <http://texi2html_1.82.bb>
>> b/meta/recipes-extended/texi2html/texi2html_1.82.bb
>> <http://texi2html_1.82.bb>
>>  > new file mode 100644
>>  > index 0000000..f19b576
>>  > --- /dev/null
>>  > +++ b/meta/recipes-extended/texi2html/texi2html_1.82.bb
>> <http://texi2html_1.82.bb>
>>  > @@ -0,0 +1,14 @@
>>  > +DESCRIPTION = "Perl script that converts Texinfo to HTML"
>>  > +HOMEPAGE    = "http://www.nongnu.org/texi2html/"
>>  > +SECTION     = "console/utils"
>>  > +LICENSE     = "GPLv2"
>>  > +LIC_FILES_CHKSUM =
"file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>>  > +
>>  > +PR = "r0"
>>  > +
>>  > +SRC_URI     =
>> "http://download.savannah.gnu.org/releases/texi2html/${P}.tar.bz2"
>>  > +
>>  > +SRC_URI[md5sum] = "a8a9193c0ac1bec2f3ca7be40a5a82eb"
>>  > +SRC_URI[sha256sum] =
>> "d69c1effc416896409003ea64fdb21152cc0a9a7c665d437a0a3bef9b588b4f1"
>>  > +
>>  > +inherit autotools
>>  > --
>>  > 1.7.6.4
>>  >
>>  >
>>  > _______________________________________________
>>  > Openembedded-core mailing list
>>  > Openembedded-core@lists.openembedded.org
>> <mailto:Openembedded-core@lists.openembedded.org>
>>  > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>  >
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--bcaec520ea8500266a04affeee3e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Sunday, October 23, 2011, Saul Wold &lt;<a href=3D"mailto:saul.w=
old@intel.com">saul.wold@intel.com</a>&gt; wrote:<br>&gt; On 10/23/2011 01:=
06 PM, Khem Raj wrote:<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; On Sunday, Octob=
er 23, 2011, Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux=
.intel.com</a><br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.=
com</a>&gt;&gt; wrote:<br>&gt;&gt; =C2=A0&gt; Needed to build oe-core with =
oe-core<br>&gt;&gt;<br>&gt; Nope, this is needed on the target image to bui=
ld OE-core with an OE-Core image.<br>
<br>Ok <br>&gt;<br>&gt; Sau!<br>&gt;&gt;<br>&gt;&gt; Oe-Core with oe-core d=
id u mean meta-oe in one place ?<br>&gt;&gt; =C2=A0&gt;<br>&gt;&gt; =C2=A0&=
gt; Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw=
@linux.intel.com</a><br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.=
com</a>&gt;&gt;<br>&gt;&gt; =C2=A0&gt; ---<br>&gt;&gt; =C2=A0&gt; =C2=A0met=
a/recipes-extended/texi2html/<a href=3D"http://texi2html_1.82.bb">texi2html=
_1.82.bb</a><br>
&gt;&gt; &lt;<a href=3D"http://texi2html_1.82.bb">http://texi2html_1.82.bb<=
/a>&gt; | =C2=A0 14 ++++++++++++++<br>&gt;&gt; =C2=A0&gt; =C2=A01 files cha=
nged, 14 insertions(+), 0 deletions(-)<br>&gt;&gt; =C2=A0&gt; =C2=A0create =
mode 100644 meta/recipes-extended/texi2html/<a href=3D"http://texi2html_1.8=
2.bb">texi2html_1.82.bb</a><br>
&gt;&gt; &lt;<a href=3D"http://texi2html_1.82.bb">http://texi2html_1.82.bb<=
/a>&gt;<br>&gt;&gt; =C2=A0&gt;<br>&gt;&gt; =C2=A0&gt; diff --git a/meta/rec=
ipes-extended/texi2html/<a href=3D"http://texi2html_1.82.bb">texi2html_1.82=
.bb</a><br>
&gt;&gt; &lt;<a href=3D"http://texi2html_1.82.bb">http://texi2html_1.82.bb<=
/a>&gt;<br>&gt;&gt; b/meta/recipes-extended/texi2html/<a href=3D"http://tex=
i2html_1.82.bb">texi2html_1.82.bb</a><br>&gt;&gt; &lt;<a href=3D"http://tex=
i2html_1.82.bb">http://texi2html_1.82.bb</a>&gt;<br>
&gt;&gt; =C2=A0&gt; new file mode 100644<br>&gt;&gt; =C2=A0&gt; index 00000=
00..f19b576<br>&gt;&gt; =C2=A0&gt; --- /dev/null<br>&gt;&gt; =C2=A0&gt; +++=
 b/meta/recipes-extended/texi2html/<a href=3D"http://texi2html_1.82.bb">tex=
i2html_1.82.bb</a><br>
&gt;&gt; &lt;<a href=3D"http://texi2html_1.82.bb">http://texi2html_1.82.bb<=
/a>&gt;<br>&gt;&gt; =C2=A0&gt; @@ -0,0 +1,14 @@<br>&gt;&gt; =C2=A0&gt; +DES=
CRIPTION =3D &quot;Perl script that converts Texinfo to HTML&quot;<br>&gt;&=
gt; =C2=A0&gt; +HOMEPAGE =C2=A0 =C2=A0=3D &quot;<a href=3D"http://www.nongn=
u.org/texi2html/">http://www.nongnu.org/texi2html/</a>&quot;<br>
&gt;&gt; =C2=A0&gt; +SECTION =C2=A0 =C2=A0 =3D &quot;console/utils&quot;<br=
>&gt;&gt; =C2=A0&gt; +LICENSE =C2=A0 =C2=A0 =3D &quot;GPLv2&quot;<br>&gt;&g=
t; =C2=A0&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D59530bdf3365=
9b29e73d4adb9f9f6552&quot;<br>&gt;&gt; =C2=A0&gt; +<br>
&gt;&gt; =C2=A0&gt; +PR =3D &quot;r0&quot;<br>&gt;&gt; =C2=A0&gt; +<br>&gt;=
&gt; =C2=A0&gt; +SRC_URI =C2=A0 =C2=A0 =3D<br>&gt;&gt; &quot;<a href=3D"htt=
p://download.savannah.gnu.org/releases/texi2html/${P}.tar.bz2">http://downl=
oad.savannah.gnu.org/releases/texi2html/${P}.tar.bz2</a>&quot;<br>
&gt;&gt; =C2=A0&gt; +<br>&gt;&gt; =C2=A0&gt; +SRC_URI[md5sum] =3D &quot;a8a=
9193c0ac1bec2f3ca7be40a5a82eb&quot;<br>&gt;&gt; =C2=A0&gt; +SRC_URI[sha256s=
um] =3D<br>&gt;&gt; &quot;d69c1effc416896409003ea64fdb21152cc0a9a7c665d437a=
0a3bef9b588b4f1&quot;<br>
&gt;&gt; =C2=A0&gt; +<br>&gt;&gt; =C2=A0&gt; +inherit autotools<br>&gt;&gt;=
 =C2=A0&gt; --<br>&gt;&gt; =C2=A0&gt; 1.7.6.4<br>&gt;&gt; =C2=A0&gt;<br>&gt=
;&gt; =C2=A0&gt;<br>&gt;&gt; =C2=A0&gt; ___________________________________=
____________<br>&gt;&gt; =C2=A0&gt; Openembedded-core mailing list<br>
&gt;&gt; =C2=A0&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.=
org">Openembedded-core@lists.openembedded.org</a><br>&gt;&gt; &lt;mailto:<a=
 href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core=
@lists.openembedded.org</a>&gt;<br>
&gt;&gt; =C2=A0&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/l=
istinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listi=
nfo/openembedded-core</a><br>&gt;&gt; =C2=A0&gt;<br>&gt;&gt;<br>&gt;&gt;<br=
>&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>&gt;&gt; <a href=3D"mailto:Opene=
mbedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.o=
rg</a><br>&gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listin=
fo/openembedded-core</a><br>
&gt;<br>&gt;

--bcaec520ea8500266a04affeee3e--
