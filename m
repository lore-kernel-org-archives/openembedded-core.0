Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id C7AFA72F24
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 13:01:17 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id f67so112180358wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DM++laJVF4Q01PZUbrx5H85bejI/NHdOPWe3Ln0i9wA=;
	b=hNtSRoiaj3GfztaCNRDy7zHrTrvL1yhq8B2UxXQsDGxpX3zhXFKwafs5N+OAtgPGLy
	VJUl+RY+onOYRzOaiaOh0nbanyUiQjWK637lD81iLOwYrqWaOe+zT/djvOFbE8qY/fC5
	kKquC9YAEjBiINLQK8qAiqqg3fFFMhZfiDlRvFFfkIk70/ZjXMeZzc2e0OMlv7Lb9BR+
	0mEpBzeyxW7tlpLe5PiG42li6NWwtnaYcRS8N/MwMMDEtPPEHGhep5gsg/b1hhmsQLFg
	kTn2b4ivLAAiwenhbls/T3UYpTLKnMrY01brvQocMLjO8SGES6Tsg9z0PEDo/rDP4jKE
	BFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DM++laJVF4Q01PZUbrx5H85bejI/NHdOPWe3Ln0i9wA=;
	b=fRTQ47XU/vr+scu3eO4STl1EzOsWa51GV8+Zlk2/WPz9bjt99vDXf+xwa/D2u1Avzm
	JODQGWLnpP44/5WgrClUKok6aV6yKM+yHYdFzQPzMt4UyZK00G/Fj5PIJYvqE9OhZg20
	0arNSkTBJyleEgLiux1YgQ6RNboy4RxMfDfTkCPAVYBr4oThp/XQP2/PEgCPxByv8UAg
	v4qMiiKjEZHSEpLWd8+9G6IbYkzF7xGtHJnL7wJ5PtGV91ATV251efGF8nPMih1nge9h
	QZZU8FJsvTysoOfFI7G0ffKdYETK+Usxpj7TNaQelrZT5iMZcg2Raj/+eQK13tFBKSZY
	YcTA==
X-Gm-Message-State: AIVw113RIUFK7t+0M1rCRFyDnXvIzzODi5hrhgqMXzkQOjKjF963gvFp
	NpZjAI3rmNY63VTR
X-Received: by 10.80.140.3 with SMTP id p3mr2706870edp.129.1499259678247;
	Wed, 05 Jul 2017 06:01:18 -0700 (PDT)
Received: from ?IPv6:2003:a:31:4300::46? ([2003:a:31:4300::46])
	by smtp.googlemail.com with ESMTPSA id
	4sm10608658eds.48.2017.07.05.06.01.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jul 2017 06:01:17 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>
References: <CAJTo0LZ85U2djZGW4rzK7uumBkutYb91yXY40irYyAVvCKOBRQ@mail.gmail.com>
	<20170704153229.6628-1-sledz@dresearch-fe.de>
	<CAP9ODKqtEV8B1MqKMhZbG0mY7DTfK7EVi-M39roTqp5dvPeS1g@mail.gmail.com>
	<CAJTo0LbK1brj7Xd_LeOZNf8ZkCHfRHXVujtKeAXGDxvJnT0cfw@mail.gmail.com>
	<CAP9ODKrfKZqLkcb+c4Yk8CHtPMCrLQqgwiNN7ad4O__ZzuNgAg@mail.gmail.com>
	<CAMKF1srQZZss3qf3SvGC1cy1S2OXpoPhdN7g2w-a-akQXZJMfg@mail.gmail.com>
	<CAP9ODKrYceNRtaSu9Sg157OC_a9Lj2oWuPgHPj3Xeo-2ORSXZQ@mail.gmail.com>
	<1499259565.9571.173.camel@linuxfoundation.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <2f4e4bb9-b979-6b44-1e67-2b5bda049450@dresearch-fe.de>
Date: Wed, 5 Jul 2017 15:01:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499259565.9571.173.camel@linuxfoundation.org>
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
X-List-Received-Date: Wed, 05 Jul 2017 13:01:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit

On 05.07.2017 14:59, Richard Purdie wrote:
> On Wed, 2017-07-05 at 09:52 -0300, Otavio Salvador wrote:
>> On Tue, Jul 4, 2017 at 8:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Tue, Jul 4, 2017 at 3:16 PM, Otavio Salvador
>>> <otavio.salvador@ossystems.com.br> wrote:
>>>>
>>>> On Tue, Jul 4, 2017 at 7:11 PM, Burton, Ross <ross.burton@intel.c
>>>> om> wrote:
>>>>>
>>>>>
>>>>> On 4 July 2017 at 23:08, Otavio Salvador <otavio.salvador@ossys
>>>>> tems.com.br>
>>>>> wrote:
>>>>>>
>>>>>>
>>>>>> Ross, please apply it as it has been causing problems for
>>>>>> many users.
>>>>>> It is applied in master
>>>>>> OE-Core:5d3df78367be0afbfe001b4fa776a98a82e6ce54
>>>>> I would, but I'm not Pyro maintainer ...
>>>> Sorry, who is? I must have missed the announcement.
>>> Richard as of now see https://wiki.yoctoproject.org/wiki/Releases
>> Added RP on Cc.
> 
> Its in the pyro-next branch.

Any ideas when it will go to pyro itself?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

