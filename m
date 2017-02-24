Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id CE2DA77514
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 20:51:46 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o22so2717255wro.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 12:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x/daeoxndQSMhm5gyxd1GaTxm+BXD0sPAvIAPwbFecQ=;
	b=uBwpnED6Myd0WJh5tJ3+ZBs/RfF4oLbVSHMLCNLFr10ClQ9smK1D6fmtJRMxIt+v2d
	OpMfCCDk+KjJH2xiQIjsq1tqKmtpLs71KT5m4lvMhhnZmEszKtIhqL5hchdIkfdeKeCv
	0frE47/QJAaeiCQWx6XmYfnCkUXwdHkmOlgOOOKQxZ2sZBb/pWkayyasS/NWLpB/KXT3
	wMQfG8QuOk+zU9iceHw0yfLGcIbDxwv3+41FTqM1gjbimNtfvMZoX6xBbCDjCfWRnTEv
	Mn5ojwEMMXMduw9Hz+hs1jtVFcq1EuwXOoMlP6Hki2z+YtRgfqYk/5ZiBVYFEb+FS+82
	Vb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x/daeoxndQSMhm5gyxd1GaTxm+BXD0sPAvIAPwbFecQ=;
	b=p95A4LJXNiVVzPVmGmbWSKQVngnqd6SRc3kMfocinXZEuGZG9hdGfM6B6eTHIja0Tt
	A1GWWeFIHyICSypxPyBJmggI5Eumvgkl4ZFEXROYxGbY1uX4rXSbUzOpT6rCnqlZVB5w
	+3jw9c2NnJ4wMxP84PqKzEc0WP29alO4m7KGQ3HuEqfAcad9n6V0KVZTL9cm5zCRiACt
	I/CIaUAGQxFuSbwbku6Y0M3cR8QvnRezS6P7Ma7NZTT+rHGN4rwh/tmMwLLAIWH3MKU1
	0ndyAkLUcOdtX/QKodARUIs7jUMCIAhPagdzojQNyXohyD04g38G780Pv2N1RoZwfWoJ
	zNHQ==
X-Gm-Message-State: AMke39kqFKEgJtce9WivmIOB7X4mq/Rgv3Jll+yy+OCPnBmI+Yz96dILcOjNXDudvJjKhASC5Knm74VYxYh68Q==
X-Received: by 10.223.136.79 with SMTP id e15mr4424474wre.14.1487969507472;
	Fri, 24 Feb 2017 12:51:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.208.207 with HTTP; Fri, 24 Feb 2017 12:51:46 -0800 (PST)
In-Reply-To: <d0fc6e64-0602-0389-5c2e-f89161b3885a@balister.org>
References: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
	<CAMKF1sr0OxcRYC9OZsJBieR-MVFnw5XbfuKr+go8xnhgYDHstA@mail.gmail.com>
	<CA+chaQdJprDqs_aiMuWy6pRDB0WDM=fjnM6RqtLGv28EUCLOxg@mail.gmail.com>
	<d0fc6e64-0602-0389-5c2e-f89161b3885a@balister.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 Feb 2017 21:51:46 +0100
Message-ID: <CA+chaQd6FsOMascqMb16stGRVeJK-ickg8hJYq3gVDiTkE_VqQ@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: Joe MacDonald <joe_macdonald@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] deprecated.bbclass: Add a PNDEPRECATED variable for recipes
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
X-List-Received-Date: Fri, 24 Feb 2017 20:51:47 -0000
Content-Type: multipart/alternative; boundary=001a11491ce4edff3305494ce506

--001a11491ce4edff3305494ce506
Content-Type: text/plain; charset=UTF-8

OK, should I update all currently PNBLACKLISTed recipes to add " - the
recipe will be removed on 2017-09-01 unless the issue is fixed" in the
PNBLACKLIST value, so that we can delete all blacklisted recipes before 2.4
release?

On Fri, Feb 24, 2017 at 9:39 PM, Philip Balister <philip@balister.org>
wrote:

