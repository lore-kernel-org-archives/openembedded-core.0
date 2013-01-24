Received: from mail-oa0-f51.google.com ([209.85.219.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TyOzr-000504-Cq
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 16:45:47 +0100
Received: by mail-oa0-f51.google.com with SMTP id n12so9877917oag.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 07:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=ily27XL59e72Lw2Sw0TNrqzXiDV5I/Qz0zhgJXlzaK0=;
	b=COme0SpdZGUs3suvPsoL7SYrnX1JFcx4C+6HFpIyvHbK4nRykiDM5WXldoMuUUCIIS
	jQfrzVixyCwVOeMy2y+5+Jbe7KXbENx7MbXwGfYIJdx7b5nb18u1zriyFRISjq4fY2s4
	za9c2P/BWlovPAklCwdxyTAmVzrHIPSY6bRgrC8bbLGvMUN+iLE1V12Hl3CwHavi/qNr
	v6SSJU2JaQKUxuIZXgasAuKw2tTC9ZfdY7FwBAZ6ZeL8BwP8OeVgGwd5RMYFXz7ViZOF
	2ufEZPaah52RZQTP6w2ms7roxLOHuTHV+ZiRJdts8sPuuuXzmf33cJQS7bBk8EZvY/EP
	FUww==
MIME-Version: 1.0
X-Received: by 10.60.172.113 with SMTP id bb17mr1807067oec.110.1359041414006; 
	Thu, 24 Jan 2013 07:30:14 -0800 (PST)
Received: by 10.60.54.34 with HTTP; Thu, 24 Jan 2013 07:30:13 -0800 (PST)
In-Reply-To: <CAJTo0LZR4BjQYHPfaBtGpDe9Oi1qTuv=wAvhCkQ6EtfNkuLKtg@mail.gmail.com>
References: <1359034562-31592-1-git-send-email-radu.moisan@intel.com>
	<20130124134801.GD3012@jama> <51013F96.80302@intel.com>
	<CAGiJk9ca5XZXMamBFOr+syV08WK--2CYONS_0f=rCxrZkm+n-g@mail.gmail.com>
	<CAGiJk9dpU1vpqUZt_+3aS4Bu97_kEkftPrOameF-LAB1qd2qDg@mail.gmail.com>
	<CAJTo0LbN7djNS17qDc60716+uSSgjKbtXHnUvsCWq6Bm_zKigA@mail.gmail.com>
	<CALbNGRQhr3GGp+Hx2jMOs0sEXCw5PNYdQhfoiHL0Kw1AxWvf6g@mail.gmail.com>
	<CAJTo0LZR4BjQYHPfaBtGpDe9Oi1qTuv=wAvhCkQ6EtfNkuLKtg@mail.gmail.com>
Date: Thu, 24 Jan 2013 16:30:13 +0100
Message-ID: <CAGiJk9ca7C5UWwLW0GTsiqSxH=TjOHfQ_bd4L9YgiKW+151cuw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: set default.target to multi-user.target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 15:45:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2013/1/24 Burton, Ross <ross.burton@intel.com>:
> On 24 January 2013 15:16, Andreas M=C3=BCller <schnitzeltony@googlemail.c=
om> wrote:
>> So I would have to touch all my images to save GUI-less guys from
>> systemd warning? Hmm
>
> It would default to a text console, so you'd need to modify your GUI
> images.  There may be some common place we can override this globally
> for anything with X.
>

The developer of systemd made this the default just so we can change it?

There is no reasoning why to change the _default_ so that others have
to change their image rather than you have to change yours.


--
Regards
Samuel


