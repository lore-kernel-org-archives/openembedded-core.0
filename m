Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5759A77C9C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 13:03:35 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id g19so17194219wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 06:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/9LQfOb4OaWHNOHgukzWUztYuFpWh6a7BS8eOL/UGeE=;
	b=LU3bvBhAOSck9bhe2upd7pjznQ0bZ0uo5lGQnud0Di1gam7yTGuLk25ccX/mFQ723a
	W7C9eCiLkByop7xw9jnZIowVg/mkZ5KttuJ9z4KCVAT87xfdG2XC1Dl7mWzChSr+v/sp
	v2GiHRsd42ocWIwnSVCTwOeEC32XVji5T5TIyCsSgnoPfCXpFDswLqY8kmUK1P1NGUjG
	O+KpnFe+HfJXoBUVCm5vBlspugBveTg3YcLFC63mMuB8crUmmMhDwUE9q9CZ+Kp3apMH
	stLdj2CM/VOpeU5InboD6+z7gYc/fsBqy+S9e8j5Qbi05/dkOr8h0Vvzw3sTxs5JArgv
	w0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/9LQfOb4OaWHNOHgukzWUztYuFpWh6a7BS8eOL/UGeE=;
	b=TEwWbCdNezadMiOO9rqEVKgWd0ArRpAVmjyNit2rZsbcMaa+eYNa6rZ5Efu9RHMXVx
	Nw/+I5y+46C9naj0BgiRYodkxbcln0vFNSYr44A8ECL/PVIl1dDock8erdA+SmKc+UAY
	8Td7lNIy+lCBPfIMPSlGJbpQhx1LvCnGRh93ydo0CucbeVsyM8Yuy0ojWOc2h9ajHT3S
	NzvBF3fRME5AGQ1Uad4K/uTx/DrF+HtaNXh6uQyLYtsz2iD/5vkBojv93H9WkLZFRAZZ
	KAFvANtQMvhy0N6RAibOnARa7sCpq6ykXOrqox4dbvZRc+bUi/5W/yzy2mHXjX6uXJap
	xV9Q==
X-Gm-Message-State: AFeK/H1MzB/fxkHlnO99bU57frHSJROIXai5Q82qUFR3QB25bINxAJvb
	j+oBClDpFJkBH/FnWwB4pvVrZsMxkQ==
X-Received: by 10.28.37.135 with SMTP id l129mr22317243wml.49.1491483817059;
	Thu, 06 Apr 2017 06:03:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 6 Apr 2017 06:03:36 -0700 (PDT)
In-Reply-To: <CAHiDW_FWnBo8vsQ_OTwHYDJmMDXfH1b+6UkTjWf1=qK9QiYWLg@mail.gmail.com>
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<CAHiDW_GH-WhDow0+nP-JnTq1kUKqfBmtS__BuqfUSuroNvsawg@mail.gmail.com>
	<2234508.nmKqqo84gx@crde-port-20.cahors.local>
	<CAHiDW_FWnBo8vsQ_OTwHYDJmMDXfH1b+6UkTjWf1=qK9QiYWLg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 6 Apr 2017 15:03:36 +0200
Message-ID: <CA+chaQdGcpevoyue494P0FkYp_C8dt4fbZ3CLoza7sVHoRSWjg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Thu, 06 Apr 2017 13:03:36 -0000
Content-Type: multipart/alternative; boundary=001a114e192c1ab740054c7f2326

--001a114e192c1ab740054c7f2326
Content-Type: text/plain; charset=UTF-8

I still don't understand why not use standard update-alternatives and
install another package with your favorite openssl.conf which has higher
ALTERNATIVE_PRIORITY.

This way u-a will switch to new config even when you just install the
package which require it on the target later and will switch back to
default openssl.conf when the alternative package with config file is
uninstalled.

