Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9E6887888A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 17:34:52 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id c11so4385330ith.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 09:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m2Guiq5QCyjU/Z+2BSRgWRsnN70UHwouIRNtgEbDZBo=;
	b=UoO+EVr/2tiarZfxviJi1UQqwRYOAl8Ag+kw7pXVaCcXTpqZ+8JJD3UMgezcFR+YU/
	6MKPpAokExVP7swDdM5I+rA0WyXKdaugum8nq4uIAQ33ovLPjROIOavj+k8Dg8fmbRCn
	VdcTvQYOUCq1V7MB5U9AdLxCkdbxYjP1npPH7SI/AWt7nFD+t2RarfzRTdJgJEYwJVYw
	MHKoH5oiQrlXCokecitce2RAoF6HJqtknMGmQ1lcbKTQLWCmnV9QR7R0W/5JEMl1xcZo
	jK7/OCkuNkujfBsa2mXtpUdiPfFe+ZyPNPIivlEMbajkbkC8pVNVch0Ff/njQws7uhzb
	0jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m2Guiq5QCyjU/Z+2BSRgWRsnN70UHwouIRNtgEbDZBo=;
	b=tndYvumP/sOlNtPpUNrDbT+y2rKQ5JUqqjBrVRO/dT3Fjh+AjaVuZvF0lY51DwwrDK
	pzi2nhM3Mbm28uxwgLJbLToAr9oWzNGzX1h7CWGkmCoKFhCNvRbqlYojg02inzQIb2wN
	gogB2ux2PO+UOATw0ELP1nN4tI+ekN6P7g5542uaJo+IOEQtkMYfla5zv9m9GREy6sQP
	N6Ki9x5VKng/Hbjf0kS4WVcsdmNUKxloAfaXAiRVQNlNLc2sjAe43i2TNuNqQVdrbJVb
	bQ2kFQkKC8jR5MyOavrONewRh4uwdUtx3YbinuDK+1Pz+XCxbiWNgsjLGmoJRVFKw60k
	W9xQ==
X-Gm-Message-State: APf1xPAtmLBtaGgY8JR13q9FnXGrIncrtJQERqAxH2EEy8r4X3H2ZR8z
	/REST1x3YyqfzPs2R/ZZ7BVgqbEoVESw7ddvHCo03Q==
X-Google-Smtp-Source: AG47ELt5OteMWOMCbdHaGOpZ0l3gUVygOfyXT762miTKNO1zx9hjplOVcorK9SS5OBGQxnnkwrtiY0r0JAI6v5s81KM=
X-Received: by 10.36.82.84 with SMTP id d81mr21855632itb.34.1519839293623;
	Wed, 28 Feb 2018 09:34:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Wed, 28 Feb 2018 09:34:33 -0800 (PST)
In-Reply-To: <20180228145424.GA23739@mbabyjoh-desk.ger.corp.intel.com>
References: <1519762766-20100-1-git-send-email-juro.bystricky@intel.com>
	<20180228145424.GA23739@mbabyjoh-desk.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Feb 2018 17:34:33 +0000
Message-ID: <CAJTo0LYcvzqc+KZeOdWQiSHpahAD0X1Mnj4WDv0OEh-JmW012g@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus-test_1.12.2: various fixes
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
X-List-Received-Date: Wed, 28 Feb 2018 17:34:52 -0000
Content-Type: multipart/alternative; boundary="001a11449248366d24056649299e"

--001a11449248366d24056649299e
Content-Type: text/plain; charset="UTF-8"

So the problem is that dbus-test has a libdbus-1.so.3 and if it is built
after dbus then it wins the race for "who provides libdbus.so".  Obviously
this isn't right, I'm testing a fix now using PRIVATE_LIBS and want to file
a bug to fix this behviour in 2.6.

Ross

On 28 February 2018 at 14:54, Maxin B. John <maxin.john@intel.com> wrote:

