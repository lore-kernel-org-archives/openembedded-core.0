Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id E6E0B7E97C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 13:38:09 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id j184so1994740oih.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 06:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wJV+XdLIreVI+id5nKl7w938KQJTrwwT6iPp7ZaAocg=;
	b=KqvPBmDjI+yz2Y2LG+0j4sanO1Zgt8Ym35JJ23CK6XZuGDer4piFHOzQ1xlFgpVRZw
	Q+vDZ4cGGe3xLPmwZ2YG8XWPcZ4tm0BWmWPgwIpMf0stUZkVqynZStJ661jVWXDi9gWN
	HjT9oPqxtNVoHw/pme51CFe6Q9lVl87+sNRWHZK/nbipuOaF33zcrBGQAsLWY++m/TmY
	1EY0X9TeeDtqRRaZL/+8uqF993JU6EesIi5qB/TL7Q7jJHydxb0HGgGIbCPxjaMkltLw
	fZ/3nO7tePGkKnwlXQ7YUSB9Ck1jmcqLhQ4sLikZBy2IRWgUwbjSrVVscEKsZOapcaWT
	XSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wJV+XdLIreVI+id5nKl7w938KQJTrwwT6iPp7ZaAocg=;
	b=lkpskXz3Wue0eRFpgQPMvs24SZxzzUJ5AfHYpSfj1c8Eu+MgTQ6THTQvR+nURLGCRd
	3l6xZOwwPfxXNKjRGIY753rqkcSK+vbrkqe0kk6rnXSA8rOgVtcdv9YvLF05FAzUJ8WR
	UsJVHHgluiFvndoIUN5MGfy7Pr6yUFxTeWyrKG7ZgGxx/7CafbMqTupwMT50AZXXDloY
	SZzUX9Oe2TndBRIO8VmGwmhMKsg3431q7IVv4SZsvEOq+JrmzB2SNdX0nzkRKQH7RV3w
	tmIwyl5Y9k1HmT3YrwreVNrl1iiZW/7E02nK3svUPn+T/vXbDoogzHAHewst+BXqejOb
	QOHQ==
X-Gm-Message-State: APjAAAX5Ci/C6CKX66QF8/9YU1z7RI7ZGYYm+VnTeJwtllk7+rswkoBC
	6Rcs6JuGoHsAKWBAy+1MdOPgZ2b3nVYdC+PDOFVx31Fnd1g=
X-Google-Smtp-Source: APXvYqwe4MUM/L/yjJGqpv3XxRFjRtHSezp1AvMORjr2czXzsAops96PyMs0q5sDTk4b0dFTCJK9mvJ1KC1uCzConPc=
X-Received: by 2002:aca:c008:: with SMTP id q8mr1906864oif.135.1560519490881; 
	Fri, 14 Jun 2019 06:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
	<a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
	<20190614120448.2wg2523qu67la7mh@pengutronix.de>
	<ee3249ee4f978ee2ee7c74b0af81fe971ca66300.camel@linuxfoundation.org>
	<20190614123451.c5idgiizmqnlhob4@pengutronix.de>
	<f2348016a0867fd986bbe4965dcb88a5b652055f.camel@linuxfoundation.org>
	<99B005A2-CD21-4AA8-B960-54121098F850@gmail.com>
	<c85e93b13ddcbc27c27ac17fdcf97a0d1ffc4020.camel@linuxfoundation.org>
	<CANNYZj-9xUFE0x9D_BpLiqkNitLmXnrv9n8boodZpE5bX-psgw@mail.gmail.com>
	<CAJTo0LZbf2Y6_nN0E8tsVLHKxZAtE6zyqP25nyKk=v6+bQjkHg@mail.gmail.com>
In-Reply-To: <CAJTo0LZbf2Y6_nN0E8tsVLHKxZAtE6zyqP25nyKk=v6+bQjkHg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Jun 2019 15:37:59 +0200
Message-ID: <CANNYZj9LOQZkawsAPi=Sgsd2_0qTeR=NOn4RxqArA+CmkLSTQQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: kernel@pengutronix.de, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Fri, 14 Jun 2019 13:38:10 -0000
Content-Type: multipart/alternative; boundary="000000000000eb4e11058b48c110"

--000000000000eb4e11058b48c110
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Jun 2019 at 15:36, Burton, Ross <ross.burton@intel.com> wrote:

> > Dropping the swrast dependency will not help though, as it is provided
> by the mesa-megadriver package, which will continue to include swrast as
> long as it is enabled in the mesa recipe. mesa-megadriver is also pulled in
> through other dependencies.
>
> Won't that stop the build failure on the autobuilder though?
>

Yes, I think it would.

--000000000000eb4e11058b48c110
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 14 Jun 2019 at 15:36, Burton, Ros=
s &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">&gt; Dropping the swrast dependency will not help thoug=
h, as it is provided by the mesa-megadriver package, which will continue to=
 include swrast as long as it is enabled in the mesa recipe. mesa-megadrive=
r is also pulled in through other dependencies.<br>
<br>
Won&#39;t that stop the build failure on the autobuilder though?<br></block=
quote><div><br></div><div>Yes, I think it would. <br></div></div></div>

--000000000000eb4e11058b48c110--
