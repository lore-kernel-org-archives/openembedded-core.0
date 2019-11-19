Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 940D97E63A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 16:48:00 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id r20so25275694qtp.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 08:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4SYQFg3WMBulgYr7LInqqrGcUSgTl66mSM3+2b54j3Q=;
	b=lkeI6SVaY7CdiYAF+3tjNWSSNaRdTSrn3HLi+uDU2GpCuZs4TnyceNSUNOqoDUdr/L
	9Ksvzs+4V+cWtTpa5SKHoszO7nVXj3hX73PpH+ynopiJV0Z1Rc5+0WH7HmNFr8Kpr3b0
	BsSUyX3Mpk81QKpp0XvHm7iP5vtLUvt71Sd9lGJGe6Dl0dLErqssfWb894HdouLW5pU2
	sdxWGqB2QuDdWPEwG500VQfwMCkkyoJmTuuBcQffcN3Ph3eqQ6kds+hohucMpWvrO0pl
	sHavS4XHY8qXqtFE1xQ8OF2z9R130DRTeG0BZyKxp0583WPrq956tEFs9t/5z6LQB8+Y
	vhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4SYQFg3WMBulgYr7LInqqrGcUSgTl66mSM3+2b54j3Q=;
	b=tVBvMWIAeqcxy+OGrrRIJQMq0M71/eA6kqZI6URmzBdTEpC7KcGVoFQPx+MZ/qaIid
	FXxsLIup6TeOnNgFSo9NjV+OwWf7bHsXMlPShTxg2KdrqokU7uirOhoHuX56j2BCcBos
	Uish3J3uOZy9IjB84NFVoNvxdZnO07XIpm/i2U4n40ZJeljBxmre0JQt3AsCv+yEt7YT
	NABulKjmRwQuDjBxg/5V4z6H7BPb2p6yQzp/g7Hxen7C3C5Iip74C1eBbcGMfnJxH30B
	UiNro+PTECYmo6bH2INGP/OC9Dhp23kx65kTxCfhMQ0+pgg5Up2e4hCKfvtvLHkr24mv
	lo8A==
X-Gm-Message-State: APjAAAWWzAZbRAx6mACsoxNLBBES46MWw3bOGJRfvuJlFTnj9YZTl2bY
	xk1DqPVuU/8BU/ODDiCPu/cE3aBOf9D4JQCtNug=
X-Google-Smtp-Source: APXvYqx6hFYHPwqoVIO4R+K4d8zF8K8EKf847NIAtxM+/f3o+W3SPiHcTxdKqL7UcdVyVF9g4MYstnJwlsjsERdnHyY=
X-Received: by 2002:ac8:66d7:: with SMTP id m23mr33844856qtp.53.1574182081206; 
	Tue, 19 Nov 2019 08:48:01 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sp5SWYgoOj7Ujy5GMEEcuuATkuD45q7k7+LSc2SSkTVNg@mail.gmail.com>
	<20191118210500.GA4741@localhost>
	<CAMKF1spsipv7AbxJfmwHMU5dPtPDm-8VBxeQGWhEGUxJFG4WUw@mail.gmail.com>
	<20191118220613.GA7568@localhost>
	<CAMKF1sq3hnUuM7rcCbEhfbTmUtGbpMVVZkq8mFo24FKGG=kFYA@mail.gmail.com>
	<20191118225500.GB7568@localhost>
	<CAMKF1squJq7mLJJBhf_+EQbBTHb1c8R1g449e6Uo2v=MtNk2XQ@mail.gmail.com>
	<CANx9H-D0Bve0QUDd3pERWV7xOvTfjro5+=FuaAJUxYz+tp3X5w@mail.gmail.com>
	<CANNYZj_2+0+6Suq0Gu74t+QDhx3mdb6FZsr2mwy8WhtNk493ug@mail.gmail.com>
	<CAMKF1spXYo2-Qor9YpPs13+EgCpxLq+f7Bc69YUXPmHwEJRdAw@mail.gmail.com>
	<20191119163036.GA4044@localhost>
In-Reply-To: <20191119163036.GA4044@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Nov 2019 08:47:50 -0800
Message-ID: <CAMKF1srqxjAFrGv_MGnGgxp5KvcBKMgVowkiWjdopMUX-92zEA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/13] python: update to 2.7.17
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
X-List-Received-Date: Tue, 19 Nov 2019 16:48:00 -0000
Content-Type: multipart/alternative; boundary="000000000000c322e00597b5d39f"

