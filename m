Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 26B34607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 15:17:36 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id a5so13601460vkc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 08:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=lrC0ZlHk+QhiQ2VxClePCAF4pTmEWE2ftUdIYNKjBgM=;
	b=BZcxV1LQXmZvp+sQH/JXmiiDTy2JhKbjeygK/hPCgFmdidZ3QFbDu2IXVPGqBOp7IL
	dvMjyKgaL2jwbsMJc/GsspNTaHf+IONuxJsJZiNl/KU6ftwru0cm5fvSuASCEMqqsj2h
	4Iv4AIWKs7wbCNjVNbiyIEARinGEpUMDcIRadPkCM0KAK3Zd7yQF9bmcQWxMOIbK03y5
	YvlzU9atCgZCWl6hVkS7R9OoiDQ3E4hf0MxrR16XbW2XjPj6tQ5hM9Qf3VKYnDmwkK6M
	2MRkaXMcLX9DmyKVsDXp0Qf7v3aMNYDe5So2FIMXl6WbFfua7dmzF6T0k8lcbfTuwzss
	QK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=lrC0ZlHk+QhiQ2VxClePCAF4pTmEWE2ftUdIYNKjBgM=;
	b=Sjqryhr2+JRuZqL13GwaS+aDCOPsOnyzPVVjFi0Mtk1IchyzjglKd7KggSh8VfWbwf
	XXDKtG2ONJWM9XqMzHXGBMMvoQqYweqiolLRbpA0es68zLDNMhXh9+zIQwf+4dCI+aCk
	gsn10yx5l1oKpL4Q/qipvyGC5Q6GPJh69OFFO8clgox3QFWpkPyU5fsgU87UboplWAkh
	nfoK530vGNdpCi5N5HTBkgOBpWx42Pu0O1DUusfvAldd3kgVF2LkMe9/bUb1lpp0LfEg
	17stlAIS7wwSeRO/e1BhlFm/yRUMlT/b6uC/TL4vLezmy3ggMhfwl0t3/3ToA7pzBGhy
	N8hw==
X-Gm-Message-State: ALyK8tLjnZ7TMBTCLGLgXBFUzDZTF1JbhkU9qc56tbxmxKOa1UWmrPVrPnfM1GxSm9Mneg==
X-Received: by 10.176.67.199 with SMTP id l65mr9350919ual.61.1468250256769;
	Mon, 11 Jul 2016 08:17:36 -0700 (PDT)
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com.
	[209.85.213.49])
	by smtp.gmail.com with ESMTPSA id 92sm2165366uay.26.2016.07.11.08.17.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jul 2016 08:17:35 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f49.google.com with SMTP id x130so16041978vkc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 08:17:35 -0700 (PDT)
X-Received: by 10.176.3.116 with SMTP id 107mr9380767uat.131.1468250254674;
	Mon, 11 Jul 2016 08:17:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Mon, 11 Jul 2016 08:17:33 -0700 (PDT)
In-Reply-To: <1468249814.17048.1.camel@intel.com>
References: <cover.1467378176.git.patrick.ohly@intel.com>
	<25bb70f088ffb603e1f389b7657c1fbf3f2871bb.1467378176.git.patrick.ohly@intel.com>
	<CAP9ODKo=BAgtk8iUbSgcOVh4+uVW-SBuEri6f8MkRH2qXfpVSw@mail.gmail.com>
	<CAP9ODKrNecB=hRAkFb-LL4TcTc9XXw=AmKu-efdjPs3PKDkY1A@mail.gmail.com>
	<1468249814.17048.1.camel@intel.com>
Date: Mon, 11 Jul 2016 12:17:33 -0300
X-Gmail-Original-Message-ID: <CAP9ODKps8qLV8cvyR4DHq8yZ+iFk5A1f3ON7EFNrdr=hq__HJA@mail.gmail.com>
Message-ID: <CAP9ODKps8qLV8cvyR4DHq8yZ+iFk5A1f3ON7EFNrdr=hq__HJA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>, "Burton,
	Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] meta-ostro-fixes: initramfs-framework: add retry loop for slow boot devices (like USB)
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
X-List-Received-Date: Mon, 11 Jul 2016 15:17:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 11, 2016 at 12:10 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Mon, 2016-07-11 at 11:35 -0300, Otavio Salvador wrote:
>> Hello Ross,
>>
>> On Fri, Jul 1, 2016 at 2:50 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> > Agreed but please split the rootfs in another module; so we don't
>> > force it to be included. The e2fs can rdepend on it.
>>
>> I noticed this has been merged but my comment here was totally ignored. Why?
>
> I can't speak for Ross, but perhaps he felt that it was already a
> worthwhile improvement. I wanted to address your comment (and still do),
> but didn't find the time last week. I'll do it via another patch now,
> okay?

Ok but Ross action is wrong in my opinion, in worse case he should
have asked before. If comments are ignored there is no point in people
spend time doing so.

I wanted the change to be atomic and not two changes which may
required more rework for same logic change. :-(

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

