Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6507C4DB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Mar 2019 16:40:04 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id a3so9592444pff.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Mar 2019 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=oq/e2PsE1Dp6PxAH/n6GcDy4vYZTW+ZFdJIq5uCSf5k=;
	b=MXCqcCkG/3M5px7f2pLxQxB5pbE99CuHIzLLiKtLc8AM2EYdDxKEoi5aqbKytvvl0E
	f9eUvuVmS0Rc3voTKLzmrHFmJbiKWpqCJvagT4dD63QMrWxu3+JdxppY0qWwrdLti8gl
	rGKpfBQgfXiSgYmx1LPBLWVc02cCrIFQ7H4DMChdYgdMKpWqbRUi4EDj8kaUUUtK8EXZ
	NCp8TMD8D/dSkEUF88EAENfX71bHSI7wc9wiQxbt6zoHP4izfnS04irYcAJpNXGdRj/1
	jhfAE3UMEBmd4mtxaf8Z9dyKV2fDbTNl/OpMhWe7+AeyD3XPWvCZZ7FaoM6UuGg0Rwd6
	pl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=oq/e2PsE1Dp6PxAH/n6GcDy4vYZTW+ZFdJIq5uCSf5k=;
	b=fjIxK3zvp6DpnvMHDylH8tAZaHNAosQzSCyyvqevvxXSg3vrJ82ENk4n3htd+i33o3
	oyt7twVSuUEzUdr54JIad+TlzHQYHgtkc+0AIkTMTDnu+Zoyg3iS0Rqont+JrDACItyf
	pvIano7r7udLNXiqYTdZWUcCr+O+9UbwQDaOtdD5CEm3Zx+PsKRFunzi7MeowLtC8PMA
	Nxpzcs2SDbALwgriw7Iq+Opby8vxF1oAwdohrdbwsQ9R+SmOQZvUM6BNMiIdQQJdcbQs
	iMYMd+jj1zr0s0PmcNL1uN2x8l7Vvv/zSjRQZe0N5Xl19XtxcprZk+sTcW9cw+JCLUK/
	f6nA==
X-Gm-Message-State: APjAAAWCa4S4WDyqg34NJk3p7pJ9qfxJgQjAZvm2E+wJHcjjwb9+dKeN
	ON6wFgsjdCVhj3L7B6e1T8oxwc8I
X-Google-Smtp-Source: APXvYqwCbTIj9lw7zNNqtHGn4XJf2JWcxVoU9PhqGu7N1bElG70ClNtD9BEku5T+M2ZW6lX1vBB2QA==
X-Received: by 2002:a17:902:8a84:: with SMTP id
	p4mr15192390plo.2.1552840805567; 
	Sun, 17 Mar 2019 09:40:05 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:55ff:5980:c3cd:d28e?
	([2601:202:4180:c33:55ff:5980:c3cd:d28e])
	by smtp.gmail.com with ESMTPSA id
	s6sm10487316pgm.90.2019.03.17.09.40.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Mar 2019 09:40:04 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <154947113576.452.14618413373824638023@git.openembedded.org>
	<CALbNGRRLfW_ih43gr8n_rG5YcLQizAs4Mhi0rU_TVjoCCyw1Ag@mail.gmail.com>
	<CALbNGRR0PjTSJWT=FARJrLNn4BPPV+XkS_RL2CiqSiOnj4Tfbg@mail.gmail.com>
	<d897cca3-2471-ecfa-c99a-da0df5649d37@gmail.com>
	<CALbNGRQBHySVaqLXNNTbM5xvo5fOh-UxzogyjC6Rm1_6_WETcw@mail.gmail.com>
	<ed62bdd5-c9ad-1796-2330-960d6072317d@gmail.com>
	<20190317130836.GA3809@localhost>
	<45f8b8f1-95b5-3b76-b955-91be44f5a99e@gmail.com>
	<20190317162555.GB3809@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e141da53-fe24-8420-03ae-a281bd348893@gmail.com>
Date: Sun, 17 Mar 2019 09:40:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190317162555.GB3809@localhost>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] branch thud updated (ad0a553 -> 748f946)
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
X-List-Received-Date: Sun, 17 Mar 2019 16:40:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 3/17/19 9:25 AM, Adrian Bunk wrote:
> On Sun, Mar 17, 2019 at 08:38:20AM -0700, akuster808 wrote:
>>
>> On 3/17/19 6:08 AM, Adrian Bunk wrote:
>>> On Sat, Mar 16, 2019 at 08:50:13AM -0700, akuster808 wrote:
>>>> On 3/16/19 5:20 AM, Andreas M=C3=BCller wrote:
>>>> ...
>>>>> 2. This was applied on Feb 6th which is not 3 month back exactly.
>>>> then its worst than I thought, I can't remember what my thought proc=
ess
>>>> was back to Feb 6th.
>>>>> [1] https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance#Po=
int_release
>>>> I am glad you are bringing these things up, it helps me revisit my o=
wn
>>>> processes and help me improve.
>>>>
>>>> We are planning on revising the maintenance guidelines soon so I hop=
e to
>>>> get your input.
>>> Was the boost upgrade in thud sent to the mailing list for review?
>> That series did not, the previous ones and several Sumo request have.
>>
>> So you are the second person to mention the update, is it causing a
>> problem?
> You were requesting input.
>
> I am not using boost on Yocto, but in Debian it is pretty normal
> that several packages stop building each time boost gets updated.
>
> "Drop signals library as upstream has removed it" in the backported
> commit shows the tip of this iceberg.
>
> What went wrong that even the removal of a library from boost
> did not prevent this change from entering a stable branch?

Like I said before, I don't recall the thought process when that series
was put together.

>
>>> My reading of the "Requesting a fix in a stable branch" section=20
>>> would be that this is already a mandatory part of the process.
>> That is not under the "Maintainers procedure" so it does not apply.
>>
>> I have taken requests via IRC and a simple "please add this to stable
>> branch X" emails so I have not been enforcing the letter of the law.=C2=
=A0
>> ...
>> Like I have mentioned already, the processes mentioned in
>> "Stable_branch_maintenance" are under review.
> One problem is that changes to master are getting better reviewed than =

> changes to stable branches.
>
> Upgrading boost in a stable branch wouldn't have survived a mailing
> list review.
I would hope so.

>
> A possible improvement would be to always use thud-next, and each time =

> commits are added to thud-next an email thread with all new commits get=
s=20
> sent to the mailing list (similar to the review threads for new upstrea=
m=20
> stable kernels, see [1] for an example).
That is what I do for meta-openembedded and then I send a pull request.

- Armin
>
>> regards,
>> Armin
> cu
> Adrian
>
> [1] https://lkml.org/lkml/2019/3/12/1290
>



