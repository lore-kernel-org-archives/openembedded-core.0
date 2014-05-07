Return-Path: <pirobk@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4926660167
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 14:58:33 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id b57so853224eek.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 May 2014 07:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=dJHAx5VtvfVjn/i6cpNZ238+Uhub+JsWqgMJkw7SZbw=;
	b=VJeu3z82+Xkja9yX/iATiVVaZ+2d9G1Z54VpWbJThJVr+R+Svuytz/FYPGHXpEwq2t
	9URbp6Ffw1NFqCxMUQBLfLj6eQ1o1gY1vg7uzj4Q3BSOj+epUvm+DQOJYt4YVMYSp69U
	MsaInZoRwPr7mx1UDCacFcv/swpfE6mXMvL2xRFcuMle/7p6Om5wanPMT5jdqQKovuoy
	KqOhA4dMVuiGfPw6I/wzasc+BOdYmfL82jDIY7oPDNUwF8ndWaOkMYHbd/HGBGRXMnuZ
	wUrUA6Hx29PZ3lXtArju5NNbv1SmNT9fTbPjtptEvMYupDiJC/7f8Yq6fTrfZD79ermx
	l1sw==
X-Received: by 10.14.95.8 with SMTP id o8mr46447208eef.15.1399474713723;
	Wed, 07 May 2014 07:58:33 -0700 (PDT)
Received: from [192.168.1.149] (p5DCFD17A.dip0.t-ipconnect.de.
	[93.207.209.122]) by mx.google.com with ESMTPSA id
	cj41sm7054187eeb.34.2014.05.07.07.58.32 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 May 2014 07:58:33 -0700 (PDT)
Message-ID: <536A4A18.5090308@gmail.com>
Date: Wed, 07 May 2014 16:58:32 +0200
From: =?ISO-8859-1?Q?Bj=F6rn_Krombholz?= <pirobk@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <536899F5.1030104@gmail.com>	<20140506205518.GE11339@denix.org>	<CAMKF1spaD8x1e2VYMwq34R2RLbz6xDw9ypDVwzr8sQJBuOpm5A@mail.gmail.com>	<5369533B.9010209@windriver.com>	<CAMKF1srtVO7u8OU5v=V=B4Gmy6LdD21jMKftTBwcS2+Q99V5xA@mail.gmail.com>
	<536957A8.90300@windriver.com> <536A2D11.8000009@gmail.com>
In-Reply-To: <536A2D11.8000009@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain doesn't compile working binaries
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
X-List-Received-Date: Wed, 07 May 2014 14:58:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2014 02:54 PM, Björn Krombholz wrote:
> Additional note, in case it was missed: I am using v2013.06 (yocto 1.4 base, Angstrom variant)
>
>
> I guess the problem is, that the relocation_sdk.py excludes /lib/ and
> 32/64 bit variants.
[...]
> New and broken:
> # ldd m4
>          linux-vdso.so.1 (0x00007fff6c000000)
>          libc.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/./../../lib/libc.so.6 (0x00007fefc1de8000)
>          /lib64/ld-linux-x86-64.so.2 (0x00007fefc2198000)
>
> /lib64/ obviously doesn't get replaced.
>
> I have no clue how to debug this any further. Not even sure if the problem is more likely related to eglibc packages or somewhere hidden in the general OE build scripts. :/
>
> I will build a v2013.12 version now and check if there is any difference.

Quick followup.

yocto-1.5 / Angstrom-v2013.12 _does_ work as expected.


-- 
Björn Krombholz
pironex GmbH -- http://www.pironex.de

