Return-Path: <tarun4690@gmail.com>
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
	[209.85.219.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0421374BBC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 14:25:43 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id e18-v6so2749423ybq.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OJPylK1aUzgTZcL+q1Vere/tHUDvQdtLrUbDcZvwo/4=;
	b=XWnWCj0YTtcWzAktL8Sq1djoaYHLcG+HFBq1ZOFHuSM/Osij9QKXrCKxi0yc0LxHV/
	4DHbo7ubPkDsKsfpjoACHyovabyOMQihNOl8HUGTBFGzd0NhyuBcGHTEVarfx5y5ZPOK
	N4kINI2PkAcCpzdPTdAQ2QW/knKTmRXvKJFJmc+ZA8GXtS/yaxKfNiT707VowyZNRjGZ
	8Zd0c1IBTyFTQYnzaWOwyaTg6kGQJTXFuxvAxiV96mAzCIpbcNAEq1uCP6iVT4RN2go9
	oS3Bp/znC2vhEJPrSSb/Z2SVWpNodhDgWf/1ERcRLvsaK2/u6EcZk3o0DAo8jZCEdoiJ
	FjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OJPylK1aUzgTZcL+q1Vere/tHUDvQdtLrUbDcZvwo/4=;
	b=XMah5Pi/uTQ/YCTVa8KeGn6aBRybetDk2xvXG5p1WX8PtEfFH8L/9g31kcmNrSIBbF
	2hK3jNL9zNIBgiqV/d/9izm1h03oXUoLwYS3eU3cBI3/nablFo8aOqcf7T9POGi7VZBp
	iQU68jqS2wvtc6NVZcl0vDWV/fRKNa+rkju5MPBWeibjXvagCX7svY+dDHWYFGC5ELCu
	t2ZB+44tcO5gkW4prY0RkpL1nbKZIrB38Y3yLoZbODkgS+fCJl7mpNWqT3gIGTxOC3xS
	0vP2g5Y9QoeOiF2kXEMLaBu2hqrp2rMgcHRngBtZ2rY3Wj1nvCVYKtZzUSYKPfxkF9pL
	gYew==
X-Gm-Message-State: APzg51A8PDaMe4U4EvLGygEYPqK0Hk6WNFKyde/SYmGr6qolFMlJcYQG
	wQ6IW9sG2ftskx6PnrlCOeYiIOhb+ewkoTNCbiU=
X-Google-Smtp-Source: ANB0VdYe9CecRJj544p+Od5JAB9bL5/nlgSsH/S9Cw0WY/7yqZav0fC0mTVXJAzcjcnsdHtAsTJzChecm7zmx4F6xs4=
X-Received: by 2002:a25:a20a:: with SMTP id
	b10-v6mr4590711ybi.374.1536157544752; 
	Wed, 05 Sep 2018 07:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAMvyGd-9c41OHDgy1qaxhiNyQwH9Hf9Nzo3bqfw+fanGF-AdNg@mail.gmail.com>
	<CANNYZj9_WHwO4iM1dkhQDKkBXfeNyNdA7cAioh7=D-5DEgLb2A@mail.gmail.com>
In-Reply-To: <CANNYZj9_WHwO4iM1dkhQDKkBXfeNyNdA7cAioh7=D-5DEgLb2A@mail.gmail.com>
From: Tarun Tej K <tarun4690@gmail.com>
Date: Wed, 5 Sep 2018 19:55:33 +0530
Message-ID: <CAMvyGd_XsQCHnfPiJNuLpD-ATzHnPgHcOARkRzTB-3Z0B5pXyw@mail.gmail.com>
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: bitbake gstreamer1.0 : "Nothing PROVIDES 'gobject-introspection'"
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
X-List-Received-Date: Wed, 05 Sep 2018 14:25:44 -0000
Content-Type: multipart/alternative; boundary="000000000000c62c310575208cc9"

--000000000000c62c310575208cc9
Content-Type: text/plain; charset="UTF-8"

Thanks for the response.

The issue I have is, although I have added the
gobject-introspection.bbclass within the classes directory, I get an error
saying 'Nothing PROVIDES 'gobject-introspection'.

The other class I use (upstream-version-is-even.bbclass) is also present in
the same directory but it gets inherited by gstreamer1.0_1.14.2.bb without
any error. Why is there a problem for gobject-introspection only?

I totally agree to your point about updating to latest YP release. It is
just that our project is depending on some recipes related to older version
BSP so it will be a while before we completely migrate to latest release.

Thanks
Tarun

On Wed, Sep 5, 2018 at 7:44 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> What is the issue though? You need to be clear about it: paste the
> exact, specific error message you are getting.
>
> Generally, I would recommend that you update to the latest YP release
> first. Backporting recipes in this fashion is a complicated task.
>
>
>
> Alex
>
> 2018-09-05 15:36 GMT+02:00 Tarun Tej K <tarun4690@gmail.com>:
> > Hi,
> >
> > I am trying to build the latest gstreamer version 1.14.2 using the yocto
> > recipes from
> >
> https://github.com/openembedded/openembedded-core/tree/master/meta/recipes-multimedia/gstreamer
> >
> > I have added new version recipes to my custom yocto layer; added the
> > required .bbclass files to 'classes' directory inside my custom layer.
> There
> > are older version (1.4.5, 1.6.0) recipes in other layers but my layer has
> > higher priority so the 'bitbake -s' shows 1.14.2 as the version of
> gstreamer
> > family, so that proves the recipes are successfully parsed.
> >
> > After that I am trying to build gstreamer1.0 using the command 'bitbake
> > gstreamer1.0' but I get an error saying
> > Nothing PROVIDES 'gobject-introspection' ..........
> > Close matches:
> > gobject-introspection-stub
> > gobject-introspection-native
> >
> > I have verified that the gobject-introspection.bbclass file has been
> added
> > to classed directory of my layer. I have removed gobject-introspection
> from
> > the inherit list in the  gstreamer1.0_1.14.2.bb and it successfully
> > continued to bitbake until some 'installed but not shipped' error
> occurred
> > at do_package_qa task. Also another class
> 'upstream-version-is-even.bbclass'
> > is also inherited by gstreamer1.0_1.14.2.bb and that is also present in
> same
> > directory as gobject-introspection.bbclass but I don't get any error with
> > that.
> >
> > I am using the yocto setup cloned from freescale's repository
> > (
> http://git.freescale.com/git/cgit.cgi/imx/fsl-arm-yocto-bsp.git/tree/imx-4.1.15-1.1.2.xml?h=imx-4.1.15-1.0.0_ga
> ),
> > so this might contain older dependency libraries. Also the bitbake
> version
> > is 1.28.0
> >
> > What could be the problem? Please let me know if I need to provide any
> > additional information to understand issue better.
> >
> > Thanks
> > Tarun
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--000000000000c62c310575208cc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the response.<div><br></div><div>The issue I ha=
ve is, although I have added the gobject-introspection.bbclass within the c=
lasses directory, I get an error saying &#39;<span style=3D"color:rgb(32,33=
,36);font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Helvetica,Arial=
,sans-serif;font-variant-ligatures:no-contextual">Nothing PROVIDES &#39;gob=
ject-introspecti</span><span style=3D"color:rgb(32,33,36);font-family:&quot=
;Google Sans&quot;,Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-varia=
nt-ligatures:no-contextual">on&#39;.=C2=A0</span></div><div><br></div><div>=
The other class I use (upstream-version-is-even.bbclass) is also present in=
 the same directory but it gets inherited by <a href=3D"http://gstreamer1.0=
