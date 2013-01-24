Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyOqz-0004rF-70
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 16:36:37 +0100
Received: from mail-ye0-f200.google.com ([209.85.213.200])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 07:21:03 -0800
Received: by mail-ye0-f200.google.com with SMTP id r13so15053366yen.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 07:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=nrSVxdIxbRaiqFiYulrp/nKmI4Q1W0aQrTg2UGLZjms=;
	b=PYrPkBhi5lUgeWDHyEdN1Oi24G9oWmd1dys0lhJdOM4x0U2a2sKLT875XSac+1ddCB
	bhnJ59E6HVcrk40orcuj5ZxvuiTDk9FbFnP0nYe6H4ILUNWUbsLg0D/SaaUxSGcucSu8
	dfd3HndJNEXB1RD11izMqBsBTG5uy+D7DXafOY7DJs1TfB4V8mwgrueHcrvGwIYk0RIk
	lT96mMLJ0RqYjHbRMhve9f4JDLYZ/Ez8jSf+hk0qslXB+OysUDGKj0xWQvd/VR03JAkZ
	Y4Ks2mVFLXOVHWuC8XGrMrkmePUWUVcPkinryZa8PTiryIYXywCLDiuI/qAm8h+eM7xr
	aRMA==
X-Received: by 10.52.176.202 with SMTP id ck10mr1958148vdc.42.1359040862073;
	Thu, 24 Jan 2013 07:21:02 -0800 (PST)
X-Received: by 10.52.176.202 with SMTP id ck10mr1958138vdc.42.1359040861989;
	Thu, 24 Jan 2013 07:21:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Thu, 24 Jan 2013 07:20:41 -0800 (PST)
In-Reply-To: <CALbNGRQhr3GGp+Hx2jMOs0sEXCw5PNYdQhfoiHL0Kw1AxWvf6g@mail.gmail.com>
References: <1359034562-31592-1-git-send-email-radu.moisan@intel.com>
	<20130124134801.GD3012@jama> <51013F96.80302@intel.com>
	<CAGiJk9ca5XZXMamBFOr+syV08WK--2CYONS_0f=rCxrZkm+n-g@mail.gmail.com>
	<CAGiJk9dpU1vpqUZt_+3aS4Bu97_kEkftPrOameF-LAB1qd2qDg@mail.gmail.com>
	<CAJTo0LbN7djNS17qDc60716+uSSgjKbtXHnUvsCWq6Bm_zKigA@mail.gmail.com>
	<CALbNGRQhr3GGp+Hx2jMOs0sEXCw5PNYdQhfoiHL0Kw1AxWvf6g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 15:20:41 +0000
Message-ID: <CAJTo0LZR4BjQYHPfaBtGpDe9Oi1qTuv=wAvhCkQ6EtfNkuLKtg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQkiq9OWMIS0MAFhYztZo7iTKC0ol1znk+yCLurcKj7VBeYRmSIRUO5z/zvM48S0TTmZJ0OE29QqsjE+Fp66XZaTZt/Ijbcz49uGFQb/E6qYqiLroapN9rZTgNS2vg6YRon1peGe/aR+/5C2swCAE4mMMI1cE+rlbu0HuMaWNTll81qWFXEZUbqUe+Sw08t1WYAX26AT
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
X-List-Received-Date: Thu, 24 Jan 2013 15:36:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 24 January 2013 15:16, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
> So I would have to touch all my images to save GUI-less guys from
> systemd warning? Hmm

It would default to a text console, so you'd need to modify your GUI
images.  There may be some common place we can override this globally
for anything with X.

Ross


