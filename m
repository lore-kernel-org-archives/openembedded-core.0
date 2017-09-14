Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5E831782AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 12:14:01 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id v137so1612132ywg.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 05:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HGQ5a8jAf/XxyV1GZUA1H1uB4diKSw3WxqDnzgbxTjM=;
	b=GewaIw3vYtc4GN2xhTaIDVsn0vjmXWBByzrR7f7cAL4cpD9jJq8Qz08G7BKlqmKJoL
	eFR0+Gwk38WxCpJQibeOm/tVsqnOrNYbeQ6D/CZhUcJD4lj5/Yt5d/tqZTPOOGjPUzpT
	UwWfgs5kpz/Dm04b21MYJPaOEti1J16jguTfLzSmjtUkthRYjMwEA+8zPBmHaD+fTnBr
	zctQzpEI7ifJ7EqNbHvY8C2kzsyazbxfT3nfSPEiRFOYvSoglu/EgAQMOHI9oK40+r9h
	IME6JoRpcvQkdQp7JNa8dIOGZSE67cX8wtQXKi2TrHr+h4GuoN0fipQOcmV7WA0fkaVZ
	YB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HGQ5a8jAf/XxyV1GZUA1H1uB4diKSw3WxqDnzgbxTjM=;
	b=Y66sT0BQXKIG+s82QDHqC35bOTJDjD1mE0io5v4doo5o1uxiiPTdD7mBmGyxU3e1/S
	3guw0gP9jEtvfIQE5sorEKZXVe4QCp/+/i9s0QPkTSWwCnAoromDKsPToQDsajRJmfls
	Nr9rswCC4G7lEWuGGEO90XMJ+CX2ZmQ0n9Bs4ajUqEpzbBXhvkQFcQKpej4pMtia9u3x
	f9O90mmI4gWNWYq5MvaRoa4y1h8nQ+Mizkpex0ODjjjxuGyKY7wIdaHCjJmHjP3nPhun
	LPkcn0vtO3UWV67iwqODr+utNoz7wcCA8zGbsWGX9M0L9szteUUwL7BOQUf+zyDkGQR0
	+bAA==
X-Gm-Message-State: AHPjjUgFea0zsEU3HBUUB2gIiHpdZuQ6XxHST93i+JzQE2LoGytZdac/
	XdgspztsBJ2DZJ4Gg4E=
X-Received: by 10.37.64.80 with SMTP id n77mr17235951yba.196.1505391242913;
	Thu, 14 Sep 2017 05:14:02 -0700 (PDT)
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com.
	[209.85.223.181]) by smtp.gmail.com with ESMTPSA id
	z145sm5548988ywa.21.2017.09.14.05.14.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 05:14:01 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f181.google.com with SMTP id l15so457500iol.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 05:14:00 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCNCHQpMRmGBFrnjjRcoOax3bdeQyLRL8WLjeRF/KasVLMBh6HEpJmS5Hc0YjaY+n39hIdd3mhuPQ52JEQRzd0=
X-Received: by 10.202.199.129 with SMTP id x123mr12222188oif.67.1505391240286; 
	Thu, 14 Sep 2017 05:14:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.86.129 with HTTP; Thu, 14 Sep 2017 05:13:59 -0700 (PDT)
In-Reply-To: <1505384767.19222.4.camel@andred.net>
References: <20170912203608.14327-1-otavio@ossystems.com.br>
	<20170912203608.14327-3-otavio@ossystems.com.br>
	<1505290515.32675.4.camel@andred.net>
	<CAP9ODKoRrYs0SB1f6GCvFW6fStoEQNYkv7YbMfZdqbhLfGnXJw@mail.gmail.com>
	<1505384767.19222.4.camel@andred.net>
Date: Thu, 14 Sep 2017 09:13:59 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpLckOoc-dvXOFwCoDRiPXZb4dJJJ15+cs1SbtbBQ4wyQ@mail.gmail.com>
Message-ID: <CAP9ODKpLckOoc-dvXOFwCoDRiPXZb4dJJJ15+cs1SbtbBQ4wyQ@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8 3/3] kernel-devicetree.bbclass: Add support to generate append to kernel
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
X-List-Received-Date: Thu, 14 Sep 2017 12:14:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2017 at 7:26 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> On Wed, 2017-09-13 at 09:30 -0300, Otavio Salvador wrote:
>> On Wed, Sep 13, 2017 at 5:15 AM, Andr=C3=A9 Draszik <git@andred.net> wro=
te:
>> > On Tue, 2017-09-12 at 17:36 -0300, Otavio Salvador wrote:
>>
>> ...
>> > AFAICS, zImage is specific to x86 and arm, all other arches, including
>> > MIPS
>> > have no zImage Makefile target, so we'll never get here.
>>
>> Do you know which types we can use here?
>
> * for CONFIG_MIPS_RAW_APPENDED_DTB this can be either vmlinux.bin, or
>   vmlinuz.bin
> * for for CONFIG_MIPS_ELF_APPENDED_DTB this should be vmlinux
>
> see other mail :-)

What if I add ARM support now and when someone has the need for MIPS,
and can test it,  it is added? I can use a switch case for ARM and
error out for others so it is easy to extend.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