_1.14.2.bb">gstreamer1.0_1.14.2.bb</a> without any error. Why is there a pr=
oblem for gobject-introspection only?</div><div><br></div><div>I totally ag=
ree to your point about updating to latest YP release. It is just that our =
project is depending on some recipes related to older version BSP so it wil=
l be a while before we completely migrate to latest release.</div><div><br>=
</div><div>Thanks<br>Tarun</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr">On Wed, Sep 5, 2018 at 7:44 PM Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">What is the issue though? You need to be clear =
about it: paste the<br>
exact, specific error message you are getting.<br>
<br>
Generally, I would recommend that you update to the latest YP release<br>
first. Backporting recipes in this fashion is a complicated task.<br>
<br>
<br>
<br>
Alex<br>
<br>
2018-09-05 15:36 GMT+02:00 Tarun Tej K &lt;<a href=3D"mailto:tarun4690@gmai=
l.com" target=3D"_blank">tarun4690@gmail.com</a>&gt;:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am trying to build the latest gstreamer version 1.14.2 using the yoc=
to<br>
&gt; recipes from<br>
&gt; <a href=3D"https://github.com/openembedded/openembedded-core/tree/mast=
er/meta/recipes-multimedia/gstreamer" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/openembedded/openembedded-core/tree/master/meta/recipes-=
multimedia/gstreamer</a><br>
&gt;<br>
&gt; I have added new version recipes to my custom yocto layer; added the<b=
r>
&gt; required .bbclass files to &#39;classes&#39; directory inside my custo=
m layer. There<br>
&gt; are older version (1.4.5, 1.6.0) recipes in other layers but my layer =
has<br>
&gt; higher priority so the &#39;bitbake -s&#39; shows 1.14.2 as the versio=
n of gstreamer<br>
&gt; family, so that proves the recipes are successfully parsed.<br>
&gt;<br>
&gt; After that I am trying to build gstreamer1.0 using the command &#39;bi=
tbake<br>
&gt; gstreamer1.0&#39; but I get an error saying<br>
&gt; Nothing PROVIDES &#39;gobject-introspection&#39; ..........<br>
&gt; Close matches:<br>
&gt; gobject-introspection-stub<br>
&gt; gobject-introspection-native<br>
&gt;<br>
&gt; I have verified that the gobject-introspection.bbclass file has been a=
dded<br>
&gt; to classed directory of my layer. I have removed gobject-introspection=
 from<br>
