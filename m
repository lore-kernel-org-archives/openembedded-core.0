Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6526860797;
	Mon, 18 Jul 2016 22:48:44 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id j37so57135qta.0;
	Mon, 18 Jul 2016 15:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cNLc40AETe4wuAT6LeYMbuQQVkl2RUtNPB8mh5xWP/Y=;
	b=hKbkAKJPXc15IzJY2C9ilXrfxpE95DgvJEhpq3BlFxrqin6a+q4cT6esY8BOFtTfIR
	f7HgycoEzkkQXmNpqKowDPF1TBSPjjE0oUfxwqZpkBZ7VVW/WWjEgw9yU33oXPeM94ur
	mPXRIZZop5yppB3d0qNz2T0pJBTamH9vAZtD1VCHKUMXkqawo0c5xaAhdA17wSAZdJX5
	hmf4t18HELhc39lEH3GH6qKAekSEzj+wz8FHWk9DkB5O4P3mHMiE6ZV6rjmZZPdGMV/+
	c3C5ylflwiQlam5uQB/hvLymSIBY7DIy2EUuO3+7c+PrNbD6cwc69m0TarD84hoodWmX
	sytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cNLc40AETe4wuAT6LeYMbuQQVkl2RUtNPB8mh5xWP/Y=;
	b=eY1NjPVSQ6pMAUmp4VXvDM5hD4LZWOFrpo/44W5twgMCI71GMwYFNvAhce+QtE33Xj
	Bjn42YalJhXlsH05ygFsQ+L57pWz9Fyib7W+R06zhoznLUfxMYA5d6cqdRdeks/0yyrw
	3vmFIULU8AouA9hmxprn5ao0/La91pkZAKSS/UdX6oLRB9EC70q+ZEn7uHUO78+6Ovu6
	B9LPs0CWEswsrAyU+ohsMOonvNAxfQqKKbNpSDgtPyeEhhICYydgjk9IdpWEz0EjxXgc
	vYBMu20D8d4XveO3cc48ngBS2ugn8paQqHZm58RTnvWD2kqxFCz8eaK1UYneIb7DmLUB
	t4Cg==
X-Gm-Message-State: ALyK8tLBpwPhY73nvkjv4RbWY+B74t+98J6HsO5eMnMPPOoAPehIspzQ4xB5afrmKq2IzxkkkoBsJiJLtkmozw==
X-Received: by 10.200.48.112 with SMTP id g45mr56586933qte.70.1468882125520;
	Mon, 18 Jul 2016 15:48:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Mon, 18 Jul 2016 15:48:44 -0700 (PDT)
In-Reply-To: <1468880306.2228.69.camel@pbcl.net>
References: <CAJTo0LYNjoPfahXjaKEVP6ey=mY3MKDKK5DoCPB9Dp151UgFpw@mail.gmail.com>
	<1468880306.2228.69.camel@pbcl.net>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 18 Jul 2016 18:48:44 -0400
Message-ID: <CADkTA4OMij4vsjGfw9Vwjh3ymGYkJDUsAKou6=hU7f0Yt05FXA@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Removal of uclibc from oe-core?
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
X-List-Received-Date: Mon, 18 Jul 2016 22:48:46 -0000
Content-Type: multipart/alternative; boundary=001a1143c9c44f02800537f0c5dc

--001a1143c9c44f02800537f0c5dc
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 18, 2016 at 6:18 PM, Phil Blundell <pb@pbcl.net> wrote:

> On Mon, 2016-07-18 at 23:01 +0100, Burton, Ross wrote:
>
> > Now that musl is fairly mature I think it's time to take uclibc out to
> > pasture, where the pasture is possibly called meta-uclibc.
>
> I think this is a splendid idea.
>

Agreed.

But do we need a sharpened stake to make sure it doesn't come back ?

Bruce


>
> p.
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1143c9c44f02800537f0c5dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jul 18, 2016 at 6:18 PM, Phil Blundell <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, 2016-07-18=
 at 23:01 +0100, Burton, Ross wrote:<br>
<br>
&gt; Now that musl is fairly mature I think it&#39;s time to take uclibc ou=
t to<br>
&gt; pasture, where the pasture is possibly called meta-uclibc.<br>
<br>
</span>I think this is a splendid idea.<br></blockquote><div><br></div><div=
>Agreed.</div><div><br></div><div>But do we need a sharpened stake to make =
sure it doesn&#39;t come back ?</div><div><br></div><div>Bruce</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
p.<br>
<br>
<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a1143c9c44f02800537f0c5dc--
