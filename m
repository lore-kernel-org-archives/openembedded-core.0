Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 075A665DB1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 14:10:42 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id et14so14291005pad.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 07:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=4LNCEElSVuSEKcPezBLKRz8IP0mP6OtNDMWyrrxRUDM=;
	b=gcK5j7pyYTBxsZXKDQfq24MVodsXvGt5eXmUKH8VMUWAgQ84bWvp8aJ8eQ8VKhvpI2
	43SR+fSpcUwwuHgNOMeS0PpEDDuRWv9+rYhipqfHLtaZ/DNRPOB34MNvnaUUtaMJB5Yy
	UGbwD9ThP835BmRnWozmquM7umVwNgO+2tUIx2G5nGCC3Zd841tKjVge1SkCdUn4Ines
	pQqQipDmmc1qrths49SgkVel4aTIko4Eb7iWhDL2dxMfsWQEXAqqF2Nvlo3bv8OxMzVY
	sAHR2+ikOa64jnMf/xQH7uQD0D/TGNCZZj6A10LVStIspL8C7mlx55s4Eind6Qjl97bF
	1nqg==
X-Received: by 10.68.200.101 with SMTP id jr5mr53894862pbc.36.1408630242618;
	Thu, 21 Aug 2014 07:10:42 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:2933:84ae:665a:84e2?
	([2601:c:9380:601:2933:84ae:665a:84e2])
	by mx.google.com with ESMTPSA id
	cj17sm38964313pdb.75.2014.08.21.07.10.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Aug 2014 07:10:41 -0700 (PDT)
Message-ID: <53F5FDDE.30609@gmail.com>
Date: Thu, 21 Aug 2014 07:10:38 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1408316808-13486-1-git-send-email-akuster808@gmail.com>
	<1408606690.1669.103.camel@ted>
In-Reply-To: <1408606690.1669.103.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] nettle: update nettle to version 3.0
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
X-List-Received-Date: Thu, 21 Aug 2014 14:10:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/21/2014 12:38 AM, Richard Purdie wrote:
> On Sun, 2014-08-17 at 16:06 -0700, Armin Kuster wrote:
>> With this update, LGPLv3 or GPLv3 where  added to many files.
>> Each supported algorithms govern which license they want.
>> Many are stated as  "ether v2 or v3 or both in parallel".
>> Update license to be v2 or LGPLv3 or GPLv3.
>>
>> The previous verion had one GPLv3 file so the license was incorrect.
>
> With this change, "bitbke gnutls" stops working.

dang.

I will look into it.

- Armin
>
> Cheers,
>
> Richard
>

