Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QmR59-0000hS-Ot
	for openembedded-core@openembedded.org; Thu, 28 Jul 2011 15:57:00 +0200
Received: by yxi19 with SMTP id 19so1544561yxi.6
	for <openembedded-core@openembedded.org>;
	Thu, 28 Jul 2011 06:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=e3yXtItFlHGRPKCTmnTIB/NVDZDSL7jpE35ziJj8cHI=;
	b=Ay6d6hUajiXqF/ZEr9vfAnD6PKzfFPK5N5/FKz5YD2uhm806pGWVXTGdoqRVk9FGFY
	I/zEN8xUw86CXd58yVXyb5tQ58UmuO8I96DT3MXaI5aYcFjqF/QSFgEzZSmjbTaYBCJR
	GhLKAuzCIa0kA0FIvT2Vbyv087joGjnDNeFcQ=
MIME-Version: 1.0
Received: by 10.91.173.4 with SMTP id a4mr51419agp.68.1311861163690; Thu, 28
	Jul 2011 06:52:43 -0700 (PDT)
Received: by 10.91.94.13 with HTTP; Thu, 28 Jul 2011 06:52:43 -0700 (PDT)
In-Reply-To: <CAPcSpE+ZKH=o7RsotsiCmo3ss5zHo=wH9-z6htc7zVWDo7YSOQ@mail.gmail.com>
References: <1311824295-13464-1-git-send-email-bengardiner@nanometrics.ca>
	<CACW_hTZEgveniP0x3R6Q1mNb9+T0kYP=TsOF4A2SwHKJeAqUjA@mail.gmail.com>
	<CAPcSpE+ZKH=o7RsotsiCmo3ss5zHo=wH9-z6htc7zVWDo7YSOQ@mail.gmail.com>
Date: Thu, 28 Jul 2011 15:52:43 +0200
Message-ID: <CACW_hTaR-BfLXDpUyrCcL+Ns2KOOSiT+kH9fJ07HGJwOZ51a4w@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
Cc: Koen Kooi <koen@dominion.thruhere.net>, openembedded-core@openembedded.org
Subject: Re: [PATCH] [PATCH] raptor: add recipe
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
X-List-Received-Date: Thu, 28 Jul 2011 13:57:00 -0000
Content-Type: multipart/alternative; boundary=001485f5eb02a80ab804a9217a4f

--001485f5eb02a80ab804a9217a4f
Content-Type: text/plain; charset=ISO-8859-1

2011/7/28 Ben Gardiner <bengardiner@nanometrics.ca>

> Hi Koen, Frans,
>
> On Thu, Jul 28, 2011 at 6:48 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> >
> > Op 28 jul. 2011, om 05:38 heeft Ben Gardiner het volgende geschreven:
> >
> >> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> >> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> >> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> >>
> >> This recipe is a port of recipes/raptor/raptor_1.4.21.bb from
> >> git://git.openembedded.org/openembedded, commits
> >> 01e8e9f325d8d251e852e7a5704b5fe50880e1ad 'raptor: added recipe' and
> >> f1d24b5a986233f869364eb109476f5184e76d10 'raptor: add libxml2 DEPENDS'
> >
> > Why does this need to be in OE-core and not in some other layer? It
> doesn't look so core to me, especially since nothing in oe-core (or
> meta-oe/efl/gnome for that matter) depends on it
>
> Because oe-core's meta/recipes-support (naively) seemed like a
> reasonable place for it. I would be happy to re-spin the patch for
> locating it in any layer. Please advise me.
>

oe-core is only for core recipes. Not sure about the exact definition, but I
suspect it is something like "recipes that (virtually) everybody needs".
I'm not sure about layer policies, but maybe this could go to meta-oe.

>
> It's true that nothing depends on it. As Frans mentions later it's
> only dependent in oe.dev is flickrcurl. Raptor is both a library and a
> utility; we use the latter so raptor itself is a dependency of our
> images.
>
> >>
> >> The recipe was modified by adding a LIC_FILES_CHKSUM assignment.
> >>
> >> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> >>
> >> ---
> >>
> >> Not tested in the oe-core + meta-openembedded et. al. layers.
>
> I'm sorry for the confusion -- this recipe is/was tested in oe.dev and
> 2011.03-maintenance branches.
>

