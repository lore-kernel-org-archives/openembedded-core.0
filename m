Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id A52C577D52
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 15:58:34 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id c10so80287401qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 08:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uT5+OM0G3za9PuzN09wpx1HM15ZpZ415v9XNyxmth9k=;
	b=BIR/gC4H+teKlC95mh3c0SVuuMIkRNqQR8K30DDDnwDkSVnaQHvWS36ccdhVAwp8UX
	msevJfKhKMOrLS0tbzEp+3Tt3oKPm9TtrC0A7c05wn25ebc4BxPOYEy5K2aqVM5ovA67
	D2pzJIhh13N1mlcLydlTaylNYKj52bFdmuXRvBbznehLUhP6grmD6oP7L5M3ywMQectj
	/gHeSzzxWFvioJXyAUilwx2bIz9jEkh4ij+UMfAfNnk3wk5vJWmkJszGBqw8htzPKslL
	8hVxhpL5/aX0qjF9pV8zDQLXKC8R82zuHrdh9NE9CsJW1Qo021UiCC+XzyTKsS2oyr3A
	H03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uT5+OM0G3za9PuzN09wpx1HM15ZpZ415v9XNyxmth9k=;
	b=rFr7RIZzBCKdpuxHMLF9lx6IBmNexKUAYklXCi1guHCwB7IkkSNhjIhOrMTo3IYMho
	vCHj2Z1jeUgDin+IL3bG2IwPLI62v2XOWtZyNqTOJSImB1e87JL6R/GuPO96UvzpZu9u
	e0reeNYBuQe97MEOeFSQ0Ne8YudEUV7V/YQqZ1JeQK2QT0IlGtIZd8r/Jw3tDI+OpEXf
	ytloKf049hHXbl7ftUU24NWhsHHVZsT+ouRCOV2/89qjOGUjNJgLikQEeWEkOrH7VJq5
	DkM9clIvpg5on/5mKVV9bQMISW62js1BJn5eIC9Ccu2vz8hVxAmkZiF0tf4tbGBB+bZR
	ZRFQ==
X-Gm-Message-State: AKS2vOxlBiJqLjSAhOhX/DH44Ya/BZf6SzQEwyA8KTvI1PTgPh4mf93L
	eU0UwY3lZ4QpY7e1Ki7M9BXEdZdbzZWq
X-Received: by 10.237.40.97 with SMTP id r88mr21566674qtd.27.1496764715571;
	Tue, 06 Jun 2017 08:58:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Tue, 6 Jun 2017 08:58:15 -0700 (PDT)
In-Reply-To: <821c29ed-09a2-8cb9-e0bf-26977f67dcca@linux.intel.com>
References: <1496761395-4499-1-git-send-email-ross.burton@intel.com>
	<821c29ed-09a2-8cb9-e0bf-26977f67dcca@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Jun 2017 16:58:15 +0100
Message-ID: <CAJTo0Lb0M3QLAd-iJY-j2GKXqSLTEetRbq3qQr_SWa379tKJdw@mail.gmail.com>
To: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] archiver: preserve sysroot paths in configured mode
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
X-List-Received-Date: Tue, 06 Jun 2017 15:58:35 -0000
Content-Type: multipart/alternative; boundary="94eb2c068b342f2e7c05514cb148"

--94eb2c068b342f2e7c05514cb148
Content-Type: text/plain; charset="UTF-8"

On 6 June 2017 at 16:42, Mikko Ylinen <mikko.ylinen@linux.intel.com> wrote:

> This patch is not enough because the problem is in do_unpack_and_patch
> which
> is shared by most archiver modes. This patch fails, e.g., with "original +
> diff"
>
> https://patchwork.openembedded.org/series/7068/
>

Yes, I have yours in my branch too.  There's many ways that the archiver
can fail right now, clearly we need to exercise it a bit more in selftest.

Ross

--94eb2c068b342f2e7c05514cb148
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 June 2017 at 16:42, Mikko Ylinen <span dir=3D"ltr">&lt;<a href=3D"mail=
to:mikko.ylinen@linux.intel.com" target=3D"_blank">mikko.ylinen@linux.intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":39=
b" class=3D"a3s aXjCH m15c7e12df538222d">This patch is not enough because t=
he problem is in do_unpack_and_patch which<br>
is shared by most archiver modes. This patch fails, e.g., with &quot;origin=
al + diff&quot;<br>
<br>
<a href=3D"https://patchwork.openembedded.org/series/7068/" rel=3D"noreferr=
er" target=3D"_blank">https://patchwork.openembedded<wbr>.org/series/7068/<=
/a><div class=3D"yj6qo ajU"><div id=3D":130" class=3D"ajR" tabindex=3D"0"><=
/div></div></div></blockquote></div><br>Yes, I have yours in my branch too.=
=C2=A0 There&#39;s many ways that the archiver can fail right now, clearly =
we need to exercise it a bit more in selftest.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c068b342f2e7c05514cb148--
