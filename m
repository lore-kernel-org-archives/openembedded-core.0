Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0705C75C54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 10:32:27 +0000 (UTC)
Received: by qget71 with SMTP id t71so1693990qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 03:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=E85JyBsX1O+0rEm9TVsnkP31IjDiBTuz44nk7Z3nhAc=;
	b=CaKPM8Hdi3N8BTrfIHwzPog5gEX88IPLjfJv6UGX1tjL+YFcKUys+6iOQZ4vtQ163X
	gAA4ofl1AJ+IFffv4XlpNzFAFhxMgiUTbzCbC8OlIAVbGM3yO6PGmKHwXEjs+AudOXTT
	qRnigsE5kbGqbJxDWOkNtIFMZE4zBjfKecRHZmyfypor8ygewhnuZZy/pm9fYgeTTdYv
	JUvS7CtVAaoMPZG+Ervfh47FwzuQmoisQNLpsy/GjAnhPjM1o4Ui8jyKt2sUPm5UfqD0
	PFyqLhcwHOnJ8xO6ySPGH4UHmTBjFYPuUeCM/F9jIlqsZy1wh6hl+Y8SlYCThYydqSJG
	Kvnw==
X-Gm-Message-State: ALoCoQkJ5LfgYQ8Im9VKpWGs3MnuDnKBlroAR07qlgUAgGoc4tz0v1kgXMXpF8NDUHLNe5P/Z+Yl
X-Received: by 10.140.43.199 with SMTP id e65mr24775132qga.80.1435660348410;
	Tue, 30 Jun 2015 03:32:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 30 Jun 2015 03:32:08 -0700 (PDT)
In-Reply-To: <1435623417-18133-1-git-send-email-juro.bystricky@intel.com>
References: <1435623417-18133-1-git-send-email-juro.bystricky@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 11:32:08 +0100
Message-ID: <CAJTo0LaOUcu7qRdmYvXm3jqoYQx48_wsKRDM5bxsMZVj_ew-CQ@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: OpenSUSE 13.2 configure error
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
X-List-Received-Date: Tue, 30 Jun 2015 10:32:28 -0000
Content-Type: multipart/alternative; boundary=001a113a9baa160ef40519b9b967

--001a113a9baa160ef40519b9b967
Content-Type: text/plain; charset=UTF-8

On 30 June 2015 at 01:16, Juro Bystricky <juro.bystricky@intel.com> wrote:

> Qemu configure tests for the presence/existance of SDL by
> trying to link against libSDL. libSDL in turn attempts to load
> libcrypt which will then attempt to load libgpg-error.
> The bitbaked libgpg-error will be built with ABI incompatible
> with the one required by libcrypt.
> The remedy is to force qemu configure to use the host's
> libgpg-error instead. This is achieved by modifying the linker
> library search order.
>

I think seeing this summary will send Saul into a quivering wreck as this
was a massive source of pain in the previous release.  Interesting solution
but I'd like Saul's opinion.

The patch should probably only be applied for native and nativesdk builds,
as I suspect that's going to break a target build quite badly.  Also, it
needs signed-of-by and upstream-status (inappropriate, I imagine) tags in
the patch header.

Ross

--001a113a9baa160ef40519b9b967
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 June 2015 at 01:16, Juro Bystricky <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1y5" cl=
ass=3D"a3s" style=3D"overflow:hidden">Qemu configure tests for the presence=
/existance of SDL by<br>
trying to link against libSDL. libSDL in turn attempts to load<br>
libcrypt which will then attempt to load libgpg-error.<br>
The bitbaked libgpg-error will be built with ABI incompatible<br>
with the one required by libcrypt.<br>
The remedy is to force qemu configure to use the host&#39;s<br>
libgpg-error instead. This is achieved by modifying the linker<br>
library search order.</div></blockquote></div><br>I think seeing this summa=
ry will send Saul into a quivering wreck as this was a massive source of pa=
in in the previous release.=C2=A0 Interesting solution but I&#39;d like Sau=
l&#39;s opinion.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">The patch should probably only be applied for native and natives=
dk builds, as I suspect that&#39;s going to break a target build quite badl=
y.=C2=A0 Also, it needs signed-of-by and upstream-status (inappropriate, I =
imagine) tags in the patch header.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a113a9baa160ef40519b9b967--
