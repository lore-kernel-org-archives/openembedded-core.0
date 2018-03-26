Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 123296006E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 02:38:19 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id w3so11161766uae.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 19:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j8M6mTC05IjLvdbq4rq6uEKR/LKff8BeTr7mWv2eqUg=;
	b=WGYJq22S6VL5ymSg13StszC7WF8SivjasdVvBPBhm+/5tVctAHgYeevxSVMIvI882r
	AcdF+xeDFNuHvf+yBwyivvnYcbqGk9aaHMNtZTfHf7VLwrwnexhW2x8/tJF+aGBLoqBR
	H4zl7/GW22wVceFwCS6TTdZ7TgJ92BPornq2m5IQXbFiWzko4Uls6DH3Ywh/fEtgY2oS
	+fBO82eNryhs/CEUfxr/TtnVdU8rJTdaLf71RNkDGuOZFM8QNB8NhO0jDxzO2Fxs7agm
	VemGjzaat9bCPpY8tSveu0j6YW0CjjzvPOs2a/o2SefARce1WVzkmT8PwzDUsnDbualO
	Qnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j8M6mTC05IjLvdbq4rq6uEKR/LKff8BeTr7mWv2eqUg=;
	b=YjFGN0yXeJnTeGmqU2GF4aWMhXY6Y8AHk+lPqwZkQQYK3kaUitJF1Aut4uCzOgdab4
	lmK43NmUHKIqEbI+Ovwwoi3bkAs8AFWrdLyzSal1fNUjfEvdRy55Ig7a8oBtOlDRmXAW
	fW7wMWcwTtzszJE2KwU/8k89niY694ttWV+JXR7iP0l+RpPW2D1i5B+TzjeoCxV4Bwa+
	Lk5mFvOEKc9HzQwJIK60zGTwbM6TfxZ+3ofLXyX7DHp+FtGDE5dZRZzqtGokahqRjxCa
	kLJRFTRE1NfEGYFn6KOn/mX3Buj9JswKbLxf47IYANonZGBgS2kBqDt+GEu5qoYu0Hay
	pHSg==
X-Gm-Message-State: AElRT7FxZVJAPbx/QFdBkdxq87H3NqZXkCE3Cs5RkgWA9+wTJHKopdHF
	vUOKJ8CM6PnRpC7JnCSnrzNeDLd/Dm7Dj5qtiC4=
X-Google-Smtp-Source: AIpwx49UYqff+NiQGK0wl8yxnoQiFwlxOd90KwdfZN1EWKWoHrHgtVGp/Bind4FgqI/y2v4Ahu98/MupwH7gaqNVk3k=
X-Received: by 10.176.112.47 with SMTP id u15mr6545590ual.159.1522031900490;
	Sun, 25 Mar 2018 19:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAPGMVzEP9hJqngopC_AFsVLNPEJda+R5AZSecW4JPWhZTUcwmg@mail.gmail.com>
	<CAPGMVzGzXx7iDovEPuj-t5m1a+A9bHgU6u0O6_Yq-PArUpxsoA@mail.gmail.com>
	<9c95a5d5-de41-1299-74c0-43eb6e8f2b6a@balister.org>
In-Reply-To: <9c95a5d5-de41-1299-74c0-43eb6e8f2b6a@balister.org>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Mon, 26 Mar 2018 02:38:09 +0000
Message-ID: <CAPGMVzF7Wt0H2XzyV_nk70Ji23L9=tf0cMftTxmuLi=aN_C24g@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-ros] ros package import problem
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
X-List-Received-Date: Mon, 26 Mar 2018 02:38:20 -0000
Content-Type: multipart/alternative; boundary="089e0831ad74c402f3056847aaa8"

--089e0831ad74c402f3056847aaa8
Content-Type: text/plain; charset="UTF-8"

Thanks, I'll check it out.

On Mon, 26 Mar 2018, 04:02 Philip Balister, <philip@balister.org> wrote:

> On 03/25/2018 04:38 PM, Rajath C S wrote:
> > Can i get a reply from the respective maintainers?
>
> You will have better luck reading:
>
> https://github.com/bmwcarit/meta-ros
>
> and understanding where to post your question. This list is not a
> support list for meta-ros.
>
> Philip
>
> >
> > Rajath C S,
> > 9964182112,
> > Bangalore - 560060
> >
> > On Fri, Mar 23, 2018 at 12:06 PM, Rajath C S <rajathcs.1996@gmail.com>
> > wrote:
> >
> >> i have added rospy and roslib to CORE_IMAGE_EXTRA_INSTALL += in
> local.conf
> >> but when i go to the python terminal in poky and import rospy and
> roslib it
> >> is unable to do so
> >>
> >> any solution would be of great help thanks
> >>
> >> Rajath C S
> >>
> >>
> >
> >
> >
>

--089e0831ad74c402f3056847aaa8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, I&#39;ll check it out.=C2=A0</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Mon, 26 Mar 2018, 04:02 Philip Baliste=
r, &lt;<a href=3D"mailto:philip@balister.org">philip@balister.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On 03/25/2018 04:38 PM, Rajat=
h C S wrote:<br>
&gt; Can i get a reply from the respective maintainers?<br>
<br>
You will have better luck reading:<br>
<br>
<a href=3D"https://github.com/bmwcarit/meta-ros" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://github.com/bmwcarit/meta-ros</a><br>
<br>
and understanding where to post your question. This list is not a<br>
support list for meta-ros.<br>
<br>
Philip<br>
<br>
&gt;<br>
&gt; Rajath C S,<br>
&gt; 9964182112,<br>
&gt; Bangalore - 560060<br>
&gt;<br>
&gt; On Fri, Mar 23, 2018 at 12:06 PM, Rajath C S &lt;<a href=3D"mailto:raj=
athcs.1996@gmail.com" target=3D"_blank" rel=3D"noreferrer">rajathcs.1996@gm=
ail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt;&gt; i have added rospy and roslib to CORE_IMAGE_EXTRA_INSTALL +=3D in =
local.conf<br>
&gt;&gt; but when i go to the python terminal in poky and import rospy and =
roslib it<br>
&gt;&gt; is unable to do so<br>
&gt;&gt;<br>
&gt;&gt; any solution would be of great help thanks<br>
&gt;&gt;<br>
&gt;&gt; Rajath C S<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--089e0831ad74c402f3056847aaa8--
