Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 419CE7878B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 10:27:32 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id b189so8495094wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 02:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=BAHk1LBY4TshD/oIe/uKC/uAkdAJ0cZpEkxUbAekpfc=;
	b=E4wP7+EMbYuHzhSBujqRUeayrhH32akTWeadfIz9h0bLhLj6J6mcSntiQxyJMfx6To
	iiGzg1SyQjeUv5KnfLl/IDadZtyKNPPSOAEf1sNvcku+461+aZELZOOKIGiRQ4sPLL6l
	JBkYG/o+A7oFlgmSn6H/ekPNZUDXqPJ/CVuNikQxhU0byXET6JegPhXPglfeEHqWkfz3
	JfUW02bMXoh5VnihKbItAp5575nar0EElXdQTt5xDilY8pSpmtRezSaWpSzvNNeodLPK
	X4OxhZPWBTMLCg20iocTn4aWADGFAM9Pjqj6SyQA6wy7SmXEgYX1cZAfaNTvkfNWYk1R
	4bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=BAHk1LBY4TshD/oIe/uKC/uAkdAJ0cZpEkxUbAekpfc=;
	b=VMwoudSNMIlTOfu1LZH77RB/8N+4nooz/Kc2gxz9S1YaWPKWh8L5KTGahzM6IdjeUA
	6V9gu+C7Q5GcdXz5RWYqMowRzw8YrXKQOt134iLEWra8e58XJDrH/lF81/3ge+0x8LdR
	O68JN+9ojld6sXqtXGxaYV/Pbabo1Ar3X4c4MrbsxhR7PLcBXGSc9XoFp9s0CFfkGNFR
	psCHou1jfBS5bqnG+zzp1DN7EIIV2aWTroissp4cwns9TgiotUjSBdfo2Pps+iv7H1S2
	TiVDzEdQSrud5T1EbV2tY7gqliJ4Fn+v3G+slu8woXf0Zta6BAyr6EdzXhM7W7OyWY2Y
	ZssQ==
X-Gm-Message-State: AJaThX7zDvFDoG5qVFJkVyPM+vb75Z+V7PmcIq1dNJFlSgOrMmrxZ2Xx
	fRdFArAazcEDkL+Av98hAyTOnAiTr6eeYCDBaP4=
X-Google-Smtp-Source: AGs4zMaTesNz/D5DELemDUMX6Gn+bH12usTi4naTdN8U7wu+M45hhGvA6ca9gyVtu/ETFpLjYZheV8pXU5Rjf+7lhcI=
X-Received: by 10.28.127.197 with SMTP id a188mr1128129wmd.138.1510828053934; 
	Thu, 16 Nov 2017 02:27:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.99 with HTTP; Thu, 16 Nov 2017 02:27:33 -0800 (PST)
In-Reply-To: <726d845f-268e-0f27-bcd7-c6b2fd9f4c53@windriver.com>
References: <cover.1495183828.git.kai.kang@windriver.com>
	<d0db7f059097d0271e5808dda280140ef49aae6f.1495183828.git.kai.kang@windriver.com>
	<CAJTo0LbxO83ka-W2znsakpTwOejgoJzmxFuehogFk5oDhZct2Q@mail.gmail.com>
	<c46b6cd7-cf25-8fd6-789f-c9cfbcbf9026@windriver.com>
	<726d845f-268e-0f27-bcd7-c6b2fd9f4c53@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Nov 2017 02:27:33 -0800
Message-ID: <CAJ86T=UMd9D-_WZ3um3Yg6+yKRFJyToLhNjZw90U0LUujTGfgg@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bind: build with threads and update configure options
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
X-List-Received-Date: Thu, 16 Nov 2017 10:27:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2017 at 8:24 PM, Kang Kai <Kai.Kang@windriver.com> wrote:
> On 2017=E5=B9=B405=E6=9C=8823=E6=97=A5 17:58, Kang Kai wrote:
> On 2017=E5=B9=B405=E6=9C=8819=E6=97=A5 19:47, Burton, Ross wrote:
> On 19 May 2017 at 09:52, <kai.kang@windriver.com> wrote:
>>
>> Build without threads for bind is inherited from legacy openembedded.
>> All libc's support proper threading on Linux now, so enable threads
>> support for bind.
>>
>> It is also need to disable static library build which cause package dhcp
>> fail to build after enable bind threads support.

It seems this change was made without taking into account the advice given =
in:

  http://git.openembedded.org/openembedded-core/commit/?id=3Df28757a4b89447=
ea528cba987f0396b92aa0bbfe

"If and when we ship bind's shared libraries we should ensure that the
libraries go into a separate package."

In rocko builds I see "named" running on port 53 and dnsmasq fails to start=
...

>> Options devpoll and epoll are configured to choose most preferable
>> multiplex method for unix socket. The priorities are: epoll > poll >
>> select. When set '--enable-epoll', it just defines a var and include
>> header file that is available for cross compile. So use epoll for bind.
>>
>> Add PACKAGECONFIG 'urandom' that could use /dev/urandom as random device=
.
>>
>> Update file/directory ownerships to fix daemon start failure.
>

