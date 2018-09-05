Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id D592D74C68
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 13:42:43 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id p84-v6so13673264oic.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 06:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=J9i9/5u4P8SMLrgrsCZqFBBJRZ/qd1oz523XcnSz9s8=;
	b=o0j75oeqXkN5lioseff130U+EQe8cR2jwrdcxnJDNUh8mGEpSKj8TdsLZ1pMFTjNrW
	a9x1P8lwA/LomTjXESeGHZ37Qe1qCLOmo/ggFxU55ExFlxWA1mqTeWfUwb9i7apUeMmF
	D1WA2902TAHRADHxt4Uj4WbzJG698wBZ0WBgwKf4CjdcuoEnwt9fIiaryYNzRlVX5G6l
	SZzkj7HJjmWMxZl7U54u6XjxWwvzIXzZ4OpZBa4qrRc7P9PLyoUMlfa4FDYtchFTXgCA
	o0yfZB7vEgDzIYgLXuBfA1NAdjHoDm9zOio6QAw42T09Kls8hpTlL0JDXRFD6KqlzzPh
	hSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=J9i9/5u4P8SMLrgrsCZqFBBJRZ/qd1oz523XcnSz9s8=;
	b=oHl8q9XmcpgXl+CAy6UtXTyw3PsOtkTq9tMP4wCUBNlTg0r5vl4ay6ZYBx3fPVdiBk
	LbzuTlDuMjOf5EknirSn26jFlODGt+1+rMQKLMixxKh2WZTPYmDd2JYopQPGnt0DaOsK
	c5kLJNUQHnxBW8V1sFZQuzsbWfONYOF/ntIdVyWc9zTsVcy3tBvdc2HOr+IAsjlf4Pza
	YJ5kKx6NiCFVwQd5LtzKhDLqYi/1tINnGVi7tq5aGHqdusUMDQykEErNFu9c1MW3Pvkz
	YLqigQRNhTfOFYQwBmrAPD3kGDpFzTr7dRejwGAWB/TIOoZ1vUPCIBwtrAQWX+FmWzG6
	nvHQ==
X-Gm-Message-State: APzg51CZIzKHoO2spsS8dCXOcEt9OSUwffkKEFX6oFKeW8FEDtmVOt+v
	hXDPvmYRA5jPxCtxr6i82L1SncjqF3q22Q==
X-Google-Smtp-Source: ANB0VdYaj77PyPXpiA9ZxG04pMxve9DTJ6IXLU/lgN2mvr2ktjpHGdUZXO9Auf2oAKyggY69moxSww==
X-Received: by 2002:aca:3ad4:: with SMTP id
	h203-v6mr28607779oia.294.1536154964375; 
	Wed, 05 Sep 2018 06:42:44 -0700 (PDT)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com.
	[209.85.218.48]) by smtp.gmail.com with ESMTPSA id
	l204-v6sm1231614oia.45.2018.09.05.06.42.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 06:42:43 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f48.google.com with SMTP id x197-v6so13649443oix.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 06:42:42 -0700 (PDT)
X-Received: by 2002:aca:f045:: with SMTP id
	o66-v6mr31105396oih.8.1536154962473; 
	Wed, 05 Sep 2018 06:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20180830232604.10850-1-otavio@ossystems.com.br>
	<CAMKF1sozB+uN8h3YcEXSnRvuQOWdYYzRC2iOrr54h-5VYnQUMA@mail.gmail.com>
	<CAP9ODKopW2QbA0qvf4kdmq9j3vme_LO4y-43h1Uq5tspErb0Gw@mail.gmail.com>
	<CAMKF1sr8BRcKEgQQYnfROQrrZ=0PocpWW11bFd_9X7RPuNpC5Q@mail.gmail.com>
	<CAP9ODKoLPC-BNnfqjoUzbDM+EPo1jmwGoqyk7=cMD4vord2Kyw@mail.gmail.com>
	<CAMKF1sr9+bzRBVfV5J=ad4v_m1kQ5hLg=qDqX_dyEUWcFeocAQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr9+bzRBVfV5J=ad4v_m1kQ5hLg=qDqX_dyEUWcFeocAQ@mail.gmail.com>
Date: Wed, 5 Sep 2018 10:42:30 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpfrTs+vQQcG=TyTO6nPZHR8U3xHyg4i_xsn17eOKc41A@mail.gmail.com>
Message-ID: <CAP9ODKpfrTs+vQQcG=TyTO6nPZHR8U3xHyg4i_xsn17eOKc41A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Update 3.11.4 -> 3.12.1
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
X-List-Received-Date: Wed, 05 Sep 2018 13:42:44 -0000
Content-Type: multipart/alternative; boundary="000000000000dbed5705751ff2aa"

--000000000000dbed5705751ff2aa
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 4, 2018 at 8:43 PM Khem Raj <raj.khem@gmail.com> wrote:

> Here is one failiure that is seen in meta-oe with updates cmake
>
> http://errors.yoctoproject.org/Errors/Details/190510/


I am looking at it...

Seems not related. I built poco using cmake bump and OE master.

Seems related to the musl update on master-next.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000dbed5705751ff2aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue=
, Sep 4, 2018 at 8:43 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Here is one failiure that is seen in meta-oe with updates cmake<br>
<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Details/190510/" rel=3D"no=
referrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Details/1=
90510/</a></blockquote><div><br></div><div>I am looking at it...</div><div>=
<br></div><div>Seems not related. I built poco using cmake bump and OE mast=
er.</div><div><br></div><div>Seems related to the musl update on master-nex=
t.</div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blan=
k">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tp://code.ossystems.com.br" target=3D"_blank">http://code.ossystems.com.br<=
/a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobil=
e: +1 (347) 903-9750</div></div>

--000000000000dbed5705751ff2aa--
