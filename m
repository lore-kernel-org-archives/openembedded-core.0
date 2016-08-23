Return-Path: <akuster808@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id D98FF60762
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 16:51:51 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id c52so4003828qte.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=6WRMyZ705madBibF6vHslJSQbsUGAqAT6IoOPxoFqRI=;
	b=rcl+x96mV4Lpd02k7baO3VY5KRX4DtL5jqQkMMBtpLmd13nLINvzuU5OZS/stDzuaA
	N97tf2pw5JLvLMFTtqPTEzFUGqqXzChAYKyK39dELuzt7e5Jj796PUqDGaGc3bl4s2WR
	kAOkdbDKJUsIDdmqU2IKHVLRvQsPdfS575gnXgjjogtlkm5LQXHH1e6kmlAnL5Tdc805
	YbZVYIeMQQg9fpI1bYINcpu83BCfnvnMqUJcKCsxQ9y5A0SjePEb5Xy/Z5cc0EhQxGXj
	bh6KkvrEjCBaKc6ukMnQSnvknhI2S1o4LXYbRxiCQgJep4F/bw3G7ue3nyFawxUWGxgR
	yc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=6WRMyZ705madBibF6vHslJSQbsUGAqAT6IoOPxoFqRI=;
	b=DEwgvBLJErVOpTxDQvC+A3b+ucYrQ23c0E5cJYyX71ixONF8myaN43PE67iQ2eWUQB
	zADrMaaB/7W4Dk/xmiKMUXjlkDQa2622Nm6CFQa+y1ZxTfVTglOoWoNNpIV3QFOTd7DP
	3T9fQOKM/2GN0w5vVb8W72uZt1/qW5GU5gzGVn6r05JDodY7avCIr1HyFIAI1JycObZs
	tYymotWern4EsJGx3Yd7bCsAdRLcBewRJV3mbi3lwStZQoXqpkv9R4oQ3qWGcA34u+an
	+WingkCHWGwnmfJ1dsg1TD7NRK4FjWQjhykBdFeDs3UEsXt5kIbRo24FsTjtF4+dZE+f
	5TQg==
X-Gm-Message-State: AEkooutdVQ9wiBFTD7Fj1X9vil6zo/oalmX/VLehlHkBKMFuKHBxXoD9jtxZ+BU/Fbg8aA==
X-Received: by 10.237.37.216 with SMTP id y24mr30880522qtc.58.1471971112443;
	Tue, 23 Aug 2016 09:51:52 -0700 (PDT)
Received: from [10.26.31.149] ([151.124.225.52])
	by smtp.gmail.com with ESMTPSA id s52sm2245369qtc.4.2016.08.23.09.51.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Aug 2016 09:51:51 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, Ruslan Babayev <ruslan@babayev.com>
References: <877fb8ih9t.fsf@babayev.com>
	<74C0D260-699E-447C-B450-0499FCB6DA8C@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <c33e034a-f2f5-c224-db2f-5e86dcccf75e@gmail.com>
Date: Tue, 23 Aug 2016 09:51:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <74C0D260-699E-447C-B450-0499FCB6DA8C@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: krogoth: musl-1.1.15 is broken on mips
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
X-List-Received-Date: Tue, 23 Aug 2016 16:51:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 08/22/2016 04:21 PM, Khem Raj wrote:
>> On Aug 22, 2016, at 3:13 PM, Ruslan Babayev <ruslan@babayev.com> wrote:
>>
>> Hi Khem,
>>
>> musl-1.1.15 has a change which broke mips arch. This was reverted later
>> but 1.1.16 is not out yet.
> Yes I am aware if this and it has been fixed in master for sometime now.
> http://git.openembedded.org/openembedded-core/commit/meta/recipes-core/musl/musl_git.bb?id=681b75cb7c1ad88774d611119c9a7f6d076ff2c5
>
> Armin
>
> Can we cherry-pick the above commit to krogoth please ?

Sure thing. Will get it after my vacation.

-armin
>
>
>> You need to use at least
>>
>> https://git.musl-libc.org/cgit/musl/commit/?id=39494a273eaa6b714e0fa0c59ce7a1f5fbc80a1e
>>
>> I just tried it with my custom krogoth based distro on an Octeon3 board
>> and seems to work fine now.
>>
>> Cheers,
>> Ruslan


