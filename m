Return-Path: <pirobk@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 987F0605F4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 17:13:06 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e53so938340eek.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 May 2014 10:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=expbILX67kjnaYOLgc2yJq8a5r8Rm3vXWFYc8q+ELRQ=;
	b=uOAB7RmyOzM6y5lBvelrA7/HT2CR/i+X1rXJMR2LxoGaauZCioV8LXPoEPJ9slf6qz
	WFzsIA07/YeJj5oluqKOy+iXHNZrCDdBb/6zU3cPGJRTMhHa0klXzenQ2NfVrssInFAt
	1yFhev0khpibTUJP7nXkHnEBCGW7OsqQmxvi2UVpozXdP+9zgJXWgMAXPo5bRZopVMkV
	pRkthqhsjE2aK9eGPlaBDpETAYgdNQR6OPt9QHIFIfrbatkEZgEOue7lPtDtvbtGfXXH
	2jA1U6tkO9g+XFFrd1AZHX3q7XkCoaIndHTbgeeCsS2S6F9qYlCg+YS2dEvQg1yBQ0nu
	wOWg==
X-Received: by 10.14.108.198 with SMTP id q46mr17316923eeg.31.1399482787360;
	Wed, 07 May 2014 10:13:07 -0700 (PDT)
Received: from [192.168.1.149] (p5DCFD17A.dip0.t-ipconnect.de.
	[93.207.209.122])
	by mx.google.com with ESMTPSA id r1sm13117952eew.30.2014.05.07.10.13.06
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 May 2014 10:13:06 -0700 (PDT)
Message-ID: <536A69A2.9080209@gmail.com>
Date: Wed, 07 May 2014 19:13:06 +0200
From: =?ISO-8859-1?Q?Bj=F6rn_Krombholz?= <pirobk@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <536899F5.1030104@gmail.com>	<20140506205518.GE11339@denix.org>	<CAMKF1spaD8x1e2VYMwq34R2RLbz6xDw9ypDVwzr8sQJBuOpm5A@mail.gmail.com>	<5369533B.9010209@windriver.com>	<CAMKF1srtVO7u8OU5v=V=B4Gmy6LdD21jMKftTBwcS2+Q99V5xA@mail.gmail.com>
	<536957A8.90300@windriver.com> <536A2D11.8000009@gmail.com>
	<536A4A18.5090308@gmail.com>
In-Reply-To: <536A4A18.5090308@gmail.com>
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
X-List-Received-Date: Wed, 07 May 2014 17:13:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 05/07/2014 04:58 PM, Björn Krombholz wrote:
> On 05/07/2014 02:54 PM, Björn Krombholz wrote:
>> Additional note, in case it was missed: I am using v2013.06 (yocto 1.4 
>> base, Angstrom variant)
>>
>>
>> I guess the problem is, that the relocation_sdk.py excludes /lib/ and
>> 32/64 bit variants.
> [...]
>> New and broken:
>> # ldd m4
>>          linux-vdso.so.1 (0x00007fff6c000000)
>>          libc.so.6 => 
>> /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/./../../lib/libc.so.6 
>> (0x00007fefc1de8000)
>>          /lib64/ld-linux-x86-64.so.2 (0x00007fefc2198000)
>>
>> /lib64/ obviously doesn't get replaced.
>>
>> I have no clue how to debug this any further. Not even sure if the 
>> problem is more likely related to eglibc packages or somewhere hidden 
>> in the general OE build scripts. :/
>>
>> I will build a v2013.12 version now and check if there is any difference.
> 
> Quick followup.
> 
> yocto-1.5 / Angstrom-v2013.12 _does_ work as expected.
> 

...meaning, binaries do run without segfaulting, though as Mark 
suggested, there shouldn't be any reference to the hosts /lib64/...

The ldd output for an installed nativesdk-m4 from yocto-1.5 looks like:

# ldd m4
        linux-vdso.so.1 (0x00007fff92700000)
        libc.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/./../../lib/libc.so.6 (0x00007f8aa86e8000)
        /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x00007f8aa8a98000)

# ls -l /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld*
-rwxr-xr-x 1 root root 149304 May  7 16:00 /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-2.18-2013.10.so
lrwxrwxrwx 1 root root     18 May  7 16:01 /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2 -> ld-2.18-2013.10.so


:-/


-- 
Björn Krombholz
pironex GmbH -- http://www.pironex.de

