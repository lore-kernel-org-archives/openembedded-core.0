Return-Path: <sledz@dresearch-fe.de>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD416B8D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 12:03:28 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so5484738wes.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 05:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ywInTJkg7EorLkl2UZaeQhTYtJiZ/pyBoByFgGXKOLU=;
	b=GXHu0hPsxtybDO6GvspI5m34gMZBDjH+NOAiHdSTURVXEFbpGJddmirIupTzq8xa83
	lzroP7Nj/eAakbDQs9HVapnbdmKiYYj91BX6a5N/lv9Rykr6Z0v4ODXQ0yeYNxM+UHs2
	L52GD1PIX5LaFkdeni0/6IByUqfUFfVkUtMfKStaQBqFV5IVxUJe/Me1kwzVH8zmFKDk
	mt7h6VjOdsTW0LRQnFVS1kS1+nDwKUz0IU+0MrADUvcWwCrgvcStfJUf6EViVNomSuVG
	ajNObPdzakw2he1B45yf3RpGYo8XLDXBfXnTp4jkLka3aVRuyUx9EbMphOL97omPrWsj
	lPTQ==
X-Gm-Message-State: ALoCoQmmFNt5X/ichUNXtd4lCxmzlLGFWe4PLGJ9CE0wkK/Us/iy4Dhp8Skv0UjHpABabz9vF5q9
X-Received: by 10.180.212.77 with SMTP id ni13mr26603154wic.5.1402920209352;
	Mon, 16 Jun 2014 05:03:29 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id m1sm33569857eep.24.2014.06.16.05.03.28
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Jun 2014 05:03:28 -0700 (PDT)
Message-ID: <539EDD0F.8020505@dresearch-fe.de>
Date: Mon, 16 Jun 2014 14:03:27 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1402775049-3165-1-git-send-email-sledz@dresearch-fe.de>
	<539E8F97.3070508@dresearch-fe.de>
	<6076930.voh3DpIb8j@peggleto-mobl5.ger.corp.intel.com>
	<539EBCA8.3000709@dresearch-fe.de> <20140616105942.GO2428@jama>
In-Reply-To: <20140616105942.GO2428@jama>
X-Enigmail-Version: 1.6
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][daisy][PATCH] live555: fix fetch problem
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
X-List-Received-Date: Mon, 16 Jun 2014 12:03:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 16.06.2014 12:59, Martin Jansa wrote:
> On Mon, Jun 16, 2014 at 11:45:12AM +0200, Steffen Sledz wrote:
>> On 16.06.2014 10:48, Paul Eggleton wrote:
>>> On Monday 16 June 2014 08:32:55 Steffen Sledz wrote:
>>>> What is the right ML address for patches in this area?
>>>> 
>>>> The meta-multimedia/README in git://git.openembedded.org/meta-openembedded (daisy branch) says:
>>>> 
>>>> "Send pull requests to openembedded-devel@lists.openembedded.org"
>>>> 
>>>> But i believe this should be openembedded-core@lists.openembedded.org.
>>> 
>>> No, for all layers in the meta-openembedded repository it should be openembedded-devel as listed.
>> 
>> OK, thx for this info.
>> 
>> So i hope the patch will make it into the daisy branch in the next time, because our build is broken meanwhile (OK, we have a workaround, but this is unendearing).
> 
> We still don't have meta-oe daisy maintainer :/ (and update to READMEs in daisy branch)..

How should i interpret this answer?

There is nobody who can push my patch (about the live555 fetch problem, nothing about READMEs) to the daisy branch?

- -- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlOe3Q8ACgkQlSfCk8EgCzhdlQCgjMhmzGAk6sacNllCwiP/+Gd2
jxIAoONeZ+a1EwuBT8Dfg0cbmfXM0Lte
=TnT1
-----END PGP SIGNATURE-----

