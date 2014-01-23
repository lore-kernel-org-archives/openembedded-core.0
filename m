Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 67BD36DC8B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:44:24 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id i11so2041418oag.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=WatFaKpM5TVLO+aEAwrhtoL7PHXMqvRbJ3TJfQDx15Q=;
	b=hTcxrjtxm2eiq1lVE0mNO7mmd7tdp1xxP2ZTjyiEYPrsQO8Z+SILL1fpIYI95+6Myq
	osj9vA8WqRcM5fi5jik/rvFGvcSYpPz02tmyZk3+wPki+waoMBVscRHGH8kxWUI3WF/e
	9GQQQSUPt8p5vPgEukVT9juRrdR5TMqivTdLlILUe2gLANSO7CP/8etGW7p8EiBKPMfz
	pItuq4dZN43nl3WuFhrMEdOCG3TuOtHsexGkQkfHHA79JQz6VFr24k5hZ/LCIu6U4jEP
	mZqp0K+iy70NgOK+Lu/1piNFwRRkublJexYS4i4QXIdM+JHm7Jy1+1aa+Mbz8MdF0u4t
	+43w==
MIME-Version: 1.0
X-Received: by 10.182.241.8 with SMTP id we8mr540921obc.62.1390481065435; Thu,
	23 Jan 2014 04:44:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 04:44:25 -0800 (PST)
In-Reply-To: <52E10E51.10701@windriver.com>
References: <1390479566.17424.99.camel@ted>
	<CAP9ODKqTjAESi+B56QFCuKpNJ3fxxmO+_Tx1_gWUxt+VyejycA@mail.gmail.com>
	<52E10E51.10701@windriver.com>
Date: Thu, 23 Jan 2014 10:44:25 -0200
X-Google-Sender-Auth: bWcmx-SBNfYHbsfFYulj-I8GRCs
Message-ID: <CAP9ODKoc=yr4N8ZNADo=HsbMELQ2ZvX9spurd0tEW09=SZh7zA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtool-cross/native: Force usage of bash due to sstate inconsistencies
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
X-List-Received-Date: Thu, 23 Jan 2014 12:44:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 23, 2014 at 10:42 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
> On 01/23/2014 08:37 PM, Otavio Salvador wrote:
>>
>> On Thu, Jan 23, 2014 at 10:19 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> Scenario:
>>> a) libtool script is built on system with bash as /bin/sh
>>> b) machine B installs sstate from build a)
>>> c) machine B has dash as /bin/sh
>>>
>>> In this scenario, the script fails to work properly since its expecting
>>> /bin/sh to have bash like syntax and it no longer does have it.
>>>
>>> This patch forces the configure process to use /bin/bash, not /bin/sh
>>> and hence allows the scripts to work correctly when used from sstate.
>>>
>>> (From OE-Core rev: 2c66aa0fc98b092ebb37baee94e92d1965afd76b)
>>>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>>
>> Does this work for Fedora, using bash in /usr/bin/bash?
>>
>
> Yes, I think so, on Fedora:
>
> $ readlink -f /bin/
> /usr/bin
>
>
> /bin is a symlink which points to /usr/bin.

Thanks for checking.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

