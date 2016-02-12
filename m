Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id D86A475D4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:15:52 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 9so88506311iom.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 03:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=F6JaDcdPiYkdEEfGfG/L0G4NVG32avkobWV02vrS6E0=;
	b=vNITKJ+OuB5+yuP+rruVHXLBpKuezTZ4wrMHvWCyHmkTzpLhzCtOmY28cosf7blw0S
	z7KO1cxNdT67svKnkYt+iKbh4x0jsYtTSR+wbsivPW70O4pV3SsLe6KYEhGIudtUz8z7
	iEY+K++vtWQn6C6KdSUPArqkM7XT6fT9TTuYfnwB1HsMR6VhdDxhQ+cxdRLEQNvI/dR0
	G1V54Yn190Q+QgBp7ClG69YldxZYLQ82qEweAiwdKyjnm3fgEYy18PSJRs5lwLnfUSVP
	9c+YET7gyBmxZThC3i7EP5pelbBF7MfFZ6ScMR9irqiKcRIXh4hm7CWOl1l+O+jgZnS2
	9gJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=F6JaDcdPiYkdEEfGfG/L0G4NVG32avkobWV02vrS6E0=;
	b=Ce/TcH1kQhm0SuzbUJGTyVIni6VC9WhFrzb7dSx/w0tlOI9OWYJ7D/8Y9nxFvEmk/h
	4ZIUqUTUiNCkR3dxjHOEA8x1hWTrEyhc4EBNyMi/QmRieRN7fnKNCFvFNFaQGlFszcDz
	AmAN+RK6UGhUyVtlKS+4rwwxU7yY4YwuTj0fkBEzdknP5Hay5qihQV8d5YN9nqUpZgqO
	izVzC1qTnCdK26J/YfBNqKG7XPeMH9N4tRKnRbt2RtS3ouqg3QIyIEKfCva+8m/L5LV6
	f+V5lm2h7bthMjnUzZ6SqBcE/vqL/eD671EuHXV1Zfw4VxwJj8GqGhWu0qQG+2iF+viX
	LCdA==
X-Gm-Message-State: AG10YOTup72FdLrlouyeNBCsAkcON6wgBs5kHKRxg9NjQPENV/zocjlC24MgtYYTsMPAK7Lsc/b9tdUew0s4coLT
X-Received: by 10.107.3.220 with SMTP id e89mr2119388ioi.99.1455275753158;
	Fri, 12 Feb 2016 03:15:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 12 Feb 2016 03:15:33 -0800 (PST)
In-Reply-To: <56BDBDF8.8020605@mlbassoc.com>
References: <1455249507-30989-1-git-send-email-gary@mlbassoc.com>
	<CAJTo0LaveuPmPrhLf9bc4H0PkyEz-cVGfiH+fjxqk=ynxJkhew@mail.gmail.com>
	<56BDBC07.3060907@mlbassoc.com> <56BDBDF8.8020605@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Feb 2016 11:15:33 +0000
Message-ID: <CAJTo0LYnyFbwdF_8u5Fnx=ejU62huTnDYa7fDrS76LdJKJvYNg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: Add -dbg packages for all libraries
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
X-List-Received-Date: Fri, 12 Feb 2016 11:15:54 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7c514d02052b90ca9a

--001a113f0e7c514d02052b90ca9a
Content-Type: text/plain; charset=UTF-8

On 12 February 2016 at 11:11, Gary Thomas <gary@mlbassoc.com> wrote:

> # opkg install mplayer2-dbg
> Installing mplayer2-dbg (2.0+gitr0+2c378c71a4-r13.1) on root.
> mplayer2-dbg: unsatisfied recommendation for libavformat-dbg
> mplayer2-dbg: unsatisfied recommendation for libavutil-dbg
> mplayer2-dbg: unsatisfied recommendation for libfaad-dbg
> mplayer2-dbg: unsatisfied recommendation for libasound-dbg
> mplayer2-dbg: unsatisfied recommendation for libavcodec-dbg
> mplayer2-dbg: unsatisfied recommendation for libswresample-dbg
> mplayer2-dbg: unsatisfied recommendation for libpostproc-dbg
> mplayer2-dbg: unsatisfied recommendation for ncurses-libtinfo-dbg
> mplayer2-dbg: unsatisfied recommendation for libswscale-dbg
> ...
>
> So, how should this have worked, or is it a little broken?
>

Well it *should* have worked, but clearly isn't!  Can you file a bug?

Ross

--001a113f0e7c514d02052b90ca9a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 February 2016 at 11:11, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"=
mailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":s4" class=3D"a3s" st=
yle=3D"overflow:hidden"># opkg install mplayer2-dbg<br>
Installing mplayer2-dbg (2.0+gitr0+2c378c71a4-r13.1) on root.<br>
mplayer2-dbg: unsatisfied recommendation for libavformat-dbg<br>
mplayer2-dbg: unsatisfied recommendation for libavutil-dbg<br>
mplayer2-dbg: unsatisfied recommendation for libfaad-dbg<br>
mplayer2-dbg: unsatisfied recommendation for libasound-dbg<br>
mplayer2-dbg: unsatisfied recommendation for libavcodec-dbg<br>
mplayer2-dbg: unsatisfied recommendation for libswresample-dbg<br>
mplayer2-dbg: unsatisfied recommendation for libpostproc-dbg<br>
mplayer2-dbg: unsatisfied recommendation for ncurses-libtinfo-dbg<br>
mplayer2-dbg: unsatisfied recommendation for libswscale-dbg<br>
...<br>
<br>
So, how should this have worked, or is it a little broken?</div></blockquot=
e></div><br></div><div class=3D"gmail_extra">Well it *should* have worked, =
but clearly isn&#39;t!=C2=A0 Can you file a bug?</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113f0e7c514d02052b90ca9a--
