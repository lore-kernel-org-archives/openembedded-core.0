Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0734D747D7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 02:24:00 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id v135-v6so12567411lfa.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 19:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Da9Lbg3uCzqUGvhGD/PQHxvqY5bcfKk2sFxOpMZlZdQ=;
	b=DQTPTFVJjeHDhsXFblmoDRBGjJE8iPpAe2OpOY+xI4XFhS7XPyLpaEwFHP9Xuks5Yy
	CDHLbYOEfl8ySBSsU/4AIx0RLLaOTTcQXA2MJq3WnO8P7vnH7zqJd5Xlg1rfIC0JMFXk
	jp85tRd2m9tDsr+3nvKDVVV/YjnNWkCRv7T6VyIU8nRMpPku9W3z8iA5qocJug6vEcOV
	OKiaCFetU3sIHVO1CaEptBMsTBj1r9ZSTbkIfc3Q13u1DuIPLMfE6u2advqcvUAOj4D3
	kfncAkphetoxH5U2U5ObPVRfUj5k0flQQ+T/LdFGWkrOSlH49gi+gPVjHA7u/zMHsjcp
	9jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Da9Lbg3uCzqUGvhGD/PQHxvqY5bcfKk2sFxOpMZlZdQ=;
	b=UhThWkja1Jn9LM/K0V317VmBciEqvAI/bB0Nc16ZX7+2J9gokLs+Ch7DV4dgfHiJ96
	RGzZNYXAciBXvXPwouVvNvGtHw0myRgViK5J8x9JNk/C+VK09+0I8sQueN71485tqqdC
	rLyukKCzJSuONQSJ4sottBaF6EOWI+DYXX8ZiaX3ZNd78wlHLx5SgW6ix0dHN3IQRiLI
	Z1JGggXQYU7vB2vwdOigse/byZMCQ+hdWYTBm4raHpiEiCoC0moU/eA+wNJENJCTGQKK
	doB9epGUQjuzzXSV6gEVKTafo4O8h7MMyq0p8TJ9F9Si9nSi4ONrqYhCDLon8yh7JRNz
	pdgg==
X-Gm-Message-State: ALKqPwc5fxhUxrRqGyg0DYgkMR0FRlQvSpTzeiEXeOTrMuuHNolQZV/f
	ssA8h1kjW8wDvEERsbaYL3t8Gqp9NI+aTjT5ayA=
X-Google-Smtp-Source: ADUXVKIQndZlNj3rpr5lm1BiMFwP2blBdkZC7HIU2Fgns8qnzEKEVfTwqGGOSQAxx7xcltKZ+vHgnZTPb0Ndg436AaI=
X-Received: by 2002:a2e:8350:: with SMTP id
	l16-v6mr6625610ljh.28.1527819841478; 
	Thu, 31 May 2018 19:24:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb07:0:0:0:0:0 with HTTP; Thu, 31 May 2018 19:23:59
	-0700 (PDT)
In-Reply-To: <CAJ86T=XTDOZYzdUTBLSO39XeBu6QhV0U5+U=iGd_hM0OwBXH_Q@mail.gmail.com>
References: <20180531200659.28877-1-twoerner@gmail.com>
	<CAJ86T=XTDOZYzdUTBLSO39XeBu6QhV0U5+U=iGd_hM0OwBXH_Q@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 31 May 2018 22:23:59 -0400
Message-ID: <CAHUNapRaJVnECsz3rU2CV265xOJLMPUARfsHZGn-CnY_Kn4j3Q@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [devtool][PATCH] devtool deploy-target: optionally specify package
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
X-List-Received-Date: Fri, 01 Jun 2018 02:24:01 -0000
Content-Type: multipart/alternative; boundary="000000000000eea3aa056d8b461a"

--000000000000eea3aa056d8b461a
Content-Type: text/plain; charset="UTF-8"

Hi Andre, thanks for taking an interest!

On Thu, May 31, 2018 at 6:22 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, May 31, 2018 at 1:06 PM, Trevor Woerner <twoerner@gmail.com>
> wrote:
> > Instead of installing an entire recipe's build output (i.e. ${D}), allow
> the
> > user to optionally specify a package from said recipe to be installed
> > exclusively (i.e. ${PKGDEST}/<package>).
>
> I'm not a big devtool user myself, but I'm curious about the
> situations where you might need this?
>

