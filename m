Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web10.1047.1631203457301600349
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 09:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=IHbmjfzA;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 80BA72E8922;
	Thu,  9 Sep 2021 11:04:16 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1631203457; bh=yQpEAiB8e61bCQ95XwzFeXHp4FW0dQgMM//VcDrKi8o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IHbmjfzAbk+0rxlKetcvzbpG45/YYCkDyyIQuVbuMb8A2mHETZhihA1TyKzyLEI1a
	 C036S+MNEgu2Yoke96oF+p2ztQuUyhzmgRjEZmq3Si9hYDEmrbv1bgSpNelo1t80Xv
	 g10t+INjhYohx73w3nuno6ZTaRcBmL6fPzQGEc7vL/DWB5gxvivjz1loXXe1n1hLoh
	 B3VdxysrDgyyShnjAmL9tOttcYb7Gs4qvQFf7AHcqgf7ZTQtEntBxl7eARmr2eEJV/
	 bJecbo7vjYPSv+SS8eSAL2lI2VaC7E7b/X8fMUK2tenRh6ep+CbcldCyc+e3mfabgf
	 CVq22vQktcvIQ==
Date: Thu, 9 Sep 2021 11:04:14 -0500
From: "Seebs" <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Damian Wrobel
 <dwrobel@ertelnet.rybnik.pl>
Subject: Re: [PATCH 3/6] pseudo_client: Do not pass null argument to pseudo_diag()
Message-ID: <20210909110414.06572d6d@seebsdell>
In-Reply-To: <20210909153614.1225570-3-richard.purdie@linuxfoundation.org>
References: <20210909153614.1225570-1-richard.purdie@linuxfoundation.org>
	<20210909153614.1225570-3-richard.purdie@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu,  9 Sep 2021 16:36:11 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

>  pseudo_client.c:848:17: warning: =E2=80=98%s=E2=80=99 directive argument=
 is null
> [-Wformat-overflow=3D] 848 |                 pseudo_diag("couldn't
> allocate absolute path for '%s'.\n",

I'm sort of curious as to whether pseudo_root_path is ever actually
called on a null path, but eh, checks are cheap.

-s
