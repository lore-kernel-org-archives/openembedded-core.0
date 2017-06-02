Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id AE7D177E79
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 15:13:22 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id v111so1998318wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jun 2017 08:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=hijXO0ELXuyBjRG0kQz4Q010K9wcC9VUmRqWVg0Pikg=;
	b=ErjMSafKaXf80ynvGYlR2mutcGUjlVG4FNntqUVSg9M5wNX+X2f+plGide7gLdF/M4
	Z1HLaw2iwjBZq5a8UTcZx9qWgIiylu/xGA8H2/wTz6u+Yzh8Amb3jWLynUCx3usDs8bi
	GKpkQwSsb5Q5DJbQl4riSldKCQjqeocy/M7MnLIB0GKZPgqVSeljggFX9OEVfKz0aX9w
	DJSWcn9Vfr/Ipc/Xr+OqMn3/YjMAb4eksuz2kiMwcHCPNaGtxdaZ1yFjFUbG5Im3l34j
	Sa4mV8IiDpgy1Oo00nw3blcRmSO4edsxNpEeZAy5C0s3Cs1pyw3g53UPrteNycBVlL76
	z67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=hijXO0ELXuyBjRG0kQz4Q010K9wcC9VUmRqWVg0Pikg=;
	b=dxSOWAVcvd+QOfhmhfxs3ah4BmkNBCMHBipcL5gssIT+a6E81gIUUr/QuUoRZCwRS0
	w+3zOEjjM8qaejccCaRqLyoADZ2N0wdlnm/VMENSwOwOjRO0zBkCOqj3AMicq0woWYmp
	U9A0P1qAzQEs4ZS5vhRoMHZfoe1TssOKiEGEvombVhTlh9SsOtDHt1zL+KhvoXpD2uFQ
	3khIL/E3Ip/kdiodBPHzuyRRG830xoTjCFoBlfwF8v2JATzY+GAYE/oWhgRqtW0cWKpR
	1cQVFD186l47ID/OP3Q4KIyJ4J1D3YBi5iAJXSzP90Kcg2eMgILGjIiPghmk/TAXj29E
	Jm1Q==
X-Gm-Message-State: AODbwcBXlKreZpwJq2a+cKYlL8X2nJllqCHSIR5MZO7KXUabvyLWYrN2
	pXU6WqIIEAJiyTjqf30=
X-Received: by 10.223.170.137 with SMTP id h9mr6106649wrc.36.1496416403271;
	Fri, 02 Jun 2017 08:13:23 -0700 (PDT)
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com.
	[74.125.82.50]) by smtp.gmail.com with ESMTPSA id
	p65sm3405765wmf.24.2017.06.02.08.13.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jun 2017 08:13:22 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f50.google.com with SMTP id b84so28155160wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jun 2017 08:13:22 -0700 (PDT)
X-Received: by 10.28.103.214 with SMTP id b205mr3491007wmc.122.1496416401967; 
	Fri, 02 Jun 2017 08:13:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.236.75 with HTTP; Fri, 2 Jun 2017 08:13:21 -0700 (PDT)
In-Reply-To: <CAMKF1soDUE=MB1_Y_eh_VF-mnvaZPXYV5HW2qbMadc5U53DjUQ@mail.gmail.com>
References: <20170601003100.32359-1-otavio@ossystems.com.br>
	<CAMKF1soDUE=MB1_Y_eh_VF-mnvaZPXYV5HW2qbMadc5U53DjUQ@mail.gmail.com>
Date: Fri, 2 Jun 2017 12:13:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo5xrcTbqQotadcpBPzAOVG26YvXb2OstkAq0XE51mZVw@mail.gmail.com>
Message-ID: <CAP9ODKo5xrcTbqQotadcpBPzAOVG26YvXb2OstkAq0XE51mZVw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Upgrade to 3.8.1
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
X-List-Received-Date: Fri, 02 Jun 2017 15:13:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 31, 2017 at 9:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, May 31, 2017 at 5:31 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> There was a set of changes, those are:
>>
>>  - CMake now requires librhash for build and as there is no other
>>    users in OE-Core we make it use its internal copy instead;
>>
>>  - Copyright.txt checksum has change due new contrubutors and 2017
>>    year additions;
>>
>>  - Patch avoid-gcc-warnings-with-Wstrict-prototypes.patch was removed
>>    as it is not need anymore;
>>
>>  - Patch 0001-KWIML-tests-Remove-format-security-from-flags.patch was
>>    removed as it is included in this release.
>>
>
> Can we get to 3.8.2 instead while you are at it ?

Sure.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

