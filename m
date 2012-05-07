Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRQyV-0002t4-C1
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 18:39:51 +0200
Received: by eaae1 with SMTP id e1so1269003eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=ZiGeDDUA4ftQN666VfZh0utN8PkPTmGwvewCEuRfupU=;
	b=hVe98NZFad493AAPgHw6X783BZvMQjjqAxNEMIyrRLNLiAAsG/YnkVfkJrpqG+2vqh
	ua/ESJsoEn6xmr/tv5Bpp4VIa31jCE/qmrZp2y+DOZ0PNhJCXI5ZhTViyBVB37jHtSYr
	NWh7gVYQi0X06DPd5Jf+LzID8RxJhifPKYknJkMen9rPBlzagAlv0PHiSkwA21Pqi2wk
	ia/Jnnr2lKpGT/XFQdSMFsw+ZYkpiLzJuJ2k6z94yFoR/CYcZfVZhBlF89LGgb4r2YJj
	ToTFMHzCfge1gVey+tennYewBZBo7AZyjIbMl7nql57gI+blnfOikl1mRdu1XgSNI25e
	WKhg==
Received: by 10.14.149.129 with SMTP id x1mr2639503eej.108.1336408200954; Mon,
	07 May 2012 09:30:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Mon, 7 May 2012 09:29:30 -0700 (PDT)
In-Reply-To: <20120507083033.GA3184@jama.jama.net>
References: <20120507083033.GA3184@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 May 2012 09:29:30 -0700
Message-ID: <CAMKF1spnOnOVXe5uuXD7SGYJXQqetcB9KPROh8YDSsz4sX6nXA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: dropping libgdbus from oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 May 2012 16:39:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 7, 2012 at 1:30 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> Nothing in oe-core depends on it and gdbus was merged to glib in 2010 so
> nothing new will probably depend on it
>

seems good I think, send a patch for removal.

> Cheers,
>
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


