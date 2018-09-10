Return-Path: <leon.anavi@konsulko.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4F1795FD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 08:30:22 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id g33-v6so20951537wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 01:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=uILClppsiA8j9POJTyug+N8S//D29tlzZ0nfkvKWmcs=;
	b=FTkK3oNJeTBUDp1UHVPW4bui7XPctOmvBNUepef7Nk8yYxHvvKUp9qycYOIsyFnqRw
	5gNOPBs70xahtSV6oonERHS1M+m9xZh2vcJHwKL/9rX56StpBWsix8PqlQNaujYvBTSw
	H72TxpkPzp502wY1nmxGAfSV8PuHwh4gw5/4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=uILClppsiA8j9POJTyug+N8S//D29tlzZ0nfkvKWmcs=;
	b=S72XikrP5BdQWkbaGSRjpXb/vGAeZ0l2+5FV1WIy+/3rnitUcr1cSoa7GyZQwf0rEd
	ue/Vtfx67I0pQQyOAKOpYe7DYBy3Qt20PRSw/51b+imE5l2y4ehH5DqeTFsK1T3gwIIc
	a89V4qrEJkOWBDqoFNXWjFWpm+T1FhnGPuJdxwCnO/BC3LQLcnA+saPfiSNBjpzYzC50
	L1DHQsOR//GUo3sdAYvZppPRcqxsjAg/tCukbj+M8ANNheFYgb/+FDp9c2aW6xl7jP5O
	1YQ3Jt0NTS1NiWnMiFlI4EUmU9ohxGwpSEM4MAmwg35E+OGPyytYiOr6RlU8oLmRcN7g
	hETg==
X-Gm-Message-State: APzg51D02qczU7w5RlDiXohHvBZosfymva1yR2ejovOkoU3ZXF0gqPb2
	AC3jtx2MdLzOIYfxRf3qXVgY2EtmCMA=
X-Google-Smtp-Source: ANB0VdbFS2BATuYFQqXQUgTCGxeskh+69bcABK/pZpMCsc/7zlxqKeiO+P0hji2USYW+cw3gBuYdug==
X-Received: by 2002:a5d:674d:: with SMTP id
	l13-v6mr13509814wrw.197.1536568223069; 
	Mon, 10 Sep 2018 01:30:23 -0700 (PDT)
Received: from [192.168.4.209] ([78.130.197.177])
	by smtp.gmail.com with ESMTPSA id
	v16-v6sm15300245wrw.12.2018.09.10.01.30.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 01:30:22 -0700 (PDT)
To: Mohamed Dawod <mhm.dawod@gmail.com>,
	openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
