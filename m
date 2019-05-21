Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6824C7E26D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 23:11:21 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id e17so116540pgo.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 16:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=IeaVEstc382l7j6ezeOrJIYteok2xCRV+DYfZ55TIE4=;
	b=ixPkIsdMkPFlZowigEUSTcM7w4ugoq6jf1MJhWNcmIXW+dGvGJABii1hsKodqR3Gzi
	0a5IDw8HKi0AzaVuBPKYIR0ofeZVsRAPOnCCBI1hoIorw3k1ApSO5GWwBTDwKf3WS0/n
	cCqAmUsQIOW4rE0Xj9qF0ygT2uJe7G8QR/hxcg651Itb5vO/MrMTPT7m+vcIifoQ6Fbm
	JIneIADldYfcQeE59UFXnFjuRFQEti/H58CJiRNOcTkPilpUBMkch+MvxdMSaYIp6CHg
	i0wazB6swVTA2BkwUoeoIzj6GNpnwBAlXwubwPIPfaHBIXrYnOhWH/14p8VXabRIaw4f
	wfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=IeaVEstc382l7j6ezeOrJIYteok2xCRV+DYfZ55TIE4=;
	b=CUfAX66M1245wt1jDNBiY0xXGHWceZNcUXRYeRxPnsqUpmitnPEnpJzYiF5sJe7nfD
	zJH1efSbKO4x2aXSXDuy9TXoZ5AVhD+EzbbiVR9EWJS6j22BW1v+j6OnLW2rVh/6AqJ3
	rQFiA6X7Q2lwGEruqZF/mw2RnWkwxB3903p7e2qbreoGW3cAzrYmIOVzZNRFO5arh7jB
	pLbr7YGkBANBNO1wUHN978S/olGNwms/ozsvfDeDJXu5/5kZp8GDBVGQZ+a+8JwC8tSp
	/qPRsCMuAZuHeKAYaaEM8wMGBrX2fRh8CjoaYlP1kbnUNUEIg3ZLTH56NzCOjl181ofm
	zTCw==
X-Gm-Message-State: APjAAAXci1WzDxWaNinHsrVmWHsW3wQ0H9WigOGFiBi8QmHFT3CoM2Uk
	we7kj1CqUSTebWqYse0ysmi2/cWE
X-Google-Smtp-Source: APXvYqxuUL5eb3hCMMqFOzH64GybNr4NUSV8KJfDnL25LPuKAaobsMx1dSXImDrOXRfZnR4Dhhc5qw==
X-Received: by 2002:a65:450b:: with SMTP id n11mr44030260pgq.174.1558480282270;
	Tue, 21 May 2019 16:11:22 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:a1cd:b182:87c0:f84e?
	([2601:202:4180:c33:a1cd:b182:87c0:f84e])
	by smtp.gmail.com with ESMTPSA id
	i12sm27298189pfd.33.2019.05.21.16.11.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 16:11:21 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20190417133941.31087-1-schnitzeltony@gmail.com>
	<CALbNGRSJs_KncbefGSSPN_u_KYOrCnEsfSTeLJKLXeFQ7guEPQ@mail.gmail.com>
	<CALbNGRSC=NjtUg=JxzmaZbjEj8BhH1NGPTRTs=iU34ftM8s=JQ@mail.gmail.com>
	<CALbNGRTCng3BDqz-Phy2chgUQJYuwHmcymmL0z+ad+YGy+nd-A@mail.gmail.com>
	<CALbNGRSN609Q1RHAkFODAh-3mTtRENdMv52XWJEv9RnUiLsxmw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <2688dbbf-c2a5-96c8-dc6c-078b02d5364b@gmail.com>
Date: Tue, 21 May 2019 16:11:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRSN609Q1RHAkFODAh-3mTtRENdMv52XWJEv9RnUiLsxmw@mail.gmail.com>
Subject: Re: [PATCH][thud] adwaita-icon-theme: do not delete symbolic svg but pack them in ${PN}-symbolic
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
X-List-Received-Date: Tue, 21 May 2019 23:11:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 5/21/19 2:42 AM, Andreas Müller wrote:
> On Tue, May 14, 2019 at 9:47 AM Andreas Müller <schnitzeltony@gmail.com> wrote:
>> On Tue, May 7, 2019 at 12:51 PM Andreas Müller <schnitzeltony@gmail.com> wrote:
>>> On Tue, Apr 30, 2019 at 8:20 AM Andreas Müller <schnitzeltony@gmail.com> wrote:
>>>> On Wed, Apr 17, 2019 at 3:39 PM Andreas Müller <schnitzeltony@gmail.com> wrote:
>>>>> This fixes:
>>>>> * gtk-icon-browser: for symbolic view almost all icons were missing
>>>>> * xfce's thunar: 'home' and 'up' icons were missing. Had a long discussion with
>>>>>   XFCE-people [1] and asked here [2].
>>>>>
>>>>> How could I overlook the most obvious...
>>>>>
>>>>> [1] https://bugzilla.xfce.org/show_bug.cgi?id=14443
>>>>> [2] http://lists.openembedded.org/pipermail/openembedded-core/2018-November/275815.html
>>>>>
>>>>> (From OE-Core rev: 0911e7d2f5443210b594a198ada8465af7a2fc78)
>>>>>
>>>>> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
>>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>> ping?
>>> Something wrong with this bugfix?
>>>
>> pingediping
> Should write some auto-ping script..

Its been sitting in stable/thud-next.

https://git.openembedded.org/openembedded-core-contrib/commit/?h=stable/thud-next&id=9c63433010aae6891149a7605a637bee879dc4ef


>
> PING


