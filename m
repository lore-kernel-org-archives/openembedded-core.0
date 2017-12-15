Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id DD6DC6076F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 15:51:12 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id r143so10926102lfe.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 07:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V7ztleKYZvPzdpC51IGBWtZSqOeoik8t98Bbvp4JV9U=;
	b=TusckdkqC6Gilwk93WyS+mO4RfS1KvwP3dwQj0reXDsgBFUByV4Uwet1e9oIHLwZGX
	g4yT7HInCzMpPpKJW3b4tZwBek3hNl/v6tvgGvynJhMHRyd4w+JxNG316xqNK3uLSBoy
	GUQ6c93Q/1fy+urA0uPGitbiHiOlEQeuDS2p8spKdtjHTtfeWvQptTErYrLiG2YP2/5l
	ljIuLSbkSr6WH0Z/3qyhbmLOwvT4Id7KV/qW8zlLH2ug3R2r3uXfEzG+QZAbIrJWnGGl
	aoOPAL0wxAmbg7+bTI+ZuL+swOsieS1VW1SlqZnDjN/nF3vn8tzVxQVhfPY5RhdD3UyU
	1Sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V7ztleKYZvPzdpC51IGBWtZSqOeoik8t98Bbvp4JV9U=;
	b=iGW/C2F/nH52RNiC7ZRoK1L8AgBgXpfwx/8X3F2WFjoOve+2wW6DED+2erwc5nfisV
	tICEiRHaEGR/nmNFFQeHNaDi3ttL6Tw5bJHxtDFVgVnjwWLEYYYlnM217y9hxRs1y2F1
	WTjiQ2LLzHJLI9QsrTWDHBMKS9ex91DM/Ra5Dh2WaEJ2t12ghveMTAHDdMTdvwSs4j8k
	eeWKSPWn0oNzZsOg0JXBw7clnToU/k01gFIIQAhCz1jFqP8Pi0AhYEpWHvTW8EDy58/V
	Jc4PbyCRxmMSraoLEVtzFtCzJLK4sGJYjGjBmCDFm7D6Zv+YtW6acOtdkDte+olWcXKK
	MQwQ==
X-Gm-Message-State: AKGB3mLjEdHRUFfRiNv3ECAiBhl9+iW5Vk4w3pRIu5DmfL+LIyCpNIbI
	HU4e4SHKBQExY7/EGTLnvZ82f+jd7fUNXpCsJcU=
X-Google-Smtp-Source: ACJfBovkLey0gid5B2tZ2qnVQZSIJmP6GG9xxcNqBIEm4zpzuQyK+sSFJdshEXRY5dGnSQmPYiHDAmamyl4GPtTspCg=
X-Received: by 10.46.64.76 with SMTP id n73mr6475190lja.33.1513353073487; Fri,
	15 Dec 2017 07:51:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.143.11 with HTTP; Fri, 15 Dec 2017 07:50:52 -0800 (PST)
In-Reply-To: <784b237e-8cad-d450-5d23-32adc961110a@linux.intel.com>
References: <20171116174541.3081-1-ricardo.ribalda@gmail.com>
	<db49b730-240f-3d14-3fd0-31e109bd2ee2@linux.intel.com>
	<CAPybu_28ZvnJTjd1KiNx375+kfh1c+q=y65paJYDeHpJyd5qew@mail.gmail.com>
	<784b237e-8cad-d450-5d23-32adc961110a@linux.intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 15 Dec 2017 16:50:52 +0100
Message-ID: <CAPybu_1+eRCMvWgCBX4wGMysv9OS7bvZTCF+H1p3cjkUQcmkpg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] meson: Port pkgconfig-native patch to 0.43.0
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
X-List-Received-Date: Fri, 15 Dec 2017 15:51:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 15, 2017 at 4:27 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/16/2017 07:57 PM, Ricardo Ribalda Delgado wrote:
>
>>>> +Some libraries, like QT, have pre-processors that convert their input
>>>> +files into something that the cross-compiler can process. We find the
>>>> +path of those pre-processors via pkg-config-native instead of
>>>> +pkg-config.
>>>> +
>>>> +This path forces the use of pkg-config-native for host_bins arguments.
>>>> +
>>>> +There are some discussions upstream to merge this patch, but I
>>>> presonaly
>>>> believe
>>>> +that is is OE only.
>>>> https://github.com/mesonbuild/meson/issues/1849#issuecomment-303730323
>>>
>>>
>>>
>>> Does the snippet from Martin's patch that I just commented on solve this
>>> issue in a much simpler way?
>>
>>
>> I am afraid not. We need to call pkg-config for getting the -libs
>> -cflags, et all, and pkg-config-native for --host_bins We cannot use
>> the same pkg-config for all unfortunatelly.
>
>
> Unfortunately, the same patch needs to be ported again to 0.44.0, as the
> changes upstream made are non-trivial. Can you do that please?

Sure,

can you wait til monday? I have all my test tools setup in the office

>
> Alex



-- 
Ricardo Ribalda

