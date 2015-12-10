Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 62DF16612D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:13:26 +0000 (UTC)
Received: by igcto18 with SMTP id to18so14808812igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Wa3FUveqCGSkVcyVXFs97lEhJAEnEF7fFOS8CqRWk0c=;
	b=CWbURXwv6aF5S2aQs+5anYkkw016guyeEnLltv3misNmR0O62T4frgCwxn9BfHOm0+
	IQtjHAK0zbJndRzn3AcvB+jQWJl0EQuC1Lc85XTGz8vDf2XyEITmOwrlUAMHtAEGggXB
	Sf6hbQJNNpQD42TtDuuiJzGxIJ9NxRGv/Sjj870E/hY8ubX71VI5jjAfVohPdibWgVVj
	IA+VldQtgpqIV+7QZFZpuvp80xOBiP6LLll6+rl3m8bcLVXEjiTdrjmMzzbIQ3qE3zyy
	j+zGjnIuEmlJGOYA+TG9y/7qi0BJpOYtmnVBE+CwELfaOpNvcTTFw3QfkPN8UKRNzxoU
	O+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Wa3FUveqCGSkVcyVXFs97lEhJAEnEF7fFOS8CqRWk0c=;
	b=gcbQTpud+ZphUSGLGsIVYLmd5MDLgdsigso99cbel4YxuOk2lKxho9KA6JP5y3iT3q
	rm4N4rj986yYkkYB+dXdiDgk5EmXrr4y09iCmJVX9vZQQA38i+YcDPv0nzviZR3yK9ff
	i7aW4n+pkSFOxoZ+Yp88f63bYjh06F4EFLjMvJb/80ZSEF4dEyiSrvbKYuj0NiMVlQij
	rKpisnM1dbVW6cyM3rY97MlgR6FQfH0Wopjz2A9yR/4SR/XVbuhB0Q4yTuLK3TNrR4jk
	rRZUTF/r63xNMHMlltOFEbUiw3nmuFqKf5UhVjyH5SxevQIDtpEvGjMC3v/o94bitx2c
	t7zQ==
X-Gm-Message-State: ALoCoQlQ3RH0+kwukQdqR4zuqbP5Ws3mSk+EeRBrlJTutZjqBHFbHJRz3Er7qRSk8ERUcOfG43deFo5s6NbEjdiap+WCB1RYDAX3GJpvSLzAl+p1hFrSDro=
X-Received: by 10.50.155.33 with SMTP id vt1mr14914994igb.64.1449753206781;
	Thu, 10 Dec 2015 05:13:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 10 Dec 2015 05:13:07 -0800 (PST)
In-Reply-To: <CAP9ODKqWgmKcpKNvVPGtwSqxfniP_tMvTCyB5mX-sEq1LVLuMw@mail.gmail.com>
References: <1447948114-30329-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LZYWxzDwnizQ2vrWL7n0Q4uPnccU-K-umgwYxaRTb7GBg@mail.gmail.com>
	<CAP9ODKqWgmKcpKNvVPGtwSqxfniP_tMvTCyB5mX-sEq1LVLuMw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Dec 2015 13:13:07 +0000
Message-ID: <CAJTo0LYyobQ4aaU+CG05-7Urgm2VND1rhzGgd+4xis8MKrkH=A@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 1/4] lttng-modules: Upgrade to 2.7 release
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
X-List-Received-Date: Thu, 10 Dec 2015 13:13:28 -0000
Content-Type: multipart/alternative; boundary=001a11343daae712f005268af8c0

--001a11343daae712f005268af8c0
Content-Type: text/plain; charset=UTF-8

On 8 December 2015 at 12:06, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> > Hopefully not an annoying build race!
>
> This succeed here; however I am not testing against linux-yocto.
>
> Has kernel changes been merged recently? It was working fine.
>

It's the kernel-arch change, and the problem only appears on x86 archs.
Stand down for now :)

Ross

--001a11343daae712f005268af8c0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 December 2015 at 12:06, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salva=
dor@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><span class=3D"">&gt; Hopefully not an annoying build race!<br>
<br>
</span>This succeed here; however I am not testing against linux-yocto.<br>
<br>
Has kernel changes been merged recently? It was working fine.<br></blockquo=
te></div><br>It&#39;s the kernel-arch change, and the problem only appears =
on x86 archs.=C2=A0 Stand down for now :)</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11343daae712f005268af8c0--
