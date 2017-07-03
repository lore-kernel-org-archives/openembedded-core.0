Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id D8540776F4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 19:38:16 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id 70so21120995wmo.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 12:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ExsS7lYaKZ82IJozw1b9s2cLewb/v3OIU5yRDBhd1l4=;
	b=d5xJMXO+TFqdpLn00eoScS/dg4+Juf8sAd/Uvq/KzbbPwqO8cp2z5hsZJrEF6b/8kI
	02xHfL8jNaOrlqM+XiigScbTZH96cN9BSiyPkYygHOTuFIm7QK9723mRcl6+K0+bm6T5
	oXgaf+HzmJjfnpDgoYQYOswu0ygmwZcA/jk5ZSVgYcVt7FW7rbfFOwKfIBmM5/DE3KBt
	/vy8MWoozKk4cqChhxvqSpLihoIvaI4qoi+DxLGVTKF8HBmhSfQDRNYMU0yDI45YxsYH
	FncRABSmrQaybnoBKV+3hJy2NptA9K1Anz0vJXpQd1uBM5KxQ49+B/hxHHQkKvme2gCI
	B5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ExsS7lYaKZ82IJozw1b9s2cLewb/v3OIU5yRDBhd1l4=;
	b=rVKFncYUbp/OcwM6zb8YZyq+VB2PdBp7DwPRW7h6gGSAGNCzbpRFze9gjnYmRYnV04
	b0AKyjtiGmtwkFwQjxA4BZShcpM6+TrSrBmf34JvPgCGEMGSCxsWYsQnAq1PSmNfQpWV
	cp4oFLCPE8WIdIofGLE3vyNfkKqI3W8kmSreiM04J3ZlbZ0wb06mxg1u0ucTy15XvfQf
	CVIZDeCRXbbC34zc4JEHL79xIsembEu6W540QB6nCHzdgcp13xJcKH5VLY98TNTzDu8x
	Yqmox0JxxKX5frcDILE/3X+NSxfch+0vYlkhuWzsLh5nP/XydhlfVVlccKhGXIoI1wBW
	kUEA==
X-Gm-Message-State: AIVw110Zkz0b5VowKU/TBl1wEVNUsA7U1a9VA7TzEHYBRMSb99101gca
	VGzibykGc2XLWp33WKog9wMQ7jUf+Q==
X-Received: by 10.80.175.198 with SMTP id h64mr3764180edd.131.1499110697111;
	Mon, 03 Jul 2017 12:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20170703162641.42332-1-jose.perez.carranza@linux.intel.com>
	<CAMKF1sruAfdxjtU3wO9=JLNbEyS3v=ZoctTSY+pCKY6zT+ovZg@mail.gmail.com>
	<3bd8e1e2-b5f5-48fa-71be-0b83bbeffb9e@linux.intel.com>
In-Reply-To: <3bd8e1e2-b5f5-48fa-71be-0b83bbeffb9e@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 03 Jul 2017 19:38:05 +0000
Message-ID: <CAMKF1sq5bpXcPuiSdRUrGtXH=xaAC_uOKbQN3_by6Eh820isNg@mail.gmail.com>
To: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/sdk: Replace buildiptables for buildgzip tests
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
X-List-Received-Date: Mon, 03 Jul 2017 19:38:17 -0000
Content-Type: multipart/alternative; boundary="94eb2c195f5894971305536ee8d7"

--94eb2c195f5894971305536ee8d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 3, 2017 at 12:25 PM Jose Perez Carranza <
jose.perez.carranza@linux.intel.com> wrote:

