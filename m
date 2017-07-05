Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2467571DD2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 12:52:43 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id j85so32267847wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 05:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=oczf7LDZSTSMNhlUnfip25bPIX1dFNg2gMM277g6gds=;
	b=RTVO0AXqLVmrLwP07DtjRDmTDfGvOMDsHOa4nzu3w+GhbGji3eBC8CEvL/nUpc86bv
	Fb22woY6BQkbhLQGz3LpDfC/da+3FjS+C6WKxbnJXNQHd30RN5fbFkIKj6GhLIPHJ7ii
	o01Lr9uYExDZPyn8Ci3rauGw+Q01fB/0rYv+PnoSF2wiv2gePMnsHesf82hKMxfapCNE
	S90thBGuyiYe3OCs0frA99MD8g+EHS5kiriDaVDT+TrliOnx31C+FDwmH0H7XaiK3J9K
	uIZAtB6yxTRulbjJKwEnMbaXoRBJhgw47m1QkGWUEi2WztfGVrVpL7OpmStdaL7zhDFo
	xcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=oczf7LDZSTSMNhlUnfip25bPIX1dFNg2gMM277g6gds=;
	b=gV1MgdC2VxxpQFYDWbWFbBHgTj2crID3HKirjUfannaveWmZ5yEHifZDT0oLXV0ZOo
	bnNZg9PUCxPiqS9fguYWlvR58XDJQDnYxeIBUEqtXCKE94QrfDBunrZYyumBG4jltj5j
	tY4WDFsjEyq8rRPuYJxMitovu946oVe+AF5BkWhDiQ2WuC7hIZ08nU7/pyaFZTDqfCAK
	XIKpCB2A73bcPpI/GvJEhnpKjaL68iI1oGhdbMWi00pgl3ZUIb77JyoiI5EaqGfu9B51
	r888am6NFEEmyYatqiNbamRMJv5sQV51uqiLJSJ6KSJCSS/vqOq8Fd2gUtDZrEn5CIcK
	Ulyg==
X-Gm-Message-State: AKS2vOzHorxTSDRAVgCOpr0uzPAjESBmscAwS+P4Fd1MTMyHXkG5eYcg
	cNy18y8JAONXUit2sCU=
X-Received: by 10.28.129.149 with SMTP id c143mr30865242wmd.47.1499259164751; 
	Wed, 05 Jul 2017 05:52:44 -0700 (PDT)
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com.
	[74.125.82.52])
	by smtp.gmail.com with ESMTPSA id q17sm9664009wmd.4.2017.07.05.05.52.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jul 2017 05:52:44 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f52.google.com with SMTP id f67so111927201wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 05:52:43 -0700 (PDT)
X-Received: by 10.28.19.205 with SMTP id 196mr23430926wmt.122.1499259163293;
	Wed, 05 Jul 2017 05:52:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.209.14 with HTTP; Wed, 5 Jul 2017 05:52:42 -0700 (PDT)
In-Reply-To: <CAMKF1srQZZss3qf3SvGC1cy1S2OXpoPhdN7g2w-a-akQXZJMfg@mail.gmail.com>
References: <CAJTo0LZ85U2djZGW4rzK7uumBkutYb91yXY40irYyAVvCKOBRQ@mail.gmail.com>
	<20170704153229.6628-1-sledz@dresearch-fe.de>
	<CAP9ODKqtEV8B1MqKMhZbG0mY7DTfK7EVi-M39roTqp5dvPeS1g@mail.gmail.com>
	<CAJTo0LbK1brj7Xd_LeOZNf8ZkCHfRHXVujtKeAXGDxvJnT0cfw@mail.gmail.com>
	<CAP9ODKrfKZqLkcb+c4Yk8CHtPMCrLQqgwiNN7ad4O__ZzuNgAg@mail.gmail.com>
	<CAMKF1srQZZss3qf3SvGC1cy1S2OXpoPhdN7g2w-a-akQXZJMfg@mail.gmail.com>
Date: Wed, 5 Jul 2017 09:52:42 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrYceNRtaSu9Sg157OC_a9Lj2oWuPgHPj3Xeo-2ORSXZQ@mail.gmail.com>
Message-ID: <CAP9ODKrYceNRtaSu9Sg157OC_a9Lj2oWuPgHPj3Xeo-2ORSXZQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] u-boot-mkimage: fix nativesdk build
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
X-List-Received-Date: Wed, 05 Jul 2017 12:52:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 4, 2017 at 8:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jul 4, 2017 at 3:16 PM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Tue, Jul 4, 2017 at 7:11 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>
>>> On 4 July 2017 at 23:08, Otavio Salvador <otavio.salvador@ossystems.com.br>
>>> wrote:
>>>>
>>>> Ross, please apply it as it has been causing problems for many users.
>>>> It is applied in master
>>>> OE-Core:5d3df78367be0afbfe001b4fa776a98a82e6ce54
>>>
>>> I would, but I'm not Pyro maintainer ...
>>
>> Sorry, who is? I must have missed the announcement.
>
> Richard as of now see https://wiki.yoctoproject.org/wiki/Releases

Added RP on Cc.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