Earlier today I was working on recipes for some software which recently
added the feature to dlopen() one of a couple shared objects based on
various conditions. But instead of dlopen()'ing the SONAME, they were
dlopen()'ing the raw .so file. OE's default packaging, of course, added the
*.so.0 and *.so.0.0.0 files to the ${PN} package, and the raw *.so files to
the ${PN}-dev package. So when the app tried to run, it failed.

Investigating, I realised there were two things I could do: 1) add the raw
*.so files to the ${PN} package (with INSANE_SKIP += "dev-so") or 2) fix
the app. I decided to try #2, with the help of devtool.

I made one small change to the app, "devtool deploy-target"'ed it, and,
AMAZINGLY, everything worked!! Wow, what luck! ... or not.

Investigating, I discovered that "devtool deploy-target"'s only mode of
operation is to upload the entire recipe's ${D} directory (i.e.
${WORKDIR}/image) to the target! I hope you'll be as surprised by that as
am I. Considering ${D} includes *.a files, man pages, raw *.so files,
pkgconfigs, (... thankfully it doesn't also include the -dbg packages) that
is a lot of stuff to be uploading to the target, a lot of wrong stuff, and
in my case that hindered my work. Most target filesystems are only 10%
larger than required to hold their contents, so uploading static libraries,
man pages, pkgconfigs, etc is not great.

Specifically, these unwanted raw *.so files were hindering my work. My only
two options were: 1) to use "devtool deploy-target" as-is and then have to
manually delete all the .so files or 2) come up with a better solution. I
went with #2 (again).

Many recipes generate just a couple packages: ${PN}, -dbg, -doc, -dev,
-staticdev, -locale. But some generate a whole bunch. In my case my recipe
is generating a lot of packages, but I only wanted to investigate one. This
patch allows a developer to focus on just one package, instead of the
entire recipe.


> Are the going to be problems if users want to deploy more than one
> package (or switch between a full deploy and a package) and don't
> deploy and undeploy in the right order?
>

In my patch I added a --package option to "devtool deploy-target" but not
to "devtool undeploy-target". devtool keeps track of what files were
uploaded by creating a per-package list on the target itself (in
/.devtool). When you undeploy a recipe, it simply looks for this recipe
file on the target, reads the files listed there, and undeploys each of the
files in that list.

Therefore, mixing and matching deploys and undeploys amongst recipes don't
interfere with each other.

I checked at the time, but I'm not 100% sure now, but I believe if one
deploys two packages from one recipe, the on-target file gets appended. But
now I'm not 100% sure, so I'll verify this tomorrow (thanks for the
reminder). As such, under my scheme, you can deploy recipes and packages at
will, but then only undeploy the whole kit and caboodle in one go; given a
recipe name to undeploy, whatever it finds in the on-target record will get
undeployed.

I think any developer will find this reasonable behaviour (but maybe not?).

In any case, my patch doesn't affect any existing workflows. If a developer
never notices the new --package option and simply continues to use "devtool
deploy-target" with just a recipe name, the behaviour will be exactly the
same. Only when the --package option is used will the new behaviour occur.

I'll verify deploying multiple packages from the same recipe to confirm
they append the list file. I'll also verify deploying the same package
multiple times (although my guess is there'll be no difference between this
and the existing behaviour should one deploy the same recipe multiple
times).

--000000000000eea3aa056d8b461a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">Hi A=
ndre, thanks for taking an interest!</div><div class=3D"gmail_quote"><br></=
div><div class=3D"gmail_quote">On Thu, May 31, 2018 at 6:22 PM, Andre McCur=
dy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_=
blank">armccurdy@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><span class=3D"">On Thu, May 31, 2018 at 1:06 PM, Trevor Woerner &l=
t;<a href=3D"mailto:twoerner@gmail.com">twoerner@gmail.com</a>&gt; wrote:<b=
r>
&gt; Instead of installing an entire recipe&#39;s build output (i.e. ${D}),=
 allow the<br>
