Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.2023.1594405147424902747
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 11:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@koncepto.io header.s=default header.b=De9SFJBA;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from [192.168.1.17] (lfbn-bor-1-1339-171.w193-250.abo.wanadoo.fr [193.250.150.171])
	by koncepto.io (Postfix) with ESMTPSA id 2408E6014E;
	Fri, 10 Jul 2020 20:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1594405144;
	bh=eFYCJthJwzSLqe90wIEFAIgrqOn5Wq9BcVrGwD04/7Y=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=De9SFJBAVh8XfYFm1C9TcqAo48APuurqIqcV9/Mza8LXvCua/U62W1GxRf5ZB06MC
	 cjzBtWym2lzcLV3/JeopreBg1JTG7OXeYJ0RLCvq8FXDEciIrdJdwQ7/71YX8BpBoy
	 Ir8oPO1kBH0RLKa01vfURLW+PI9bSxs55r8RXmIP6DthmDpOmY3fOi10ESS43RrhmD
	 W9t+2ojymQUw6RNr8HwHcO0pWmc8DJXnoga/yZBzPbm5y2h6QjHGaWk2ERI/OqTZT8
	 JyIVXGKM7Ky/6P2QpUzjdjoVBBe5dfrqX1kt1+YihFB5pIywRFf2G5RKlhR+U0ZtkP
	 tgw9oG/g3wJtA==
Subject: Re: [OE-core][Patch 2/2] kernel-yocto.bbclass: force creation of config.queue
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Andrey Zhizhikin <andrey.z@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Max Krummenacher <max.krummenacher@toradex.com>
References: <20200710090514.440-1-max.krummenacher@toradex.com>
 <20200710090514.440-2-max.krummenacher@toradex.com>
 <CADkTA4PA0N8W7+jUbV+ao__tY8Q_623=yLZ47YC=z4dD4fiGmA@mail.gmail.com>
 <CAHtQpK5GsbVg3pdNWoYtynvHjzCMMJVr7yRAx5mPQ674DS6N2g@mail.gmail.com>
 <bf4599cf6afab3338c6bdbc86855a424376d3c39.camel@gmail.com>
 <CADkTA4MDO+BCc3ZLDCTzpG6v-0F-c0BwyU068yb1CjTN84sg4A@mail.gmail.com>
 <CADkTA4P-y9n5LLFBmbwhVjV5eXqpM43oVL9KqJxzAUNS8VFZGQ@mail.gmail.com>
 <ffdc5289fd5629ead12ca61c865e769ef82655cf.camel@gmail.com>
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
Message-ID: <6fabe46d-0c78-b015-f4fa-90c7f88034a3@koncepto.io>
Date: Fri, 10 Jul 2020 20:19:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ffdc5289fd5629ead12ca61c865e769ef82655cf.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Max, all,

Le 10/07/2020 =C3=A0 17:52, Max Krummenacher a =C3=A9crit=C2=A0:
> I don't have to test, this was actually my first approach to make the
> build succeed. I thought it to be to invasive for all the other use
> cases which I do not fully understand.
>=20
> If you're working on anything that includes the effects of the attached
> patch just drop my submission. Thanks for the work.
>=20
> I put a workaround for this issue in our kernel recipe, so for me there
> is no rush to have it fixed in openembedded-core.
>=20
> Max
>=20
> If anyone would need the quick and dirty workaround:
>=20
> +do_kernel_metadata_append () {
> +       touch ${S}/.kernel-meta/config.queue
> +}

Thanks for this.
I have the same problem on my side (poky master + meta-freescale ->
imx7s-warp) and this one fixes my build issue [1].

[1] - http://51.75.135.20:8080/job/imx7s-warp/104/console
--=20
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io
