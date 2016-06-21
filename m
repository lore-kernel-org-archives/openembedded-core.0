Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9402A607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 03:10:41 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id wo6so1480436pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 20:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=hj6z5cnp4M8KW8noYlpdBpWZTgC4ouG38yznva7jfAo=;
	b=raxiyIVMTUa0WN72Rq1SrfyBhWWf8wtnfUAzflHOrCZ4X6xprVZmZd8Ylr+hRMMn1Z
	reYynJtEt1+/GrJ2IpDRiYDQ5UT8BR6+ylixYub8RcWLNwQ/z+7iQNdQXrp5EjGJQtt8
	sA99aMZeqfpTAKJ3UezE3saLa8qBDxDtrCuWKDgIlsCcI7qwNc6BJJWsAjt7AkaBf1M+
	FKTzxPzo8Z6m1iy9YfDQMqKvg7tnY4yZGMYMLsR2t5rnw1cEFY9bcZJm/rHyvJ9PzITr
	yoVQC1lPG76dTlAVQMuJIPcy6quwcHuZLTSa5DDxOehK+8IB2LwJQUWupNjFgEGhrJiv
	MP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=hj6z5cnp4M8KW8noYlpdBpWZTgC4ouG38yznva7jfAo=;
	b=ltf/BNaYKQyT1f3jdNXMAu627TDm0Cho7b++/iYYNX+/2mAgiRMQxBpdDmoHVgapDw
	NlzGXE8By3bf7ydOidGU30BYZcPeVejdrOD5b/W31sso0XIDkqpK89/BGT3IlxzREx89
	E+v8czeQjsxZ/pK3CJkA0UV0MqNiDuZz8UOw1P0cdGqPwi+pqapxuxNh4AgHu9oLSZnc
	F5TGrk6daVNRaPy/kxqU6NsVxY1m5nYT7jKGvX2Y6OcXRgEVVHVD20VuLJHSAJHGqHP1
	vUgUsAwmzcS1Lgtkw3FgB2VyWGLqjy1+JWuMUNCGOX01Nz1JWPIDM7CqTK54jY9KIo3s
	DPXw==
X-Gm-Message-State: ALyK8tKHi3hrqWd8h3RaTfDvBFYLlVJHugo1VVzU8E8SzVV0l2ysK85qMoEy2Xq8S4yQzA==
X-Received: by 10.66.86.103 with SMTP id o7mr3696410paz.5.1466478642004;
	Mon, 20 Jun 2016 20:10:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:499f:ba38:f7c1:a6b1?
	([2601:202:4001:9ea0:499f:ba38:f7c1:a6b1])
	by smtp.googlemail.com with ESMTPSA id
	186sm19502803pfg.39.2016.06.20.20.10.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2016 20:10:40 -0700 (PDT)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>
References: <CAP9ODKorODqhm-Pqe4L_m4RpTvPmW++yNngL_pAUxvFHHa7XTg@mail.gmail.com>
	<CAMKF1sqBWnbCtLNbVDD7cBvMyGbXfC-uyG=ewur33gzJ3VEP5g@mail.gmail.com>
	<CAP9ODKquFwEALn2SAMa-wM6M-9gFQ_KZFMoks_26UYgk-Smr6A@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5768B02E.3070502@gmail.com>
Date: Mon, 20 Jun 2016 20:10:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKquFwEALn2SAMa-wM6M-9gFQ_KZFMoks_26UYgk-Smr6A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-krogoth] Backport for libc != glibc
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
X-List-Received-Date: Tue, 21 Jun 2016 03:10:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 06/20/2016 09:08 AM, Otavio Salvador wrote:
> On Mon, Jun 20, 2016 at 1:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
> ...
>>> Could those be reviewed and queued for the next backport?
>>
>> They look fine for backport to krogoth. Please submit pull requests
> 
> Armin can easily pick them; I gave the OE-Core hashes.

Ok got them. running test builds.

- armin
> 

