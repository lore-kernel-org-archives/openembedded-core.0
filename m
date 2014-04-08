Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4123565D24
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 21:32:37 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id to1so1584920ieb.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Apr 2014 14:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=z+MdG5cgjhImBTXxp/yFR1xKpMt8pqIkhxeEe5DGbTM=;
	b=X2dRFHM04fk/Akz0kjCyLvzC0VGxrLzbKsbSr6KTT9aYgpEN4SvjD+D0lm9tqzEY/+
	vDNyFXzKljJ73DoP1HMMKk+rMPzoDs8IBBMYAoYEmmM3ZS7DGV85PKXA0ZNW/dciV7yq
	/+js37IP5NDZJh7hliF3JpP8AbLvmXDucItU8wcfjC9V2tYJgBRRMkb2x1pzhhahXCoA
	zHxckLS+fQbmlVF3FWHyGdcM2uAEe6cTaRxFORhSVV401oxLkrbR85eProLBE7j++V0I
	8maIunhIIs2265VDYTbEysCbhcvm3Snl02ciAsRzvj+Jg5rnDkeJeYKfmSjYTd7CK4+h
	iClA==
MIME-Version: 1.0
X-Received: by 10.42.114.82 with SMTP id f18mr3938090icq.56.1396992758445;
	Tue, 08 Apr 2014 14:32:38 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Tue, 8 Apr 2014 14:32:38 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Tue, 8 Apr 2014 14:32:38 -0700 (PDT)
In-Reply-To: <534446D4.2090906@dresearch-fe.de>
References: <5330220F.8050504@dresearch-fe.de> <1395664516.24232.56.camel@ted>
	<533029C5.1000406@dresearch-fe.de> <1395665593.24232.58.camel@ted>
	<53303FAB.5020907@dresearch-fe.de> <20140324151537.GD29998@jama>
	<53315AE7.1020304@dresearch-fe.de> <53319AAD.5070506@windriver.com>
	<53429BF2.2050804@dresearch-fe.de>
	<5342A69C.9020901@dresearch-fe.de> <1396882151.24597.72.camel@ted>
	<5343EC99.800@dresearch-fe.de>
	<CAMKF1soqOcYKVkgCy_wOU=yyeKJ+JO54e6pAy+dZxhmm1DEXBA@mail.gmail.com>
	<534446D4.2090906@dresearch-fe.de>
Date: Tue, 8 Apr 2014 14:32:38 -0700
Message-ID: <CAMKF1sp-2je4QxiW5ZmjPSCp3WizrmAZcyJ0trb0_LrNTR9E4A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: complex versioning scenario
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
X-List-Received-Date: Tue, 08 Apr 2014 21:32:39 -0000
Content-Type: multipart/alternative; boundary=20cf303f6dce1efe0104f68eb94f

--20cf303f6dce1efe0104f68eb94f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Apr 8, 2014 8:58 AM, "Steffen Sledz" <sledz@dresearch-fe.de> wrote:
>
> Am 08.04.2014 19:20, schrieb Khem Raj:
> > On Tue, Apr 8, 2014 at 5:33 AM, Steffen Sledz <sledz@dresearch-fe.de>
wrote:
> >> If a package contains a shared library *and* a binary (e.g. a related
command line tool) then the soname major version *is not appended* to the
package name (see debian_package_name_hook in debian.bbclass). All other
problems are aftereffects.
> >
> > shared objects which are to be used by other independent packages (
> > public .so) should be packaged separately into runtime shared object
> > package which is separate from packages with binaries so that multiple
> > versions of same librararies
> > can be packaged on single system, your usecase seems to indicate that
> > the .so is just used by this given binary you bundle together is that
> > the case ?
>
> No it is used by the binary which is part of the package *and* some other
binaries.
>
> So i've to split the package into two packages of which one contains only
the shared object. Right?
yes
>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058

--20cf303f6dce1efe0104f68eb94f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Apr 8, 2014 8:58 AM, &quot;Steffen Sledz&quot; &lt;<a href=3D"mailto:sle=
dz@dresearch-fe.de">sledz@dresearch-fe.de</a>&gt; wrote:<br>
&gt;<br>
&gt; Am 08.04.2014 19:20, schrieb Khem Raj:<br>
&gt; &gt; On Tue, Apr 8, 2014 at 5:33 AM, Steffen Sledz &lt;<a href=3D"mail=
to:sledz@dresearch-fe.de">sledz@dresearch-fe.de</a>&gt; wrote:<br>
&gt; &gt;&gt; If a package contains a shared library *and* a binary (e.g. a=
 related command line tool) then the soname major version *is not appended*=
 to the package name (see debian_package_name_hook in debian.bbclass). All =
other problems are aftereffects.<br>

&gt; &gt;<br>
&gt; &gt; shared objects which are to be used by other independent packages=
 (<br>
&gt; &gt; public .so) should be packaged separately into runtime shared obj=
ect<br>
&gt; &gt; package which is separate from packages with binaries so that mul=
tiple<br>
&gt; &gt; versions of same librararies<br>
&gt; &gt; can be packaged on single system, your usecase seems to indicate =
that<br>
&gt; &gt; the .so is just used by this given binary you bundle together is =
that<br>
&gt; &gt; the case ?<br>
&gt;<br>
&gt; No it is used by the binary which is part of the package *and* some ot=
her binaries.<br>
&gt;<br>
&gt; So i&#39;ve to split the package into two packages of which one contai=
ns only the shared object. Right?<br>
yes<br>
&gt;<br>
&gt; --<br>
&gt; DResearch Fahrzeugelektronik GmbH<br>
&gt; Otto-Schmirgal-Str. 3, 10319 Berlin, Germany<br>
&gt; Tel: +49 30 515932-237 mailto:<a href=3D"mailto:sledz@dresearch-fe.de"=
>sledz@dresearch-fe.de</a><br>
&gt; Fax: +49 30 515932-299<br>
&gt; Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;<br>
&gt; Amtsgericht Berlin Charlottenburg; HRB 130120 B;<br>
&gt; Ust.-IDNr. DE273952058<br>
</p>

--20cf303f6dce1efe0104f68eb94f--