I'd say that before submitting you should as a minimum test that it builds
properly in the layer you are submitting it (so e.g. we're sure all depends
are there).

>
> > So why are you sending it if it isn't tested?
> >
> >> We are not
> >> ready yet to migrate from the 2011.03-maintenance branch. This patch is
> >> proposed for inclusion in oe-core so that we can meet the new policy
> >> requirements for inclusion in the 2011.03-maintenance branch
> >
> > Where does it say it's OK to do a pull request for untested recipes? And
> where does it say it needs to be in OE-core first?
>
> My understanding of Tom's post to the oe.dev mailing list is that
> commits in pull-requests for 2011.03 need to first be oe-core or one
> of its layers.
>

No idea here.
But why would add a patch for LIC_FILES_CHECKSUM in the maintenance tree.
If I recall correctly those are not needed in 2011.03 (but if it is and it
is missing from the recipe, I think it should be added, if not, probably
leave the recipe as is).

>
> In Message-ID: <4DFA7108.5020103@mentor.com> On Thu, Jun 16, 2011 at
> 5:09 PM, Tom Rini <tom_rini@mentor.com> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Hi all,
> >
> > As part of this weeks TSC meeting, an agenda item was brought up about
> > the 2011.03-maintenance branch and oe-core / etc.  I have now updated
> > the policy about where changes need to be before they can be included in
> > 2011.03-maintenance to include being in oe-core / meta-oe or other
> > relevant public layer instead of being only in the oe.dev master branch.
> >  This is not a policy change, but a clarification of what was there
> > previously.  Thanks all!
> >
>
> On Thu, Jul 28, 2011 at 7:29 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> >
> >
> > 2011/7/28 Ben Gardiner <bengardiner@nanometrics.ca>
> >>
> >> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> >
> > Eh, yes and no.
> >
> > I did write the original recipe and commited it on 14 aug 2010 with a
> > sign-off message.
> > As such this got my signoff, but I am not sure the signoff should be
> > repeated if this moved to oe-core.
>
> Fair enough. It is your Sign-off to give or take.
>
> I was following the patch message guidelines. "Example: Importaing
> from Elsewhere Modified" in particular:
>
>
> http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines#Example:_Importing_from_Elsewhere_Modified
>

Ah ok, Those guidelines are fairly new and I was not too aware of them. If
it is in accordance with the guidelines it is fine with me to keep them.
I was mainly triggered by the signed-off lines at the beginning of your
message (which I don't think are in accordance to the above mentioned
guidelines).
The only concern I have is that the sign-off would be interpreted as my
blessing for this patch in oe-core. If it only is used as an indicator of
the origin or as a statement that I released and was entitled to release the
original stuff, that is ok (as that is still appropriate).

>
> I will remove your Sign-off in v2.
>
> > My sign-off at that time is definitely not to be used as a suggestion it
> is
> > ok for oe-core (actually I feel this is not something for oe-core)
>
> Understood -- I am happy to re-spin for inclusion in any layer. Please
> advise.
>
> Best Regards,
> Ben Gardiner
>
> ---
> Nanometrics Inc.
> http://www.nanometrics.ca
>