On Thu, Apr 6, 2017 at 12:55 PM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> On 6 April 2017 at 12:23, David Vincent <freesilicon@gmail.com> wrote:
> >
> > On mercredi 5 avril 2017 09:30:52 CEST Jussi Kukkonen wrote:
> > > This apparently breaks key generation with openssl-native because the
> file
> > > doesn't exist.
> >
> > Looking at the recipe right now, I understand why key generation is
> broken for
> > native build (I should have been more careful). I see two ways of fixing
> it :
> >         - either recreate the symlink in do_install_append_class_native
> >         - or simply modifiyng the OPENSSL_CONF variable in the same task.
> >
> > >
> > > I can fix it by adding one more complication to the recipe (will send a
> > > patch) but I don't think the current solution is all that great: I've
> been
> > > looking at this patch for a while now and still don't really
> understand why
> > > it is needed and how these different packages interact. I'm sure it
> makes
> > > sense when you look at the other recipe but ... isn't it a bad sign
> that
> > > that context seems to be needed?
> >
> > OK, I will provide some context because maybe my approach was wrong. In
> some
> > of my builds, I require some images to have a very specific
> configuration to
> > make OpenSSL use engines. My idea was to provide a package for this task
> since
> > the default file can not be overridden (and in fact shouldn't be for the
> native
> > build).
>
>
> So previously openssl-conf package included etc/ssl/openssl.cnf and the
> symlink ${libdir}/ssl/openssl.conf. Nothing RDEPENDS on this package (but
> libcrypto RRECOMMENDS it).
>
> After your patch the actual configuration file is still installed. In a
> postinst
>   * ${libdir}/ssl/openssl.conf is removed if it exists (why? If it's for
> upgrading, then this should happen in a prerm or postrm)
>   * the symlink ${libdir}/ssl/openssl.conf is created
>
> My confusion is this: how does the above solve the problem you describe?
> If you've managed to use RCONFLICTS to prevent the configuration package
> from getting included in the image, why are changes to the package needed?
>
>
>
> Some alternative solutions to your problem I think might work:
> * openssl_%.bbappend with a do_install_append() that simply copies your
> conf file over the one from upstream recipe. No extra packages needed
> * BAD_RECOMMENDATIONS or PACKAGE_EXCLUDE to prevent openssl-conf from
> getting included in your image, then adding your own package with your
> configuration (does not work for dpkg I think)
>
> Jussi
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a114e192c1ab740054c7f2326
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I still don&#39;t understand why not use standard update-a=
lternatives and install another package with your favorite openssl.conf whi=
ch has higher ALTERNATIVE_PRIORITY.<div><br></div><div>This way u-a will sw=
itch to new config even when you just install the package which require it =
on the target later and will switch back to default openssl.conf when the a=
lternative package with config file is uninstalled.</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Apr 6, 2017 at 12:5=
5 PM, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mailto:jussi.kukkonen=
@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><span class=3D"">On 6 =
April 2017 at 12:23, David Vincent &lt;<a href=3D"mailto:freesilicon@gmail.=
com" target=3D"_blank">freesilicon@gmail.com</a>&gt; wrote:<br>&gt;<br>&gt;=
 On mercredi 5 avril 2017 09:30:52 CEST Jussi Kukkonen wrote:<br>&gt; &gt; =
This apparently breaks key generation with openssl-native because the file<=
br>&gt; &gt; doesn&#39;t exist.<br>&gt;<br>&gt; Looking at the recipe right=
 now, I understand why key generation is broken for<br>&gt; native build (I=
 should have been more careful). I see two ways of fixing it :<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 - either recreate the symlink in do_install_append=
_class_native<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 - or simply modifiyng the=
 OPENSSL_CONF variable in the same task.<br>&gt;<br>&gt; &gt;<br>&gt; &gt; =
I can fix it by adding one more complication to the recipe (will send a<br>=
&gt; &gt; patch) but I don&#39;t think the current solution is all that gre=
at: I&#39;ve been<br>&gt; &gt; looking at this patch for a while now and st=
ill don&#39;t really understand why<br>&gt; &gt; it is needed and how these=
 different packages interact. I&#39;m sure it makes<br>&gt; &gt; sense when=
 you look at the other recipe but ... isn&#39;t it a bad sign that<br>&gt; =
&gt; that context seems to be needed?<br>&gt;<br>&gt; OK, I will provide so=
me context because maybe my approach was wrong. In some<br>&gt; of my build=
s, I require some images to have a very specific configuration to<br>&gt; m=
ake OpenSSL use engines. My idea was to provide a package for this task sin=
ce<br>&gt; the default file can not be overridden (and in fact shouldn&#39;=
t be for the native<br>&gt; build).<br><br><br></span>So previously openssl=
-conf package included etc/ssl/openssl.cnf and the symlink ${libdir}/ssl/op=
enssl.conf. Nothing RDEPENDS on this package (but libcrypto RRECOMMENDS it)=
. <br><br>After your patch the actual configuration file is still installed=
. In a postinst<br>=C2=A0 * ${libdir}/ssl/openssl.conf is removed if it exi=
sts (why? If it&#39;s for upgrading, then this should happen in a prerm or =
postrm)<br>=C2=A0 * the symlink ${libdir}/ssl/openssl.conf is created<div><=
br>My confusion is this: how does the above solve the problem you describe?=
 If you&#39;ve managed to use RCONFLICTS to prevent the configuration packa=
ge from getting included in the image, why are changes to the package neede=
d?<br><br><br><br>Some alternative solutions to your problem I think might =
work:<br>* openssl_%.bbappend with a do_install_append() that simply copies=
 your conf file over the one from upstream recipe. No extra packages needed=
<br>* BAD_RECOMMENDATIONS or PACKAGE_EXCLUDE to prevent openssl-conf from g=
etting included in your image, then adding your own package with your confi=
guration (does not work for dpkg I think)<span class=3D"HOEnZb"><font color=
=3D"#888888"><br><br>Jussi</font></span></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a114e192c1ab740054c7f2326--
