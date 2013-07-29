Return-Path: <djszapi@archlinux.us>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF216B315
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 12:18:36 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id uo5so1250744pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 05:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=fd6vFVZVgh4vcluDsvJNTjk3z0dCpi8Rtt2UByoGe+8=;
	b=M9RlzjPg7PaHbBkq44ctONbM+cHMcNlzqBenSsu6QPgX4Tt/UX8JeWBJETMBxS9nNN
	AWXyZJuTgOCj1w7lFx+39r7jtXuGGjtIu+LBuXEArqAb/ipOkQ1UTb6kRILyZRhzc+mj
	tx6lQ8WGrPMOEO4tmTvWEDr+87NnT2e4a3D5PLqwQ/hE5xU7cE9BHhGvwWadG5PmUVPf
	Sll9jx260FA8vdhCs+r5p6bPRkjsngPgoBJXi9ikpJ5hkIfZOtFYpHYXcACqKUmM5fMS
	AGCEyM/+b6DOAXoyiyfiKGlPITX/y4Un7baI9uUkos5azPJODRDdDZJCCbENMosEB0u/
	N7uw==
MIME-Version: 1.0
X-Received: by 10.66.27.143 with SMTP id t15mr64458161pag.171.1375100317085;
	Mon, 29 Jul 2013 05:18:37 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Mon, 29 Jul 2013 05:18:36 -0700 (PDT)
In-Reply-To: <1375094111.13247.9.camel@phil-desktop.brightsign>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
	<1375094111.13247.9.camel@phil-desktop.brightsign>
Date: Mon, 29 Jul 2013 13:18:36 +0100
X-Google-Sender-Auth: st1vpzz_JN57mM9324Cox9aNAUY
Message-ID: <CAOMwXhMZ1w5j=aP_yPXb=k0=UOuinMS5ENAsXAdzcb42WxC0Og@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQmZsHpbTHTp3to9wLwneZddKJl2yju4tSW7Cws0eSHD8NIPB9bnsj+uYPbFDiz7gb+z3pyH
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Mon, 29 Jul 2013 12:18:36 -0000
Content-Type: multipart/alternative; boundary=bcaec52bea19ee498604e2a57d94

--bcaec52bea19ee498604e2a57d94
Content-Type: text/plain; charset=ISO-8859-1

Only _one_, not two.


On Mon, Jul 29, 2013 at 11:35 AM, Phil Blundell <pb@pbcl.net> wrote:

> On Mon, 2013-07-29 at 11:22 +0100, Laszlo Papp wrote:
> > I disagree. This change should not have gone in the first place
> > causing the regression for the users. Please be consistent with the
> > history.
>
> If this was a recent change then I would have some (limited) amount of
> sympathy for your position.  But the commit you are complaining about
> has been in the tree for over a year, and it was presumably included in
> at least one if not two of the most recent stable releases.
>
> p.
>
>
>
>

--bcaec52bea19ee498604e2a57d94
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Only _one_, not two.</div><div class=3D"gmail_extra"><br><=
br><div class=3D"gmail_quote">On Mon, Jul 29, 2013 at 11:35 AM, Phil Blunde=
ll <span dir=3D"ltr">&lt;<a href=3D"mailto:pb@pbcl.net" target=3D"_blank">p=
b@pbcl.net</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Mon, 2013-07-29 at 11:2=
2 +0100, Laszlo Papp wrote:<br>
&gt; I disagree. This change should not have gone in the first place<br>
&gt; causing the regression for the users. Please be consistent with the<br=
>
&gt; history.<br>
<br>
</div>If this was a recent change then I would have some (limited) amount o=
f<br>
sympathy for your position. =A0But the commit you are complaining about<br>
has been in the tree for over a year, and it was presumably included in<br>
at least one if not two of the most recent stable releases.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
p.<br>
<br>
<br>
<br>
</font></span></blockquote></div><br></div>

--bcaec52bea19ee498604e2a57d94--
