Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id C65AC72D36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 13:35:16 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id z107so24155355qgd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 05:35:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yrc4ywWHh+fTLMX+odrBjgHAMPOYeCRlXs63R3KF4k0=;
	b=eJkfxPiA42KXET2InL0vG4xZNsw0xdeZaY75EifYe2UWg18fG6JpdNWu+N1VeJvDD+
	rVrNuQYZ5EzZh6E0sz0Dm9BBhH3DQ0IHlm4ylXWXNsMMN0F/LMHoW50ZEnbg1hf2pqgM
	Z23lddCH0BjF8xRzRIM7t/TdeC9sNSDKIlfntFwXc49LlNdTjiluzHAp1UVJlqxoIxPM
	PFfv69peL5iHQNe1SfKGBDjcUs3N60E3SPzQPFSGkfzPc6uN1YYrUlThhgTezy/zUbIY
	xoeutA3/vwLGo2urawgQwBq7XzmOAVVISeYbck2sFdrdWQPf4MnlgoJmUEs85flqUjl+
	xaug==
X-Gm-Message-State: ALoCoQm+825soHZ7b2llkgORyUZXlN59AKY5BOgRwBHiem+tmkEQTOIZUjhZ4x1RP+pyKnHxu7k0
X-Received: by 10.140.85.9 with SMTP id m9mr23378975qgd.7.1424698517408; Mon,
	23 Feb 2015 05:35:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 23 Feb 2015 05:34:57 -0800 (PST)
In-Reply-To: <1424515460-52075-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1424515460-52075-1-git-send-email-sven.ebenfeld@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Feb 2015 13:34:57 +0000
Message-ID: <CAJTo0LYY0Gh2p6p-vofrXxYQnfjKRwazoz+khs7HpyG==3Zvsg@mail.gmail.com>
To: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] terminal.py: No --disable-factory for gnome-terminal >= 3.10
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
X-List-Received-Date: Mon, 23 Feb 2015 13:35:16 -0000
Content-Type: multipart/alternative; boundary=001a11c12e960ae2f0050fc179a0

--001a11c12e960ae2f0050fc179a0
Content-Type: text/plain; charset=UTF-8

Hi again,

On 21 February 2015 at 10:44, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:

> +        vernum = check_konsole_version("gnome-terminal")
> +        if vernum:
> +            major = int(vernum.split('.')[0])
> +            minor = int(vernum.split('.')[1])
>

And whilst you're editing this code, doing the split inside
check_terminal_version and returning a tuple would clean it up nicely:

def get_terminal_version():
    ...
    return ver.split()[-1].split('.')[:2]
(major, minor) = get_terminal_version()

Ross

--001a11c12e960ae2f0050fc179a0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi again,</div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On 21 February 2015 at 10:44, Sve=
n Ebenfeld <span dir=3D"ltr">&lt;<a href=3D"mailto:sven.ebenfeld@gmail.com"=
 target=3D"_blank">sven.ebenfeld@gmail.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div id=3D":48b" class=3D"a3s" style=3D"overflow:hi=
dden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vernum =3D check_konsole_version(&quot;g=
nome-terminal&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if vernum:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 major =3D int(vernum.split(&#39;=
.&#39;)[0])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 minor =3D int(vernum.split(&#39;=
.&#39;)[1])</div></blockquote></div><br>And whilst you&#39;re editing this =
code, doing the split inside check_terminal_version and returning a tuple w=
ould clean it up nicely:</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">def get_terminal_version():</div><div class=3D"gmail_ext=
ra">=C2=A0 =C2=A0 ...</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 return =
ver.split()[-1].split(&#39;.&#39;)[:2]</div><div class=3D"gmail_extra">(maj=
or, minor) =3D get_terminal_version()</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a11c12e960ae2f0050fc179a0--
