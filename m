Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1THIiE-0007WF-C8; Thu, 27 Sep 2012 20:21:26 +0200
Received: by pbbro12 with SMTP id ro12so4004856pbb.6
	for <multiple recipients>; Thu, 27 Sep 2012 11:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=fGT4e9o2F4e9NMeKknp+c+nKaxbUah1pz256uWIf6rs=;
	b=kRzDLtfJb9i5gkdJ6rYas/OP3N2xg637HFSylRNGVgH8HY7b9fXeBxh2VXs1ng7u6K
	2rSl4jRfmQNkHLgDfaD16c0ZQnwobGiyGw6gyTPCV4FGKB0yDTCTrgKx1Cqtt0aFNL/e
	B9H0MIpdxA0dmjeOXWi7LRAiPHtBWtZPRgcmRZDjHyGdjQ3ukj5TT4fw3M76X10gU5ju
	FJYNzNP9SY3qdeaBtQ23KCd5DFhauJehmJgLjl9n2j7wU5bw1JAx+FJ+IY28eXFznQQT
	p2xohdiiV9F4mcPjX5QMT6eQplvInx0NR1LoEYD9aklaIsK++fBUuzGV+cXTGpFpAJsK
	GByQ==
MIME-Version: 1.0
Received: by 10.68.229.138 with SMTP id sq10mr13776580pbc.126.1348769313488;
	Thu, 27 Sep 2012 11:08:33 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Thu, 27 Sep 2012 11:08:33 -0700 (PDT)
In-Reply-To: <20120927175531.GF3454@jama.jama.net>
References: <20120927142926.CA9C5103AC@opal>
	<20120927153419.GD3454@jama.jama.net>
	<20120927175531.GF3454@jama.jama.net>
Date: Thu, 27 Sep 2012 15:08:33 -0300
X-Google-Sender-Auth: PjIAFHeRxu7Ix-gjMXsvzdlm2lk
Message-ID: <CAP9ODKr0nC2WbN=gCieWRnf4=-9SiiB6NUiubVrTxnnvbAaGtg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Martin Jansa : xserver-xorg: use EXTENDPKGV instead of PV in RCONFLICTS_${PN}-module-exa
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
X-List-Received-Date: Thu, 27 Sep 2012 18:21:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 27, 2012 at 2:55 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Sep 27, 2012 at 05:34:19PM +0200, Martin Jansa wrote:
>> On Thu, Sep 27, 2012 at 02:29:25PM +0000, git@git.openembedded.org wrote:
>> > Module: openembedded-core.git
>> > Branch: master
>> > Commit: ed0216d29fc4355c5220f3ad51df04a63cacb0c3
>> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=ed0216d29fc4355c5220f3ad51df04a63cacb0c3
>> >
>> > Author: Martin Jansa <martin.jansa@gmail.com>
>> > Date:   Sat Sep 22 19:13:14 2012 +0200
>> >
>> > xserver-xorg: use EXTENDPKGV instead of PV in RCONFLICTS_${PN}-module-exa
>> >
>> > * it doesn't make much sense with PV, because xserver-xorg-module-exa
>> >   was introduced in
>> >   http://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/xorg-xserver?id=1a666ee1cda3c0b74daba5881fc5f62e13deec66
>> >   so our xserver-xorg-module-exa RCONFLICTS with xserver-xorg (<= 1.11.2-r4)
>> >   and (< 1.11.2) is not good enough
>> >
>> > * because we don't know how many PRINC are in BSP/DISTRO layers,
>> >   then it's safer to RCONFLICTS with every older version then current
>> >   EXTENDPKGV
>> >
>> > Also fixes whitespace to work correctly with opkg
>>
>> The whitespace problem wasn't opkg fault AFAIK, but
>> bb.utils.explode_dep_versions as shown in
>> http://patchwork.openembedded.org/patch/37069/
>
> Ah and it was meant to be applied together with this patch, so now it's
> missing PR bump..

It keeps failing for me.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