References: <CAGCTLNSbsH7Hto3CwpC+p0YFWQqnYRHYm2TwcbH6w5TzbtBP5A@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Openpgp: preference=signencrypt
Autocrypt: addr=leon.anavi@konsulko.com; prefer-encrypt=mutual; keydata=
	xsFNBFnU8b4BEADKkOruSAClof+En5MwATpFk1fdeWsCYUcDMpuffX/xhU7JJKdW59hAYyW6
	7NvECRTXCQ5GaaDYPNAmZlCW/PgZcn5NFl6cOStNvAali+ljVRhVq0DoTF0CLz2pu5+RWodW
	mbDdraADLTiBaCDfbWabk2z/2wb/L83is91ILcbmziy9lTxrivRGfTjkhcN0DmQjd8SvdO8K
	+KIN8K8rWb2aI5cbVGYoR817aLQ5eAfzkWjEqJxfswynO48gPUzsMZlv2vP7ThR/abBXNnDl
	GYXRNUIinVsq7DddVHi4d2bd6zRJFIdQxyW9q8m3GzhVf44LWyiwrpJdyLYcKFPZmRj4sYSZ
	hIQNx8QvPMOjvAKe6xOLU2mEISd+g4oRi8OBhIB9mmt2agDa6wC0FpKSt8igOTya6HuDweFA
	AZvsnPYnkD5x8yUIYjAjA9S0jS5AORCgHIMS0ugZfn79q4zQa2aRhh0fVFiCzx9MLEgxDkiK
	HP46cU4A6vEXZWMHYBErZvj+wXYbyZxdBhcCF1ugEOtbENs9IBe6HF4LKOSKuLRLOlqjYOgs
	Vl2vHKam0ygEDOoFmxa+TQdF2gR1rB4tDPgKpHBO4QlbKWcXVIivGQ9MYilyrxgOMtFnS6aA
	nAILTXSQL/2t1qKfylPO8ZKz1713ysXgA6uKxm8HxZVPU+i/XwARAQABzSRMZW9uIEFuYXZp
	IDxsZW9uLmFuYXZpQGtvbnN1bGtvLmNvbT7CwX0EEwEIACcFAlnU8b4CGyMFCQlmAYAFCwkI
	BwIGFQgJCgsCBBYCAwECHgECF4AACgkQJHbkEznh9PXxVg//StQNTxfTjZ/q+rW4xSrp7H45
	DCIGkjF5q5ltByyiNT70Y4czbhCW4GBHCC+eGWzwXw7u6B2q0J0Co0CMZ/hMc9PT1avwbP6C
	BeHDMegfY4Y2MKw+au3Ym6mQepGqIyeQxsBODLaUpcholfNtT5x3JozvbyyVMvPhGPjMjyaZ
	A05E3xwFhNBjiZFe5TMmNf2UlJRvOc8RAt3oeSLbVq3iPRHPB33MYoi1x2RI+peb23lJUGPw
	UUCFziwcMu9YcowxAiQ2Nba9zjsi7jzU4e4x4v3caAq3W/e2WYGFvD5zOHJ3HptLCIXZxqVi
	G/UCWj1r+ZXgH5oksQ47xKKPS3U/6bpFVT9LtNQt0G1veaea4kLbBot8JKjIX3OjiGUp5ciY
	SQQB/9nTYYgaIMuYrPJNkszwVS58f7CXtowh4oVdFRkRG9plFtpen7NvlEdXFPrqeoVNeCSQ
	bHyyStHya0a5Iesx0VugIayowkZCu5i9j61ojMvOo99xpyuNx4yTPDyqu3WCAFyx9gr648YX
	yS/9gM+xvhYeqw+8YO5fhdncU0mjXbD2cM0C1hdgrFpwqJBxg2RRgIOoKwzHLiGZ62l17A5I
	GWsIeT3/jAp7bDUbWadLESFuRE/BzC6+x04aZHXHzY744dnPtRLupD/gQI+cUmX1jJbY8TrD
	l1n5HIYeQePOwU0EWdTxvgEQAMAd4uIslpAHEkxBk3o29gfFB6afEO3nQCciPjyo+eNjqDzV
	Fx5SX2fvPWnHC/H52OHbdJrbtlfATqs+1XvdMvw1Az6AmR84HvcO9Sv+Mhg09Ed5at2FHAle
	yACsMcnJfiQM1M+JInOAnd0M94BS0APGVKwPErxdBiV1C6cksVOEfdAGT62mkxLqPKJwXtqm
	4R7KTZqGRKKhaQKS8/PRylMPLg4ghy0uqW8CzNi7FYdWJMxpOzjvMqbRQ4gxushGAZ7/N3xM
	ZQuJcGOJTggHsf6kcf4r+5nk5DS3YkVmgEia0TucZscYQ8NBHlvP47dR7/DAlXhEwxat6igC
	6ZdmnQlolwIePxTtEPX0RHNTdRtDxNI4hRxaETqO7ihH7+qAqbJPc6clj8qX/Z/+hSA9Vbd3
	ssEVA8CCL0o0FElr2mQGgaZ4TdhuK7yW5cLEXfxlqyaPrXhBG7SLsF2jdoJvnmzrqmMjKwKe
	WkwEN2DTD21QHHu8d7qrZEJZhN2SYU1fgv9SnAXbzWAOTxQUwhQNl7oUdsBvys22LqexDsvz
	f0TibgPtPbvdUty8clRWUKllVa/VmOtwNwDmXeUbnds/19BsJjEhcnq2xEHn6bkaDyTv9AU9
	rpu7kKj5siGUpfzH0GamBMR52JnPPMM54rDBqp5llXeFF6spmKlhypwFUnyNABEBAAHCwWUE
	GAEIAA8FAlnU8b4CGwwFCQlmAYAACgkQJHbkEznh9PURVg/8DUv/u6j+GnUfWgmBHEoQ6DDp
	axqjUrK2kkCS6XhGVs/1fJyUXQwQpRD4TLAsKLB6fxS2ANds8tojXvW2fnJu+uIpw3Pxa9q4
	pyaAZPBXx9O7KhLk2bXKy5EzfG9aIb+1EhLtWy40/36OHhCY3CvOblEtQIfziwN0E/Nj34bF
	H89tThq4UnLVkKeoiSoAHiWWPqqXcR6e3lkm6n5bVLISgrrw2zKLXUVbYWdfkmABrTakypbg
	VhBied88cLeeTG+sDdFgAXC8Ot4Lt9OhTDSSjnPircEcyczT1sFiYBoWC+XfUabMBQ1wPgLE
	K+sPTsTFLzIVuJi0L4rTmkEPfsucdclI58/F31J+2VhctSg7hSBgWvi1u+pZorkmTeVEvqJ/
	9EqSQXlN7sasxVR+TQ/7IscsK/rnJkWwhC46F5ug+t2bFYjyfIoNnwNmdaO9HZHAUOuaZU2F
	vAlPsy4hV/piuhR1IDpAJ0W4QHGdXhpHCMtGE+K//KGdr/huxfj2hNTK9gYfUdgR1xdvqziC
	s1Ajm9SKwsrCkU2JE8YZTSaXVPjZWxqh7Kv1OMlfHyduxzWPxEkOCMK+2KlsaGMV4KlP1quB
	FEK7FSK7M45yhpEKSXyr61Xi/BnAaK9Cak9jZd3163yFORiJyPO2p9fXB3sgUTs3RrEpfq0G
	Z14qQ+tQr2c=
Message-ID: <bdc7edec-3e0b-0d97-05d7-8e7847326b96@konsulko.com>
Date: Mon, 10 Sep 2018 11:30:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAGCTLNSbsH7Hto3CwpC+p0YFWQqnYRHYm2TwcbH6w5TzbtBP5A@mail.gmail.com>
Subject: Re: [oe] [openembedded][wayland][weston]: How to configure screen resolution
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
X-List-Received-Date: Mon, 10 Sep 2018 08:30:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi Mohamed,


On 9.09.2018 14:10, Mohamed Dawod wrote:
> Hello,
>
> I want to know how to change the screen resolution using weston.ini fil=
e ?

You can set the resolution size width and height in pixels with property
mode in the output section of weston.ini. For example:

[output]
mode=3D1680x1050

Please have a look at weston documentation for details.


> How to generate this file and use it for my image?

You can update or provide your version of weston.ini through a bbappend
file.

Best regards,
Leon

>
> Thanks,
>

--=20
Leon Anavi
Software Engineer
konsulko.com