--001485f5eb02a80ab804a9217a4f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/7/28 Ben Gardiner <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:bengardiner@nanometrics.ca">bengardiner@nanometrics.=
ca</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
Hi Koen, Frans,<br>
<div class=3D"im"><br>
On Thu, Jul 28, 2011 at 6:48 AM, Koen Kooi &lt;<a href=3D"mailto:koen@domin=
ion.thruhere.net">koen@dominion.thruhere.net</a>&gt; wrote:<br>
&gt;<br>
&gt; Op 28 jul. 2011, om 05:38 heeft Ben Gardiner het volgende geschreven:<=
br>
&gt;<br>
</div><div class=3D"im">&gt;&gt; Signed-off-by: Frans Meulenbroeks &lt;<a h=
ref=3D"mailto:fransmeulenbroeks@gmail.com">fransmeulenbroeks@gmail.com</a>&=
gt;<br>
</div><div class=3D"im">&gt;&gt; Signed-off-by: Ben Gardiner &lt;<a href=3D=
"mailto:bengardiner@nanometrics.ca">bengardiner@nanometrics.ca</a>&gt;<br>
&gt;&gt; Signed-off-by: Tom Rini &lt;<a href=3D"mailto:tom_rini@mentor.com"=
>tom_rini@mentor.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; This recipe is a port of recipes/raptor/<a href=3D"http://raptor_1=
.4.21.bb" target=3D"_blank">raptor_1.4.21.bb</a> from<br>
&gt;&gt; git://<a href=3D"http://git.openembedded.org/openembedded" target=
=3D"_blank">git.openembedded.org/openembedded</a>, commits<br>
&gt;&gt; 01e8e9f325d8d251e852e7a5704b5fe50880e1ad &#39;raptor: added recipe=
&#39; and<br>
&gt;&gt; f1d24b5a986233f869364eb109476f5184e76d10 &#39;raptor: add libxml2 =
DEPENDS&#39;<br>
&gt;<br>
</div><div class=3D"im">&gt; Why does this need to be in OE-core and not in=
 some other layer? It doesn&#39;t look so core to me, especially since noth=
