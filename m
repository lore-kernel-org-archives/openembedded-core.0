Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3D29C60110
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 12:32:17 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id t126so1964977iof.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 04:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nrEiPuVzGwTA1MWpCwYHj8GzpLO5ksZBk33enlNtNmY=;
	b=ni63QnRZQV4Xy0UeHXj/c4BN2n+KEKQRy+lAx8DilA5r2N5FnFg4sdV2VWF/eK9M+Q
	euZ5Hdy+hHuN5BhKKrbtGbOO8PC5lE1HtP+5/OYXcGEYrKgnc3Zw+nlvDHWShaMHC4NC
	THUWDQkbk11fpzzVY4LRoJ6kWN2rATgdxiU7BJ7OXs2MfI+VU8RtrsdBEjpQ3V/9OzmE
	90S5yuyvo5cdIgx6QgrckJgUV5VETtdqSiTW+Q3GSD9VsrtwnGlNZyqwNJWayaibjK0o
	BXCffa6KTnwtwuiF5uMeKg0YoexgiZXPngRplODZ80CSipUCh+2nBryFkUzxpslANgq5
	HR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nrEiPuVzGwTA1MWpCwYHj8GzpLO5ksZBk33enlNtNmY=;
	b=Q4pnpK1QTASN71IqK9TRF4Dy7Q7Mjsng3nqLh8PpGnb+Ou0jPGRUJCOBg81K1zIp99
	CZKyjkdGV/VnBFUEiKxWCtaEg9wK+lETR9W66UASpyO71L34gvMqisK2QpPg2Tro1dWX
	GY4DJ3d7ciPzjmegAcjO9IxqQxlJ3uIhVXXFoj8HyVPxzbJLeSbk4RLeuXrHyFh77JWe
	P6L6QNJrluZULwhbeXqr58nQr69wqQvQkGb6KWrMbBYJBh5kaR8yObsZa2la67nB3fzq
	aSnWSLtDzFXqJmEAM7mjdpWUhKFAc92CgVsWGbd2/wpyaxBTvalYHp3hMBA59EPBuyl7
	7svw==
X-Gm-Message-State: APf1xPArWUcCaYymS8PJ75bdKQZgQyRkcvg/z65Rg2nwpgQeb56+j8do
	6VzZ3voz4/6iHGKroHj437vY9hOJvZzhs/0JvEYvaQ==
X-Google-Smtp-Source: AH8x224AjhRMxnMWOPNaucqgPXsBwpHK2sR0+fTl89NqrTiFbxP2nuSMPpTs2vuD9dW0gMLy9AoKq7mYqChvkBH2OyE=
X-Received: by 10.107.37.212 with SMTP id l203mr3865478iol.20.1519216339395;
	Wed, 21 Feb 2018 04:32:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Wed, 21 Feb 2018 04:31:58 -0800 (PST)
In-Reply-To: <20180221091309.GA8210@mbabyjoh-desk.ger.corp.intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
	<1519029438-11092-13-git-send-email-maxin.john@intel.com>
	<CAJTo0LYjvxdw-cr9P9He_+KMsW0XdOK-D2ch3qzaAB6OsMmSEw@mail.gmail.com>
	<20180221091309.GA8210@mbabyjoh-desk.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Feb 2018 12:31:58 +0000
Message-ID: <CAJTo0LYk1nrpR4rx1s9D07i_mD3tgAsehpc+BobVDyyiYRGfFQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/27] kmod: define bashcompletiondir
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
X-List-Received-Date: Wed, 21 Feb 2018 12:32:18 -0000
Content-Type: multipart/alternative; boundary="001a11405f163f3f180565b81e93"

--001a11405f163f3f180565b81e93
Content-Type: text/plain; charset="UTF-8"

On 21 February 2018 at 09:13, Maxin B. John <maxin.john@intel.com> wrote:

> On Wed, Feb 21, 2018 at 12:09:36AM +0000, Burton, Ross wrote:
>
> >>On 19 February 2018 at 08:37, Maxin B. John <maxin.john@intel.com>
> wrote:
> >>
> >> After moving to pkgconf, kmod package qa test fails without it.
> >
> >Is this failing because pkgconf returns a full path
> (/path/to/my/build/usr/share/bash-completion) instead of the path in the
> pc (/usr/share/bash-completion)?  In the context of a target path in a
> makefile, the latter is correct and the former is very wrong.
>
> Due to this line in configure.ac:
> with_bashcompletiondir=$($PKG_CONFIG --variable=completionsdir
> bash-completion)
>
> combined with this:
> $(INSTALL_DATA) $$files "$(DESTDIR)$(bashcompletiondir)"
>

Which you have to admit seems like the right thing to do...  I'd argue that
pkgconf is doing the wrong thing here.

Ross

--001a11405f163f3f180565b81e93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 21 February 2018 at 09:13, Maxin B. John <span dir=3D"l=
tr">&lt;<a href=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.joh=
n@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Wed, Fe=
b 21, 2018 at 12:09:36AM +0000, Burton, Ross wrote:<br>
<br>
&gt;&gt;On 19 February 2018 at 08:37, Maxin B. John &lt;<a href=3D"mailto:m=
axin.john@intel.com">maxin.john@intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; After moving to pkgconf, kmod package qa test fails without it.<br=
>
&gt;<br>
&gt;Is this failing because pkgconf returns a full path (/path/to/my/build/=
usr/share/<wbr>bash-completion) instead of the path in the pc (/usr/share/b=
ash-completion)?=C2=A0 In the context of a target path in a makefile, the l=
atter is correct and the former is very wrong.<br>
<br>
</span>Due to this line in <a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a>:<br>
with_bashcompletiondir=3D$($PKG_<wbr>CONFIG --variable=3Dcompletionsdir bas=
h-completion)<br>
<br>
combined with this:<br>
$(INSTALL_DATA) $$files &quot;$(DESTDIR)$(<wbr>bashcompletiondir)&quot;<spa=
n class=3D""><br></span></blockquote><div><br></div><div>Which you have to =
admit seems like the right thing to do...=C2=A0 I&#39;d argue that pkgconf =
is doing the wrong thing here.</div><div><br></div><div>Ross</div></div></d=
iv></div>

--001a11405f163f3f180565b81e93--
