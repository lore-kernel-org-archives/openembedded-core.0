Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8F775EE7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 09:40:31 +0000 (UTC)
Received: by qkao63 with SMTP id o63so26448740qka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 01:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=enaJGExhYVIBkbfKObSbc1ixVn4ZyA3W202/08nsPZA=;
	b=2JXnqtnyuTHJE4UFmlVIMgFMgqEFIMT+Y6MYE+BUt9e5HGi1G5hG6iMaq6RLnqeJk0
	7mzV03O4Mzgw6rd1vDj+B4gCiHaSDlHDwpS2K4jqyLMNVg5JHVumsuLCp34wqWJgWCT4
	YKcq9A0oUcnN0OehktzORB0czfxzj8a/hLLrzW+OypTiodLlGUzSpF2x3nAoAnkuYmLo
	jMG4puwZ09+Iboayn09/dDOLt2KsZLKGQs0MvTrNpFvZ5olPbCt4aTPBgAnoSS4ZLaRT
	fnYqU7zTojqn2D+VcfAte6nWbCbWKnnrdrEeKBX6pCR8If6L3HRd9djSrMGvJf54UV31
	R2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=enaJGExhYVIBkbfKObSbc1ixVn4ZyA3W202/08nsPZA=;
	b=giHoTcL5kvuPnwEF9EN2CY/NpVsCgeoDaGU8ZcV0YcsERhVN+MfrW/Tj7vd+TQIJGx
	ItkYyhnZtduIn0XUsr9+D9L1UN1191s3PIy8747c6q8r4gTq36s0LXNgL760JuQazlGK
	0dsJdGO70jAISxCubvlVt7Xc0b3eWV3T5jCy1XAOtL0pdbrLcJhEWAej5Tul4BwCQvq6
	+MYcY4HI5cuSJdslT/jKE0pew+vUmt9aszQuCR6X+EIDrtIqvBAJigy3khlgigxSxZA+
	oD+VmFYhkp7y4+spOjdaT+flCeoO3riIw2I7qfntUqq0VM5Y/zW9ZmqfBFNWTmRLVWeu
	vMZQ==
X-Gm-Message-State: ALoCoQnHg/5xxVmIPE4QXa/aizVj0f5p3HraNltoFYbK+PzPCWqMm5DXLF71IUHQcYQItPw7tJt/
X-Received: by 10.55.73.144 with SMTP id w138mr28897553qka.104.1447062031935; 
	Mon, 09 Nov 2015 01:40:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Mon, 9 Nov 2015 01:40:12 -0800 (PST)
In-Reply-To: <CAHiDW_Hh6ZitOvA8G8i-uZ1VfvYKrKgxsfkKeaU2DXEyBtvnww@mail.gmail.com>
References: <cover.1446729162.git.jussi.kukkonen@intel.com>
	<CAJTo0LZbx2rXSyvqED6Mi2aJ37tPFXuK2UggiyKCmmk7sAt_8w@mail.gmail.com>
	<CAHiDW_Hh6ZitOvA8G8i-uZ1VfvYKrKgxsfkKeaU2DXEyBtvnww@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Nov 2015 09:40:12 +0000
Message-ID: <CAJTo0LZD4wG=jb2XJkAiVcZ=xn5Apv8ayL1vFRKF=9N8gHHRnw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Upgrades: GLib & friends
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
X-List-Received-Date: Mon, 09 Nov 2015 09:40:36 -0000
Content-Type: multipart/alternative; boundary=001a114a9f4461c01a05241862cc

--001a114a9f4461c01a05241862cc
Content-Type: text/plain; charset=UTF-8

On 8 November 2015 at 10:19, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> Alternatively, moving to qemu 2.4.1 (that was released this week) will
> solve the issue as well.
>

Sounds good.  Can you add a patch to the current qemu and we can drop it if
a tested qemu upgrade also gets merged.  For obvious reasons, qemu takes a
while to test.

Ross

--001a114a9f4461c01a05241862cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 November 2015 at 10:19, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Alternati=
vely, moving to qemu 2.4.1 (that was released this week) will solve the iss=
ue as well.</div></blockquote><div><br></div><div>Sounds good.=C2=A0 Can yo=
u add a patch to the current qemu and we can drop it if a tested qemu upgra=
de also gets merged.=C2=A0 For obvious reasons, qemu takes a while to test.=
</div><div><br></div><div>Ross</div></div></div></div>

--001a114a9f4461c01a05241862cc--
