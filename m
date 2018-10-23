Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 219E775219
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 07:42:08 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id o14-v6so243267pgv.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 00:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=6ffBl+ySjm6mwYVhuEMfmhmlVy6WOV48ceYkh+T+2fM=;
	b=C+dgrgcyXsc7NrEDaA0yhG4rMA7s57x3YwH1YtGaRhtxhrmId9MoG2/VaEp248lR6S
	PdlkcjPTfSMRMo48U4oZXs2lrDed0QrmigaeMj0kGLsDKvifGGDkgDlK/t8nsvTHIInH
	pap8WcueLJRRWFZo1tPMfwc0Z067whi94Pt9yfyHpVvPI7ppwQdxSW1IhG7XxSmn1u8w
	xiQubngy1AgEX5zKICCmZI83PhqYVXopOx86BVo4QR5g5VOoevZl1L4+xg4Nlgi8SsqD
	cusnoqQveLSDWjVIBwbagHixhm8f0tiiNUgupWQomWkEay6IGXuJJrtpC9w+fY7JQmeT
	fKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=6ffBl+ySjm6mwYVhuEMfmhmlVy6WOV48ceYkh+T+2fM=;
	b=b4SB4egt/37v3EgYaOsn2JvugsrjLU5lO7vqCh/XDNIM0MS0fkZkAzo9eT9W3kMZVn
	fGYbgEH4gKK5eosYDAsUMFfT0A8zYcmDyB6UX4jkPCKiN2XQyfHHxOM5zhw39RMAz8cx
	9hSQw5R5uM3S2SIszVm6xylpitqzxeg0mzHkUabyr1XYw1yIEAIXArengABU8h1bwn3X
	DSJECIx+SFTf3Ho4DTCDBkhy1y231F11MA+1CPeGpt1nuHjDOy3loGklWIBZ3LH9WPTa
	0Iy6NJ99A4F64TJZdm6VQ5+hkHbJFhPJtVYyrnTVhnIXzplIu+laxxOT0LLY/hkbSyTN
	5UsQ==
X-Gm-Message-State: AGRZ1gKUA9XoEkvz370Ck8UDPicQt3NnhT98mSEjUqP6IvLzy7Kziy3n
	NKMYy+8HuiACOMcgZ4atWyz1+7imLcI=
X-Google-Smtp-Source: AJdET5d5624+WuSEm6jzeEHi6RvWhw6/mA6Ii2tJoSQZ/GIo6K6UX7gAgojaaTBurc6cH/qsjTZ3Tg==
X-Received: by 2002:a63:dc54:: with SMTP id f20mr1778333pgj.410.1540280529639; 
	Tue, 23 Oct 2018 00:42:09 -0700 (PDT)
Received: from [10.15.240.186] ([109.144.222.79])
	by smtp.gmail.com with ESMTPSA id
	w2-v6sm833525pfk.140.2018.10.23.00.42.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Oct 2018 00:42:09 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
	<1540217112-24479-4-git-send-email-akuster808@gmail.com>
	<CAJ86T=WVfW1E_4OStVRu8TN03hhnQB0Z0d8M6PnqEgkqR-SK3A@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <8c28b5f7-261d-32cb-a558-bf9de7384d89@gmail.com>
Date: Tue, 23 Oct 2018 08:42:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WVfW1E_4OStVRu8TN03hhnQB0Z0d8M6PnqEgkqR-SK3A@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/13] gnutls: update to 2.6.4
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
X-List-Received-Date: Tue, 23 Oct 2018 07:42:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 10/22/18 9:06 PM, Andre McCurdy wrote:
> On Mon, Oct 22, 2018 at 7:05 AM, Armin Kuster <akuster808@gmail.com> wrote:
>> Notable change:
>>
>> libgnutls: Added the final (RFC8446) version numbering of the TLS1.3 protocol.
>> see: https://lists.gnupg.org/pipermail/gnutls-help/2018-September/004457.html
> Subject mentions 2.6.4 instead of 3.6.4


Thanks for catching  that.

BR,

Armin

>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/recipes-support/gnutls/{gnutls_3.6.3.bb => gnutls_3.6.4.bb} | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-support/gnutls/{gnutls_3.6.3.bb => gnutls_3.6.4.bb} (93%)
>>
>> diff --git a/meta/recipes-support/gnutls/gnutls_3.6.3.bb b/meta/recipes-support/gnutls/gnutls_3.6.4.bb
>> similarity index 93%
>> rename from meta/recipes-support/gnutls/gnutls_3.6.3.bb
>> rename to meta/recipes-support/gnutls/gnutls_3.6.4.bb
>> index 441bbec..6d2a11d 100644
>> --- a/meta/recipes-support/gnutls/gnutls_3.6.3.bb
>> +++ b/meta/recipes-support/gnutls/gnutls_3.6.4.bb
>> @@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
>>             file://arm_eabi.patch \
>>  "
>>
>> -SRC_URI[md5sum] = "d3b1b05c2546b80832101a423a80faf8"
>> -SRC_URI[sha256sum] = "ed642b66a4ecf4851ab2d809cd1475c297b6201d8e8bd14b4d1c08b53ffca993"
>> +SRC_URI[md5sum] = "63363d1c00601f4d11a5cadc8b5e0799"
>> +SRC_URI[sha256sum] = "c663a792fbc84349c27c36059181f2ca86c9442e75ee8b0ad72f5f9b35deab3a"
>>
>>  inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