ing in oe-core (or meta-oe/efl/gnome for that matter) depends on it<br>
<br>
</div>Because oe-core&#39;s meta/recipes-support (naively) seemed like a<br=
>
reasonable place for it. I would be happy to re-spin the patch for<br>
locating it in any layer. Please advise me.<br></blockquote><div><br>oe-cor=
e is only for core recipes. Not sure about the exact definition, but I susp=
ect it is something like &quot;recipes that (virtually) everybody needs&quo=
t;.<br>
I&#39;m not sure about layer policies, but maybe this could go to meta-oe. =
<br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.=
8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
It&#39;s true that nothing depends on it. As Frans mentions later it&#39;s<=
br>
only dependent in oe.dev is flickrcurl. Raptor is both a library and a<br>
utility; we use the latter so raptor itself is a dependency of our<br>
images.<br>
<div class=3D"im"><br>
&gt;&gt;<br>
&gt;&gt; The recipe was modified by adding a LIC_FILES_CHKSUM assignment.<b=
r>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Ben Gardiner &lt;<a href=3D"mailto:bengardiner@nano=
metrics.ca">bengardiner@nanometrics.ca</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; Not tested in the oe-core + meta-openembedded et. al. layers.<br>
<br>
</div>I&#39;m sorry for the confusion -- this recipe is/was tested in oe.de=
v and<br>
2011.03-maintenance branches.<br></blockquote><div><br>I&#39;d say that bef=
ore submitting you should as a minimum test that it builds properly in the =
layer you are submitting it (so e.g. we&#39;re sure all depends are there).=
 <br>
</div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex;=
 border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<div class=3D"im"><br>
&gt; So why are you sending it if it isn&#39;t tested?<br>
&gt;<br>
</div><div class=3D"im">&gt;&gt; We are not<br>
&gt;&gt; ready yet to migrate from the 2011.03-maintenance branch. This pat=
ch is<br>
&gt;&gt; proposed for inclusion in oe-core so that we can meet the new poli=
cy<br>
&gt;&gt; requirements for inclusion in the 2011.03-maintenance branch<br>
&gt;<br>
</div><div class=3D"im">&gt; Where does it say it&#39;s OK to do a pull req=
uest for untested recipes? And where does it say it needs to be in OE-core =
first?<br>
<br>
</div>My understanding of Tom&#39;s post to the oe.dev mailing list is that=
<br>
commits in pull-requests for 2011.03 need to first be oe-core or one<br>
of its layers.<br></blockquote><div><br>No idea here. <br>But why would add=
 a patch for LIC_FILES_CHECKSUM in the maintenance tree.<br>If I recall cor=
rectly those are not needed in 2011.03 (but if it is and it is missing from=
 the recipe, I think it should be added, if not, probably leave the recipe =
as is).<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex;=
 border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
In Message-ID: &lt;<a href=3D"mailto:4DFA7108.5020103@mentor.com">4DFA7108.=
5020103@mentor.com</a>&gt; On Thu, Jun 16, 2011 at<br>
5:09 PM, Tom Rini &lt;<a href=3D"mailto:tom_rini@mentor.com">tom_rini@mento=
r.com</a>&gt; wrote:<br>
&gt; -----BEGIN PGP SIGNED MESSAGE-----<br>
&gt; Hash: SHA1<br>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt; As part of this weeks TSC meeting, an agenda item was brought up about=
<br>
&gt; the 2011.03-maintenance branch and oe-core / etc. =A0I have now update=
d<br>
&gt; the policy about where changes need to be before they can be included =
in<br>
&gt; 2011.03-maintenance to include being in oe-core / meta-oe or other<br>
&gt; relevant public layer instead of being only in the oe.dev master branc=
h.<br>
&gt; =A0This is not a policy change, but a clarification of what was there<=
br>
&gt; previously. =A0Thanks all!<br>
<div class=3D"im">&gt;<br>
<br>
On Thu, Jul 28, 2011 at 7:29 AM, Frans Meulenbroeks<br>
&lt;<a href=3D"mailto:fransmeulenbroeks@gmail.com">fransmeulenbroeks@gmail.=
com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; 2011/7/28 Ben Gardiner &lt;<a href=3D"mailto:bengardiner@nanometrics.c=
a">bengardiner@nanometrics.ca</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Frans Meulenbroeks &lt;<a href=3D"mailto:fransmeule=
nbroeks@gmail.com">fransmeulenbroeks@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Eh, yes and no.<br>
&gt;<br>
&gt; I did write the original recipe and commited it on 14 aug 2010 with a<=
br>
&gt; sign-off message.<br>
&gt; As such this got my signoff, but I am not sure the signoff should be<b=
r>
&gt; repeated if this moved to oe-core.<br>
<br>
</div>Fair enough. It is your Sign-off to give or take.<br>
<br>
I was following the patch message guidelines. &quot;Example: Importaing<br>
from Elsewhere Modified&quot; in particular:<br>
<br>
<a href=3D"http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guid=
elines#Example:_Importing_from_Elsewhere_Modified" target=3D"_blank">http:/=
/wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines#Example:_I=
mporting_from_Elsewhere_Modified</a><br>
</blockquote><div><br>Ah ok, Those guidelines are fairly new and I was not =
too aware of them. If it is in accordance with the guidelines it is fine wi=
th me to keep them.<br>I was mainly triggered by the signed-off lines at th=
e beginning of your message (which I don&#39;t think are in accordance to t=
he above mentioned guidelines). <br>
The only concern I have is that the sign-off would be interpreted as my ble=
ssing for this patch in oe-core. If it only is used as an indicator of the =
origin or as a statement that I released and was entitled to release the or=
iginal stuff, that is ok (as that is still appropriate).<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex;=
 border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
I will remove your Sign-off in v2.<br>
<div class=3D"im"><br>
&gt; My sign-off at that time is definitely not to be used as a suggestion =
it is<br>
&gt; ok for oe-core (actually I feel this is not something for oe-core)<br>
<br>
</div>Understood -- I am happy to re-spin for inclusion in any layer. Pleas=
e advise.<br>
<br>
Best Regards,<br>
Ben Gardiner<br>
<br>
---<br>
Nanometrics Inc.<br>
<a href=3D"http://www.nanometrics.ca" target=3D"_blank">http://www.nanometr=
ics.ca</a><br>
</blockquote></div><br>

--001485f5eb02a80ab804a9217a4f--
