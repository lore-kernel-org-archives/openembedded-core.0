Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id C463971C7A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 14:15:04 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id g60so60178359qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TEkON2bodX6VxttkhgXQ/EnL2D/5onxtAFENZ1BQpXo=;
	b=TaHFTAcwkyCMseXgVjLal1rbuUgZwJ06JTeM6tj6B6enHS20XgAOQTR5cCkjl8lLtJ
	bONUfb4UwhvbKZKNd7HtLR+eu27UtsyYAFTH/oERu2kdFlFKbhmzrvVrzTH+ULD6Bbmj
	gEGd+FLXFfZyr1N5jM4xyoYFSAMDDo/ceZ8z8HlpQOveqddDjX1uraqz/bsRHZXgprdK
	S83MTEnU8Tvx6nNbm25hbKhuZ/VdMhEcniItCZNTCTHWxMU/MeOL4EH4ie0vX3bWopjB
	Wc6BCnNo1fKh1YMfeEdSd4BuXU1u+L0B9XTwIGz8HgJhqYkWHAGep37OZCzXrilLkX1T
	NvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TEkON2bodX6VxttkhgXQ/EnL2D/5onxtAFENZ1BQpXo=;
	b=jOImNoBUwe7JsAoNkCShRNpxwPxZzNsTvXbLSwCYpeLFaXE1r42lovk386jWOts4ol
	/PST35slSHkpN82ZXXQ8bBSIv5BOMgA0gBKcJ0MZCL+T9FP23y5Bg4l+GR1+HB0+trtz
	KpYPj7zblTLJ0eqTg4Pq1ww/2cAse70WkSaXvgw6MGo7fuOgewGXLoLwB4P2Y5kM5Toa
	DFuaWnemYXGIFN4s29VdFHSliePgYpCQWjUtgIXScW5P42weMw1v03e2z9P8f3UDeq8m
	qyKYr2ADztDH7PkRHQPHAu21I+JAj8lvPihiEdNk0z3Vv6WKodLOasWgbg5SCNFLELo1
	8QEA==
X-Gm-Message-State: AN3rC/4ynl/8Lcmcv0iJ08x2WB+X86HpjszYaU2dekbVXla79SAY38w/
	zQ1ZcrKPQoI7kCUcx5lELz+6FyuSWoHG
X-Received: by 10.200.3.105 with SMTP id w41mr13432313qtg.188.1492524905822;
	Tue, 18 Apr 2017 07:15:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 18 Apr 2017 07:14:45 -0700 (PDT)
In-Reply-To: <1492521609-26624-9-git-send-email-ferlandm@amotus.ca>
References: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
	<1492521609-26624-9-git-send-email-ferlandm@amotus.ca>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Apr 2017 15:14:45 +0100
Message-ID: <CAJTo0LbOKpaYit0Zmex3QcPJfA5rC9WjkS0=X4xZzyZwBDo8cQ@mail.gmail.com>
To: Marc Ferland <ferlandm@amotus.ca>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 8/8] bluez5: rename "readline" config option to "client"
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
X-List-Received-Date: Tue, 18 Apr 2017 14:15:05 -0000
Content-Type: multipart/alternative; boundary=f4030435cf58d48994054d718826

--f4030435cf58d48994054d718826
Content-Type: text/plain; charset=UTF-8

On 18 April 2017 at 14:20, Marc Ferland <ferlandm@amotus.ca> wrote:

> The configure option is "enable-client" not "enable-readline" (the
> latter does exists and is automatically enabled when enable-client is
> passed).
>

The point of this was to remove dependencies on the GPLv3 readline library,
so this explicitly is readline-using-clients not all clients.

Ross

--f4030435cf58d48994054d718826
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 April 2017 at 14:20, Marc Ferland <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ferlandm@amotus.ca" target=3D"_blank">ferlandm@amotus.ca</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":35s" class=3D"a3s aX=
jCH m15b813a3c12ea62d">The configure option is &quot;enable-client&quot; no=
t &quot;enable-readline&quot; (the<br>
latter does exists and is automatically enabled when enable-client is<br>
passed).<br></div></blockquote></div><br>The point of this was to remove de=
pendencies on the GPLv3 readline library, so this explicitly is readline-us=
ing-clients not all clients.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--f4030435cf58d48994054d718826--
