Return-Path: <kergoth@gmail.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6112B606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 18:58:24 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id l2so1080724uak.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 10:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PKCDQDHh6gg0nsnnQ9meZZOruxWKUoVX2mu9BJeZzhs=;
	b=GELDWlKgf4OnF5cN1NSPumo2PZgo6qail+Fns5wm9udOOogv+goPptwULoJwxtwVtV
	BjHRB90OC0fC0IO/oWgiFnnXoOzyut9jwQ/N4tPcJtB90HAcOWhS/XKvInFxza6LQcaV
	DkCNFavaBY2S2ys2lOSgGI5lSYTUPoWSfrgCYWY8koGitahuK4D2u3pb5iWf0xEEsh+S
	2vZM7QnDl3XwXY32GRtsNpkQbODSnkCU0rVw+3QAsO4yZpH+ZhK7ttGEq6plwcSMuSF2
	hfoGnd2+BON6a7UW09a3wgS0w1T6NAzje1GfwAO87qCFgKnXbfRLwklSQF9mwytgDZX9
	rrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PKCDQDHh6gg0nsnnQ9meZZOruxWKUoVX2mu9BJeZzhs=;
	b=CpJ5WTHP4FycQGhrEtuQNMdLtsELwaLx3S0dDwWy0+On5aWV3C1+V4g0R1qquwhBKo
	yEPmvKctb1zjrFNZPRn61hRXFGpJYRJZErzHiAOyNAaEBQBR+UvLg25urIDAA0hWNpfX
	NEdtHwy8HrQb5Zg72IR2iyuZsjD73qirT2JPQRrK3xsaFu6KIDSsOCanKSMj3hP7+ESH
	Ey0Rg2sue8ya4ZhEl6W1QVJ5CJQqouyWNGhOuDuoqvy0dseI5sgoxwVcvssnaKQ/q8Xh
	KQoeYCClpSrefHwCZPMH69rwTRUe/SJEhFXoLuGpfI3Wl5JT7QXWgmpT0GPIoenTS6qy
	O90A==
X-Gm-Message-State: AJaThX6Jjn6/lKxvU+Np/+C/YgR0VfhxFtc/sHNzMP+ts4pN+2tfowZ6
	IdsDewvKIpB6l7gWY++v78f0Nreoj0SvkLd15vo=
X-Google-Smtp-Source: AGs4zMa37fNjNICs1R+GjjMAARlzYmqFUw0fLUqiHviwj2jmcOihXAtSpQVy9oCZYTOUBl2tg6CwkgeeE2Xm1QDlzRI=
X-Received: by 10.31.154.211 with SMTP id c202mr170928vke.78.1511895506000;
	Tue, 28 Nov 2017 10:58:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.72.130 with HTTP; Tue, 28 Nov 2017 10:58:05 -0800 (PST)
In-Reply-To: <20171128171204.11665-1-ross.burton@intel.com>
References: <20171128171204.11665-1-ross.burton@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 28 Nov 2017 11:58:05 -0700
Message-ID: <CABcZANm9179WNQTrf10EGomJTQkh-AJfeBF5xJdHPy0-Ttv5Ug@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: disable aclocal
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
X-List-Received-Date: Tue, 28 Nov 2017 18:58:25 -0000
Content-Type: multipart/alternative; boundary="001a1140ff9892a1ab055f0f9a70"

--001a1140ff9892a1ab055f0f9a70
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 28, 2017 at 10:12 AM, Ross Burton <ross.burton@intel.com> wrote:

> Bash hand-maintains their aclocal.m4, so stop autoreconf from invoking
> aclocal
> and overwriting it.  This means we can remove the kludge to copy
> aclocal.m4 to
> acinclude.m4.
>

Nice. Glad to see some of these kludges going away after all these years :)
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a1140ff9892a1ab055f0f9a70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Nov 28, 2017 at 10:12 AM, Ross Burton <span dir=3D=
"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.b=
urton@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Bash hand-maintains thei=
r aclocal.m4, so stop autoreconf from invoking aclocal<br>
and overwriting it.=C2=A0 This means we can remove the kludge to copy acloc=
al.m4 to<br>
acinclude.m4.<br></blockquote><div><br></div><div>Nice. Glad to see some of=
 these kludges going away after all these years :)</div></div>-- <br><div c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>F=
ounder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Men=
tor Graphics</div></div></div></div>
</div></div>

--001a1140ff9892a1ab055f0f9a70--
