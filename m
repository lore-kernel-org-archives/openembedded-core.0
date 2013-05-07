Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UZeoy-0003uV-Lw
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 12:08:32 +0200
Received: by mail-wi0-f182.google.com with SMTP id m6so395253wiv.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 02:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=qByS9HA8dSVqHKMEdliUhD0ZbLHMXwCFN+Tk54Oo1SQ=;
	b=RNU5hKsPjIpr5zGrmm2+xFMUgHcMPfW5/ZzEc9kqxSNBe4nZhDt3NTyoBmk1wJ58jk
	lURqqEgut4m0czYKrNOG9DanXeYk+7tMeyUs/8YMfJMctJvSCUhzzHiyNI6vCK3x/2LT
	IHDoUhMcswv1lS/57GpvNiqcaQQUigVp0CqzValI1NzTdPsm8S3YHGKy+UKhT8ticOiE
	jqqZeCSx9aF4VrAlM3BxENy5gnpy6Ftbi8uJbqVqiysL3JHj3FDxhMdRqgVALmiyYbhV
	xK678rya+C187I3pM1jEJQy+A4DyejBAMvn3ql2AgNk+vQBLnqszVBHH6FKXiBNDLg2U
	ompw==
X-Received: by 10.180.198.49 with SMTP id iz17mr13443501wic.19.1367920232149; 
	Tue, 07 May 2013 02:50:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.6.38 with HTTP; Tue, 7 May 2013 02:50:12 -0700 (PDT)
In-Reply-To: <20130507091051.GC3187@jama>
References: <1367917682-23214-1-git-send-email-bogdan.a.marinescu@intel.com>
	<20130507091051.GC3187@jama>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Tue, 7 May 2013 12:50:12 +0300
Message-ID: <CAMZjud0fbNeKVqV8v931xkD5FAF0HsyeNDG7zRczcySUKyubJQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQnBFsVQZ4gKd45qLq+mnR1hnG9xdQjGPibMVYadIN125k8OSobNcob/XD13WsR0MyeeZHWX
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-scons: upgraded to 2.3.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 10:08:33 -0000
Content-Type: multipart/alternative; boundary=047d7b624d3c84cfc204dc1dbf62

--047d7b624d3c84cfc204dc1dbf62
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 7, 2013 at 12:10 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Tue, May 07, 2013 at 12:08:02PM +0300, Bogdan Marinescu wrote:
> > "2013" was added in the 'Copyright' line in LICENSE.txt.
> >
> > Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> > ---
> >  ...ons-native_2.2.0.bb => python-scons-native_2.3.0.bb} |    2 +-
> >  meta/recipes-devtools/python/python-scons_2.2.0.bb      |   15
> ---------------
> >  meta/recipes-devtools/python/python-scons_2.3.0.bb      |   14
> ++++++++++++++
> >  3 files changed, 15 insertions(+), 16 deletions(-)
> >  rename meta/recipes-devtools/python/{python-scons-native_2.2.0.bb =>
> python-scons-native_2.3.0.bb} (100%)
> >  delete mode 100644 meta/recipes-devtools/python/python-scons_2.2.0.bb
> >  create mode 100644 meta/recipes-devtools/python/python-scons_2.3.0.bb
> >
> > diff --git a/meta/recipes-devtools/python/python-scons-native_2.2.0.bbb/meta/recipes-devtools/python/
> python-scons-native_2.3.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/python/python-scons-native_2.2.0.bb
> > rename to meta/recipes-devtools/python/python-scons-native_2.3.0.bb
> > index 701e0f7..87450b6 100644
> > --- a/meta/recipes-devtools/python/python-scons-native_2.2.0.bb
> > +++ b/meta/recipes-devtools/python/python-scons-native_2.3.0.bb
> > @@ -1,5 +1,5 @@
> >  require python-scons_${PV}.bb
> >  inherit native pythonnative
> >  DEPENDS = "python-native"
> > -RDEPENDS_${PN} = ""
> >  PR = "r0"
>
> You can drop PR here.
>

Thanks. I've sent a new version of the patch.


