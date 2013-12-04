Return-Path: <andrei@gherzan.ro>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 52EAF6D840
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 20:08:39 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hq4so8566866wib.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 12:08:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iy3JMqj7LwKA4taGv6vh9Ho8gI8jsJgJHhTOcZ6YgQk=;
	b=kUVXENBBRWpxpZCdtjFo1idhZfqHJjot5V23NXlj/OafSh2XjcS17BgtsUS8ltatsO
	zo++TkfTnvqpCESK/rbDmGiRP/lDdoE+T9vdTPPTXiWxyMuL+1rt4vQw8261AJ6D7275
	4vJui745YI/x3jrNb1NKM7v6/i6VKv2ey8BIrPPekKbPBsQyMxsnbBMIAr8yQsejBtIy
	AFKDcH9QXr+IPS5VaVNwsTz6G5+W5vzkuugHIE1QfvcxutY6PztqWMbKA99IGPuwKeKq
	qHQeeNObQPo9n0i9pD22tBCrjEb6j4jAun66GkPa/1TT1ieKWgMsDhAFoountIjYjEt6
	BWYQ==
X-Gm-Message-State: ALoCoQnsSlkgcSJ7rSe02jwAvo6H46IbeiLkiZM2n81YbDjkdHFjJe5+mpXVj0+KbG0DaJNDQIYg
X-Received: by 10.180.103.193 with SMTP id fy1mr9023496wib.10.1386187718442;
	Wed, 04 Dec 2013 12:08:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.217.150.199 with HTTP; Wed, 4 Dec 2013 12:08:18 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <2780723.Eg1JlMHale@helios>
References: <1386182811-3588-1-git-send-email-andrei@gherzan.ro>
	<2780723.Eg1JlMHale@helios>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 4 Dec 2013 22:08:18 +0200
Message-ID: <CAK18fxEO_t+xF5PCGRgOBeDq5vRXxE4fas_i9CNHDyBuEwwf+A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libav: Add v9.10
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
X-List-Received-Date: Wed, 04 Dec 2013 20:08:40 -0000
Content-Type: multipart/alternative; boundary=f46d04428e3a8cd82a04ecbafa70

--f46d04428e3a8cd82a04ecbafa70
Content-Type: text/plain; charset=ISO-8859-1

Hello,


On Wed, Dec 4, 2013 at 8:57 PM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> On Wednesday 04 December 2013 20:46:50 Andrei Gherzan wrote:
> > This version includes libavresample needed for packages like xbmc.
> > To use this version add:
> > PREFERRED_VERSION_libav = "9.10".
>
> We really want to avoid having too many versions of the same recipe hanging
> around. However, it seems premature to drop 0.8.x at this point. Perhaps we
> should drop the libav_git recipe that we currently have, since that is just
> pointing at an old 0.9.x version?
>
> Anyone have any thoughts on this?
>

Yes. I think this is a good thing. The idea is that they maintain two types
of releases: 0.X and 9.X so probably there are some incompatibilities
between these two.

ag

--f46d04428e3a8cd82a04ecbafa70
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><div class=3D"gmail_extra"><br><br><div class=3D=
"gmail_quote">On Wed, Dec 4, 2013 at 8:57 PM, Paul Eggleton <span dir=3D"lt=
r">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">p=
aul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wednesday 04 December 2=
013 20:46:50 Andrei Gherzan wrote:<br>
&gt; This version includes libavresample needed for packages like xbmc.<br>
&gt; To use this version add:<br>
&gt; PREFERRED_VERSION_libav =3D &quot;9.10&quot;.<br>
<br>
</div>We really want to avoid having too many versions of the same recipe h=
anging<br>
around. However, it seems premature to drop 0.8.x at this point. Perhaps we=
<br>
should drop the libav_git recipe that we currently have, since that is just=
<br>
pointing at an old 0.9.x version?<br>
<br>
Anyone have any thoughts on this?<br></blockquote><div><br></div><div>Yes. =
I think this is a good thing. The idea is that they maintain two types of r=
eleases: 0.X and 9.X so probably there are some incompatibilities between t=
hese two.=A0</div>

<div><br></div><div>ag</div></div>
</div></div>

--f46d04428e3a8cd82a04ecbafa70--
