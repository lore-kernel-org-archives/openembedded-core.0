Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2307160B44
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 16:44:57 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id o16so2366477uap.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 09:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Dq+FErJRbHzLOIbVMvTrLunA4aCKAWc0e35GcoYe+Z0=;
	b=RM00+6wG71BQK3ejbbNsoDx0wOIdrujoDS1vf8fJBkJUkNzCAYcJS8AC1D4KVTi67L
	8Cw+sD8Q3F4MSJGcirA2Ux/3Zgt+yL65xwzDHdI3a1yNHT6cW2SpDoW4YI4k5/dTc6TC
	cuRak24zsi3BVO0E/P+pJZHiwLf+rljKcGogkxBI89g5tboSEZJtdL8AL0oxlse/R8bN
	ppDbuQYLHfi/OkuJ197BSOwyyiOV+3xYqJBclVdPPAIldtSn/PpyH2RZepAGsEX9HaQ5
	kLnKy4WdkfKA9CSoM591UTEtwbEuIW8Eh/G5NulLNCbX0FCAUqmgi7K+a6Dn20VoOADG
	804w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Dq+FErJRbHzLOIbVMvTrLunA4aCKAWc0e35GcoYe+Z0=;
	b=M7muUgc5JQPiiMNZDbfKMzmti8z2sCOH+5orLr3AJ00r86u465a5kesFHfveMjbJkV
	ggH/kAmXAt6WzZIm7AkgXnL4LTpzqvIMLqHLAtyBJM8WQdsTgekoaX9n8BbV+Dp6CrHX
	MsFbtZgqJL5gbLmviQ94xdAyXFa+LeSz5nTgh7qUz2n0mphaElZBXtzHUtkKcPRIAjYk
	jGyynslqVEbpqcAfjyXqbMyitgm7cYU8tNReJuRvAKFUcX2Qa4/+LwJVYgvbGyqxnu8x
	9dIcV08a2tDz73Q7LUU4D7SDCD37+BN9TvUote2nUYTFW4OwyJLkMTLlF6x2fFuVU7GG
	ZDdg==
X-Gm-Message-State: ANhLgQ3dvX40jNugNUX3H+tJoxklgbylLsFHyH68dAkZ0WFLMUMatptP
	JsUiihOPvmXFzvhH24tZigzpzbIuVH4a2OsXGtC3FuRi
X-Google-Smtp-Source: ADFU+vti53zB6CFzjFpKaz72PpvCwKIiwKdsHo6d2Y29DMiTsOt1P7S+1/Y/ZAZpiQbipe+6MgHHOHdz2SatWu/b81Q=
X-Received: by 2002:ab0:65d3:: with SMTP id n19mr54839uaq.48.1584031497896;
	Thu, 12 Mar 2020 09:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR10MB366487DDF67A917978FD21D7FDFD0@VI1PR10MB3664.EURPRD10.PROD.OUTLOOK.COM>
	<80a2ec8e-cb96-9e2c-77e4-64fc2d5163dc@gmail.com>
In-Reply-To: <80a2ec8e-cb96-9e2c-77e4-64fc2d5163dc@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 12 Mar 2020 09:44:46 -0700
Message-ID: <CAJ86T=X9aqB8StBjtN6hDPbU0HE+MF_WJa5cNxb30D+fTNGODg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: runqemu nographic and hvc0
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
X-List-Received-Date: Thu, 12 Mar 2020 16:44:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 12, 2020 at 9:13 AM Khem Raj <raj.khem@gmail.com> wrote:
> On 3/12/20 8:21 AM, Marko, Peter wrote:
> > Hi,
> >
> > I'm trying to boot my own qemu image on zeus branch with "runqemu nographic /path/to/extracted/rootfs" but I have problem that console is flooded with
> > process '/sbin/getty 115200 hvc0' (pid 383) exited. Scheduling for restart.
> > starting pid 385, tty '': '/sbin/getty 115200 hvc0'
> > I'm using yocto qemuarm kernel and qemuarm machine (but it's the same with qemuarm64).
> >
> > Basically qemuarm machine has
> > SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
> > which is transferred to /etc/inittab, however hvc0 device does not exist after booting in nographic mode.
> >
> > What kind of configuration am I missing in my image?
> > I think that might be the graphic console which does not exist in nographic mode?
>
> that is correct
>
> > Is there a way to get rid of this problem without breaking graphic mode console?
>
> I did not find one, it particularly happens with busybox init.

I don't know what the proper fix is, but changing SERIAL_CONSOLES to
"115200;ttyAMA0" avoids the issue.

I've changed the machine config directly but you could probably also
use the _qemuarm over-ride to set SERIAL_CONSOLES from local.conf,
etc, e.g.:

  SERIAL_CONSOLES_qemuarm = "115200;ttyAMA0"

