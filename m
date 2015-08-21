Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 144317391A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 21:59:00 +0000 (UTC)
Received: by igfj19 with SMTP id j19so23453076igf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=GR76ee8hRVyG92xyindJbuY5uqSn72Phu4AjZuPB+ro=;
	b=NpBsY6jynHTpWR7LbjBlW3DP4I16hpTph7SyVOPSWzqy7A/e5S/5gKnktdX79o8srO
	94kC1Elzjwrmu9Wer+6xCt++PITNbgTttPT6mTpM6ouu5BSmd2GowwMc0T0cSDOCqpDj
	1cC0io29LJyH+J0+td8v5SRIxth5j3iIfnvv67LZ3ixr66sKSfmLUq6jyJ4VAmRXV5SD
	4wYHDbWTABwZMm/nIw13syl0qKVbg0U4/BF24u/jG8LPQFlyHT2Yi1Q340IZ3Fc19BFk
	Gl6Lu7+0JD3X0d7Im3EPe+/4WJVB0hudvG3Sbramaz1HbYZcNzjkGISgkcP1wara608A
	IrIQ==
X-Gm-Message-State: ALoCoQnD7+zMefvGMm+j/G8INoA+O6UnDDbaTfgHqAAvU5sVnZCUZlh7DaRTQT6WYBzd6wUBi5km
X-Received: by 10.50.30.196 with SMTP id u4mr5166940igh.11.1440194340548;
	Fri, 21 Aug 2015 14:59:00 -0700 (PDT)
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com.
	[209.85.223.173])
	by smtp.gmail.com with ESMTPSA id au6sm3041391igc.0.2015.08.21.14.58.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Aug 2015 14:58:59 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iods203 with SMTP id s203so96323526iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:58:58 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.14.145 with SMTP id 139mr8604237ioo.37.1440194338666;
	Fri, 21 Aug 2015 14:58:58 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 21 Aug 2015 14:58:58 -0700 (PDT)
In-Reply-To: <2ADD7CA4-0184-4D54-9E0B-8A58ACB51DC1@gmail.com>
References: <1440193082-508-1-git-send-email-otavio@ossystems.com.br>
	<2ADD7CA4-0184-4D54-9E0B-8A58ACB51DC1@gmail.com>
Date: Fri, 21 Aug 2015 18:58:58 -0300
Message-ID: <CAP9ODKrEBfBH-+Z2VYg3qG5Bpi7aDozn6F1Z9r7MP3qC8Zs+RQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Rename 'BRANCH' variable to 'SRC_BRANCH' for clearness
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
X-List-Received-Date: Fri, 21 Aug 2015 21:59:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2015 at 6:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Aug 21, 2015, at 2:38 PM, Otavio Salvador <otavio@ossystems.com.br> w=
rote:
>>
>> The 'BRANCH' variable name has no explicit relation with the
>> SRC_URI. Using 'SRC_BRANCH' makes it more obvious and easier to
>> identify.
>
> Look good to me, just may be avoid =E2=80=98_=E2=80=99 and call it SRCBRA=
NCH

I did this initially but looking at how it looks in the source code,
it seems SRC_BRANCH makes easier to spot the relation with SRC_URI. So
I took the second.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

