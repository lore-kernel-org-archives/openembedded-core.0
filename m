Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 651EA60571
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 10:56:23 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id q108so26249084qgd.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 02:56:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ofrN5XX8SskAJu4nlRP7SzJWUFfNj6LV28tCETvsk34=;
	b=crvkC12h1S/oZVwz41JtQulmZaoEWjOL57fEuRk5FrbI2P3dl7yx6cUSaAXl3T4fns
	6xm1VaAwhL3IJOl8KXCLz4sKJu+5Tu2eBZ/258hpHICQfJJTWGpI9+zLJ5k5aV8TYVRN
	ew2RuCnqCrLR9AcO1tDSCvCcojxd3U6YMoP1IrKvLRwp4hrKSUzRV2kPf7iN5SRNSOHw
	/w5Iq+VZ3te21d3mLLh08+g1VAHK2999RkXIVg3ByJNEcpb/yKtEEK3+hXdv9tTrZOXI
	De7Jt2BsLaKYa026oE4Q20AR7hc1B/t4koaK6/nPdlOeCmZsaZRZUK8aTQ4d2aLaVE32
	oazQ==
X-Gm-Message-State: ALoCoQlBgnLPNhGXbLZPFZSXaEqMqkzyDSqtxqOoO+5yNTvQXKgkAKXSatPVsLiP/D6WMd5sr6UK
X-Received: by 10.224.24.132 with SMTP id v4mr1556qab.17.1422528984384; Thu,
	29 Jan 2015 02:56:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 29 Jan 2015 02:56:04 -0800 (PST)
In-Reply-To: <1422401819-24209-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1422401819-24209-1-git-send-email-alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Jan 2015 10:56:04 +0000
Message-ID: <CAJTo0LYWqiy+dKjECTUm4pZogAwh=X7eb4P06S6Gg=ct=QcJ3g@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] terminal.py: fixes launching multiple windows of gnome-terminal
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
X-List-Received-Date: Thu, 29 Jan 2015 10:56:26 -0000
Content-Type: multipart/alternative; boundary=001a11c2b49ecc2005050dc85612

--001a11c2b49ecc2005050dc85612
Content-Type: text/plain; charset=UTF-8

On 27 January 2015 at 23:36, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> When resolving a patch, a new process of gnome-terminal
>
> is created for every patch to be resolved, it "waits"
>
> for the previous one to end, instead of launching
>
> multiple windows at the same time.
>

I wish I knew what causes some of your commit messages to end up being
double-line-spaced!

Ross

--001a11c2b49ecc2005050dc85612
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 January 2015 at 23:36, Alejandro Hernandez <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejan=
dro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div id=3D":21u" class=3D"a3s" style=3D"overflow:hidden">When re=
solving a patch, a new process of gnome-terminal<br>
<br>
is created for every patch to be resolved, it &quot;waits&quot;<br>
<br>
for the previous one to end, instead of launching<br>
<br>
multiple windows at the same time.</div></blockquote></div><br>I wish I kne=
w what causes some of your commit messages to end up being double-line-spac=
ed!</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a11c2b49ecc2005050dc85612--
