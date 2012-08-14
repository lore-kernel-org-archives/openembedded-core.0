Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T1Ild-0007E2-7X
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 17:10:49 +0200
Received: by wgbdr1 with SMTP id dr1so435378wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 07:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=QhweasFjkTK2E6sJg5tjaIO8xvhnUrUAwVNiiBNQLGA=;
	b=YCQXIzH/85qbLfMrTT8ES4ANzWKgri0YXdkSbItZdvrDZfFn6rDqnyZynvs/5IYtt8
	zXs1VhGmjC4Aar6/ssvK3MjMogk/Iw0vvxaC43MtubYoXWJ8mNcXwTSbt0Nmj40Yg0dk
	SDZRqH7BeUL1oyBnXNI1pz4bXqZ9UCPpT7tc73Yb1gj5BJLxb+LDmFPtd/BXlOfvHkVr
	a69Q4CtugWj6myAaVGl2X6lpE7xYvH3PNVCOu2XhZUyOtfDt+yczVl/bMRqUxwrlzcoH
	/yCSsZro2xZ6hMyf0pCf3UkZnQyhvvbeDzIHN8/+eDO/qj19Rmhh59cN/IJRNuFBmB4Q
	/8xg==
Received: by 10.50.87.227 with SMTP id bb3mr12090122igb.57.1344956333404; Tue,
	14 Aug 2012 07:58:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.63.50 with HTTP; Tue, 14 Aug 2012 07:58:33 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <15973ABB-4725-4BA6-9C5A-59DFFC274EB8@dominion.thruhere.net>
References: <CAK18fxFfWO0ZG2tisaROTuJ-FSgLoqMW4cUgTpNq3DNeqFpNqg@mail.gmail.com>
	<502A3D34.6080208@linux.intel.com>
	<15973ABB-4725-4BA6-9C5A-59DFFC274EB8@dominion.thruhere.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 14 Aug 2012 17:58:33 +0300
Message-ID: <CAK18fxEVMwUHeG0coAc0p6vr=cef893rkDdxHr+nOUgpKTqZrQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkivtDpITTQ9XOQJ6oKBcoNgSG3jcOUfioQrXKg/4nOpTMvbytvwlOtiUNn8+5NzRl9M86t
Subject: Re: dbus with tests
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
X-List-Received-Date: Tue, 14 Aug 2012 15:10:50 -0000
Content-Type: multipart/alternative; boundary=e89a8f3ba4d37db24a04c73b0c6f

--e89a8f3ba4d37db24a04c73b0c6f
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 14, 2012 at 3:50 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

>
> Op 14 aug. 2012, om 13:57 heeft Saul Wold <sgw@linux.intel.com> het
> volgende geschreven:
>
> > On 08/14/2012 02:11 PM, Andrei Gherzan wrote:
> >> In the process of updating dbus, tests (in my opinion) are mandatory.
> >>
> >> While compiling dbus with tests, dbus and dbus-glib are needed. To
> >> compile dbus-glib, dbus is needed (obviously). The only solution (to
> >> compile dbus with tests) that i found is to create a new recipe named
> >> dbus-tests where to compile dbus with --enable-tests
> >> --enable-embedded-tests, skip write to sysroot (noexec) and just package
> >> dbus-tests.
> >>
> >> 1. Do you guys know a better solution for this?
> >
> > We have started to think/chat about this, there was another patch on the
> list recently that Mark Hatle and I talked about tests.
> >
> > I think having the tests enabled with DISTRO_FEATURE would allow for the
> flexibility of enabling then without always incurring the cost /overhead of
> longer compile times.
> >
> > Can you incorporate the changes to the core recipe with out having to
> add a new dbus-tests recipe if you use DISTRO_FEATURE?
> >
>

As Koen as said in another mail i don't think there is another option than
creating another recipe and we could add RDEPENDS to dbus if DISTRO_FEATURE
contains dbus-tests.


> >
> >> 2. What would be a good path to use for installing tests?
> > Same here, disucssion started.I would like to see tests go into
> ${datadir}/${BPN} (/usr/share/${BPN}
>
> $datadir is not for executables, but for data
>
>
Binaries and scripts?

ag

--e89a8f3ba4d37db24a04c73b0c6f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote">On Tue, Aug 14, 2012 at 3:50 PM, Koen Kooi <=
span dir=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net" target=
=3D"_blank">koen@dominion.thruhere.net</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">

<br>
Op 14 aug. 2012, om 13:57 heeft Saul Wold &lt;<a href=3D"mailto:sgw@linux.i=
ntel.com">sgw@linux.intel.com</a>&gt; het volgende geschreven:<br>
<div class=3D"im"><br>
&gt; On 08/14/2012 02:11 PM, Andrei Gherzan wrote:<br>
&gt;&gt; In the process of updating dbus, tests (in my opinion) are mandato=
ry.<br>
&gt;&gt;<br>
&gt;&gt; While compiling dbus with tests, dbus and dbus-glib are needed. To=
<br>
&gt;&gt; compile dbus-glib, dbus is needed (obviously). The only solution (=
to<br>
&gt;&gt; compile dbus with tests) that i found is to create a new recipe na=
med<br>
&gt;&gt; dbus-tests where to compile dbus with --enable-tests<br>
&gt;&gt; --enable-embedded-tests, skip write to sysroot (noexec) and just p=
ackage<br>
&gt;&gt; dbus-tests.<br>
&gt;&gt;<br>
&gt;&gt; 1. Do you guys know a better solution for this?<br>
&gt;<br>
&gt; We have started to think/chat about this, there was another patch on t=
he list recently that Mark Hatle and I talked about tests.<br>
&gt;<br>
&gt; I think having the tests enabled with DISTRO_FEATURE would allow for t=
he flexibility of enabling then without always incurring the cost /overhead=
 of longer compile times.<br>
&gt;<br>
&gt; Can you incorporate the changes to the core recipe with out having to =
add a new dbus-tests recipe if you use DISTRO_FEATURE?<br>
&gt;<br></div></blockquote><div><br></div><div>As Koen as said in another m=
ail i don&#39;t think there is another option than creating another recipe =
and we could add RDEPENDS to dbus if DISTRO_FEATURE contains dbus-tests.</d=
iv>

<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div class=3D"im">
&gt;<br>
&gt;&gt; 2. What would be a good path to use for installing tests?<br>
&gt; Same here, disucssion started.I would like to see tests go into ${data=
dir}/${BPN} (/usr/share/${BPN}<br>
<br>
</div>$datadir is not for executables, but for data<br>
<div class=3D"im"><br></div></blockquote><div><br></div><div>Binaries and s=
cripts?</div><div><br></div><div>ag</div></div>

--e89a8f3ba4d37db24a04c73b0c6f--
