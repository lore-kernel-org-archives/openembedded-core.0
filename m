Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 25A1C70016
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 16:06:53 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id j85so21377548wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eTmrMv9qjaGdYO2AGQw6q6y9CLjPZmgGmW55UFYRk48=;
	b=tU38UzA0Q5FKPPgSVkqyQJ0jcOfnbWSYO5UOr/dLu8SnJ/8daEXJv90uH5rQ5Wf7N/
	7gPCgrc/Rl2Y1TwBMUHQFzZ6EEFKzZMPJYEev4h3TWma5E5OK6kCSqTdNz5VNbspwIkf
	fiHLoylJz7bFKSSgV+U2wf9b731OHkWX0mK30q3cEstoD7qSb3DBuLrGUCzlPLDUtxzs
	QLBpXzqk2yqzC+KsvS2qDM9PdNy2A0xYsfySNiMvsb+0A9VOZG5lnQ9zCCxFEmz7bKLu
	gjjDjMtvDfSmHrVsziPyIMic7ePGtpUb+L1aqBmfnG24tUGbVlJ0GmiPuRkuBsIn5UOq
	c5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eTmrMv9qjaGdYO2AGQw6q6y9CLjPZmgGmW55UFYRk48=;
	b=LUJfNAAFxx1INyOw1hp4bL6Nw4BSk0MQPZmRg8ikQR+FUCM3fgVnaYSgljPDxRZJBU
	9AW98m39HPRZBfEs38WQKdKIdjZH1hurmkbrZlaHfLYqf7LDiIgGs+AYBCy+eUrLb2Pe
	6Ts3EvxI6Nk6Oui9ScIgti822itAj2pxAlrmDw+q+J6q9q51BAdR5AyBvB9WC1OFN0y0
	yK9JXl88QQsQNaW+7x2Nt1Ukw+zfFCCbyIrD+JGwLJjBDOkOYOUVscyWFg2F2MHGwAG5
	004ADsClgCoaCuO8TVBwlshksUbUa90xOyALbqhNxyu1YkG6Utu4Ucy8/rT/Mg2arPMJ
	rPyw==
X-Gm-Message-State: AIVw113Jvn/Pp3THiMWRh9+DhKVi6HtivF5fg7/LTMD7JVnOyfgW3vRT
	gi3PIBLBFppEC7HQZ+2t9PHdwITPpA==
X-Received: by 10.80.175.198 with SMTP id h64mr3213774edd.131.1499098014534;
	Mon, 03 Jul 2017 09:06:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Mon, 3 Jul 2017 09:06:24 -0700 (PDT)
In-Reply-To: <CAJTo0LYyubn4hEUwJEQog_pVGYd954TuDPPjQUL+7MQnaD+Bug@mail.gmail.com>
References: <20170630092543.3151-1-ricardo.ribalda@gmail.com>
	<CAJTo0LYyubn4hEUwJEQog_pVGYd954TuDPPjQUL+7MQnaD+Bug@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Jul 2017 09:06:24 -0700
Message-ID: <CAMKF1sp6apMMwZcu80+zcg+Hdk+QdR-wLizFJm23KJx9JGxhuA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] gcc-6.3: Fix libgfortran build
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
X-List-Received-Date: Mon, 03 Jul 2017 16:06:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 3, 2017 at 8:22 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 30 June 2017 at 10:25, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>>
>> --- a/meta/recipes-devtools/gcc/gcc-6.3.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
>
>
> Is this fixed in gcc 7 (in which case the upstream-status is backport), or
> is gcc 7.1 still broken?

this in needed on gcc 7.1 as well.

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

