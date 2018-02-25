Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8B60178754;
	Sun, 25 Feb 2018 22:55:18 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id v9-v6so6183616plp.12;
	Sun, 25 Feb 2018 14:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=q1M4LRe086AcBzkgq+kpwORhuaSLRMxVR4ztIugfeFM=;
	b=tJ+xztBs5rFhSHzoo8KVNQbNj6o4bcYrx0mClJX00KLbwqei7d6WN+FcSy5+TZYAJq
	vKkDOLoI1tWoawnFWlFJrReGVni/EFf8EUbxf2nqY4XHLgOLF/y39on5VKQdXZgBSvko
	NopT9S78sr/E+CDylY7pg1z76XZAwI0bgPIppdOSM4JQN01fElxhSTylIljg7OPvDOnU
	1U0Xyh37LKoaP4Qdqxi11EfqsSGhQW8/lWuBMxZCUFhtwx74KR2ABGeP1Tm+ebv/F9it
	MeKLNaUvUzwNKIAkZflGlMc0XXoumC+mQLJyl3K0wpwqxX9KOpACfjccHJtHoIN/Vtx/
	FnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=q1M4LRe086AcBzkgq+kpwORhuaSLRMxVR4ztIugfeFM=;
	b=dWAdwIspkcCMBGIbaUuhYOBITom0rNeLVC4dwbmqqCsuJ+pr7n9tP0C/CNORL1F5Iq
	UPBMZmhlNEzkzlicFLH2ZhhsTNyvVxEwIAJhfWrAC283mreEe0N90xGmjeXyO3CEtKjn
	q35N6xBUCmuA+8e7UxOl0Sg5A/aa4PSQCQyOcGdUgAUryDmZMMyDVHN7N96wuKPzFfpS
	jvG89MWFuZ7N6KuFhyTPUguF8yRub26nAGzmZHi2es2H8mxuQOElwc8XsGPO4DdXIn0s
	JVcM0/5OarpNZec0sOPwNB2o/muTdyZcfXlLUCtPP1l8OgscJvqE6Cbii0SD/hjQDg+0
	CcAQ==
X-Gm-Message-State: APf1xPBA9aBE/UzXBNZ8/NbaGhSb1CDfCa0AYHq0GiNwuS+/jwvL0+Ek
	KY71f6BrdymeY19TepA9AWXjJQ==
X-Google-Smtp-Source: AH8x224N5xtRftqnFrgR29GDSd1XcHnvYWqWGIQUBHS49LT9bpkyZv7CKihWv7wj9eI//WsOZFKhYQ==
X-Received: by 2002:a17:902:b604:: with SMTP id
	b4-v6mr8665576pls.448.1519599319606; 
	Sun, 25 Feb 2018 14:55:19 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:ad95:2a34:2e02:2fdf?
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	p10sm1694967pgd.28.2018.02.25.14.55.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Feb 2018 14:55:18 -0800 (PST)
To: Tom Rini <trini@konsulko.com>
References: <966e95a6-4401-5c12-b69c-9bd37bb236fd@gmail.com>
	<20180224183811.GL4311@bill-the-cat>
From: akuster808 <akuster808@gmail.com>
Message-ID: <fa075cca-02ef-7cd9-e60d-86693e554dd6@gmail.com>
Date: Sun, 25 Feb 2018 14:55:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180224183811.GL4311@bill-the-cat>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] meta-openembedded/meta-oe re-org
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
X-List-Received-Date: Sun, 25 Feb 2018 22:55:18 -0000
X-Groupsio-MsgNum: 108390
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ANj6Ow28Y34NMpxReFRKT5aVKjf8pQEGW"

--ANj6Ow28Y34NMpxReFRKT5aVKjf8pQEGW
Content-Type: multipart/mixed; boundary="Ot2HXvAETHAQuVQHYbDFmNch3fFaGRFFK";
 protected-headers="v1"
From: akuster808 <akuster808@gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <fa075cca-02ef-7cd9-e60d-86693e554dd6@gmail.com>
Subject: Re: [OE-core] [RFC] meta-openembedded/meta-oe re-org
References: <966e95a6-4401-5c12-b69c-9bd37bb236fd@gmail.com>
 <20180224183811.GL4311@bill-the-cat>
In-Reply-To: <20180224183811.GL4311@bill-the-cat>

--Ot2HXvAETHAQuVQHYbDFmNch3fFaGRFFK
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 02/24/2018 10:38 AM, Tom Rini wrote:
> On Sat, Feb 24, 2018 at 09:56:42AM -0800, akuster808 wrote:
>
>> Hello,
>>
>> I am planning on moving some recipes to new locations that are more
>> in-line with their function.
>>
>> Also, I plan on adding *-shells, *-dbs, *-security and *.crypto and
>> moving the appropriate recipes there.
>>
>> This might help facilitate folks signing up to maintain a grouping lik=
e
>> recipes-crypto if that is their thing.
>>
>>
>> I will be sending out patches later today for review.
>>
>> I have staged the changes @
>> http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dakuste=
r/meta-oe-reorg
> Should some stuff perhaps be moved out to other layers?  More
> specifically, should at least tomoyo-tools get moved to meta-security
> with the rest of the tomoyo stuff? =20
Myabe. It might be easier to figure that out once we re-org things.


> I have less strong opinions on
> leveldb (but maybe recipes-dbs instead) and passwdqc.

re-naming is ease. its getting things it the grouped together that make
sense.

Thanks,
armin
>



--Ot2HXvAETHAQuVQHYbDFmNch3fFaGRFFK--

--ANj6Ow28Y34NMpxReFRKT5aVKjf8pQEGW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJakz7VAAoJEO6LtJn0Vuf5kzwP/iscWsFuQ9x/GY3j+fUPEW63
shk4v/6Uv2QHaffSuHXyQYo6FEz4u6lNo7iclZcwu/yxjusr7+X+U1zprkEoBigp
0ECRLMcScL44VXtTsipqWEuqnP32LG0lvsUa5hTVNIdwvEfMFbDiC3RUrD/HCXRo
h7Xb8SpZAI9WkSDFwQaLz5AAVZCAN8XkHx5zGN+0QlZI1QRrgWIS0Cj253V+urac
mTToZqYgicd2aMoO8x0Jfj3RSikvILTBMgCT2fXSIwq/Lxqy/dl9Z/W8eDoGsUH/
h30Fn6dDzfqxD2A7Dm4LJ+Z+pk+7pt3B33WshQ2rAM9pJU2aa+Q80MCQOLpW3ELc
RiPGgn6iaWWKGWmhd7IpcPz5EEDxnGk093QLO/m4naVsIrImPhYTY5xNmIa/5Mdz
MPdFYDQDmO1fzA0EboRfqoBZXSvIVHxStZdG4t5LvW7H9y5mrpaqrJST3X46ZGIW
LkdCWqURvXTO5g0Bk5lwF5YSgj+bVOaxELk7RK90VbDtr9+yzJ8QOnb/aX3N6S80
sj7Ks5I3lCatakSoZsa+tMywJCCAP/qyKx2yuClcQSAgbsGf3ktjfRe48gLm24Ch
/5M6kMDteIfxyc00eZlKxSNFc1YsbedzQn0w2pXNRf6jQezvoYyRzXbJvvWcxBBF
jAj8/X5BmYwNv5x/ImWo
=Bc2W
-----END PGP SIGNATURE-----

--ANj6Ow28Y34NMpxReFRKT5aVKjf8pQEGW--