> On 07/03/2017 11:59 AM, Khem Raj wrote:
> > On Mon, Jul 3, 2017 at 9:26 AM,  <jose.perez.carranza@linux.intel.com>
> wrote:
> >> From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
> >>
> >> Buildiptables test cases are conflicting with images built with =E2=80=
=9Cmusl=E2=80=9D
> >> as standard C library, in order to avoid those issues gzip package was
> >> selected to be used on the tests as this does not conflicts with =E2=
=80=9Cmusl=E2=80=9D.
> >>
> >> [YOCTO #11713]
> > I see that gzip recipes also have musl appends for do_configure, I
> > understand, that this test case will compile on device so it will get
> > hosted env and it might be working fine. I would think it will be good
> > to use a package which we dont patch even in OE
> I did some test also suing "Lzip", I did not see any reference to "musl"
> on that recipe, did you see any problem using "lzip"instead "gzip"?


Lzip should be ok


>
> Regards
> Jos=C3=A9
> >
> >> Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.co=
m
> >
> >> ---
> >>   meta/lib/oeqa/sdk/cases/{buildiptables.py =3D> buildgzip.py} | 8
> ++++----
> >>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>   rename meta/lib/oeqa/sdk/cases/{buildiptables.py =3D> buildgzip.py}
> (84%)
> >>
> >> diff --git a/meta/lib/oeqa/sdk/cases/buildiptables.py
> b/meta/lib/oeqa/sdk/cases/buildgzip.py
> >> similarity index 84%
> >> rename from meta/lib/oeqa/sdk/cases/buildiptables.py
> >> rename to meta/lib/oeqa/sdk/cases/buildgzip.py
> >> index 419c7ebd09b..a92df65c28b 100644
> >> --- a/meta/lib/oeqa/sdk/cases/buildiptables.py
> >> +++ b/meta/lib/oeqa/sdk/cases/buildgzip.py
> >> @@ -3,15 +3,15 @@ from oeqa.sdk.case import OESDKTestCase
> >>   from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
> >>
> >>
> >> -class BuildIptablesTest(OESDKTestCase):
> >> +class BuildGzipTest(OESDKTestCase):
> >>       td_vars =3D ['DATETIME']
> >>
> >>       @classmethod
> >>       def setUpClass(self):
> >>           dl_dir =3D self.td.get('DL_DIR', None)
> >>
> >> -        self.project =3D SDKBuildProject(self.tc.sdk_dir + "/iptables=
/",
> self.tc.sdk_env,
> >> -                        "
> http://downloads.yoctoproject.org/mirror/sources/iptables-1.4.13.tar.bz2"=
,
> >> +        self.project =3D SDKBuildProject(self.tc.sdk_dir + "/gzip/",
> self.tc.sdk_env,
> >> +                        "
> http://downloads.yoctoproject.org/mirror/sources/gzip-1.8.tar.gz",
> >>                           self.tc.sdk_dir, self.td['DATETIME'],
> dl_dir=3Ddl_dir)
> >>           self.project.download_archive()
> >>
> >> @@ -21,7 +21,7 @@ class BuildIptablesTest(OESDKTestCase):
> >>                   self.tc.hasTargetPackage("gcc")):
> >>               raise unittest.SkipTest("SDK doesn't contain a
> cross-canadian toolchain")
> >>
> >> -    def test_iptables(self):
> >> +    def test_gzip(self):
> >>           self.assertEqual(self.project.run_configure(), 0,
> >>                           msg=3D"Running configure failed")
> >>
> >> --
> >> 2.12.0
> >>
>
> --
> Saludos
> Jos=C3=A9
>
>

--94eb2c195f5894971305536ee8d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Mon, Jul 3, 2017 a=
t 12:25 PM Jose Perez Carranza &lt;<a href=3D"mailto:jose.perez.carranza@li=
nux.intel.com">jose.perez.carranza@linux.intel.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 07/03/2017 11:59 AM, Khem Raj wrote:<br>
&gt; On Mon, Jul 3, 2017 at 9:26 AM,=C2=A0 &lt;<a href=3D"mailto:jose.perez=
.carranza@linux.intel.com" target=3D"_blank">jose.perez.carranza@linux.inte=
l.com</a>&gt; wrote:<br>
&gt;&gt; From: Jose Perez Carranza &lt;<a href=3D"mailto:jose.perez.carranz=
a@linux.intel.com" target=3D"_blank">jose.perez.carranza@linux.intel.com</a=
>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Buildiptables test cases are conflicting with images built with =
=E2=80=9Cmusl=E2=80=9D<br>
&gt;&gt; as standard C library, in order to avoid those issues gzip package=
 was<br>
&gt;&gt; selected to be used on the tests as this does not conflicts with =
=E2=80=9Cmusl=E2=80=9D.<br>
&gt;&gt;<br>
&gt;&gt; [YOCTO #11713]<br>
&gt; I see that gzip recipes also have musl appends for do_configure, I<br>
&gt; understand, that this test case will compile on device so it will get<=
br>
&gt; hosted env and it might be working fine. I would think it will be good=
<br>
&gt; to use a package which we dont patch even in OE<br>
I did some test also suing &quot;Lzip&quot;, I did not see any reference to=
 &quot;musl&quot;<br>
on that recipe, did you see any problem using &quot;lzip&quot;instead &quot=
;gzip&quot;?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Lzip=
 should be ok=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><br>
<br>
Regards<br>
Jos=C3=A9<br>
&gt;<br>
&gt;&gt; Signed-off-by: Jose Perez Carranza &lt;<a href=3D"mailto:jose.pere=
z.carranza@linux.intel.com" target=3D"_blank">jose.perez.carranza@linux.int=
el.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/lib/oeqa/sdk/cases/{buildiptables.py =3D&gt; buil=
dgzip.py} | 8 ++++----<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;&gt;=C2=A0 =C2=A0rename meta/lib/oeqa/sdk/cases/{buildiptables.py =3D&g=
t; buildgzip.py} (84%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/lib/oeqa/sdk/cases/buildiptables.py b/meta/lib/o=
eqa/sdk/cases/buildgzip.py<br>
&gt;&gt; similarity index 84%<br>
&gt;&gt; rename from meta/lib/oeqa/sdk/cases/buildiptables.py<br>
&gt;&gt; rename to meta/lib/oeqa/sdk/cases/buildgzip.py<br>
&gt;&gt; index 419c7ebd09b..a92df65c28b 100644<br>
&gt;&gt; --- a/meta/lib/oeqa/sdk/cases/buildiptables.py<br>
&gt;&gt; +++ b/meta/lib/oeqa/sdk/cases/buildgzip.py<br>
&gt;&gt; @@ -3,15 +3,15 @@ from oeqa.sdk.case import OESDKTestCase<br>
&gt;&gt;=C2=A0 =C2=A0from oeqa.sdk.utils.sdkbuildproject import SDKBuildPro=
ject<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -class BuildIptablesTest(OESDKTestCase):<br>
&gt;&gt; +class BuildGzipTest(OESDKTestCase):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0td_vars =3D [&#39;DATETIME&#39;]<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@classmethod<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def setUpClass(self):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dl_dir =3D self.td.get(&#3=
9;DL_DIR&#39;, None)<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.project =3D SDKBuildProject(self=
.tc.sdk_dir + &quot;/iptables/&quot;, self.tc.sdk_env,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://downloads.yoctoproject.org/mir=
ror/sources/iptables-1.4.13.tar.bz2" rel=3D"noreferrer" target=3D"_blank">h=
ttp://downloads.yoctoproject.org/mirror/sources/iptables-1.4.13.tar.bz2</a>=
&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.project =3D SDKBuildProject(self=
.tc.sdk_dir + &quot;/gzip/&quot;, self.tc.sdk_env,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://downloads.yoctoproject.org/mir=
ror/sources/gzip-1.8.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://do=
wnloads.yoctoproject.org/mirror/sources/gzip-1.8.tar.gz</a>&quot;,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.tc.sdk_dir, <a href=3D"http://self.td" =
rel=3D"noreferrer" target=3D"_blank">self.td</a>[&#39;DATETIME&#39;], dl_di=
r=3Ddl_dir)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.project.download_arch=
ive()<br>
&gt;&gt;<br>
&gt;&gt; @@ -21,7 +21,7 @@ class BuildIptablesTest(OESDKTestCase):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.tc.hasTargetPackage(&quot;gcc&quot;)):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise unitte=
st.SkipTest(&quot;SDK doesn&#39;t contain a cross-canadian toolchain&quot;)=
<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 def test_iptables(self):<br>
&gt;&gt; +=C2=A0 =C2=A0 def test_gzip(self):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(self.proj=
ect.run_configure(), 0,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg=3D&quot;Running configure failed&quot;)<=
br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.12.0<br>
&gt;&gt;<br>
<br>
--<br>
Saludos<br>
Jos=C3=A9<br>
<br>
</blockquote></div></div>

--94eb2c195f5894971305536ee8d7--