&gt; the inherit list in the=C2=A0 <a href=3D"http://gstreamer1.0_1.14.2.bb=
" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.14.2.bb</a> and it su=
ccessfully<br>
&gt; continued to bitbake until some &#39;installed but not shipped&#39; er=
ror occurred<br>
&gt; at do_package_qa task. Also another class &#39;upstream-version-is-eve=
n.bbclass&#39;<br>
&gt; is also inherited by <a href=3D"http://gstreamer1.0_1.14.2.bb" rel=3D"=
noreferrer" target=3D"_blank">gstreamer1.0_1.14.2.bb</a> and that is also p=
resent in same<br>
&gt; directory as gobject-introspection.bbclass but I don&#39;t get any err=
or with<br>
&gt; that.<br>
&gt;<br>
&gt; I am using the yocto setup cloned from freescale&#39;s repository<br>
&gt; (<a href=3D"http://git.freescale.com/git/cgit.cgi/imx/fsl-arm-yocto-bs=
p.git/tree/imx-4.1.15-1.1.2.xml?h=3Dimx-4.1.15-1.0.0_ga" rel=3D"noreferrer"=
 target=3D"_blank">http://git.freescale.com/git/cgit.cgi/imx/fsl-arm-yocto-=
bsp.git/tree/imx-4.1.15-1.1.2.xml?h=3Dimx-4.1.15-1.0.0_ga</a>),<br>
&gt; so this might contain older dependency libraries. Also the bitbake ver=
sion<br>
&gt; is 1.28.0<br>
&gt;<br>
&gt; What could be the problem? Please let me know if I need to provide any=
<br>
&gt; additional information to understand issue better.<br>
&gt;<br>
&gt; Thanks<br>
&gt; Tarun<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
&gt;<br>
</blockquote></div></div>

--000000000000c62c310575208cc9--
