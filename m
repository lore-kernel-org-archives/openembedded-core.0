Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RZ6nI-0000IR-C4
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 21:11:45 +0100
Received: from mail-qw0-f45.google.com ([209.85.216.45])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 09 Dec 2011 12:03:47 -0800
Received: by qadz30 with SMTP id z30so1830298qad.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 12:03:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.156.133 with SMTP id we5mr4559956igb.74.1323461025499; Fri,
	09 Dec 2011 12:03:45 -0800 (PST)
Received: by 10.50.66.2 with HTTP; Fri, 9 Dec 2011 12:03:45 -0800 (PST)
In-Reply-To: <6376A851-2DD2-4F74-B085-1E9DAA404105@dominion.thruhere.net>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
	<6c65669e1c223d59020c581750599c11ee222063.1323286080.git.elizabeth.flanagan@intel.com>
	<20111207215306.GE6351@sakrah.homelinux.org>
	<4EE170C6.2070201@emagii.com> <1323431158.5309.126.camel@ted>
	<4EE21138.8070609@emagii.com>
	<6376A851-2DD2-4F74-B085-1E9DAA404105@dominion.thruhere.net>
Date: Fri, 9 Dec 2011 12:03:45 -0800
Message-ID: <CAPhnLPCF-a24Y+t2RpoBNhD_TeB1y+H1EX93tB3CoMCW5fu7Ng@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: ulf@emagii.com
Subject: Re: [PATCH 4/8] Add copyleft compliance class --- MAJOR BREAKAGE!!!!
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
X-List-Received-Date: Fri, 09 Dec 2011 20:11:45 -0000
Content-Type: multipart/alternative; boundary=e89a8f2350094c89da04b3ae4886

--e89a8f2350094c89da04b3ae4886
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 9, 2011 at 5:51 AM, Koen Kooi <koen@dominion.thruhere.net>wrote:

>
> Op 9 dec. 2011, om 14:46 heeft Ulf Samuelsson het volgende geschreven:
>
> > On 2011-12-09 12:45, Richard Purdie wrote:
> >> On Fri, 2011-12-09 at 03:21 +0100, Ulf Samuelsson wrote:
> >>> On 2011-12-07 22:53, Khem Raj wrote:
> >>>> On (07/12/11 11:34), Beth Flanagan wrote:
> >>>>> From: Christopher Larson<kergoth@gmail.com>
> >>>>>
> >>>>> Deploys sources for recipes for compliance with copyleft-style
> licenses
> >>>>> Defaults to using symlinks, as it's a quick operation, and one can
> easily
> >>>>> follow the links when making use of the files (e.g. tar with the -h
> arg).
> >>>>>
> >>>>> By default, includes all GPL and LGPL, and excludes CLOSED and
> Proprietary.
> >>>>>
> >>>>> Signed-off-by: Christopher Larson<kergoth@gmail.com>
> >>>>> ---
> >>>>>   meta/classes/copyleft_compliance.bbclass |   94
> ++++++++++++++++++++++++++++++
> >>>>>   1 files changed, 94 insertions(+), 0 deletions(-)
> >>>>>   create mode 100644 meta/classes/copyleft_compliance.bbclass
> >>>>>
> >>>>> diff --git a/meta/classes/copyleft_compliance.bbclass
> b/meta/classes/copyleft_compliance.bbclass
> >>>>> new file mode 100644
> >>>>> index 0000000..5d9ab11
> >>>>> --- /dev/null
> >>>>> +++ b/meta/classes/copyleft_compliance.bbclass
> >>>>> @@ -0,0 +1,94 @@
> >>>>> +# Deploy sources for recipes for compliance with copyleft-style
> licenses
> >>>>> +# Defaults to using symlinks, as it's a quick operation, and one
> can easily
> >>>>> +# follow the links when making use of the files (e.g. tar with the
> -h arg).
> >>>>> +#
> >>>>> +# By default, includes all GPL and LGPL, and excludes CLOSED and
> Proprietary.
> >>>>> +#
> >>>>> +# vi:sts=4:sw=4:et
> >>>>> +
> >>>>> +COPYLEFT_SOURCES_DIR ?= '${DEPLOY_DIR}/copyleft_sources'
> >>>>> +
> >>>>> +COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL*'
> >>>>> +COPYLEFT_LICENSE_INCLUDE[type] = 'list'
> >>>>> +COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs
> which include licenses'
> >>> If the Ampersand is not accepted in the LICENSE string, then the
> recipes
> >>> below are broken.
> >>>
> >>>  From my latest build, at least recipes with "&&" fail...
> >>> This means that nothing really completes that I have tested.
> >>>
> >>> MAJOR BREAKAGE!!!!
> >>>
> >>> I think it would be better FIRST to fix the recipes, and then introduce
> >>> checking.
> >> I think the single ampersand is accepted, the double might no longer be.
> > Yes, the single ampersand works, but the double ampersand will break the
> build
> > as well as the slash '/'.
> >
> >
> >> Certainly oe-core does continue to work. I hadn't realised there were
> >> incompatibilities introduced by this patch :(
> >>
> >> Not sure what we should do about this at this point, probably fix the
> >> layers :/.
> >>
> > True, question is who and when ?
>
> The people complaining about it and right now.
>


I know there was a conversation a while back about standardizing this field
and documenting it. If anything fell out of it, IDK, If there is any
documentation for what is valid form, I've not seen it. If it exists, could
someone point me to it? If it doesn't could we get a standards discussion
going here about how to move forward with this so we have something
documented? I've seen a bunch of different standards here and I really want
to get something nailed down as trying to write code for a field that isn't
well defined is a pain.

A few things I've been thinking about here.

- LICENSE should be ast parsable.
- license within LICENSE should have no spaces.
- At last count there are 100+ OSI opensource licenses. I've been pulling
from spdx.org and trying to use their naming convention while also
supporting mappings to non-spdx naming conventions. However there are some
LICENSE entries that are just wrong (GPL without a version) and need to be
fixed.
- the operands I've been supporting are & or |, with a modifier of +. I've
also been supporting parens grouping of license. example: "(Foo-1.0 &
Bar-1.0 ) | (Foo-2.0 & Bar-2.0)".
- There is an actual issue with LICENSE in that LICENSE is recipe based. We
should probably discuss the ability to support LICENSE_pkg, because the
recipe may contain multiple packages some of which don't share a license in
LICENSE.
- LICENSE priority should probably be dealt in a config but not in the
recipe. To me, it would make more sense as the main use case would probably
center around "If I can avoid getting XXX license in this image, please do".

