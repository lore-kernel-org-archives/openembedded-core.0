Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 701DF605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 15:21:32 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l11so2021266pgq.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=200X9MHZDICsPAu+10+bkKWUJjhulSFVWQpYOf/oSdg=;
	b=R8+N0ioOQEuC67+5eqxNDukleMagpWa+ijfO5o3HSCSQ316ViHw1Qr0HfiUJAXAxiZ
	8uTylE+M3+c4Xf5VnJLpxDs6Q8iDwYNFLpANp8BIbtm6sGMPAQ+vmYnV5O2R/UDvUG7t
	zKJCi3i/4gQ91fxLuKcFjCvP85/+1Qi5mYmLDF8j+2n26eaHSYNSvudQPjZNkMIf9mzg
	WgANgaPMNQNGvbQqTVPMFfQovXLG2Jloa6t1zPdTvDHLy5a1alONa7LE//DoTLkjLITg
	3lmtUyHxGkkDWvHd0vwdfaAWw+XQH2mBsJM6oFhN9HOHae9MchaoqVbU0IbTN4Nwqu7C
	rE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=200X9MHZDICsPAu+10+bkKWUJjhulSFVWQpYOf/oSdg=;
	b=mPj3CdhAuAYGoMKgQP6G+3DcxZW5lCSNnou43EgCc44KC61/r58soGoIIOz01kY/Ke
	yj6mUNr7Z8oW203/984BYT07sqy/Fj3IInwC0q60chIGj08uLaPxouljlaEVddfTSCNM
	fa0OS0qAkiSbaAwGJ55jtRXs8GggaMXx65ItVD0xv2HJeybeZhWbV25t5nIkYZyrMHUW
	ChIsHQHz7XhaVKiHRkzzKpxaI+3x2ZKh1EkBxvOx9MgtfoioENzj2+CRgIWmNC1qrp9s
	xFTi3hJHQhPVwybAk+9S8HKaUHvhr6Q17Vc9IUdrnGkA3coOex2tL5TYZqx+PrFLo22T
	LlLw==
X-Gm-Message-State: APjAAAUg4HG6wNMTo4ap97uwkDQ/QUHsf+ZmtZVhRDXNsbmQYi67FEuK
	usL4k+88OvbWuJSUyEdg0Wa1gIvz
X-Google-Smtp-Source: APXvYqxge2dhQSLVj6pNTprGC4HHcDDdWlBQGyggA/Mh5HbWWXyL27ceS8QW2lBDyMmwe4daO5eP+w==
X-Received: by 2002:a17:902:2d01:: with SMTP id
	o1mr9098354plb.155.1553095293213; 
	Wed, 20 Mar 2019 08:21:33 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:9d5b:fb53:b464:877c?
	([2601:202:4180:c33:9d5b:fb53:b464:877c])
	by smtp.gmail.com with ESMTPSA id
	i126sm3142442pfb.15.2019.03.20.08.21.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Mar 2019 08:21:32 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190320140929.24410-1-bunk@stusta.de>
	<6682ab95-b029-e881-43ee-59d3f7cfc174@gmail.com>
	<20190320145650.GA31018@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <6251ba28-7d83-e490-c564-7e20cdb8b04f@gmail.com>
Date: Wed, 20 Mar 2019 08:21:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190320145650.GA31018@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: Upgrade 9.11.5 -> 9.11.6
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
X-List-Received-Date: Wed, 20 Mar 2019 15:21:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 3/20/19 7:56 AM, Adrian Bunk wrote:
> On Wed, Mar 20, 2019 at 07:35:53AM -0700, akuster808 wrote:
>>
>> On 3/20/19 7:09 AM, Adrian Bunk wrote:
>>> Copyright hash changed to to year change.
>> =C2=A0You are missing one of the more important bits of info that woul=
d help
>> make the decision if this gets into M4 or waits until after 2.7 releas=
es.
>>
>> Go look at the 9.11.5-p4 release notes.
> What part of the release notes are you referring to?
>
> And why are you talking about release notes for a version
> that is neither of the two versions in this upgrade?

Ah, because the 9.11.5 has patch level updates from -p1 to -p5 that are
not the current 9.11.5 and those changes=C2=A0 are included in 9.11.6.

Also, nowhere was it mentioned this is a bugfix only update. This helps
me in deciding if this is a back port candidate.

Keywords to look for: Bugfix only, CVE's, ABI changes, dependency
changes, depreciated functions and new features.

I are hoping a little do-diligence in being applied to package updates
otherwise automation will save us all a bunch of time.

Thanks,
Armin
>
>> Did you double check this is in line with DHCP?
> What kind of breakage exactly do you fear?
>
> dhcp still builds and I am staying on an LTS branch of bind.
>
>> - Armin
> cu
> Adrian
>



