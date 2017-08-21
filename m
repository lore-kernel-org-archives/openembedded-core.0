Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9572878235
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 18:16:53 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id i12so104274510pgr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 11:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hO7zL9lBOyZNgO0H+vh60Dzx8oEYtH6MB6ZUpFSLYTY=;
	b=QmoykOtFhMLfCJA9EsjQcfDXxlgUYX9f2YvqPkg7zAZcT+he+1yBe3h/iZMuSe3/zt
	8OZYERDfHQgB9zMVIflxa7DY/j2po7rC5I1BW9nEDrmj//Je9TgouTOLOcqmbsycPmbX
	I+Bz9Y13o47JNx/0CEfZemwqtU9jhprYom1j1sVQFNhWmKBsSIGWGUi5Ie70u2n7C+yI
	Pz2BVkD05NFJPhPYIkVuenEFrUJgP9QpwFw0W0UcNrbIDLZiiWa+jQ8YBfiAZPP2Tgwk
	OXDZTfejUWRZdUG7QGGL6y8YUMw+O0ScrN0JyHYH/Frfc+xhO4euvNjHSG+QTHINkh0m
	9j7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hO7zL9lBOyZNgO0H+vh60Dzx8oEYtH6MB6ZUpFSLYTY=;
	b=ffhoz2zZV92KTRxsY+5Hgt4G/XXBRJhu4p7e7l3TIC4ST8QUjCll6W4tpCzVV/BNxn
	njGz2+Hbskzhr6bW00lDUkrF/yL43JTfoILxM8FNJghuFfbD1/ezh5SIMFgNK0NWWdMq
	ZGBbe+cyAGy6Q8BZDwCQnzQ347ED+wC5Ck0fOfUtspQZjemzcCBclYq4L+AJSlvcVunI
	hT54vyaJgrgfjdpZl/rybBHVo3o2KWeYYuGH81po+esEq51KKbSjSNBCOl38ejGnkFtA
	RiPqXTFsa3OUjuWIq1Moud0e4unrQ5ItWyYwMcuEIWqcEuHfo79fvKHcTXZbAEmAqGxg
	A34w==
X-Gm-Message-State: AHYfb5gWKKeLBi2rx/8Ij7WOKJ2qpqEKU8alDmlud3nokECkMD344r+t
	mJLdaUk3ccmUGh8++biZb2AbrMbxbw==
X-Received: by 10.98.33.84 with SMTP id h81mr17914767pfh.302.1503339414738;
	Mon, 21 Aug 2017 11:16:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 21 Aug 2017 11:16:24 -0700 (PDT)
In-Reply-To: <CAHiDW_FBQHxDOLgRC_tr-i5Y_rd4TBge0Vt_TwnRg9x5VU2ikg@mail.gmail.com>
References: <20170821102342.167780-1-jose.alarcon@ge.com>
	<CAHiDW_FBQHxDOLgRC_tr-i5Y_rd4TBge0Vt_TwnRg9x5VU2ikg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Aug 2017 11:16:24 -0700
Message-ID: <CAMKF1sp+yQe637v_s9RfxvufHY50DP5VhgUGyTe1UvMzqJ16JA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Dhrystone: add recipe 2.1
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
X-List-Received-Date: Mon, 21 Aug 2017 18:16:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 21, 2017 at 5:35 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 21 August 2017 at 13:23, Jose Alarcon <jose.alarcon@ge.com> wrote:
>>
>> Dhrystone is a synthetic computing benchmark program developed
>> in 1984 by Reinhold P. Weicker intended to be representative of
>> system (integer) programming.
>>
>> https://en.wikipedia.org/wiki/Dhrystone
>>
>> Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
>> ---
>>  .../dhrystone/dhrystone-2.1/dhrystone.patch        | 81
>> ++++++++++++++++++++++
>>  .../recipes-benchmark/dhrystone/dhrystone_2.1.bb   | 26 +++++++
>>  2 files changed, 107 insertions(+)
>>  create mode 100644
>> meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone.patch
>>  create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
>
>
> Hi,
>
> Please send meta-oe patches to openembedded-devel@lists.openembedded.org.
>
> Also this part is unlikely to be welcome on oe-devel either:
>> LICENSE = "Proprietary"
>
> I think I remember seeing a dhrystone recipe submission with an open source
> license (NCSA maybe?) last year .

https://patchwork.openembedded.org/patch/129975/

a v2 was expected, which I cant find so it never got applied. if you
are interested rework the v1 and test it out. Submit a v2 and we can
take it further along the line.

>
> Cheers,
>   Jussi
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