> On 02/24/2017 01:16 AM, Martin Jansa wrote:
> >> If nobody speaks up within some
> > amount of time the maintainer considers reasonable (I'm thinking a Yocto
> > release
> > cycle) then it's fair game to remove the recipe in question.
> >
> > Maybe this is different case with at least some PNBLACKLIST entries we
> > currently have, but
> > I don't remove PNBLACKLISTed recipes, because as we discussed it's always
> > easier to unblacklist
> > recipe from e.g. DISTRO config if the issue doesn't affect you for
> whatever
> > reason and causes
> > less churn in the metadata when it gets unblacklisted.
> >
> > And many PNBLACKLISTed recipes are also abandonware.
> >
>
> I think we need to use a different "flag" for recipes that need
> updating, and have maintained upstreams from recipes that have upstreams
> that are abandoned.
>
> So blacklist broken recipes with good upstreams and deprecate recipes
> with dead upstreams.
>
> Philip
>
>
>
> > So my question is, if we will remove PNDEPRECATed recipes after one
> cycle,
> > should we start
> > removing PNBLACKLISTed recipes as well (maybe after 2 cycles?). In both
> > cases it might backfire
> > when someone will fail to find recipe for his favorite abandonware and
> will
> > try to add completely
> > new recipe for it, or we see someone restoring these recipes (e.g. in own
> > layers instead of fixing
> > the PNBLACKLIST/PNDEPRECATED reasons in original layer).
> >
> > On Fri, Feb 24, 2017 at 5:55 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >>
> >> On Thu, Feb 23, 2017 at 8:00 PM Joe MacDonald <joe_macdonald@mentor.com
> >
> >> wrote:
> >>
> >>> Based on the blacklist behaviour, recipes can be tagged as deprecated.
> >>> Such recipes will produce a warning message when included in a build
> but
> >>> unlike blacklisted recipes, the build will continue.
> >>
> >>
> >> Perhaps this should also be documented in manuals
> >>
> >>>
> >>>
> >>> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> >>> ---
> >>>
> >>> I threw this together a long time ago and never got around to sending
> it
> >>> out for
> >>> consideration, but after the excitement last week and this, I got
> >>> thinking about
> >>> it again and thought it might be useful.  My specific use-case for
> this is
> >>> recipes I see in meta-networking that I know are largely abandonware
> but
> >>> that I
> >>> don't want to completely throw out without giving some kind of heads
> up.
> >>> Obviously this is purely informational, there's no mechanism set up for
> >>> purging
> >>> deprecated recipes, that's intended to be a maintainer activity, but
> the
> >>> idea
> >>> would be that the maintainer would flag a recipe as deprecated
> (probably
> >>> when
> >>> it's become more trouble than it seems to be worth) and thereafter
> users
> >>> would
> >>> have fair warning that this thing is on notice.  If nobody speaks up
> >>> within some
> >>> amount of time the maintainer considers reasonable (I'm thinking a
> Yocto
> >>> release
> >>> cycle) then it's fair game to remove the recipe in question.
> >>>
> >>>  meta/classes/deprecated.bbclass    | 16 ++++++++++++++++
> >>>  meta/conf/distro/defaultsetup.conf |  3 ++-
> >>>  2 files changed, 18 insertions(+), 1 deletion(-)
> >>>  create mode 100644 meta/classes/deprecated.bbclass
> >>>
> >>> diff --git a/meta/classes/deprecated.bbclass
> b/meta/classes/deprecated.
> >>> bbclass
> >>> new file mode 100644
> >>> index 0000000..3dcdadb
> >>> --- /dev/null
> >>> +++ b/meta/classes/deprecated.bbclass
> >>> @@ -0,0 +1,16 @@
> >>> +# To use the deprecated recipe check, a distribution should
> >>> +# include this class in the INHERIT_DISTRO
> >>> +#
> >>> +# Features:
> >>> +#
> >>> +# * To add a package to the deprecated list, set:
> >>> +#   PNDEPRECATED[pn] = "message"
> >>> +#
> >>> +
> >>> +addtask check_deprecated before do_fetch
> >>> +python do_check_deprecated () {
> >>> +    deprecated = d.getVarFlag('PNDEPRECATED', d.getVar('PN', True),
> >>> False)
> >>> +
> >>> +    if deprecated:
> >>> +        bb.warn("Recipe is deprecated: ", (deprecated))
> >>> +}
> >>> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/
> >>> defaultsetup.conf
> >>> index ca2f917..16ece3a 100644
> >>> --- a/meta/conf/distro/defaultsetup.conf
> >>> +++ b/meta/conf/distro/defaultsetup.conf
> >>> @@ -20,5 +20,6 @@ CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['',
> >>> '/' + str(d.getVar('MACHINE'
> >>>  USER_CLASSES ?= ""
> >>>  PACKAGE_CLASSES ?= "package_ipk"
> >>>  INHERIT_BLACKLIST = "blacklist"
> >>> +INHERIT_DEPRECATED = "deprecated"
> >>>  INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
> >>> -INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}
> >>> ${INHERIT_BLACKLIST}"
> >>> +INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}
> >>> ${INHERIT_BLACKLIST} ${INHERIT_DEPRECATED}"
> >>> --
> >>> 1.9.1
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >>
> >
> >
> >
>

--001a11491ce4edff3305494ce506
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, should I update all currently PNBLACKLISTed recipes to=
 add &quot; - the recipe will be removed on 2017-09-01 unless the issue is =
fixed&quot; in the PNBLACKLIST value, so that we can delete all blacklisted=
 recipes before 2.4 release?</div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Fri, Feb 24, 2017 at 9:39 PM, Philip Balister <span dir=
=3D"ltr">&lt;<a href=3D"mailto:philip@balister.org" target=3D"_blank">phili=
p@balister.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><spa=
n class=3D"">On 02/24/2017 01:16 AM, Martin Jansa wrote:<br>
&gt;&gt; If nobody speaks up within some<br>
&gt; amount of time the maintainer considers reasonable (I&#39;m thinking a=
 Yocto<br>
&gt; release<br>
&gt; cycle) then it&#39;s fair game to remove the recipe in question.<br>
&gt;<br>
&gt; Maybe this is different case with at least some PNBLACKLIST entries we=
<br>
&gt; currently have, but<br>
&gt; I don&#39;t remove PNBLACKLISTed recipes, because as we discussed it&#=
39;s always<br>
&gt; easier to unblacklist<br>
&gt; recipe from e.g. DISTRO config if the issue doesn&#39;t affect you for=
 whatever<br>
&gt; reason and causes<br>
&gt; less churn in the metadata when it gets unblacklisted.<br>
&gt;<br>
&gt; And many PNBLACKLISTed recipes are also abandonware.<br>
&gt;<br>
<br>
</span>I think we need to use a different &quot;flag&quot; for recipes that=
 need<br>
updating, and have maintained upstreams from recipes that have upstreams<br=
>
that are abandoned.<br>
<br>
So blacklist broken recipes with good upstreams and deprecate recipes<br>
with dead upstreams.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Philip<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
&gt; So my question is, if we will remove PNDEPRECATed recipes after one cy=
cle,<br>
&gt; should we start<br>
&gt; removing PNBLACKLISTed recipes as well (maybe after 2 cycles?). In bot=
h<br>
&gt; cases it might backfire<br>
&gt; when someone will fail to find recipe for his favorite abandonware and=
 will<br>
&gt; try to add completely<br>
&gt; new recipe for it, or we see someone restoring these recipes (e.g. in =
own<br>
&gt; layers instead of fixing<br>
&gt; the PNBLACKLIST/PNDEPRECATED reasons in original layer).<br>
&gt;<br>
&gt; On Fri, Feb 24, 2017 at 5:55 AM, Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Feb 23, 2017 at 8:00 PM Joe MacDonald &lt;<a href=3D"mailt=
o:joe_macdonald@mentor.com">joe_macdonald@mentor.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; Based on the blacklist behaviour, recipes can be tagged as dep=
recated.<br>
&gt;&gt;&gt; Such recipes will produce a warning message when included in a=
 build but<br>
&gt;&gt;&gt; unlike blacklisted recipes, the build will continue.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Perhaps this should also be documented in manuals<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Joe MacDonald &lt;<a href=3D"mailto:joe_macdona=
ld@mentor.com">joe_macdonald@mentor.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I threw this together a long time ago and never got around to =
sending it<br>
&gt;&gt;&gt; out for<br>
&gt;&gt;&gt; consideration, but after the excitement last week and this, I =
got<br>
&gt;&gt;&gt; thinking about<br>
&gt;&gt;&gt; it again and thought it might be useful.=C2=A0 My specific use=
-case for this is<br>
&gt;&gt;&gt; recipes I see in meta-networking that I know are largely aband=
onware but<br>
&gt;&gt;&gt; that I<br>
&gt;&gt;&gt; don&#39;t want to completely throw out without giving some kin=
d of heads up.<br>
&gt;&gt;&gt; Obviously this is purely informational, there&#39;s no mechani=
sm set up for<br>
&gt;&gt;&gt; purging<br>
&gt;&gt;&gt; deprecated recipes, that&#39;s intended to be a maintainer act=
ivity, but the<br>
&gt;&gt;&gt; idea<br>
&gt;&gt;&gt; would be that the maintainer would flag a recipe as deprecated=
 (probably<br>
&gt;&gt;&gt; when<br>
&gt;&gt;&gt; it&#39;s become more trouble than it seems to be worth) and th=
ereafter users<br>
&gt;&gt;&gt; would<br>
&gt;&gt;&gt; have fair warning that this thing is on notice.=C2=A0 If nobod=
y speaks up<br>
&gt;&gt;&gt; within some<br>
&gt;&gt;&gt; amount of time the maintainer considers reasonable (I&#39;m th=
inking a Yocto<br>
&gt;&gt;&gt; release<br>
&gt;&gt;&gt; cycle) then it&#39;s fair game to remove the recipe in questio=
n.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 meta/classes/deprecated.<wbr>bbclass=C2=A0 =C2=A0 | 16 +=
+++++++++++++++<br>
&gt;&gt;&gt;=C2=A0 meta/conf/distro/defaultsetup.<wbr>conf |=C2=A0 3 ++-<br=
>
&gt;&gt;&gt;=C2=A0 2 files changed, 18 insertions(+), 1 deletion(-)<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/classes/deprecated.<wbr>bbclass<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta/classes/deprecated.<wbr>bbclass b/meta/class=
es/deprecated.<br>
&gt;&gt;&gt; bbclass<br>
&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 0000000..3dcdadb<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; +++ b/meta/classes/deprecated.<wbr>bbclass<br>
&gt;&gt;&gt; @@ -0,0 +1,16 @@<br>
&gt;&gt;&gt; +# To use the deprecated recipe check, a distribution should<b=
r>
&gt;&gt;&gt; +# include this class in the INHERIT_DISTRO<br>
&gt;&gt;&gt; +#<br>
&gt;&gt;&gt; +# Features:<br>
&gt;&gt;&gt; +#<br>
&gt;&gt;&gt; +# * To add a package to the deprecated list, set:<br>
&gt;&gt;&gt; +#=C2=A0 =C2=A0PNDEPRECATED[pn] =3D &quot;message&quot;<br>
&gt;&gt;&gt; +#<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +addtask check_deprecated before do_fetch<br>
&gt;&gt;&gt; +python do_check_deprecated () {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 deprecated =3D d.getVarFlag(&#39;PNDEPRECATED&#=
39;, d.getVar(&#39;PN&#39;, True),<br>
&gt;&gt;&gt; False)<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 if deprecated:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Recipe is deprecate=
d: &quot;, (deprecated))<br>
&gt;&gt;&gt; +}<br>
&gt;&gt;&gt; diff --git a/meta/conf/distro/<wbr>defaultsetup.conf b/meta/co=
nf/distro/<br>
&gt;&gt;&gt; defaultsetup.conf<br>
&gt;&gt;&gt; index ca2f917..16ece3a 100644<br>
&gt;&gt;&gt; --- a/meta/conf/distro/<wbr>defaultsetup.conf<br>
&gt;&gt;&gt; +++ b/meta/conf/distro/<wbr>defaultsetup.conf<br>
&gt;&gt;&gt; @@ -20,5 +20,6 @@ CACHE =3D &quot;${TMPDIR}/cache/${TCMODE}-${=
<wbr>TCLIBC}${@[&#39;&#39;,<br>
&gt;&gt;&gt; &#39;/&#39; + str(d.getVar(&#39;MACHINE&#39;<br>
&gt;&gt;&gt;=C2=A0 USER_CLASSES ?=3D &quot;&quot;<br>
&gt;&gt;&gt;=C2=A0 PACKAGE_CLASSES ?=3D &quot;package_ipk&quot;<br>
&gt;&gt;&gt;=C2=A0 INHERIT_BLACKLIST =3D &quot;blacklist&quot;<br>
&gt;&gt;&gt; +INHERIT_DEPRECATED =3D &quot;deprecated&quot;<br>
&gt;&gt;&gt;=C2=A0 INHERIT_DISTRO ?=3D &quot;debian devshell sstate license=
 remove-libtool&quot;<br>
&gt;&gt;&gt; -INHERIT +=3D &quot;${PACKAGE_CLASSES} ${USER_CLASSES} ${INHER=
IT_DISTRO}<br>
&gt;&gt;&gt; ${INHERIT_BLACKLIST}&quot;<br>
&gt;&gt;&gt; +INHERIT +=3D &quot;${PACKAGE_CLASSES} ${USER_CLASSES} ${INHER=
IT_DISTRO}<br>
&gt;&gt;&gt; ${INHERIT_BLACKLIST} ${INHERIT_DEPRECATED}&quot;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 1.9.1<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Op=
enembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/open=
embedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedd=
ed.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a11491ce4edff3305494ce506--
