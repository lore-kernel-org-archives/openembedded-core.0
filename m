Return-Path: <eric.nelson@boundarydevices.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8833461222
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 20:09:26 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id mc17so7130795pbc.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 13:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=NDd9kJdFmueTSFqItDicvHMYpEmgC8n6X6lrM+eYt7M=;
	b=fJz0SiHXac6pUD/Bltvzq6Om6w3lRjFpoGWCLQykzegSDQmff5r1Da1QbI5pNoi6Uo
	B0b297MjYgJ1aqsaXrwGXvZ6gbWDnGnen05cSwccsS0VQs+auA6WSkbvLwGwsED6pYkD
	RjKfKv5M4nl4I1DrkjjOytwH70Qf1OchW/lB/AyRImLyk2pOB67f34p2eZidSFuEWYAs
	9KZzMB9l9EsABA9Wb710Gw45KzVrSqwarVZGO8WCu/ygcQ0nG3E3rzZ+wOZsjePb8dF0
	a0RgF/r3rsdk276gdTsL5f2I7l2OfFRYLVeKLl9KEYLcHnfqUTdtsw0b+KXf8M/q0Kvc
	ul9A==
X-Gm-Message-State: ALoCoQm8nqQnZeGXDUlZSeGkqe/iJIF+31eK8NlT5jg5dQPJruBdr4XS/r48wGBjRWJbSdExH7sB
X-Received: by 10.66.25.133 with SMTP id c5mr754762pag.4.1376338167405;
	Mon, 12 Aug 2013 13:09:27 -0700 (PDT)
Received: from [192.168.0.15] ([70.96.116.236])
	by mx.google.com with ESMTPSA id gg9sm239480pbc.25.2013.08.12.13.09.24
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 Aug 2013 13:09:26 -0700 (PDT)
Message-ID: <520940F2.7040508@boundarydevices.com>
Date: Mon, 12 Aug 2013 13:09:22 -0700
From: Eric Nelson <eric.nelson@boundarydevices.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1376257018-17066-1-git-send-email-eric.nelson@boundarydevices.com>
	<1376291285.27470.33.camel@ted>
	<5208EA00.5010505@boundarydevices.com>
	<CAP9ODKqf=FhdAzq1q_Dj1Hppcub9C4aGyYGGt587or-7fOmcdQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqf=FhdAzq1q_Dj1Hppcub9C4aGyYGGt587or-7fOmcdQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, denys@ti.com
Subject: Re: [PATCH] nativesdk-qt4-tools: remove nativesdk-libx11 for qt-embedded
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
X-List-Received-Date: Mon, 12 Aug 2013 20:09:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2013 12:26 PM, Otavio Salvador wrote:
> Hello Eric,
>
> On Mon, Aug 12, 2013 at 10:58 AM, Eric Nelson
> <eric.nelson@boundarydevices.com> wrote:
>>> I'm afraid we can't do this since you just broke any other kind of
>>> override which might get used anywhere by any recipe using this .inc
>>> file. I'd also be wary of adding something as simple as "qt" into
>>> overrides since it can match things more widely than you might want.
>>>
>>
>> I'm a bit of an OE n00b, and I'm not quite sure how to express this
>> conditional.
>>
>> meta-toolchain-qte shouldn't depend on nativesdk-libx11, and I'm
>> not sure how the dependency can be moved to the X11 recipe
>> recipes_qt/meta/meta-toolchain-qt.bb.
>
> I think you're looking for to:
>
> http://privatepaste.com/cc22a68c56
>
> The missing part for merging it is to /force/ it to be disabled in qt
> configure. This was last Richard complain about this patch when I sent
> it.
>
Thanks Otavio,

I saw the ${@base_contains('DISTRO_FEATURES', construct elsewhere
but got lost in the Python (scratching my head over the trailing 'd').


