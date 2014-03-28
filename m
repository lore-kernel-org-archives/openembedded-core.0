Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id 625D36D284
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 18:00:29 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id i4so6480729oah.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 11:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VsJJ5U/V8hq9DMd9t5D0jcqSIat3Wg/47/h8xxaKo8c=;
	b=YjgyGhC6/puUU5VC9A6edeELYNjmdWoSrCiH5e+XFLCD4vIsuFC0UkQKp5qzpYtcTI
	X2KP7HZaAirvoCsKbGvCSG18Zk0cij0i8V6sTZhOAHe/EYPipO2x/kPaV9PvSIoN7UTN
	90RrghoyOxOlGE7TpfZsZsy2WWF36ZRMhbZi2VkQ9tfvb5vcuoJYm8fOseUTDJwn3AAY
	YlFx6k2SPUobU+VKZnDTjWyPU3ixdefOthKvl1Ecl/2Lw8Q/27RBqMXCROfeHZgNP7Oc
	n7fhVP5HTMDRRalynTFzGT30jJULtltfb2LzIA5CWGPIRMBqu0pcB/AC/1ruziHU+iHM
	RD3A==
MIME-Version: 1.0
X-Received: by 10.182.22.33 with SMTP id a1mr1803876obf.60.1396029630623; Fri,
	28 Mar 2014 11:00:30 -0700 (PDT)
Received: by 10.60.40.200 with HTTP; Fri, 28 Mar 2014 11:00:30 -0700 (PDT)
Received: by 10.60.40.200 with HTTP; Fri, 28 Mar 2014 11:00:30 -0700 (PDT)
In-Reply-To: <CAP9ODKrT1c3UP30ntyi1c+CGJdBW49-6CnoTtXfwoJSC63XRTQ@mail.gmail.com>
References: <1395676843.24890.7.camel@ted> <5331935A.6060009@enea.com>
	<533401A8.60304@enea.com>
	<CAP9ODKrT1c3UP30ntyi1c+CGJdBW49-6CnoTtXfwoJSC63XRTQ@mail.gmail.com>
Date: Fri, 28 Mar 2014 19:00:30 +0100
Message-ID: <CAAKB1h1s9NVYwTU+j6sYR3njER9V81ZS4E8m5B27ipwUgf1=NA@mail.gmail.com>
From: David Nystrom <david.c.nystrom@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: yocto@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Features in Yocto Project 1.7
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
X-List-Received-Date: Fri, 28 Mar 2014 18:00:30 -0000
Content-Type: multipart/alternative; boundary=001a1133177c3ab52e04f5ae7afa

--001a1133177c3ab52e04f5ae7afa
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 28 Mar 2014 16:24, "Otavio Salvador" <otavio@ossystems.com.br> wrote:
>
> Hello David,
>
> On Thu, Mar 27, 2014 at 7:47 AM, David Nystr=F6m <david.nystrom@enea.com>
wrote:
> > On 2014-03-25 15:31, David Nystr=F6m wrote:
> >>
> >> On 2014-03-24 17:00, Richard Purdie wrote:
> >>>
> >>> As development on 1.6 finishes up, its time to think about what we
> >>> should be doing in the 1.7 cycle.
> >>>
> >>> I think from my perspective, in 1.7 I'd like to see us looking at
> >>> "Developer Workflow". Its a generic topic which I think covered
multiple
> >>> areas (in no particular order):
> >>>
> >>> * the ADT/SDK and how it intergrates into the rest of the system
> >>
> >>
> >>> * toaster
> >>> * python devshell
> >>> * exteralsrc.bbclass
> >>> * memory resident bitbake
> >>> * how a standalone app developer might build an image
> >>
> >>
> >> +1
> >> My wishlist:
> >>
> >> 1. Assembly of an image from a package repository using the SDK.
> >> 2. Ability to easily package multiple kernel flavours(builds with
> >> different kernel configs) with linux related bbclass:es.
> >
> >
> > 3. layer based repository splitting.
> > --
> > When having multiple users of a base repository. Ease management of
> > customized repos, by having he ability to mark layers as "split layers"=
,
> > this would yield a separate repo per "split layer", which would contain
> > packages modified/created by this layer.
>
> So you mean:
>
>  * base package feed
>  * meta-qt5 package feed
>
> and in case meta-qt5 adds a bbappend, in a existing recipe, what will
> be the behavior?

If bbappending the bash recipe, f.ex.
bash packages will be generated without meta-qt5 mods in base repo, and
subsequently generated with qt5 mods in the meta-qt5 repo.