I'll look at this to see if there is a way to handle some of the issues
this code introduces better, as I'm sure other 3rd party layers exist that
will have the same issue with this.

-b



> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk7iEksACgkQMkyGM64RGpEPYQCeMpX884EmuwpUaIdFrvJ4Pp09
> aPoAn08cOAO5X2JMPXSoOEcFBPzDt+0V
> =LDRp
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


-- 
Elizabeth Flanagan
Yocto Project
Build and Release

--e89a8f2350094c89da04b3ae4886
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Fri, Dec 9, 2011 at 5:51 AM, Koen Koo=
i <span dir=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@=
dominion.thruhere.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 2=
04, 204); padding-left: 1ex;">
<br>
Op 9 dec. 2011, om 14:46 heeft Ulf Samuelsson het volgende geschreven:<br>
<div><div class=3D"h5"><br>
&gt; On 2011-12-09 12:45, Richard Purdie wrote:<br>
&gt;&gt; On Fri, 2011-12-09 at 03:21 +0100, Ulf Samuelsson wrote:<br>
&gt;&gt;&gt; On 2011-12-07 22:53, Khem Raj wrote:<br>
&gt;&gt;&gt;&gt; On (07/12/11 11:34), Beth Flanagan wrote:<br>
&gt;&gt;&gt;&gt;&gt; From: Christopher Larson&lt;<a href=3D"mailto:kergoth@=
gmail.com">kergoth@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Deploys sources for recipes for compliance with copyle=
ft-style licenses<br>
&gt;&gt;&gt;&gt;&gt; Defaults to using symlinks, as it&#39;s a quick operat=
ion, and one can easily<br>
&gt;&gt;&gt;&gt;&gt; follow the links when making use of the files (e.g. ta=
r with the -h arg).<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; By default, includes all GPL and LGPL, and excludes CL=
OSED and Proprietary.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Christopher Larson&lt;<a href=3D"mailto=
:kergoth@gmail.com">kergoth@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; =A0 meta/classes/copyleft_compliance.bbclass | =A0 94 =
++++++++++++++++++++++++++++++<br>
&gt;&gt;&gt;&gt;&gt; =A0 1 files changed, 94 insertions(+), 0 deletions(-)<=
br>
&gt;&gt;&gt;&gt;&gt; =A0 create mode 100644 meta/classes/copyleft_complianc=
e.bbclass<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/meta/classes/copyleft_compliance.bbclass =
b/meta/classes/copyleft_compliance.bbclass<br>
&gt;&gt;&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt;&gt;&gt; index 0000000..5d9ab11<br>
&gt;&gt;&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt;&gt;&gt; +++ b/meta/classes/copyleft_compliance.bbclass<br>
&gt;&gt;&gt;&gt;&gt; @@ -0,0 +1,94 @@<br>
&gt;&gt;&gt;&gt;&gt; +# Deploy sources for recipes for compliance with copy=
left-style licenses<br>
&gt;&gt;&gt;&gt;&gt; +# Defaults to using symlinks, as it&#39;s a quick ope=
ration, and one can easily<br>
&gt;&gt;&gt;&gt;&gt; +# follow the links when making use of the files (e.g.=
 tar with the -h arg).<br>
