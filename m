Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TT9Jc-0004iV-HE
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 11:45:00 +0100
Received: by mail-vc0-f175.google.com with SMTP id p1so91316vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 03:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=fwl4V16X2ElllQqCgaXmjKbArVuCnpTAOjTbvJqY2Z8=;
	b=T4q7TbQ66Xa8Mh4PSqaQIRCRXizJ1ho7T/NNmDcdD+pe8imAP1/Ys4VvybuB/cWDc4
	/fYrmg9JB2Bc91fz5DckCvehGuQDy71e3j8lrofJk0PQjOkK5vhoHIU94Y3H4r/r2gmp
	1R6ZU+ptZazoOJcMMsIvfBZeq2hXHFrXVhhQWOdgttVjZDZyoXZ1gaODA0n92s4cFDaG
	ezYobtCQzH9GDDSttioK8q0ejrXsJ7wh97E5NwX6o+z3SjAqEHvHKn3NeIjHvbj1FP5/
	TQA+tNq8KCHrp1g7NUhLuqIIxELdTD63GHtvEHxJifmIoklff9ZrDGkOvrv/BknY2Ji/
	VDJw==
Received: by 10.220.154.68 with SMTP id n4mr12853775vcw.22.1351593085001; Tue,
	30 Oct 2012 03:31:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.59.0.10 with HTTP; Tue, 30 Oct 2012 03:31:04 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <CAJTo0LZcHi16POq8_bQpURnjLxvj7fy=9m_LX27+Nz_RADQT2w@mail.gmail.com>
References: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
	<CAK18fxFzwdCszev=Ss+rMdytAqUgDcnA4e9HEC4_psz2SAJbxw@mail.gmail.com>
	<CAJTo0LZ=t_sWFtkbdt=uwyCEGuMmHnWdu7cO3=qMmseiMtVTHQ@mail.gmail.com>
	<CAK18fxGFUy_+pzBvGtvknjj3AQFkGqBA6mjkHDgJTamXOMr5RQ@mail.gmail.com>
	<CAJTo0LZcHi16POq8_bQpURnjLxvj7fy=9m_LX27+Nz_RADQT2w@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 30 Oct 2012 12:31:04 +0200
Message-ID: <CAK18fxFcMPNVPXy6QcFAKAUmgyF83fBAX_BdUS8nLG=f=KQgyw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl5PwlIZfFxKLpXOLBjdo9swKS92QEq911RNHzZZZCbX1xh8UYylw1uthw2dB49hS6jXv8M
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] pulseaudio: add GConf dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2012 10:45:00 -0000
Content-Type: multipart/alternative; boundary=f46d043be0beb65f5504cd444925

--f46d043be0beb65f5504cd444925
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 30, 2012 at 12:19 PM, Burton, Ross <ross.burton@intel.com>wrote:

> On 30 October 2012 10:10, Andrei Gherzan <andrei@gherzan.ro> wrote:
> >> What causes gconf to not build without GPLv3?
> >
> > pulseaudio depends on gconf (because of that racing issues). Now, gconf
> > inherits gnomebase which adds to gconf's DEPENDS gnome-common package
> which
> > is GPLv3. So this is the chain.
>
> Oh joy, one of those instances where GPLv3 isn't actually a problem.
>
> gnome-common is some scripts and tools used at configure time, so
> there isn't any linkage, so there isn't any GPLv3 in the images, so
> there isn't a problem.
>
> The question is how do we express this?
>
>
Should it be whitelisted?
ag

--f46d043be0beb65f5504cd444925
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Oct 30, 2012 at 12:19 PM, Burton, Ross <=
span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_bl=
ank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">

<div class=3D"im">On 30 October 2012 10:10, Andrei Gherzan &lt;<a href=3D"m=
ailto:andrei@gherzan.ro">andrei@gherzan.ro</a>&gt; wrote:<br>
&gt;&gt; What causes gconf to not build without GPLv3?<br>
&gt;<br>
&gt; pulseaudio depends on gconf (because of that racing issues). Now, gcon=
f<br>
&gt; inherits gnomebase which adds to gconf&#39;s DEPENDS gnome-common pack=
age which<br>
&gt; is GPLv3. So this is the chain.<br>
<br>
</div>Oh joy, one of those instances where GPLv3 isn&#39;t actually a probl=
em.<br>
<br>
gnome-common is some scripts and tools used at configure time, so<br>
there isn&#39;t any linkage, so there isn&#39;t any GPLv3 in the images, so=
<br>
there isn&#39;t a problem.<br>
<br>
The question is how do we express this?<br><br></blockquote><div>=A0</div><=
div>Should it be whitelisted?=A0</div><div>ag</div></div>

--f46d043be0beb65f5504cd444925--