&gt; user to optionally specify a package from said recipe to be installed<=
br>
&gt; exclusively (i.e. ${PKGDEST}/&lt;package&gt;).<br>
<br>
</span>I&#39;m not a big devtool user myself, but I&#39;m curious about the=
<br>
situations where you might need this?<br></blockquote><div><br></div><div>E=
arlier today I was working on recipes for some software which recently adde=
d the feature to dlopen() one of a couple shared objects based on various c=
onditions. But instead of dlopen()&#39;ing the SONAME, they were dlopen()&#=
39;ing the raw .so file. OE&#39;s default packaging, of course, added the *=
.so.0 and *.so.0.0.0 files to the ${PN} package, and the raw *.so files to =
the ${PN}-dev package. So when the app tried to run, it failed.</div><div><=
br></div><div>Investigating, I realised there were two things I could do: 1=
) add the raw *.so files to the ${PN} package (with INSANE_SKIP +=3D &quot;=
dev-so&quot;) or 2) fix the app. I decided to try #2, with the help of devt=
ool.</div><div><br></div><div>I made one small change to the app, &quot;dev=
tool deploy-target&quot;&#39;ed it, and, AMAZINGLY, everything worked!! Wow=
, what luck! ... or not.</div><div><br></div><div>Investigating, I discover=
ed that &quot;devtool deploy-target&quot;&#39;s only mode of operation is t=
o upload the entire recipe&#39;s ${D} directory (i.e. ${WORKDIR}/image) to =
the target! I hope you&#39;ll be as surprised by that as am I. Considering =
${D} includes *.a files, man pages, raw *.so files, pkgconfigs, (... thankf=
ully it doesn&#39;t also include the -dbg packages) that is a lot of stuff =
to be uploading to the target, a lot of wrong stuff, and in my case that hi=
ndered my work. Most target filesystems are only 10% larger than required t=
o hold their contents, so uploading static libraries, man pages, pkgconfigs=
, etc is not great.</div><div><br></div><div>Specifically, these unwanted r=
aw *.so files were hindering my work. My only two options were: 1) to use &=
quot;devtool deploy-target&quot; as-is and then have to manually delete all=
 the .so files or 2) come up with a better solution. I went with #2 (again)=
.</div><div><br></div><div>Many recipes generate just a couple packages: ${=
PN}, -dbg, -doc, -dev, -staticdev, -locale. But some generate a whole bunch=
. In my case my recipe is generating a lot of packages, but I only wanted t=
o investigate one. This patch allows a developer to focus on just one packa=
ge, instead of the entire recipe.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
Are the going to be problems if users want to deploy more than one<br>
package (or switch between a full deploy and a package) and don&#39;t<br>
deploy and undeploy in the right order?<br>
<div class=3D"HOEnZb"><div class=3D"h5"></div></div></blockquote></div><br>=
</div><div class=3D"gmail_extra">In my patch I added a --package option to =
&quot;devtool deploy-target&quot; but not to &quot;devtool undeploy-target&=
quot;. devtool keeps track of what files were uploaded by creating a per-pa=
ckage list on the target itself (in /.devtool). When you undeploy a recipe,=
 it simply looks for this recipe file on the target, reads the files listed=
 there, and undeploys each of the files in that list.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Therefore, mixing and match=
ing deploys and undeploys amongst recipes don&#39;t interfere with each oth=
er.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I =
checked at the time, but I&#39;m not 100% sure now, but I believe if one de=
ploys two packages from one recipe, the on-target file gets appended. But n=
ow I&#39;m not 100% sure, so I&#39;ll verify this tomorrow (thanks for the =
reminder). As such, under my scheme, you can deploy recipes and packages at=
 will, but then only undeploy the whole kit and caboodle in one go; given a=
 recipe name to undeploy, whatever it finds in the on-target record will ge=
t undeployed.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">I think any developer will find this reasonable behaviour (but mayb=
e not?).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">In any case, my patch doesn&#39;t affect any existing workflows. If a de=
veloper never notices the new --package option and simply continues to use =
&quot;devtool deploy-target&quot; with just a recipe name, the behaviour wi=
ll be exactly the same. Only when the --package option is used will the new=
 behaviour occur.</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">I&#39;ll verify deploying multiple packages from the same recip=
e to confirm they append the list file. I&#39;ll also verify deploying the =
same package multiple times (although my guess is there&#39;ll be no differ=
ence between this and the existing behaviour should one deploy the same rec=
ipe multiple times).</div></div>

--000000000000eea3aa056d8b461a--