> Hi,
>
> On Tue, Feb 27, 2018 at 12:19:26PM -0800, Juro Bystricky wrote:
> > The result of running dbus-test-ptest was a series of
> > various segfaults, interpreted as FAILs. This was a direct consequence
> > of the test suite loading the installed shared library libdbus-1.so, not
> the
> > one built along the test suite.
> >
> > While we normally want to test against the installed libraries, we cannot
> > do this in this case as the test suite expects a library that is
> configured/compiled
> > differently from the installed one. We could configure the installed
> library
> > identically as the test suite expects, (and there should be no issues),
> however
> > this is not desirable for performance reasons.
> >
> > Hence we need to use the library built along with the test suite.
> > Of course, running the test suite against its own library does not
> > test the installed library, however they are both built from the same
> > sources so that can give us some kind of indication.
> >
> > The following changes were made:
> >
> > 1. Configure the test library as close as possible to the installed one,
> >    with some additional configuration options that are needed for
> testing.
> >    (Use dbus_1.12.2.bb recipe as a template)
> > 2. Include the shared libraries in the package, use LD_LIBRARY_PATH
> during
> >    testing to load them instead of the installed ones.
> > 3. Add a few more tests. (There are still some additional tests built
> that
> >    are not used, but they would have to be special-cased).
> > 4. When evaluating the test results, differentiate between "FAIL" and
> "SKIP"
> >
> > [YOCTO #10841]
> > [YOCTO #12277]
> >
> > Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> > ---
> >  meta/recipes-core/dbus/dbus-test_1.12.2.bb | 30
> ++++++++++++++++++++++++++----
> >  meta/recipes-core/dbus/dbus/run-ptest      | 20 +++++++++++++++++---
> >  2 files changed, 43 insertions(+), 7 deletions(-)
>
> Probably due to this change, dbus ptest related sanity tests fails here:
>
> https://autobuilder.yocto.io/builders/nightly-deb-non-deb/
> builds/813/steps/Running%20Sanity%20Tests/logs/stdio
>
>
> NOTE:  ... ok
> | NOTE: ============================================================
> ==========
> | NOTE: FAIL: test_ptestrunner (ptest.PtestRunnerTest)
> | NOTE: ------------------------------------------------------------
> ----------
> | NOTE: Traceback (most recent call last):
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-deb-non-deb/build/meta/lib/oeqa/core/decorator/__init__.py", line
> 32, in wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-deb-non-deb/build/meta/lib/oeqa/core/decorator/__init__.py", line
> 32, in wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-deb-non-deb/build/meta/lib/oeqa/core/decorator/__init__.py", line
> 32, in wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-deb-non-deb/build/meta/lib/oeqa/runtime/cases/ptest.py", line 93,
> in test_ptestrunner
> |     self.assertFalse(failed_tests, msg = "Failed ptests: %s"
> %(str(failed_tests)))
> | AssertionError: {'dbus-test': [' test/test-bus', '
> test/test-dbus-daemon', ' test/test-names']} is not false : Failed ptests:
> {'dbus-test': [' test/test-bus', ' test/test-dbus-daemon', '
> test/test-names']}
>
>
> Best Regards,
> Maxin
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11449248366d24056649299e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So the problem is that dbus-test has a libdbus-1.so.3 and =
if it is built after dbus then it wins the race for &quot;who provides libd=
bus.so&quot;.=C2=A0 Obviously this isn&#39;t right, I&#39;m testing a fix n=
ow using PRIVATE_LIBS and want to file a bug to fix this behviour in 2.6.<d=
iv><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 28 February 2018 at 14:54, Maxin B. John <span dir=3D"l=
tr">&lt;<a href=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.joh=
n@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<div><div class=3D"h5"><br>
On Tue, Feb 27, 2018 at 12:19:26PM -0800, Juro Bystricky wrote:<br>
&gt; The result of running dbus-test-ptest was a series of<br>
&gt; various segfaults, interpreted as FAILs. This was a direct consequence=
<br>
&gt; of the test suite loading the installed shared library libdbus-1.so, n=
ot the<br>
&gt; one built along the test suite.<br>
&gt;<br>
&gt; While we normally want to test against the installed libraries, we can=
not<br>
&gt; do this in this case as the test suite expects a library that is confi=
gured/compiled<br>
&gt; differently from the installed one. We could configure the installed l=
ibrary<br>
&gt; identically as the test suite expects, (and there should be no issues)=
, however<br>
&gt; this is not desirable for performance reasons.<br>
&gt;<br>
&gt; Hence we need to use the library built along with the test suite.<br>
&gt; Of course, running the test suite against its own library does not<br>
&gt; test the installed library, however they are both built from the same<=
br>
&gt; sources so that can give us some kind of indication.<br>
&gt;<br>
&gt; The following changes were made:<br>
&gt;<br>
&gt; 1. Configure the test library as close as possible to the installed on=
e,<br>
&gt;=C2=A0 =C2=A0 with some additional configuration options that are neede=
d for testing.<br>
&gt;=C2=A0 =C2=A0 (Use <a href=3D"http://dbus_1.12.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">dbus_1.12.2.bb</a> recipe as a template)<br>
&gt; 2. Include the shared libraries in the package, use LD_LIBRARY_PATH du=
ring<br>
&gt;=C2=A0 =C2=A0 testing to load them instead of the installed ones.<br>
&gt; 3. Add a few more tests. (There are still some additional tests built =
that<br>
&gt;=C2=A0 =C2=A0 are not used, but they would have to be special-cased).<b=
r>
&gt; 4. When evaluating the test results, differentiate between &quot;FAIL&=
quot; and &quot;SKIP&quot;<br>
&gt;<br>
&gt; [YOCTO #10841]<br>
&gt; [YOCTO #12277]<br>
&gt;<br>
&gt; Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@int=
el.com">juro.bystricky@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.12.2.bb" re=
l=3D"noreferrer" target=3D"_blank">dbus-<wbr>test_1.12.2.bb</a> | 30 ++++++=
++++++++++++++++++++----<br>
&gt;=C2=A0 meta/recipes-core/dbus/dbus/<wbr>run-ptest=C2=A0 =C2=A0 =C2=A0 |=
 20 +++++++++++++++++---<br>
&gt;=C2=A0 2 files changed, 43 insertions(+), 7 deletions(-)<br>
<br>
</div></div>Probably due to this change, dbus ptest related sanity tests fa=
ils here:<br>
<br>
<a href=3D"https://autobuilder.yocto.io/builders/nightly-deb-non-deb/builds=
/813/steps/Running%20Sanity%20Tests/logs/stdio" rel=3D"noreferrer" target=
=3D"_blank">https://autobuilder.yocto.io/<wbr>builders/nightly-deb-non-deb/=
<wbr>builds/813/steps/Running%<wbr>20Sanity%20Tests/logs/stdio</a><br>
<br>
<br>
NOTE:=C2=A0 ... ok<br>
| NOTE: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
| NOTE: FAIL: test_ptestrunner (ptest.PtestRunnerTest)<br>
| NOTE: ------------------------------<wbr>------------------------------<w=
br>----------<br>
| NOTE: Traceback (most recent call last):<br>
|=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-<wbr>autobuilder/yocto-worke=
r/<wbr>nightly-deb-non-deb/build/<wbr>meta/lib/oeqa/core/decorator/_<wbr>_i=
nit__.py&quot;, line 32, in wrapped_f<br>
|=C2=A0 =C2=A0 =C2=A0return func(*args, **kwargs)<br>
|=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-<wbr>autobuilder/yocto-worke=
r/<wbr>nightly-deb-non-deb/build/<wbr>meta/lib/oeqa/core/decorator/_<wbr>_i=
nit__.py&quot;, line 32, in wrapped_f<br>
|=C2=A0 =C2=A0 =C2=A0return func(*args, **kwargs)<br>
|=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-<wbr>autobuilder/yocto-worke=
r/<wbr>nightly-deb-non-deb/build/<wbr>meta/lib/oeqa/core/decorator/_<wbr>_i=
nit__.py&quot;, line 32, in wrapped_f<br>
|=C2=A0 =C2=A0 =C2=A0return func(*args, **kwargs)<br>
|=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-<wbr>autobuilder/yocto-worke=
r/<wbr>nightly-deb-non-deb/build/<wbr>meta/lib/oeqa/runtime/cases/<wbr>ptes=
t.py&quot;, line 93, in test_ptestrunner<br>
|=C2=A0 =C2=A0 =C2=A0self.assertFalse(failed_tests, msg =3D &quot;Failed pt=
ests: %s&quot; %(str(failed_tests)))<br>
| AssertionError: {&#39;dbus-test&#39;: [&#39; test/test-bus&#39;, &#39; te=
st/test-dbus-daemon&#39;, &#39; test/test-names&#39;]} is not false : Faile=
d ptests: {&#39;dbus-test&#39;: [&#39; test/test-bus&#39;, &#39; test/test-=
dbus-daemon&#39;, &#39; test/test-names&#39;]}<br>
<br>
<br>
Best Regards,<br>
Maxin<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a11449248366d24056649299e--
