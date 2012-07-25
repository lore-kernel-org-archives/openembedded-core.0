Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Su6GT-0007Im-O3
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 20:24:53 +0200
Received: by ggnp4 with SMTP id p4so936885ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 11:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=xxL22L28gdlYFZxxbYi9eVLa82UpvX1bvr2VZxtAUC0=;
	b=L1jva6d5F5PhLn9kLjeETuWCg70bZI2Z7HtORxxozO0h6iuab2zeiK7I++r9FOT7Bf
	MqIDr6g3glOv0NN4euCmD2LMMzJB4Fcs1Gil1ECa+HhNIhfJVqLjrioZzR4HxCThMjq7
	kvUS3454gZmX5b8dGtYqFM82ApP9QAbY/6BlwPj1+GemDuWduAaPccfh78zlT+n/FDUn
	LcQ88JC+q8eBr0t0V0dEP3Cik+aVvHQAdNutHgv4ZQyF0X4lxwvGnpPqNheQYc4mcGmc
	sFrCDpt7YdSgITvw/hLKSMcJ8S4RExq73RigwBfcVns/8kmSn8b6Xp9Z/HU/g+fr0jwC
	Z5AA==
Received: by 10.43.70.71 with SMTP id yf7mr26236961icb.14.1343240002780; Wed,
	25 Jul 2012 11:13:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.139.164 with HTTP; Wed, 25 Jul 2012 11:13:02 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
In-Reply-To: <20120711091137.GA4190@jama.jama.net>
References: <9403579097d0430a5ce2cd3bb23925fe25917a0b.1341932186.git.andrei@gherzan.ro>
	<d7e0c2813e4002b9dfd8e2d681b93da9ddc5870f.1341932186.git.andrei@gherzan.ro>
	<1341936154.1294.3.camel@ted>
	<CAK18fxFDoHEpzDnVwJLdPHKL48Qo7ZuwnJsQDE78U6fbcULjKw@mail.gmail.com>
	<CAK18fxH2w_0hSQscbm6sad-a+=kk2eyQkOtJLMnsZRe8jaf8KA@mail.gmail.com>
	<1341960238.2786.103.camel@x121e.pbcl.net>
	<20120711091137.GA4190@jama.jama.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 25 Jul 2012 21:13:02 +0300
Message-ID: <CAK18fxFyb7BHBTwV_BnaGbF7TJehNRXweQpyynY1y8hdN5OkqA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlWkr7Fh9HUiOEUegdpe9OS+T/RHOQN0R37PHDE42JDwkNn7Xa1hqnUWtARF998xFKd/4VX
Subject: Re: [PATCH 5/5] busybox.inc: Install hwclock init script only if rtc is present in MACHINE_FEATURES
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
X-List-Received-Date: Wed, 25 Jul 2012 18:24:53 -0000
Content-Type: multipart/alternative; boundary=bcaec51d221236bfc204c5ab6f46

--bcaec51d221236bfc204c5ab6f46
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 11, 2012 at 12:11 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Tue, Jul 10, 2012 at 11:43:58PM +0100, Phil Blundell wrote:
> > On Wed, 2012-07-11 at 01:15 +0300, Andrei Gherzan wrote:
> > > And to move a little further, busybox should be configured with
> > > CONFIG_HWCLOCK=y only if it makes sense for that MACHINE. In my
> > > opinion this is machine specific.
> >
> > That's a DISTRO decision.  I suspect most that have binary feeds would
> > prefer to have a single busybox binary per architecture, and accept the
> > few wasted bytes on machines without RTC, than to make it MACHINE
> > specific and end up building it multiple times.
>
> Agreed.
>
> It would be better to package initscript + hwclock to separate packages
> and then pull it to image only for machines with RTC.. but not making
> whole busybox machine specific.
>
> Another advantage of this would be option to use busybox-hwclock as utility
> and hwclock-systemd instead of busybox-hwclock-init for images which are
> using systemd.
>
>
Thank you all. It makes sense to keep busybox machine independent. I agree.
Now if i package this init script separately how would it be pulled in by
images? Think this could brake some image which now relay on this being
pulled in by busybox.

ag

--bcaec51d221236bfc204c5ab6f46
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Jul 11, 2012 at 12:11 PM, Martin Jansa <=
span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_b=
lank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">

<div class=3D"im">On Tue, Jul 10, 2012 at 11:43:58PM +0100, Phil Blundell w=
rote:<br>
&gt; On Wed, 2012-07-11 at 01:15 +0300, Andrei Gherzan wrote:<br>
&gt; &gt; And to move a little further, busybox should be configured with<b=
r>
&gt; &gt; CONFIG_HWCLOCK=3Dy only if it makes sense for that MACHINE. In my=
<br>
&gt; &gt; opinion this is machine specific.<br>
&gt;<br>
&gt; That&#39;s a DISTRO decision. =A0I suspect most that have binary feeds=
 would<br>
&gt; prefer to have a single busybox binary per architecture, and accept th=
e<br>
&gt; few wasted bytes on machines without RTC, than to make it MACHINE<br>
&gt; specific and end up building it multiple times.<br>
<br>
</div>Agreed.<br>
<br>
It would be better to package initscript + hwclock to separate packages<br>
and then pull it to image only for machines with RTC.. but not making<br>
whole busybox machine specific.<br>
<br>
Another advantage of this would be option to use busybox-hwclock as utility=
<br>
and hwclock-systemd instead of busybox-hwclock-init for images which are<br=
>
using systemd.<br><br></blockquote><div><br></div><div>Thank=A0you all. It =
makes sense to keep busybox machine independent. I agree. Now if i package =
this init script separately how would it be pulled in by images? Think this=
 could brake some image which now relay on this being pulled in by busybox.=
=A0</div>

<div><br></div><div>ag</div></div>

--bcaec51d221236bfc204c5ab6f46--
