Return-Path: <paul.betafive@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0CB6B5B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 12:44:09 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id uy5so4769843obc.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 04:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=m2JeFloHHlVANvHJxrwo+xMgjBGuDOiaFWnlWB7pJGY=;
	b=LNsXKuql4P9s1l1o2ltXq6NUHChvpyXNFO5WMbDUwJK325LhXN8ClrHcKA1tNXdeIB
	H035WAN+PJ3DIvh5kd2hsFWhK57up2Lkexh8LgnN0mYHzB4QYCWUIofK+aql/ojwcOJX
	Wm8a1W9m3UENY8avKIJbqKshrTQ3FMf2NuVSihOVe/Bg8ALe60Fmznn5A9tarUVdcpl2
	HxPCb4yiTQ9F10MeCwV8GX4PeB+t7D8mQAYItLVrj9F6mQ/BGU1AAW3CEpEWX6wpRUE2
	jL22lWPzgpve7m4i06sUn6cH7Sx7+fOKRGcZhKH5D9UBjTVepNxuG7CMvagNLSUa+weI
	x9Pw==
X-Received: by 10.182.2.170 with SMTP id 10mr7392179obv.50.1389357850179; Fri,
	10 Jan 2014 04:44:10 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.76.122.171 with HTTP; Fri, 10 Jan 2014 04:43:29 -0800 (PST)
In-Reply-To: <52CD5E27.7000106@communistcode.co.uk>
References: <52CD5DCE.5050003@communistcode.co.uk>
	<52CD5E27.7000106@communistcode.co.uk>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 10 Jan 2014 12:43:29 +0000
X-Google-Sender-Auth: MO6QmLfU7cUma8ntVP1M2r2ZjIE
Message-ID: <CANyK_8dXX3CkqE-NAX+uVL8qEHSrEzZOYCLU2nyhw1j2sDvdXg@mail.gmail.com>
To: ml@communistcode.co.uk
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: db compile failure
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
X-List-Received-Date: Fri, 10 Jan 2014 12:44:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 8 January 2014 14:18, Jack Mitchell <ml@communistcode.co.uk> wrote:
> On 08/01/14 14:16, Jack Mitchell wrote:
>> On latest master I am running into the following failure:
>>
>> http://ix.io/9Kh
>
> This should be the following link:
>
> http://ix.io/9Ki
>

I'm hitting the same error building poky at master for raspberrypi,
it's just worded slightly differently:

| /usr/lib/libstdc++.so: file not recognized: File format not recognized

I can't see a '-L/usr/lib' argument anywhere but something seems to be
causing the linker to look at my host system's libraries.

Running 'bitbake db -c cleansstate' then 'bitbake db' again hits the same error.

Any ideas?

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