>
> > +RDEPENDS_${PN} = ""
> > diff --git a/meta/recipes-devtools/python/python-scons_2.2.0.bbb/meta/recipes-devtools/python/
> python-scons_2.2.0.bb
> > deleted file mode 100644
> > index b796ae8..0000000
> > --- a/meta/recipes-devtools/python/python-scons_2.2.0.bb
> > +++ /dev/null
> > @@ -1,15 +0,0 @@
> > -DESCRIPTION = "A Software Construction Tool"
> > -SECTION = "devel/python"
> > -LICENSE = "MIT"
> > -LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=61e6307bb15ee490a9ec01fd27022d7e"
> > -SRCNAME = "scons"
> > -
> > -PR = "r0"
> > -
> > -SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] = "f737f474a02d08156c821bd2d4d4b632"
> > -SRC_URI[sha256sum] =
> "f7fcd11a7af7ec13d587a2f7cf14a92e3223eea64bf078454a9856ec0ab465b9"
> > -S = "${WORKDIR}/${SRCNAME}-${PV}"
> > -
> > -inherit distutils
> > diff --git a/meta/recipes-devtools/python/python-scons_2.3.0.bbb/meta/recipes-devtools/python/
> python-scons_2.3.0.bb
> > new file mode 100644
> > index 0000000..1110f6e
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python-scons_2.3.0.bb
> > @@ -0,0 +1,14 @@
> > +DESCRIPTION = "A Software Construction Tool"
> > +SECTION = "devel/python"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=98e9a1e6029e715255c52032a1eba637"
> > +SRCNAME = "scons"
> > +
> > +SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
> > +
> > +SRC_URI[md5sum] = "083ce5624d6adcbdaf2526623f456ca9"
> > +SRC_URI[sha256sum] =
> "9442069999cf4b2caa94a5886ab4c2c71de1718ed5e9176c18e2b6dbca463b4b"
> > +
> > +S = "${WORKDIR}/${SRCNAME}-${PV}"
> > +
> > +inherit distutils
> > --
> > 1.7.10.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--047d7b624d3c84cfc204dc1dbf62
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, May 7, 2013 at 12:10 PM, Martin Jansa <span dir=3D"ltr">&lt=
;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@g=
mail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue, May 07, 2013 at 12=
:08:02PM +0300, Bogdan Marinescu wrote:<br>
&gt; &quot;2013&quot; was added in the &#39;Copyright&#39; line in LICENSE.=
txt.<br>
&gt;<br>
&gt; Signed-off-by: Bogdan Marinescu &lt;<a href=3D"mailto:bogdan.a.marines=
cu@intel.com">bogdan.a.marinescu@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0...<a href=3D"http://ons-native_2.2.0.bb" target=3D"_blank">ons-nat=
ive_2.2.0.bb</a> =3D&gt; <a href=3D"http://python-scons-native_2.3.0.bb" ta=
rget=3D"_blank">python-scons-native_2.3.0.bb</a>} | =A0 =A02 +-<br>
&gt; =A0meta/recipes-devtools/python/<a href=3D"http://python-scons_2.2.0.b=
b" target=3D"_blank">python-scons_2.2.0.bb</a> =A0 =A0 =A0| =A0 15 --------=
-------<br>
&gt; =A0meta/recipes-devtools/python/<a href=3D"http://python-scons_2.3.0.b=
b" target=3D"_blank">python-scons_2.3.0.bb</a> =A0 =A0 =A0| =A0 14 ++++++++=
++++++<br>
&gt; =A03 files changed, 15 insertions(+), 16 deletions(-)<br>
&gt; =A0rename meta/recipes-devtools/python/{<a href=3D"http://python-scons=
-native_2.2.0.bb" target=3D"_blank">python-scons-native_2.2.0.bb</a> =3D&gt=
; <a href=3D"http://python-scons-native_2.3.0.bb" target=3D"_blank">python-=
scons-native_2.3.0.bb</a>} (100%)<br>


&gt; =A0delete mode 100644 meta/recipes-devtools/python/<a href=3D"http://p=
ython-scons_2.2.0.bb" target=3D"_blank">python-scons_2.2.0.bb</a><br>
&gt; =A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://p=
ython-scons_2.3.0.bb" target=3D"_blank">python-scons_2.3.0.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python-sco=
ns-native_2.2.0.bb" target=3D"_blank">python-scons-native_2.2.0.bb</a> b/me=
ta/recipes-devtools/python/<a href=3D"http://python-scons-native_2.3.0.bb" =
target=3D"_blank">python-scons-native_2.3.0.bb</a><br>


