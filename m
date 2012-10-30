Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TT8zJ-0004IL-JS
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 11:24:01 +0100
Received: by mail-vb0-f47.google.com with SMTP id ez10so72954vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 03:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=MBaDXYhH2id1ovgd4p6cMxm/SqoTdzRZobDrk5sUugk=;
	b=oHrKXZgjTvoc54FpHEC6lLyqD8cYllG6ACIfAyxM0TxH7bqaY6NkT2eyT9YWr457b6
	j75FIYWqSgDCzMicRrbvaOYJioViZkUrLnScEwEPes8JJhv3oLtnAxUOBH43gNIU6tIY
	PYTcUIXcbR0Lpxe/uzc8ahhN468/K15tQI02hQZ0Z6xh+y5mC8VpvBPQ7WUKu1V5jwRR
	8wk3TMsIKLxaxAZUYwTN2L4t3b1DypcNJQ25OmLSX0qOc5+XPK+9bbFkSM5uN0DTa5y5
	hNeIZFnomsoNn9OhPAJPwuJkmne15i5k/O5NP1uWRk+bB0fCHS8s1Sdkqp8yhFBGeLkv
	Twww==
Received: by 10.52.30.39 with SMTP id p7mr44206095vdh.16.1351591825993; Tue,
	30 Oct 2012 03:10:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.59.0.10 with HTTP; Tue, 30 Oct 2012 03:10:05 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <CAJTo0LZ=t_sWFtkbdt=uwyCEGuMmHnWdu7cO3=qMmseiMtVTHQ@mail.gmail.com>
References: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
	<CAK18fxFzwdCszev=Ss+rMdytAqUgDcnA4e9HEC4_psz2SAJbxw@mail.gmail.com>
	<CAJTo0LZ=t_sWFtkbdt=uwyCEGuMmHnWdu7cO3=qMmseiMtVTHQ@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 30 Oct 2012 12:10:05 +0200
Message-ID: <CAK18fxGFUy_+pzBvGtvknjj3AQFkGqBA6mjkHDgJTamXOMr5RQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnpTwKMIoBEQFhZMuzAVmJngauqWl6RkeUCaOQ5t+FnMZEIYcBPn76BFFMBPXBlE3ZDwhQj
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
X-List-Received-Date: Tue, 30 Oct 2012 10:24:01 -0000
Content-Type: multipart/alternative; boundary=20cf3079bebaab71f204cd43fe57

--20cf3079bebaab71f204cd43fe57
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 30, 2012 at 12:02 PM, Burton, Ross <ross.burton@intel.com>wrote:

> On 30 October 2012 09:59, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > This commit made pulseaudio unbuildable for builds with no GPLv3
> packages.
>
> What causes gconf to not build without GPLv3?
>

pulseaudio depends on gconf (because of that racing issues). Now, gconf
inherits gnomebase which adds to gconf's DEPENDS gnome-common package which
is GPLv3. So this is the chain.

ag

--20cf3079bebaab71f204cd43fe57
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Oct 30, 2012 at 12:02 PM, Burton, Ross <=
span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_bl=
ank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">

On 30 October 2012 09:59, Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherz=
an.ro">andrei@gherzan.ro</a>&gt; wrote:<br>
&gt; This commit made pulseaudio unbuildable for builds with no GPLv3 packa=
ges.<br>
<br>
What causes gconf to not build without GPLv3?<br></blockquote><div><br></di=
v><div>pulseaudio depends on gconf (because of that racing issues). Now, gc=
onf inherits gnomebase which adds to gconf&#39;s DEPENDS=A0gnome-common pac=
kage which is GPLv3. So this is the chain.=A0</div>

<div><br></div><div>ag</div></div>

--20cf3079bebaab71f204cd43fe57--
