Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 65FD171A36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 08:19:38 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id g60so13173976qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 01:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vQiX60KVSvg5+89ibWmJMNsbGwBNCd3yxtyFcLZdBoI=;
	b=jm8+HsEPTonyUijeami0EtRKahM2DAfp8L9U6aMWqtRKsIl2a7DM7pWou20GLbGeXl
	VJ0Y7+PlIq/IjGgN00tNh9ZAqOWar8efJLIike3HSMsVO/68b5XwU01srkNDabmiWsTP
	bmP2LTm7tFdhaY+3mIJ9JZ1i3Rie1YRTqz4+VMQYyBky/hhM0nzjTaqL9oHht6kOyImN
	jpy1FlVoGEsHvIcInh78XTjvDTHESbwgIaXiYosOvRE8YNNYnQ+ZRnyRjDsuj8whUTUA
	T0mvwqaD66QyZ4MhjnLqr+3aOaXjLgqdRMnKVbOGFXn0gy+Okh8zFlukWrt6yfx42UOs
	fKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vQiX60KVSvg5+89ibWmJMNsbGwBNCd3yxtyFcLZdBoI=;
	b=cd1MMDgKeyiRZ+IRwYjZH231mjykUYyJhL2Y5O8zTO3/JfdmfMbtr9TAjamSPg5rsG
	scxAlhAVX1F87nZzuRbkEPgNl8zKIel2tvmS4AVu5ACklrc2ZpIjWxq+ug+BmNPM76FI
	N+xa2Of2FP6NCaSmR9wrgv5i5XN2ty8BB+PLmUQnnUr1C1WD1LtGtcrh/ih4r/lRKErL
	ogkbmmZzrE/3M0Js4Iaa+pbPy+MwUxjXjHp1Gxt53D1YjOgWA61B1xHHDtrqh/YxxT5f
	GPQxFJizFr1BHdXw392/eivuvIDwuGUgKaZ9GaQB0RRlHGHftokOr4Pv5Y5PqlpSHNUj
	Uf+A==
X-Gm-Message-State: AN3rC/6bnSQjHyPvFRfkGnFAtXewYbGxHMxln6qYCqT4qgbzSD6CrBgz
	tUHnqiNSFZpQ6OthCW223mjMdEt3DCKx
X-Received: by 10.200.3.105 with SMTP id w41mr1261920qtg.188.1492589980246;
	Wed, 19 Apr 2017 01:19:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 19 Apr 2017 01:19:19 -0700 (PDT)
In-Reply-To: <CAFrQVPMr9Y8WB1HsvRWMEALD03qraOzVeKaW78FRbaE-444f=w@mail.gmail.com>
References: <1492527724-26361-1-git-send-email-bkylerussell@gmail.com>
	<CAMKF1soMAfgVG78+dywZ5nAnmAfi0-6hnUjC+MohWHm7JsBuUw@mail.gmail.com>
	<CAJTo0LYr9XCsG0yFAYeLmQtnc0n99w0dULWdz01J+kLWSp90uQ@mail.gmail.com>
	<CAFrQVPMr9Y8WB1HsvRWMEALD03qraOzVeKaW78FRbaE-444f=w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Apr 2017 09:19:19 +0100
Message-ID: <CAJTo0LbytKqx1jK_R3GTYtkH3HQggP1V9wdcvpT4QFYJdz_PZw@mail.gmail.com>
To: Kyle Russell <bkylerussell@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: Set CMAKE_CROSSCOMPILING correctly
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
X-List-Received-Date: Wed, 19 Apr 2017 08:19:39 -0000
Content-Type: multipart/alternative; boundary=f4030435cf58917565054d80afa9

--f4030435cf58917565054d80afa9
Content-Type: text/plain; charset=UTF-8

On 19 April 2017 at 04:45, Kyle Russell <bkylerussell@gmail.com> wrote:

> Thank you.  Do I need to submit an amended patch to the mailing list, or
> will your fixup get merged in from your staging branch pending no problems?
>

Don't worry about it, I've fixed it.

Ross

--f4030435cf58917565054d80afa9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 April 2017 at 04:45, Kyle Russell <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:bkylerussell@gmail.com" target=3D"_blank">bkylerussell@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Thank y=
ou.=C2=A0 Do I need to submit an amended patch to the mailing list, or will=
 your fixup get merged in from your staging branch pending no problems?</di=
v></blockquote><div><br></div><div>Don&#39;t worry about it, I&#39;ve fixed=
 it.</div><div><br></div><div>Ross=C2=A0</div></div><br></div></div>

--f4030435cf58917565054d80afa9--
