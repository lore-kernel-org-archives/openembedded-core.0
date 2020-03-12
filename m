Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id C043C60AE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 18:06:53 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id c145so7768350qke.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 11:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=seJV0sK8Ln7BSGJwEv3+CRV/q9ZU1oGp9jiFAx1somk=;
	b=OtR3liuoIqkdOhwaTVrgbgINdpt7u6Rvc15E7bciVEzwEL3r/hpCn150Yaz9mUIFyM
	A/ve//jEM1q6liHWucE1fpN89328T9NmOu+FFg3laPR6/QjxvpwjOW7ElbkwTpfXqkMu
	54mIjb/8MemoohANX7BMKudlCazPR/keT1u5cF7D6fatcUC5GQcuVPVPO+TG2swJNt1y
	gmasJYk8AVbMwTYZOpwCeDtfuX8ImHznrSbUYSOwixzcH1Sm8uQO47LBgKvjvxWOUApn
	Fx2T1Ekck58Lloa+ulld7JWJsTRKIkwcTSfjcD6ro0iZszZ8TnpTyWsoTF6mphWrNKLF
	PsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=seJV0sK8Ln7BSGJwEv3+CRV/q9ZU1oGp9jiFAx1somk=;
	b=DYpE5UKQInkLuK6WL23KA3B1XPKVIwusn7tVz1w3SipPZsX0Rg24t+rijRgXif1ggb
	72saqeS0RaOR5p97kUvRUYp4KCUWSFbFLNqtHSKTzJvWMn8GQveqamcrEuPzkmkUc0YQ
	9ZsrfGm0eqj7O2utJ6b2BgqE28jMWWSo4Tn/zqk0QODv/Z3HK9N3ItmIWpFiSXv/+Qdy
	9AYFfM6YxUYOrxC3du6VmHZ+bVzBrMBM74ZKGCUndzA79D7xxArlDL4h62sC3qntgn6A
	IbBXyn0ZZokB/z1maEcKxHAeOSQ5FezJC2u60ePe/Uz7FRgWz5wt7UjPwXpnEMTPfaHZ
	Va/g==
X-Gm-Message-State: ANhLgQ2esfsnwJoDEcK8S+f7G3gpxg/hH6jsWyZkt3CEuQ0lC5spMRVB
	GuHVTcgra3aFP+iGsEU6G4tJv5BvONNwxwF3+2Q=
X-Google-Smtp-Source: ADFU+vs4Z0vUDOSI97dA6enlqSho+u0YrYvFf77SNoBuyZPCmHhiAJJhOne/TYrHYTgWGjnj98pWbj1kEXIp2gsp4Ps=
X-Received: by 2002:a05:620a:15d1:: with SMTP id
	o17mr1061907qkm.165.1584036414271; 
	Thu, 12 Mar 2020 11:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR10MB366487DDF67A917978FD21D7FDFD0@VI1PR10MB3664.EURPRD10.PROD.OUTLOOK.COM>
	<80a2ec8e-cb96-9e2c-77e4-64fc2d5163dc@gmail.com>
	<CAJ86T=X9aqB8StBjtN6hDPbU0HE+MF_WJa5cNxb30D+fTNGODg@mail.gmail.com>
In-Reply-To: <CAJ86T=X9aqB8StBjtN6hDPbU0HE+MF_WJa5cNxb30D+fTNGODg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Mar 2020 11:06:28 -0700
Message-ID: <CAMKF1sqvd6gSB8zyabCz6LenLCpAuZ2QZX4cayU1_tb4PhbLPQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Thu, 12 Mar 2020 18:06:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 12, 2020 at 9:44 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Thu, Mar 12, 2020 at 9:13 AM Khem Raj <raj.khem@gmail.com> wrote:
> > On 3/12/20 8:21 AM, Marko, Peter wrote:
> > > Hi,
> > >
> > > I'm trying to boot my own qemu image on zeus branch with "runqemu nographic /path/to/extracted/rootfs" but I have problem that console is flooded with
> > > process '/sbin/getty 115200 hvc0' (pid 383) exited. Scheduling for restart.
> > > starting pid 385, tty '': '/sbin/getty 115200 hvc0'
> > > I'm using yocto qemuarm kernel and qemuarm machine (but it's the same with qemuarm64).
> > >
> > > Basically qemuarm machine has
> > > SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
> > > which is transferred to /etc/inittab, however hvc0 device does not exist after booting in nographic mode.
> > >
> > > What kind of configuration am I missing in my image?
> > > I think that might be the graphic console which does not exist in nographic mode?
> >
> > that is correct
> >
> > > Is there a way to get rid of this problem without breaking graphic mode console?
> >
> > I did not find one, it particularly happens with busybox init.
>
> I don't know what the proper fix is, but changing SERIAL_CONSOLES to
> "115200;ttyAMA0" avoids the issue.
>
> I've changed the machine config directly but you could probably also
> use the _qemuarm over-ride to set SERIAL_CONSOLES from local.conf,
> etc, e.g.:
>
>   SERIAL_CONSOLES_qemuarm = "115200;ttyAMA0"

that made -ctestimage fail last time when I tried it but havent tried
it lately maybe things
are better

