Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.1818.1592439117894984684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 17:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=if+/u26G;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=tghz=77=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49nMn41Kk1z2f;
	Thu, 18 Jun 2020 02:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1592439114;
	bh=jV3KU+3RVR3JvJY15qM2dPzz5qUSL6VjvWEjzziskVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=if+/u26GUqMku5R2l4pyJWqYG7K//VvSqVr+NuDUZX6BjYF9rZuSgaK2qhjQr3utT
	 KECBxpUr8UeNessgc7OsYR0xjMNg1DHJSKfRITZeQjISha+go0LzKge7o+NFqXUQdV
	 EdRszoY5t3ytSvyYDRtpwT6ZU4NTni3luWwQ0DqysBjs/lQsJNcCOFv9262N1Z54XX
	 UgOlq90MexsC9bbjnrLWM1O0j+M0X4+8+fZk7zJdRwqQDjDI4a6SFszuxFoPdjdAJ/
	 Oaine/QmVS9Ok6Z54EIorVaJFRcaNL3rlfqGpmp92fHK4SUex4nlFKgzdIocE0Xjvj
	 UA09wB1XnXZNK+BojJD4BhkTH9hjTuun66NjtAX+T8DkHwARqJDZjjZtzXHb0MBCCr
	 fwN7h+RiSW4LHvhJ167vhhZ35PLjjLlnUALExFmIb6vg4AyD8a/Ysq1Z6kRUdNS9Em
	 JR5jKHWAhGLEYY8viGhA1I0ZQSxLkaDQ4mcSL1q/Mv9RbLccWTQima3vEDtv3kVP0p
	 FfDIKvAverMM54Lxs576mZilf2pGlBnbTEdOi6QZpg2O5rBaH+GO7E5mc1vzZiQOnJ
	 Ke/k9molA8Frs3Q54tBLk2vDUW2jsv37Vw0I6gYmq5S9/E4qE92Ek5n31ulmj1e1ni
	 wjSFL0FijGarV+RZ243dQxqY=
Date: Thu, 18 Jun 2020 03:11:50 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Steve Sakoman <sakoman@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][dunfell 08/21] cairo: Do not try to remove nonexistent directories
Message-ID: <20200618001150.GB12922@localhost>
References: <cover.1592249381.git.steve@sakoman.com>
 <5e33d1d1d655c50a817acda85f2df67c67196daf.1592249381.git.steve@sakoman.com>
 <20200616194912.GH14969@localhost>
 <CAGDS+nkDyBwYqbjJtedLRx43wL8yU7ZNStpn1uvvKm-hr1VwRw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGDS+nkDyBwYqbjJtedLRx43wL8yU7ZNStpn1uvvKm-hr1VwRw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jun 16, 2020 at 10:11:57AM -1000, Steve Sakoman wrote:
> On Tue, Jun 16, 2020 at 9:49 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Mon, Jun 15, 2020 at 09:35:27AM -1000, Steve Sakoman wrote:
> > > From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > >
> > > Commit 0e1f8fa0 (bitbake.conf: propagate 'opengl' DISTRO_FEATURE to
> > > native/nativesdk from target) changed the default PACKAGECONFIG for
> > > native and nativesdk so that it becomes empty unless "x11" is in
> > > DISTRO_FEATURES since "trace" was also removed (propbably
> > > unintentionally). This highlighted than an empty PACKAGECONFIG would
> > > lead to a build failure since /usr/bin is never created under these
> > > conditions, but the recipe still tried to remove it.
> > >...
> >
> > Isn't this a fix for a bug that is not in dunfell?
> 
> My impression was that while the bitbake.conf change that highlighted
> the issue with an empty PACKAGECONFIG isn't in dunfell, the underlying
> bug that this change uncovered does exist in dunfell.
>...

I failed to reproduce the problem in dunfell, but the change looks 
harmless enough that adding it to dunfell it is unlikely to cause 
problems.

> Steve

cu
Adrian
