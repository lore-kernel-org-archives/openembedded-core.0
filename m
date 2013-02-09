Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U40Ho-0000av-Ll
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 03:35:29 +0100
Received: by mail-ob0-f174.google.com with SMTP id 16so4533669obc.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 18:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=xBY9Uqzoul5SvdvH9R65OKxeDs4O6NonwRmPf0IZdaY=;
	b=h3k5ipoKOKj9gsTqR/ftJsG6C/AqbJVUrWWNoAex1ukv4BRuRhND3FLXUN7gLeEizD
	LzkYSYEFSG+InnvN8yacOpuejdEYLLA6sqvnryS7pBHV2vhbD9s49dDUQObGGZNdtyNg
	tPpKcqDCxSmqcMt/aaigjWAphDI7kBDI6HJlDD2wyadwfNGEm8yM55v5WNUCZZgaQY1L
	sUHTnsq0m8BpSqOtcPtiPR1PEs4Ux1oO64459bUZCynzN246A0WEgSnHWF5daqQufm/o
	9X+VYdsSGizVLC3wWplr4MJwksxHB75F9LOkg9hgj3Jaokcr4sUh6wsVdhYVZtdp/VT5
	cfbA==
MIME-Version: 1.0
X-Received: by 10.182.88.103 with SMTP id bf7mr5885298obb.7.1360376373625;
	Fri, 08 Feb 2013 18:19:33 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Fri, 8 Feb 2013 18:19:33 -0800 (PST)
In-Reply-To: <CAAQYJAsS7KVVOQxAzRO8qh90Adngx6OUvpffQmpoQ68yiZGDXg@mail.gmail.com>
References: <1360335140-8690-1-git-send-email-otavio@ossystems.com.br>
	<CAAQYJAsS7KVVOQxAzRO8qh90Adngx6OUvpffQmpoQ68yiZGDXg@mail.gmail.com>
Date: Sat, 9 Feb 2013 00:19:33 -0200
X-Google-Sender-Auth: uC6xmOTYR8_HIYMnjYWecXK2d14
Message-ID: <CAP9ODKoQK9--Xou+Ft+jXs9_PVAJfgjmjuF74jH-FzfEmVu9QQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] tzdata: We shouldn't override the localtime if it is valid
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Feb 2013 02:35:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 8, 2013 at 8:55 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Fri, Feb 8, 2013 at 3:52 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> The code where mistakenly replacing the localtime file setting so we
>> end with a copy of file instead of a symbolic link. This fixes it so
>> now, we'll only do that in case the link is pointing to invalid data.
>>
>
> Hi,
>
> there was the same discussion when I first proposed the Gentoo script:
> it wasn't a mistake. it's the old issue /usr not mounted at boot.
>
> See thread: http://lists.linuxtogo.org/pipermail/openembedded-core/2012-January/016237.html

As far as I know we stopped to worry about /usr not mounted at boot.
In either case the symbolic link is how it is managed in most
distributions and expected by many softwares available so I think we
ought to follow the standard here.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


