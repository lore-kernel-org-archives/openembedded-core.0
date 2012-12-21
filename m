Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1TlzoC-0006DY-16
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 11:26:28 +0100
Received: from mail-ob0-f198.google.com ([209.85.214.198])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 02:10:37 -0800
Received: by mail-ob0-f198.google.com with SMTP id un3so18647120obb.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 02:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:x-gm-message-state;
	bh=VDfC0C259Az9Y+ou+71Yxww72OduSryKfaahjTbFwhw=;
	b=aPm1nIYRa8XbkB6E7HvG9Tzqf/4Uo2Dqr+egaZk2pj2mQHWFkcQdKv5i2maeMtNCb/
	yQ6ufL2kw2iYhHibkRDW15QBqUV7P1rBPwAEz0iIpDmAHJWWD8g3dKes4NMgFEkPKZto
	eImMwT+7j4bjT024/IbyfB0JXrUlQa7T4MS72vnA2pno2vflG4EA6ZC4HitG1jcS01Fu
	wt2WvAEbM8vkZt0vxTejTFPdWiAsG2WnhtsYQ/3Uq2m4D6MhSd2zYSCEMo4dRn2+j0ki
	YDKX+s+Hk2qXlIWkrSgzZhkuFdTsLgI2e8i0hlEXnFgT7zyfoPbw6Ha2Qs9Lsw4cMs5T
	7DnA==
X-Received: by 10.50.161.130 with SMTP id xs2mr13022125igb.34.1356084636586;
	Fri, 21 Dec 2012 02:10:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.161.130 with SMTP id xs2mr13022118igb.34.1356084636472;
	Fri, 21 Dec 2012 02:10:36 -0800 (PST)
Received: by 10.64.49.164 with HTTP; Fri, 21 Dec 2012 02:10:36 -0800 (PST)
In-Reply-To: <CAJTo0Lb2QgqE77f4oZm8sqc3izJfDhmcniGoMMCyTtBOsne2Dw@mail.gmail.com>
References: <cover.1356021837.git.alexandru.damian@intel.com>
	<5f9c3b67176f90714a2fd394e64f7d8da3cb0258.1356021837.git.alexandru.damian@intel.com>
	<CAJTo0Lb2QgqE77f4oZm8sqc3izJfDhmcniGoMMCyTtBOsne2Dw@mail.gmail.com>
Date: Fri, 21 Dec 2012 12:10:36 +0200
Message-ID: <CAJ2CSBvvwVhrjGjmh5CXrSEbR7oz+iPr+uhGXa3ytTvXxKXkGQ@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm3PaDNwpEL9UE1nS+wz9uT3VxLwBZ6wl54QhTdEgiJlMpCBzXKQ+Nw7P5jFAbk7Ct5tJczdBtnlfKZ8mGC+ciWh79JTtXQVlIniVtD0EG6ULtLyshYV0rD44/rNkzXdnAUxfPA1UUgJv4dry0K/bfNUq4IzH/HmG0sLYf+G6kRnz1aN3DLbOLgPg8RHaYi2HwyUh3u
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] Prepare mesa-dri for weston compatibility
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
X-List-Received-Date: Fri, 21 Dec 2012 10:26:28 -0000
Content-Type: multipart/alternative; boundary=14dae934106d0ad6c804d15a0fb3

--14dae934106d0ad6c804d15a0fb3
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 20, 2012 at 7:20 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 20 December 2012 16:48, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> > +PROVIDES += "wayland-egl libgbm libglapi"
>
> Remove this.


Mesa-dri provides these packages, why shouldn't we let the system know ?


> >  # this needs to be lower than -1 because all mesa-dri have -1 and git
> version has highest PV, but shouldn't be default
> > -DEFAULT_PREFERENCE = "-2"
> > +# adamian - switch to git version
> > +DEFAULT_PREFERENCE = "1"
>
> Please don't touch this, we can document at the moment that people
> need to use mesa-dri-git until the tarball is sufficient (9.0.2 should
> work).
>
> Is there any way to prevent weston being built based on mesa-dri version ?


> I also don't see anything that adds a build-dependency on wayland for
> the Wayland EGL backend to build successfully.
>

It fails gracefully if wayland isn't selected.

Alex


>
> Ross
> ---------------------------------------------------------------------
> Intel Corporation (UK) Limited
> Registered No. 1134945 (England)
> Registered Office: Pipers Way, Swindon SN3 1RJ
> VAT No: 860 2173 47
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>

--14dae934106d0ad6c804d15a0fb3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On Thu, Dec 20, 2012 at 7:20 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 20 December 2012 16:48,=
 Alex DAMIAN &lt;<a href=3D"mailto:alexandru.damian@intel.com">alexandru.da=
mian@intel.com</a>&gt; wrote:<br>

&gt; +PROVIDES +=3D &quot;wayland-egl libgbm libglapi&quot;<br>
<br>
</div>Remove this.</blockquote><div><br></div><div>Mesa-dri provides these =
packages, why shouldn&#39;t we let the system know ?<br></div><div>=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<div class=3D"im">
&gt; =A0# this needs to be lower than -1 because all mesa-dri have -1 and g=
it version has highest PV, but shouldn&#39;t be default<br>
&gt; -DEFAULT_PREFERENCE =3D &quot;-2&quot;<br>
&gt; +# adamian - switch to git version<br>
&gt; +DEFAULT_PREFERENCE =3D &quot;1&quot;<br>
<br>
</div>Please don&#39;t touch this, we can document at the moment that peopl=
e<br>
need to use mesa-dri-git until the tarball is sufficient (9.0.2 should<br>
work).<br>
<br></blockquote><div style>Is there any way to prevent weston being built =
based on mesa-dri version ?</div><div>=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">

I also don&#39;t see anything that adds a build-dependency on wayland for<b=
r>
the Wayland EGL backend to build successfully.<br></blockquote><div><br></d=
iv><div style>It fails gracefully if wayland isn&#39;t selected.</div><div =
style><br></div><div style>Alex</div><div>=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">

<br>
Ross<br>
---------------------------------------------------------------------<br>
Intel Corporation (UK) Limited<br>
Registered No. 1134945 (England)<br>
Registered Office: Pipers Way, Swindon SN3 1RJ<br>
VAT No: 860 2173 47<br>
<br>
This e-mail and any attachments may contain confidential material for<br>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.<br>
</blockquote></div><br></div></div>

--14dae934106d0ad6c804d15a0fb3--
