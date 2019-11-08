Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id C8F4F7F7B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 18:16:10 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id l5so4389258vsh.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2019 10:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6LMuQtnHcvJSr1If1scoQHdc9edOhfxJ0aeuIA802Lg=;
	b=LCl6tbY8gBp/79mEqTPfxQQypslMG809fGyqzcdvo8mjydad4L2+6V4RC5OIjC9dhm
	nVT2RWrH+51lwq3lgaGBxvxj2VXJkaqXY2RpwwOjQfxwGhDluyBlPh6Iqg8ZlZuMB52J
	/62XMLCsaS31s/tzroe1JjJhrb7dJwTGjxYmZpvyZJ73yMA3b6yoQHsOLqgqck/9+a0T
	2so0VCSnLqEetKFbnyNAF+3zobl9y0jXy/AahNeEH4iA6BxV4bfsItP5CA5yEU7jf1pK
	DNIJL202R/wYPM3gFYgKdG8ny2N27OKET6gcq3tmSqFziC2Dg0+Wr5aO5FP1e8+4l6CT
	Qd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6LMuQtnHcvJSr1If1scoQHdc9edOhfxJ0aeuIA802Lg=;
	b=o1LmfF78bSTdD6dhUDwFhEEZP2XcM/W2SoxDe8S8Vl7XhI15R0Tb8I3s2nbUzjfpiQ
	pdRRraRxP4E6nJe260dHXq/93eJuLOz/+hplJZLTogp/xrMw42PeTN6+euIxrpjbJL+y
	C+j436e1fZQMqVvgeGS1E2D7NWIO8c9G9s6X9wZdhM9ErrARRWhfp6chw4vatkFR9VF1
	d01Cb7NGjMJ7yECFEUYmG5oytqhyEIofWiccELTbcm7yE4aSq96d0pQicZuFluM9jbVx
	eJJNpnNv4P3THn5CxfOwNWvgnBPx5FlT81o6KBZwTU8OFeoCnavtuLdzu3YVbsuG2zSh
	XQ+w==
X-Gm-Message-State: APjAAAX/8TwGzMQazh3OsvBWG4d5pAZ6MkQ13vFjB2j02+/QJt7BCnzi
	RpFAL+Mshnc1W38UjairuvqTjIpuzKEZtxXGYLg=
X-Google-Smtp-Source: APXvYqz1BOQ6D94wntfLo096Ix1ujUyg4uXa6ZWY27WsQdEvQ48lcryqo8+h4Q2j17fSmFN8OX27QAjYEgc5QguabgA=
X-Received: by 2002:a67:ea5a:: with SMTP id r26mr8741956vso.94.1573236971562; 
	Fri, 08 Nov 2019 10:16:11 -0800 (PST)
MIME-Version: 1.0
References: <20191031093655.14852-1-alex.kanavin@gmail.com>
	<20191031093655.14852-3-alex.kanavin@gmail.com>
	<dc6caf95-a1e0-0eb7-f721-8dd3d1e2aa93@intel.com>
	<CANNYZj9i0mvP_X3WFapfda49YdVvuY9Tr1KY7mFcsnqRr5J-HA@mail.gmail.com>
	<CANNYZj9dmYgWxYOG6o3hJC9rEk6ghUxYRAak5wZjELMbtOJKag@mail.gmail.com>
	<CANNYZj-Cmx_iNn+tJAW4XE=VSi4MT+LeiaPQk-8REhG+Xd_JsA@mail.gmail.com>
	<CADfgfoYap0Z83h-mRXOLvX2kkC8xitN1Mx5wQM4uHugRhG15Nw@mail.gmail.com>
	<CANNYZj8fQV9vaubTyYF2gzicP3U8w0bZP4Fne91bkRRzPP5hew@mail.gmail.com>
	<CADfgfoac9HKAzqsnGcPqDnCHTvqFQJH854uR3esmJnTkdRLYmg@mail.gmail.com>
In-Reply-To: <CADfgfoac9HKAzqsnGcPqDnCHTvqFQJH854uR3esmJnTkdRLYmg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Nov 2019 19:16:00 +0100
Message-ID: <CANNYZj_3Lukw0Hw5GNgKMSpJy36y3oPsdByA3R+XPnQaG692qQ@mail.gmail.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Fri, 08 Nov 2019 18:16:10 -0000
Content-Type: multipart/alternative; boundary="000000000000d66a730596d9c645"

--000000000000d66a730596d9c645
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Nov 2019 at 19:01, Michael Halstead <mhalstead@linuxfoundation.org>
wrote:

>
>> Thanks a lot! There are two things to check:
>> 1. Old instances of vnc may still be running and should be shut down (via
>> 'vncserver -kill :1')
>> 2. vncserver executable should point to tigervnc (if both tigervnc and
>> tightvnc are installed - I don't know if you removed the tightvnc packages).
>>
>
> I removed tightvnc and all workers have been rebooted so we are good to go.
>
> Any comment on using packages from outside of the distro's official
> packaging?
>

A vnc server is entirely optional when working with yocto, it's used on the
autobuilder (machines without a physical screen) for the purpose of running
qemu with graphical frontends, but is not mentioned in the manuals as
something that users have to install or use. I'd say it's fine.

Alex

--000000000000d66a730596d9c645
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 8 Nov 2019 at 19:01, Michael Hals=
tead &lt;<a href=3D"mailto:mhalstead@linuxfoundation.org">mhalstead@linuxfo=
undation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div class=3D"gmail_quote"><br><div>Thanks a lot! There are two things to c=
heck:</div><div>1. Old instances of vnc may still be running and should be =
shut down (via &#39;vncserver -kill :1&#39;)</div><div>2. vncserver executa=
ble should point to tigervnc (if both tigervnc and tightvnc are installed -=
 I don&#39;t know if you removed the tightvnc packages).</div></div></div><=
/blockquote><div><br></div><div>I removed tightvnc and all workers have bee=
n rebooted so we are good to go.</div><div><br></div><div>Any comment on us=
ing packages from outside of the distro&#39;s official packaging?</div></di=
v></div></blockquote><div><br></div><div>A vnc server is entirely optional =
when working with yocto, it&#39;s used on the autobuilder (machines without=
 a physical screen) for the purpose of running qemu with graphical frontend=
s, but is not mentioned in the manuals as something that users have to inst=
all or use. I&#39;d say it&#39;s fine.<br></div><div><br></div><div>Alex<br=
></div></div></div>

--000000000000d66a730596d9c645--
