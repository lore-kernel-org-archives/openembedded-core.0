Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id DAFF878500
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 13:12:43 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id h199so107972593ith.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 06:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i7uOyihDHnzxvmTJ8WB2Q2ePBZgMTOTdnKubQWc1qO0=;
	b=QwsWMH0+uPy2S7CpwfJ0mkNH1HYRalnjmmlJNGg0wn2+Qj5+vgtUAi1K2+Y2YR4tTZ
	KIe1Tt0inrkV/+AMdAzojvFeNk/CuqVotrJK4DlQrsrRVvzkq9EtfF7wgQ0Gs/jYPdsQ
	6yJKeej48RhtspHXi0BR15hHTBcaeuKqsfJlU0Bk/AIW3JPsuNets/jdOolJMn3lVIFa
	8fxPkNxRrE5lmNC1QV3gl04yNaFnGhPpY/5Jj0Y/K+Gof96LTDvR+OQL+oX652ro+1CR
	rHVRFDAYVjzdCXXZ9AvJCyT8tcctosYcFhjIdwmSgAQ07B1uEJM6PpXhYUnV6ZAFVysF
	nOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i7uOyihDHnzxvmTJ8WB2Q2ePBZgMTOTdnKubQWc1qO0=;
	b=X9HxOuQ6TRBSgeY5cq1gxF/wCKbUNY6KsAQodIzkuy9w3zInOu67nu8lnloN5lynD8
	uXnyjaTx9/YUUPDoAvARbncLByClqEOk+wzUtQnjkwJ/WvQqZrTFA3C0MatYOPlJEAj4
	rrJqknAhtEA4E3iIGa3SsOFHtVcJeZBqwChsKP0fzwuR+VJneMkk3YWdeeFrOYBqyiHt
	FkUeG9oNTzCbjlk8VvfVLci4UyNWN/afSxEVdP6j/B3ZYCShWw7I9w7l3x94b9PHEXGs
	xd9mUsFMwOC0E8N3EeWAH+EtmLl8xk9qfw/1ACAJnxIfNraevZLsIT3cOOPqnqsVfkOI
	XJ2g==
X-Gm-Message-State: AIVw110/2hiNTxhX57FKoT3XnbepVirWjjaHCO59sosrmeHxS4ekCoTj
	PAOjv9AUQXj3gWmr5/TSX/onFLBZk3cO
X-Received: by 10.36.246.204 with SMTP id u195mr11878287ith.116.1501333964915; 
	Sat, 29 Jul 2017 06:12:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Sat, 29 Jul 2017 06:12:24 -0700 (PDT)
In-Reply-To: <CAJ86T=XVbuUGujVF1=FT5W2XGPN8JPXXD-BdNZMacpHFwE4rZA@mail.gmail.com>
References: <1501223526-62997-1-git-send-email-shen.joon.tan@intel.com>
	<CAJ86T=XVbuUGujVF1=FT5W2XGPN8JPXXD-BdNZMacpHFwE4rZA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 29 Jul 2017 14:12:24 +0100
Message-ID: <CAJTo0LY8k4=ji4T+=gtsxNxab9vbyGY9z9X_MMVDqgEeY+WwXg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distrodata: function to identify new packages on a release
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
X-List-Received-Date: Sat, 29 Jul 2017 13:12:44 -0000
Content-Type: multipart/alternative; boundary="94eb2c118b26ab1a540555748d78"

--94eb2c118b26ab1a540555748d78
Content-Type: text/plain; charset="UTF-8"

On 28 July 2017 at 23:59, Andre McCurdy <armccurdy@gmail.com> wrote:

> > +    git remote add -f origin git://git.yoctoproject.org/poky.git
>
> Is this patch intended for poky? Or should this be fetching oe-core and
> bitbake?


Seems to me that if the script were to use the current clone and just
switch branches, instead of using a fresh clone of poky, then it would be
generally useful to anyone who wants these reports.

Ross

--94eb2c118b26ab1a540555748d78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 28 July 2017 at 23:59, Andre McCurdy <span dir=3D"ltr">=
&lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmai=
l.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=
=3D"h5">&gt; +=C2=A0 =C2=A0 git remote add -f origin git://<a href=3D"http:=
//git.yoctoproject.org/poky.git" rel=3D"noreferrer" target=3D"_blank">git.y=
octoproject.org/<wbr>poky.git</a><br>
<br>
</div></div>Is this patch intended for poky? Or should this be fetching oe-=
core and bitbake?</blockquote><div><br></div><div>Seems to me that if the s=
cript were to use the current clone and just switch branches, instead of us=
ing a fresh clone of poky, then it would be generally useful to anyone who =
wants these reports.</div><div><br></div><div>Ross</div></div></div></div>

--94eb2c118b26ab1a540555748d78--
