Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 661CF60777
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 13:13:37 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id 192so2543903vkl.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 06:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=cUNGf2DfIETIIxVOyPKmabu45ZmTCB3vd4l3UN+6DEI=;
	b=wdPK7atENgqAxUN6K67bLqCqbD5LBYHG1Sw9aEB2tA36lDmu8/++pNfNIffIUtN9zV
	cpQfLuBs+gWxSi+sQ/COj5tzD32Zq+T1iiAQDSS7nr8nHLghTERVMi9H2vOT5ZDyI+es
	1v+XaVJyJ4qigpBYmHNkYSa/HLedA9XfBIG4HE4yAyZZ6GhbMhQx65FC6+plazfd/WJs
	IxJ0QmAQnWcheJePs6ok3w1Gya4DyBi5GHHLOEVO2upEntxWLfbMqA7Yl9zRYQn9korc
	VN8IVNLEGfXa2/jCWJ2VZ4lnNbD1I6zEFOJfnnAX568McfPh6sX+xno9ME9MAcuH5aQH
	u0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=cUNGf2DfIETIIxVOyPKmabu45ZmTCB3vd4l3UN+6DEI=;
	b=U/V+xptqsvSwAJmtMHKfuiprzQsfGz/f9iQvQsXTH60D2WvT5ZyVzLjq+Aerl64Orj
	y4tH6lVQcJrIFEhO2RPTSn55BISR9oUF3RsgnV4b3iyF/etwJp4c2gIcqdlJcoyeF9e+
	gupTjdwIj9+/kbAuZKf8ytP1Li/qN4p53DR+C17FJKLZcbUgpw0nxOw1nKipf/dgSYlw
	5hqBv3q8u43W0x1RoR01fouOKxEaPmueKIhNBDRC7iR84uzTGYu7jWQKAn/Ntf90wH+W
	2mb9kKstEUDwqeN5dzVptNWLlqtCxik1q+QCtU2vTTIJc7+s6WfiNB7pD9WWvagO0J8o
	mbKQ==
X-Gm-Message-State: AA6/9RnRLZ+EW3AAhXFqhNYv/rR9JYsWSJd/mK6bqdJzXj7GkzuSWWwOVLlZJ4Cjyaj3Tw==
X-Received: by 10.31.172.83 with SMTP id v80mr8054247vke.79.1474895618448;
	Mon, 26 Sep 2016 06:13:38 -0700 (PDT)
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com.
	[209.85.213.53]) by smtp.gmail.com with ESMTPSA id
	n185sm2719614vkd.11.2016.09.26.06.13.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 06:13:38 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f53.google.com with SMTP id 192so55272444vkl.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 06:13:37 -0700 (PDT)
X-Received: by 10.31.93.198 with SMTP id r189mr6399104vkb.39.1474895616578;
	Mon, 26 Sep 2016 06:13:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.148 with HTTP; Mon, 26 Sep 2016 06:13:35 -0700 (PDT)
In-Reply-To: <2ac658b5-b45f-337a-972c-e949ee78b85e@linux.intel.com>
References: <20160923164301.560-1-otavio@ossystems.com.br>
	<2ac658b5-b45f-337a-972c-e949ee78b85e@linux.intel.com>
Date: Mon, 26 Sep 2016 10:13:35 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr+XMz4xcVnnOky219zrpitHDsJwPhV2PVMH9xKQ19Yvg@mail.gmail.com>
Message-ID: <CAP9ODKr+XMz4xcVnnOky219zrpitHDsJwPhV2PVMH9xKQ19Yvg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] qemu.bbclass: Allow use different QEMU binary depending of target
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
X-List-Received-Date: Mon, 26 Sep 2016 13:13:38 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 26, 2016 at 10:06 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 09/23/2016 07:42 PM, Otavio Salvador wrote:
>>
>> There are architectures which support running in 32 and 64 bit
>> flavours however the simulation is provided in a specific QEMU
>> setting, requiring us to use a different binary. This patch allow this
>> to be done using, for example:
>>
>> QEMU_TARGET_BINARY_ppce5500 = "qemu-ppc64abi32"
>
>
> Should there also be a patch that makes use of this feature?

QEMU for e5500 is not working for us; until it is working it is no
sense to submit the patch however I am using it for test.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

