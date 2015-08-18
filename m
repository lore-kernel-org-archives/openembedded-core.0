Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9D073D17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 20:45:36 +0000 (UTC)
Received: by iods203 with SMTP id s203so204200445iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 13:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=+FjvsuIvWiyynkqAN1qIz1hfv+Qe5z3BYeQ7UaRim1Q=;
	b=JStw7GMoqRrIQ/mNmuC3EfoZABp+LlWOVFM9yaMKpRFHm+HC4vPxj2JCB8sP3wJ0Ip
	ohGZK78FVeO4KF8FmXp+LmNpZxGnvAah5+zUp1AbIigZdmfJaVyo65JQ2gzjXlMOWQer
	6UudRg8lfd1kgvwThcGQtd4hVaFkPxxLSZE63w5X9QwMkBzwjY4aajJI2HMKKFInsjYA
	RgP7wczO7YRiVh5GGD9WbQF/qhtfgkn4b+5ZTIWkII4EJORN6CCQ10kEc884Up430jNG
	7LWJY2syh5hdWwQZL7wR5a/BMSNsmHDpGJeE4rXj4alB+bCTK/yvEBCKMykS5L0Jr6kD
	Jq2A==
X-Gm-Message-State: ALoCoQmyFvJruMAYioOGu16d+MA08oRG8fx/1qPI6xpjEKqJydvDc4Zqb9q7C0GV4z6lyDexDH/c
X-Received: by 10.107.10.162 with SMTP id 34mr9170821iok.139.1439930736599;
	Tue, 18 Aug 2015 13:45:36 -0700 (PDT)
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com.
	[209.85.213.170]) by smtp.gmail.com with ESMTPSA id
	k64sm16157384iod.3.2015.08.18.13.45.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 13:45:35 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igfj19 with SMTP id j19so89995645igf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 13:45:35 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.66.166 with SMTP id g6mr23084498igt.19.1439930735155;
	Tue, 18 Aug 2015 13:45:35 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 18 Aug 2015 13:45:35 -0700 (PDT)
In-Reply-To: <746523C2-BA3E-44F1-AAC6-4E14E1736693@gmail.com>
References: <365E1805BC95084CBE82381A0B869994E73E4FE9@EU-MBX-03.mgc.mentorg.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CFA7F5@IRSMSX105.ger.corp.intel.com>
	<CAP71WjyESzCxJrJsxgSk0ZxnM8q0tQYU+CFmm-QVQGVouYWB+A@mail.gmail.com>
	<CABcZANkgxRSRA9afEaOD0cpeNzzSAti_Ef9D4V4ThoJkQzwmgg@mail.gmail.com>
	<CABcZANmjXndEm+OF8aKvSgHwkiOMuFgHrrJy97CYLpDNtZxCmg@mail.gmail.com>
	<CABcZAN==rSZ2M4f_2-eZ5yvAaHV+k=rC8pgRju425151ijWMZw@mail.gmail.com>
	<746523C2-BA3E-44F1-AAC6-4E14E1736693@gmail.com>
Date: Tue, 18 Aug 2015 17:45:35 -0300
Message-ID: <CAP9ODKoOiuFDYA6KKpp7HBq5z8NoDY-Lq_-Kea_KnGsRFRVYJQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: iw in place of wireless-tools
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
X-List-Received-Date: Tue, 18 Aug 2015 20:45:39 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 18, 2015 at 1:03 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Aug 18, 2015, at 9:00 AM, Christopher Larson <clarson@kergoth.com> wrote:
>
> On Tue, Aug 18, 2015 at 8:53 AM, Christopher Larson <clarson@kergoth.com>
> wrote:
>>
>> Bringing this back up again, as I think we really need to at the *very*
>> least pull in iw from meta-oe into oe-core, and adjust packagegroup-base
>> (worst case, with a VIRTUAL-RUNTIME), and better yet also drop
>> wireless-tools / move it to meta-networking.
>
>
> Worst case, we could keep both in VIRTUAL-RUNTIME for compatibility, as a
> temporary measure, but I think we need to get iw into oe-core and into the
> base images for sure.
>
>
> yes I think its a good idea
>

Agreed as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

