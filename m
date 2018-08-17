Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1368179374
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 22:39:31 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id q11-v6so16586605oic.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 15:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ahu2ZQawb3Js94EL0rNN3WrLIqZGQtO/GU6/CkYLMr4=;
	b=hsdiscWOrKXKZg0pP/s5WizRHSwt1tQQDnLFwtretacQBQX38VcVJjWL86R5SMEw10
	EEa2/R9QsBya1yidTDpes5IQMFVaKm+P+HNPytGG6d+yc6apWmX6j5M0uB1md0Jaq9lK
	41F61DTy/Q9ylqRgA3zZfxboPWPzQk9eYTd7dPzxiwVGgYyro81E5jcvMY0Tiw4bpjNZ
	ydBlDcb7f7njzeh6UD1OR5dTi9i/5E/HXl0uprzk2VGut9vdx7Uqa29Y8F7n2ZrKbTf3
	NIxLbkUpcNJGAD3qBNKQUO4ESXfboUPhgvmjYm9vRAkOwOsb5+1NecmTQAZFSd2SouLM
	ansA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=ahu2ZQawb3Js94EL0rNN3WrLIqZGQtO/GU6/CkYLMr4=;
	b=dB8qHi7RRjdZ9lbVOtmXh8S4QPPDew9F3PmGFpZbycWezh3b7YtYO74YbbTXvklkBL
	GiAcm2HAdv/az8i4+h31MzqLvcGfxEeTZbKEROs6qHtWks4aEWijfpO+sD7tovgGLF3z
	Fiy38qP3EI7HOJxrj1POHCvWGbIKkBndIem5RVSP5+cXjXeN58HMfAepbYWuo3IxdcyT
	w8St7imFoYycs5pPQNHsjZREef/VSEhcwNTrjF5lRanZ6MxYhtobP3UoFT/7HLwB78a5
	0NLcH3BqWEgtPvy5g09wBR9HCikA+NI9a8rgT6fu2dP3vhvAdXfc3jvyJ6iBj4mP5gxD
	vQtA==
X-Gm-Message-State: AOUpUlHKAyKav0Y91pnqf4HrIvbZanoScYCsbmS5QMWsf7B0T2MFExNR
	EXNkbQAx6KJ1GheuSV2ExrRXmrwN
X-Google-Smtp-Source: AA+uWPy3DnJp+LNNwxig5JMKhhJKjhjdxoUko2jnBWSi9v3mOl9epr5UNP83ZLTMJYxVkvVnNzVH0Q==
X-Received: by 2002:aca:6141:: with SMTP id
	v62-v6mr4579540oib.240.1534545572847; 
	Fri, 17 Aug 2018 15:39:32 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:5080:df55:2eb5:9a92?
	([2601:202:4180:c33:5080:df55:2eb5:9a92])
	by smtp.gmail.com with ESMTPSA id
	s3-v6sm6164592oif.22.2018.08.17.15.39.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 15:39:31 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>, Armin Kuster <akuster808@gmail.com>
References: <20180817141411.31825-1-akuster808@gmail.com>
	<CAJ86T=WfkmRWbrj6EgQXyRNhYxTxhzEfNvCkLySa3q1=hNmK_Q@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c658c3fa-b055-ba33-af4e-e5f599fe53e4@gmail.com>
Date: Fri, 17 Aug 2018 15:39:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WfkmRWbrj6EgQXyRNhYxTxhzEfNvCkLySa3q1=hNmK_Q@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] gnutls: Update to 3.6.3
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
X-List-Received-Date: Fri, 17 Aug 2018 22:39:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/17/2018 02:31 PM, Andre McCurdy wrote:
> On Fri, Aug 17, 2018 at 7:14 AM, Armin Kuster <akuster808@gmail.com> wrote:
>> [v2]
>> Fix new config options form with to disable.
>>
>> [v1]
>> release notes: https://lists.gnupg.org/pipermail/gnutls-devel/2018-July/008584.html
>>
>> add ssl3 and tls1.3 config options now supported.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/recipes-support/gnutls/gnutls.inc                       | 2 ++
>>  .../gnutls/{gnutls_3.6.2.bb => gnutls_3.6.3.bb}              | 5 +++--
>>  2 files changed, 5 insertions(+), 2 deletions(-)
>>  rename meta/recipes-support/gnutls/{gnutls_3.6.2.bb => gnutls_3.6.3.bb} (53%)
>>
>> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
>> index 04c0fd2af8..f204e5f4c0 100644
>> --- a/meta/recipes-support/gnutls/gnutls.inc
>> +++ b/meta/recipes-support/gnutls/gnutls.inc
>> @@ -30,6 +30,8 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
>>  PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
>>  PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
>>  PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
>> +PACKAGECONFIG[ssl3] = "--enable-ssl3-support,--disable-ssl3-support,"
>> +PACKAGECONFIG[tls13] = "--enable-tls13-support,--disable-tls13-support,"
> I'm not sure whether either of these should have PACKAGECONFIG options.
>
> SSL v3 is obsolete and if gnutls is disabling it by default now then
> it's probably best to leave it that way (dead and buried). Experienced
> users can always enable via EXTRA_OECONF if they really need it.
>
> TLS 1.3 is the opposite - it's brand new. If we add a PACKAGECONFIG
> option to control it then it becomes the gnutls recipe maintainer's
> job to figure out when to enable it by default. I think it's better to
> leave that decision to upstream gnutls.
No change in behavior in the way its setup now.

You can send a patch to correct them. I am not doing a v3 for this.


- armin
>
>>  EXTRA_OECONF = " \
>>      --enable-doc \
>> diff --git a/meta/recipes-support/gnutls/gnutls_3.6.2.bb b/meta/recipes-support/gnutls/gnutls_3.6.3.bb
>> similarity index 53%
>> rename from meta/recipes-support/gnutls/gnutls_3.6.2.bb
>> rename to meta/recipes-support/gnutls/gnutls_3.6.3.bb
>> index e540528a8e..c560305032 100644
>> --- a/meta/recipes-support/gnutls/gnutls_3.6.2.bb
>> +++ b/meta/recipes-support/gnutls/gnutls_3.6.3.bb
>> @@ -3,7 +3,8 @@ require gnutls.inc
>>  SRC_URI += "file://0001-configure.ac-fix-sed-command.patch \
>>              file://arm_eabi.patch \
>>             "
>> -SRC_URI[md5sum] = "8b4912c6c0e5ffefd3dbb4888eaf8a58"
>> -SRC_URI[sha256sum] = "bcd5db7b234e02267f36b5d13cf5214baac232b7056a506252b7574ea7738d1f"
>> +
>> +SRC_URI[md5sum] = "d3b1b05c2546b80832101a423a80faf8"
>> +SRC_URI[sha256sum] = "ed642b66a4ecf4851ab2d809cd1475c297b6201d8e8bd14b4d1c08b53ffca993"
>>
>>  BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