&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/python/<a href=3D"http://python-scon=
s-native_2.2.0.bb" target=3D"_blank">python-scons-native_2.2.0.bb</a><br>
&gt; rename to meta/recipes-devtools/python/<a href=3D"http://python-scons-=
native_2.3.0.bb" target=3D"_blank">python-scons-native_2.3.0.bb</a><br>
&gt; index 701e0f7..87450b6 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python-scons-nati=
ve_2.2.0.bb" target=3D"_blank">python-scons-native_2.2.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python-scons-nati=
ve_2.3.0.bb" target=3D"_blank">python-scons-native_2.3.0.bb</a><br>
&gt; @@ -1,5 +1,5 @@<br>
&gt; =A0require python-scons_${PV}.bb<br>
&gt; =A0inherit native pythonnative<br>
&gt; =A0DEPENDS =3D &quot;python-native&quot;<br>
&gt; -RDEPENDS_${PN} =3D &quot;&quot;<br>
&gt; =A0PR =3D &quot;r0&quot;<br>
<br>
</div>You can drop PR here.<br></blockquote><div><br></div><div style>Thank=
s. I&#39;ve sent a new version of the patch.</div><div style>=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">


<div><div class=3D"h5"><br>
&gt; +RDEPENDS_${PN} =3D &quot;&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python-sco=
ns_2.2.0.bb" target=3D"_blank">python-scons_2.2.0.bb</a> b/meta/recipes-dev=
tools/python/<a href=3D"http://python-scons_2.2.0.bb" target=3D"_blank">pyt=
hon-scons_2.2.0.bb</a><br>


&gt; deleted file mode 100644<br>
&gt; index b796ae8..0000000<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python-scons_2.2.=
0.bb" target=3D"_blank">python-scons_2.2.0.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,15 +0,0 @@<br>
&gt; -DESCRIPTION =3D &quot;A Software Construction Tool&quot;<br>
&gt; -SECTION =3D &quot;devel/python&quot;<br>
&gt; -LICENSE =3D &quot;MIT&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D61e6307bb15ee490a=
9ec01fd27022d7e&quot;<br>
&gt; -SRCNAME =3D &quot;scons&quot;<br>
&gt; -<br>
&gt; -PR =3D &quot;r0&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz&quot=
;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;f737f474a02d08156c821bd2d4d4b632&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;f7fcd11a7af7ec13d587a2f7cf14a92e3223eea6=
4bf078454a9856ec0ab465b9&quot;<br>
&gt; -S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
&gt; -<br>
&gt; -inherit distutils<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python-sco=
ns_2.3.0.bb" target=3D"_blank">python-scons_2.3.0.bb</a> b/meta/recipes-dev=
tools/python/<a href=3D"http://python-scons_2.3.0.bb" target=3D"_blank">pyt=
hon-scons_2.3.0.bb</a><br>


&gt; new file mode 100644<br>
&gt; index 0000000..1110f6e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python-scons_2.3.=
0.bb" target=3D"_blank">python-scons_2.3.0.bb</a><br>
&gt; @@ -0,0 +1,14 @@<br>
&gt; +DESCRIPTION =3D &quot;A Software Construction Tool&quot;<br>
&gt; +SECTION =3D &quot;devel/python&quot;<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D98e9a1e6029e71525=
5c52032a1eba637&quot;<br>
&gt; +SRCNAME =3D &quot;scons&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz&quot=
;<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;083ce5624d6adcbdaf2526623f456ca9&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;9442069999cf4b2caa94a5886ab4c2c71de1718e=
d5e9176c18e2b6dbca463b4b&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
&gt; +<br>
&gt; +inherit distutils<br>
&gt; --<br>
&gt; 1.7.10.4<br>
&gt;<br>
&gt;<br>
</div></div>&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Martin &#39;JaMa&#39; Jansa =A0 =A0 jabber: <a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span></blockquote></div><br></div></div>

--047d7b624d3c84cfc204dc1dbf62--