&gt;&gt;&gt;&gt;&gt; +#<br>
&gt;&gt;&gt;&gt;&gt; +# By default, includes all GPL and LGPL, and excludes=
 CLOSED and Proprietary.<br>
&gt;&gt;&gt;&gt;&gt; +#<br>
&gt;&gt;&gt;&gt;&gt; +# vi:sts=3D4:sw=3D4:et<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +COPYLEFT_SOURCES_DIR ?=3D &#39;${DEPLOY_DIR}/copyleft=
_sources&#39;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +COPYLEFT_LICENSE_INCLUDE ?=3D &#39;GPL* LGPL*&#39;<br=
>
&gt;&gt;&gt;&gt;&gt; +COPYLEFT_LICENSE_INCLUDE[type] =3D &#39;list&#39;<br>
&gt;&gt;&gt;&gt;&gt; +COPYLEFT_LICENSE_INCLUDE[doc] =3D &#39;Space separate=
d list of globs which include licenses&#39;<br>
&gt;&gt;&gt; If the Ampersand is not accepted in the LICENSE string, then t=
he recipes<br>
&gt;&gt;&gt; below are broken.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =A0From my latest build, at least recipes with &quot;&amp;&amp=
;&quot; fail...<br>
&gt;&gt;&gt; This means that nothing really completes that I have tested.<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; MAJOR BREAKAGE!!!!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I think it would be better FIRST to fix the recipes, and then =
introduce<br>
&gt;&gt;&gt; checking.<br>
&gt;&gt; I think the single ampersand is accepted, the double might no long=
er be.<br>
&gt; Yes, the single ampersand works, but the double ampersand will break t=
he build<br>
&gt; as well as the slash &#39;/&#39;.<br>
&gt;<br>
&gt;<br>
&gt;&gt; Certainly oe-core does continue to work. I hadn&#39;t realised the=
re were<br>
&gt;&gt; incompatibilities introduced by this patch :(<br>
&gt;&gt;<br>
&gt;&gt; Not sure what we should do about this at this point, probably fix =
the<br>
&gt;&gt; layers :/.<br>
&gt;&gt;<br>
&gt; True, question is who and when ?<br>
<br>
</div></div>The people complaining about it and right now.<br></blockquote>=
<div><br><br>I know there was a conversation a while back about standardizi=
ng this field and documenting it. If anything fell out of it, IDK, If there=
 is any documentation for what is valid form, I&#39;ve not seen it. If it e=
xists, could someone point me to it? If it doesn&#39;t could we get a stand=
ards discussion going here about how to move forward with this so we have s=
omething documented? I&#39;ve seen a bunch of different standards here and =
I really want to get something nailed down as trying to write code for a fi=
eld that isn&#39;t well defined is a pain. <br>
<br>A few things I&#39;ve been thinking about here.<br><br>- LICENSE should=
 be ast parsable. <br>- license within LICENSE should have no spaces.<br>- =
At last count there are 100+ OSI opensource licenses. I&#39;ve been pulling=
 from <a href=3D"http://spdx.org">spdx.org</a> and trying to use their nami=
ng convention while also supporting mappings to non-spdx naming conventions=
. However there are some LICENSE entries that are just wrong (GPL without a=
 version) and need to be fixed. <br>
- the operands I&#39;ve been supporting are &amp; or |, with a modifier of =
+. I&#39;ve also been supporting parens grouping of license. example: &quot=
;(Foo-1.0 &amp; Bar-1.0 ) | (Foo-2.0 &amp; Bar-2.0)&quot;. <br>- There is a=
n actual issue with LICENSE in that LICENSE is recipe based. We should prob=
ably discuss the ability to support LICENSE_pkg, because the recipe may con=
tain multiple packages some of which don&#39;t share a license in LICENSE.<=
br>
- LICENSE priority should probably be dealt in a config but not in the reci=
pe. To me, it would make more sense as the main use case would probably cen=
ter around &quot;If I can avoid getting XXX=20
license in this image, please do&quot;.<br>
<br>I&#39;ll look at this to see if there is a way to handle some of the is=
sues this code introduces better, as I&#39;m sure other 3rd party layers ex=
ist that will have the same issue with this.<br><br>-b<br><br>=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-le=
ft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
-----BEGIN PGP SIGNATURE-----<br>
<br>
iEYEARECAAYFAk7iEksACgkQMkyGM64RGpEPYQCeMpX884EmuwpUaIdFrvJ4Pp09<br>
aPoAn08cOAO5X2JMPXSoOEcFBPzDt+0V<br>
=3DLDRp<br>
-----END PGP SIGNATURE-----<br>
<br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br></blockquote></div><br><br clear=3D"all"><br>-- <br>Elizabeth Flanagan<=
br>Yocto Project<br>Build and Release<br>

--e89a8f2350094c89da04b3ae4886--