--000000000000c322e00597b5d39f
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 19, 2019 at 8:30 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Tue, Nov 19, 2019 at 07:49:15AM -0800, Khem Raj wrote:
> > On Tue, Nov 19, 2019 at 3:30 AM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > On Tue, 19 Nov 2019 at 08:58, Tim Orling <ticotimo@gmail.com> wrote:
> > >>
> > >>
> > >> I have the beginnings of scripts to generate a meta-python2 layer.
> Someone with a vested interest in keeping python2 supported will need to
> step up to maintain it. After bitbake and Oe-core moved to python3, my use
> of python2 has gone to near zero.
> > >>
> > >> I intend to move all python2 recipes from meta-python to the new
> layer. meta-python will become python3 only in 3.1 release timeframe. The
> bb files and inc files will also be merged, simplifying AUH and devtool
> usage.
> > >>
> > >> Attempts to send python2 patches to meta-python after that shift will
> be nacked.
> > >
> > >
> > > Thanks! There is however a missing part: how close is meta-oe to being
> py2-free? Oe-core is very close (u-boot is the last holdout as noted), but
> I am not sure that we can simply take out py2, and not have half of meta-oe
> fail. For instance (random example) mozjs, a fairly important component,
> still pulls it in, together with a few 3rd party libraries:
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
> > >
> > > It's tempting to force the transition by breaking things, but it also
> antagonizes users.
> >
> > Its for how python2 should be organised after it retires and
> > suggestion is to move it to an independent layer rather than
> > meta-openembedded repo,
> > wether, layers under meta-openembedded will depend on it is a separate
> issue
>
> You want meta-oe to have a LAYERDEPENDS on a new python2 layer that is
> not in meta-openembedded?


Ideally no preferable is that all recipes move to py3 or they perhaps
blacklist until someone ports them to py3



>
> cu
> Adrian
>

--000000000000c322e00597b5d39f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Nov 19, 2019 at 8:30 AM Adrian Bunk &lt;<a href=3D"=
mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Tue, Nov 19, 2019 at 07:49:15AM -0800, Khem Raj wrote:=
<br>
&gt; On Tue, Nov 19, 2019 at 3:30 AM Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Tue, 19 Nov 2019 at 08:58, Tim Orling &lt;<a href=3D"mailto:ti=
cotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I have the beginnings of scripts to generate a meta-python2 l=
ayer. Someone with a vested interest in keeping python2 supported will need=
 to step up to maintain it. After bitbake and Oe-core moved to python3, my =
use of python2 has gone to near zero.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I intend to move all python2 recipes from meta-python to the =
new layer. meta-python will become python3 only in 3.1 release timeframe. T=
he bb files and inc files will also be merged, simplifying AUH and devtool =
usage.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Attempts to send python2 patches to meta-python after that sh=
ift will be nacked.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks! There is however a missing part: how close is meta-oe to =
being py2-free? Oe-core is very close (u-boot is the last holdout as noted)=
, but I am not sure that we can simply take out py2, and not have half of m=
eta-oe fail. For instance (random example) mozjs, a fairly important compon=
ent, still pulls it in, together with a few 3rd party libraries: <a href=3D=
"https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extend=
ed/mozjs/mozjs_60.5.2.bb" rel=3D"noreferrer" target=3D"_blank">https://git.=
openembedded.org/meta-openembedded/tree/meta-oe/recipes-extended/mozjs/mozj=
s_60.5.2.bb</a><br>
&gt; &gt;<br>
&gt; &gt; It&#39;s tempting to force the transition by breaking things, but=
 it also antagonizes users.<br>
&gt; <br>
&gt; Its for how python2 should be organised after it retires and<br>
&gt; suggestion is to move it to an independent layer rather than<br>
&gt; meta-openembedded repo,<br>
&gt; wether, layers under meta-openembedded will depend on it is a separate=
 issue<br>
<br>
You want meta-oe to have a LAYERDEPENDS on a new python2 layer that is <br>
not in meta-openembedded?</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">Ideally no preferable is that all recipes move to py3 or they per=
haps blacklist until someone ports them to py3</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
cu<br>
Adrian<br>
</blockquote></div></div>

--000000000000c322e00597b5d39f--
