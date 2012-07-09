Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SoKeG-0002QI-KG
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 22:33:36 +0200
Received: by yhjj56 with SMTP id j56so11957604yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 13:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=KqbgpkDNvgE4U2Mx7z9g/QLc2wppzD+0Dn8JZef2hyY=;
	b=lBCKc1TxXxQa+MQF1V1H894G5Z81B/C6OX4Q8Nhz7Sd/6+3lGhWA3zH5J6T2kd/ES5
	JpErQoZkiwp8s7a1YeGABXwkBnAdfWyAYt5F0OgjW0/UOUpRIGlftiChvXrUOjumRxG6
	GOp0o+sDcktmkDNB9r2VQWk1HrHTTR4pAIldG34NDwxFfqyz4BmP4vYoQegPEt26v2yd
	e2nk62s/7um4KcZkAYyc9YOdc3di/zZ7cB0pr3uFTPET8MikobyN5ZJx30ZqUcIdKpR5
	dUT4etfQWAyVF3ZGR9Hkl8VGkIhuz4oJGc/8mVd2aOzx6Vklp7/12Px/z7tt4X73JZrP
	0T7Q==
Received: by 10.43.59.71 with SMTP id wn7mr10318951icb.0.1341865346150; Mon,
	09 Jul 2012 13:22:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Mon, 9 Jul 2012 13:22:04 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
In-Reply-To: <CAMKF1sq+DNviuMJ+ovOPTEO1Qzpg3HhE93UdKKbeq8W_JnadAA@mail.gmail.com>
References: <alpine.DEB.2.02.1207070649530.18262@oneiric>
	<CAK18fxGjWFXQ4C40QgmCnk5G3PucaN4JzDAsDhMb4m6+pxNxzg@mail.gmail.com>
	<1341853247.8066.36.camel@ted>
	<CAMKF1sq+DNviuMJ+ovOPTEO1Qzpg3HhE93UdKKbeq8W_JnadAA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 9 Jul 2012 23:22:04 +0300
Message-ID: <CAK18fxEAmV=s8=S93ESD+jV1pocXMXfYXc=ukocU0cnpPT970Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn5PwtVtPvU8BLMXgGEeMIzunOLQ0NktxqOSgspuHoYwFLEy4XutiaZYUZQac2P7XegOmkx
Subject: Re: tcf-agent, matchbox-wm-2: Correct "proto=git" to "protocol=git".
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
X-List-Received-Date: Mon, 09 Jul 2012 20:33:36 -0000
Content-Type: multipart/alternative; boundary=bcaec51ddaa74b31be04c46b5f4f

--bcaec51ddaa74b31be04c46b5f4f
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 9, 2012 at 8:40 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Jul 9, 2012 at 10:00 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2012-07-09 at 12:27 +0300, Andrei Gherzan wrote:
> >> On Sat, Jul 7, 2012 at 1:54 PM, Robert P. J. Day
> >> <rpjday@crashcourse.ca> wrote:
> >>
> >>         "proto=git" is not a valid parameter for the git fetcher.
> >>
> >> NOTE: package matchbox-wm-2-0.1+git1
> >> +01fa5465743c9ee43d040350f4405d35293e4869-r1: task do_fetch:
> >> Succeeded
> >>
> >> Anyway, in the git.py, code is searching for "protocol" parameter:
> >> ud.proto = ud.parm['protocol']
> >>
> >> ... so your change seems legit.
> >>
> >> On another hand, svn.py is using:
> >>  proto = ud.parm.get('proto', 'svn')
> >>
> >> A good think would be to use the same parameter names for all
> >> protocols.
> >>
> > I agree but how do we do this without breaking the world? We probably
> > should try and standardise it, probably to "protocol".
>
> so may be change the keyword to protocol and have both for this
> release additionally give a deprecation warning on proto and then
> after 1.3 remove proto
>

Healthy approach. I can submit patches on this topic if nobody did it
already locally.

@g

--bcaec51ddaa74b31be04c46b5f4f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div style=3D"text-align:center"><div align=3D"left">On Mon, Jul 9, 2012 at=
 8:40 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:</div></div><=
div class=3D"gmail_quote">

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Mon, Jul 9, 2012 at 10:=
00 AM, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@li=
nuxfoundation.org</a>&gt; wrote:<br>
&gt; On Mon, 2012-07-09 at 12:27 +0300, Andrei Gherzan wrote:<br>
&gt;&gt; On Sat, Jul 7, 2012 at 1:54 PM, Robert P. J. Day<br>
&gt;&gt; &lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca=
</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; =A0 =A0 =A0 =A0 &quot;proto=3Dgit&quot; is not a valid parameter f=
or the git fetcher.<br>
&gt;&gt;<br>
&gt;&gt; NOTE: package matchbox-wm-2-0.1+git1<br>
&gt;&gt; +01fa5465743c9ee43d040350f4405d35293e4869-r1: task do_fetch:<br>
&gt;&gt; Succeeded<br>
&gt;&gt;<br>
&gt;&gt; Anyway, in the git.py, code is searching for &quot;protocol&quot; =
parameter:<br>
&gt;&gt; ud.proto =3D ud.parm[&#39;protocol&#39;]<br>
&gt;&gt;<br>
&gt;&gt; ... so your change seems legit.<br>
&gt;&gt;<br>
&gt;&gt; On another hand, svn.py is using:<br>
&gt;&gt; =A0proto =3D ud.parm.get(&#39;proto&#39;, &#39;svn&#39;)<br>
&gt;&gt;<br>
&gt;&gt; A good think would be to use the same parameter names for all<br>
&gt;&gt; protocols.<br>
&gt;&gt;<br>
&gt; I agree but how do we do this without breaking the world? We probably<=
br>
&gt; should try and standardise it, probably to &quot;protocol&quot;.<br>
<br>
</div>so may be change the keyword to protocol and have both for this<br>
release additionally give a deprecation warning on proto and then<br>
after 1.3 remove proto<br>
<div class=3D"HOEnZb"><div class=3D"h5"></div></div></blockquote></div><br>=
<div>Healthy approach. I can submit patches on this topic if=A0nobody=A0did=
 it already locally.=A0</div><div><br></div><div>@g</div>

--bcaec51ddaa74b31be04c46b5f4f--
