Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 699D375C97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 15:50:47 +0000 (UTC)
Received: by qkei195 with SMTP id i195so9326187qke.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eEXHUWwWj2zTl6Lh37RRZnZEZ+nLBa89UpUBo/0bb28=;
	b=lUAAdAP4NwGH2sWa0GMAEQpdkT/yD5ZzJmiqNOV8Rc4PzlAiy1yod7Jt/I3c5/TsjH
	/3/4M2UKsZHN+WAFrjRYSOcDA4Nmd53wGYO5Hr+b6xH+MDilhNHk5ji00BTE+YkYmDT2
	a1CT8BaF3d4HsZwSrkAVm8gIsX39GedJerWIzgnSm6QqrUN8dvXKCfmp35CpKTvLBAgd
	GHe8T9AVtr5txnahSHyDji8RdxBbX7qIrlExBD8GUZyD9ad1+f6bYEYTtHqJJ7QrZ0XV
	D0r8BgzPAjGS9g/2GMO+fbLOxn2zB/0Z/tQ1zE3nOy3rnh7X6cNzC5y0TDdxmMio8IcB
	tvvQ==
X-Gm-Message-State: ALoCoQl8xf/ZsKJKCejJfR9sgxRaOiKi4jE+raz+a9ga3HK3lgwunTfR9pVWZKB7Z52U0SPW1W81
X-Received: by 10.140.43.100 with SMTP id d91mr27405908qga.77.1435679448431;
	Tue, 30 Jun 2015 08:50:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 30 Jun 2015 08:50:28 -0700 (PDT)
In-Reply-To: <7ef640d8e47d0705c7f06afdbc1ba24ad52eca5b.1434464336.git.jussi.kukkonen@intel.com>
References: <cover.1434464336.git.jussi.kukkonen@intel.com>
	<7ef640d8e47d0705c7f06afdbc1ba24ad52eca5b.1434464336.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 16:50:28 +0100
Message-ID: <CAJTo0LaGR+cRrNCjaaufqviMpBwi6znfhPbEkj8DWGOXitJ-OQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/6] gtk-update-icon-cache-native: Upgrade, add binary
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
X-List-Received-Date: Tue, 30 Jun 2015 15:50:52 -0000
Content-Type: multipart/alternative; boundary=001a113a989c892ccd0519be2b02

--001a113a989c892ccd0519be2b02
Content-Type: text/plain; charset=UTF-8

On 16 June 2015 at 15:22, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> * Upgrade to GTK+ 3.16.3
> * Add gtk-encode-symbolic-svg binary: it is used by icon themes
>   (e.g. Adwaita) to generate png versions of svg icons.
> * Depend on librsvg-native for gtk-encode-symbolic-svg
> * Add a patch that removes Gdk dependency from gtk-encode-symbolic-svg:
>   this way the native build stays slim.
>

As oe-core master can now handle recipes renaming, so we could rename this
recipe to something more generic if you wish now.

Ross

--001a113a989c892ccd0519be2b02
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 June 2015 at 15:22, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1w0" cl=
ass=3D"a3s" style=3D"overflow:hidden">* Upgrade to <span class=3D"il">GTK</=
span>+ 3.16.3<br>
* Add <span class=3D"il">gtk</span>-encode-symbolic-svg binary: it is used =
by icon themes<br>
=C2=A0 (e.g. Adwaita) to generate png versions of svg icons.<br>
* Depend on librsvg-native for <span class=3D"il">gtk</span>-encode-symboli=
c-svg<br>
* Add a patch that removes Gdk dependency from <span class=3D"il">gtk</span=
>-encode-symbolic-svg:<br>
=C2=A0 this way the native build stays slim.</div></blockquote></div><br>As=
 oe-core master can now handle recipes renaming, so we could rename this re=
cipe to something more generic if you wish now.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a989c892ccd0519be2b02--