//DD

>
> > Said packages would also be built for the base repo, but without
split-layer
> > modifications.
> >
> > A customized distro would use a compound of the base repo + split repo,
> > where the split repo would have higher priority.
> >
> > I guess this could mean one deploy directory per split-layer.
>
> This part is easy as all package managers we use has support for it (I
> think) so it is a matter of proper generating those and add a method
> to include it in the image, the first part is the most complicated one
> I think...
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1133177c3ab52e04f5ae7afa
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 28 Mar 2014 16:24, &quot;Otavio Salvador&quot; &lt;<a href=3D"mailto:ota=
vio@ossystems.com.br">otavio@ossystems.com.br</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello David,<br>
&gt;<br>
&gt; On Thu, Mar 27, 2014 at 7:47 AM, David Nystr=F6m &lt;<a href=3D"mailto=
:david.nystrom@enea.com">david.nystrom@enea.com</a>&gt; wrote:<br>
&gt; &gt; On 2014-03-25 15:31, David Nystr=F6m wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 2014-03-24 17:00, Richard Purdie wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; As development on 1.6 finishes up, its time to think abou=
t what we<br>
&gt; &gt;&gt;&gt; should be doing in the 1.7 cycle.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; I think from my perspective, in 1.7 I&#39;d like to see u=
s looking at<br>
&gt; &gt;&gt;&gt; &quot;Developer Workflow&quot;. Its a generic topic which=
 I think covered multiple<br>
&gt; &gt;&gt;&gt; areas (in no particular order):<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; * the ADT/SDK and how it intergrates into the rest of the=
 system<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; * toaster<br>
&gt; &gt;&gt;&gt; * python devshell<br>
&gt; &gt;&gt;&gt; * exteralsrc.bbclass<br>
&gt; &gt;&gt;&gt; * memory resident bitbake<br>
&gt; &gt;&gt;&gt; * how a standalone app developer might build an image<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +1<br>
&gt; &gt;&gt; My wishlist:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 1. Assembly of an image from a package repository using the S=
DK.<br>
&gt; &gt;&gt; 2. Ability to easily package multiple kernel flavours(builds =
with<br>
&gt; &gt;&gt; different kernel configs) with linux related bbclass:es.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; 3. layer based repository splitting.<br>
&gt; &gt; --<br>
&gt; &gt; When having multiple users of a base repository. Ease management =
of<br>
&gt; &gt; customized repos, by having he ability to mark layers as &quot;sp=
lit layers&quot;,<br>
&gt; &gt; this would yield a separate repo per &quot;split layer&quot;, whi=
ch would contain<br>
&gt; &gt; packages modified/created by this layer.<br>
&gt;<br>
&gt; So you mean:<br>
&gt;<br>
&gt; =A0* base package feed<br>
&gt; =A0* meta-qt5 package feed<br>
&gt;<br>
&gt; and in case meta-qt5 adds a bbappend, in a existing recipe, what will<=
br>
&gt; be the behavior?</p>
<p dir=3D"ltr">If bbappending the bash recipe, f.ex.<br>
bash packages will be generated without meta-qt5 mods in base repo, and sub=
sequently generated with qt5 mods in the meta-qt5 repo.</p>
<p dir=3D"ltr">//DD</p>
<p dir=3D"ltr">&gt;<br>
&gt; &gt; Said packages would also be built for the base repo, but without =
split-layer<br>
&gt; &gt; modifications.<br>
&gt; &gt;<br>
&gt; &gt; A customized distro would use a compound of the base repo + split=
 repo,<br>
&gt; &gt; where the split repo would have higher priority.<br>
&gt; &gt;<br>
&gt; &gt; I guess this could mean one deploy directory per split-layer.<br>
&gt;<br>
&gt; This part is easy as all package managers we use has support for it (I=
<br>
&gt; think) so it is a matter of proper generating those and add a method<b=
r>
&gt; to include it in the image, the first part is the most complicated one=
<br>
&gt; I think...<br>
&gt;<br>
&gt; --<br>
&gt; Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 O.S. Systems<br>
&gt; <a href=3D"http://www.ossystems.com.br">http://www.ossystems.com.br</a=
> =A0 =A0 =A0 =A0<a href=3D"http://code.ossystems.com.br">http://code.ossys=
tems.com.br</a><br>
&gt; Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903=
-9750<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a1133177c3ab52e04f5ae7afa--
