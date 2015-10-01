Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id C7E78770AD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 19:01:03 +0000 (UTC)
Received: by ioii196 with SMTP id i196so96227975ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 12:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=amlpRnkdu9MibLOCE6Jk+ox2GaZCJxSn8iwpW2O3Pfg=;
	b=UD6kIIAQGlzT5wLHfeSDFchmp2C/ACzOoSF5b2l9EbEEMTmLhcjoyX0mtouL58DwSr
	0lqg6vO7N4pUsewqa0r7T4vrvxm9nx5bhjQ9qXYwVKHKidKU0pB0rS+GeTwgRpg1/ff0
	KUyEVtVkbLv8gweF22yGAINcmuNXrtJjat/lS22KvLLOYNy53hLs8euiv3PS26HvDedY
	NLtC3CGwc6jb6G5wGtv7zKxasYnTNWXF3KXN/A6fZ39niY3AFE3udK5dSi4mFITRLa9c
	Qpdy/bGxcEyH9rP5DtjnEwvMjuI7+HBJu2cBsPnAY5szj/e0EGRq3QTau+UQvKBrNaT/
	+K2w==
X-Received: by 10.107.40.201 with SMTP id o192mr12774547ioo.83.1443726063552; 
	Thu, 01 Oct 2015 12:01:03 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Thu, 1 Oct 2015 12:00:25 -0700 (PDT)
In-Reply-To: <CAP9ODKosZgR-_-UNC2kE_Y9jKpg-=Du1=Yu82-5TYP8PzrvWig@mail.gmail.com>
References: <CAJ86T=Xkpa=hO1kizYrsSOTpeMOfbnZeniEWdMgCNhXae2W_5Q@mail.gmail.com>
	<71039CBC-0B0A-43AF-8C7D-34D73FCFE32C@gmail.com>
	<CAJ86T=VrarVcJ=EUup0k+=mXh=YoDLP2TyDxmZU9SYEHyc8MkQ@mail.gmail.com>
	<CAP9ODKosZgR-_-UNC2kE_Y9jKpg-=Du1=Yu82-5TYP8PzrvWig@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 1 Oct 2015 12:00:25 -0700
X-Google-Sender-Auth: wOfM_3oaBX_1GVB5MGyJY0lbloA
Message-ID: <CABcZAN=dmbax0001e4jF7WZYNxzGV_MZy4sgXM_VWJ52NqV4vg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Sorting rootfs manifest with .ipk packaging
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
X-List-Received-Date: Thu, 01 Oct 2015 19:01:04 -0000
Content-Type: multipart/alternative; boundary=001a1141f4102bd2dd05210fabee

--001a1141f4102bd2dd05210fabee
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2015 at 11:57 AM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Thu, Oct 1, 2015 at 3:55 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> > On Wed, Sep 30, 2015 at 5:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>> On Sep 30, 2015, at 3:03 PM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> >>>
> >>> I'd like the rootfs manifest to be sorted when using .ipk packaging.
> >>> Would a patch to sort the result of OpkgPkgsList().list be acceptable?
> >>> Or would the sorting be better done elsewhere?
> >>
> >> its not clear what kind of sorting are you looking for. It could be a
> good thing in general if its
> >> configurable and you can explain the value add of doing it.
> >
> > Aim is to make the manifest for each rootfs a little more human
> > readable by sorting the list of installed packages alphabetically.
> >
> > Currently, when ipk packaging is used, the order of packages in the
> > manifest matches the order in /var/lib/opkg/status, which appears to
> > be "random".
> >
> > It looks like RpmPkgsList().list does always sort it's results before
> > returning, so adding a sort to OpkgPkgsList().list would make it
> > consistent with the RPM equivalent.
>
> Consistency is always good. So please prepare a patch.


Agreed. In addition to being more human readable, it'd also be slightly
easier to compare manifests if they're pre-sorted with a tool like 'comm'.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1141f4102bd2dd05210fabee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Oct 1, 2015 at 11:57 AM, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salva=
dor@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><span class=3D"">On Thu, Oct 1, 2015 at 3:55 PM, Andre McCurdy &lt;<a hre=
f=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>
&gt; On Wed, Sep 30, 2015 at 5:48 PM, Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; On Sep 30, 2015, at 3:03 PM, Andre McCurdy &lt;<a href=3D"mail=
to:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;d like the rootfs manifest to be sorted when using .ipk =
packaging.<br>
&gt;&gt;&gt; Would a patch to sort the result of OpkgPkgsList().list be acc=
eptable?<br>
&gt;&gt;&gt; Or would the sorting be better done elsewhere?<br>
&gt;&gt;<br>
&gt;&gt; its not clear what kind of sorting are you looking for. It could b=
e a good thing in general if its<br>
&gt;&gt; configurable and you can explain the value add of doing it.<br>
&gt;<br>
&gt; Aim is to make the manifest for each rootfs a little more human<br>
&gt; readable by sorting the list of installed packages alphabetically.<br>
&gt;<br>
&gt; Currently, when ipk packaging is used, the order of packages in the<br=
>
&gt; manifest matches the order in /var/lib/opkg/status, which appears to<b=
r>
&gt; be &quot;random&quot;.<br>
&gt;<br>
&gt; It looks like RpmPkgsList().list does always sort it&#39;s results bef=
ore<br>
&gt; returning, so adding a sort to OpkgPkgsList().list would make it<br>
&gt; consistent with the RPM equivalent.<br>
<br>
</span>Consistency is always good. So please prepare a patch.</blockquote><=
/div><br>Agreed. In addition to being more human readable, it&#39;d also be=
 slightly easier to compare manifests if they&#39;re pre-sorted with a tool=
 like &#39;comm&#39;.<br>-- <br><div class=3D"gmail_signature">Christopher =
Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, Op=
enZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics=
</div>
</div></div>

--001a1141f4102bd2dd05210fabee--
