Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SOsxK-0000rQ-Nb
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 17:56:06 +0200
Received: by wera1 with SMTP id a1so2107571wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 08:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=+mLhtC9HPXCrbzNaV2OQJCjZiXTYO5JrlpFgDLqUs/E=;
	b=gRrt8ZaSaxrizXXI2hfJvAU0TDF0/F9tPcYkKCR/zMCGElqz3koNgJ6hBOO3ObAoHY
	OzEGJTO6zlX4VUawZoIlfreBP1J3xpIgvHraFHK/nc4vZ6hHl3h6L1MkoZgrzNl3VV7g
	FCIBrkw/1Olse1C6VEygAYcj5LwlqK+UqkZ31ZXOTEDe3tnx7mz/qo82wVcWKsKLUsaw
	LrXaM0GVnq28vbNNYWNpw99skhLPmqi1/8ceqY9sMWlGWzYvZwJplx3dlw8cAuxQMc9I
	SAVKZewnQ5X0ePtSRqxdgAiZVG3Da5Pmgj0skcdZHx/IT658n4q4Fk6abiXlBF3YYEP+
	ZNjA==
Received: by 10.180.93.196 with SMTP id cw4mr14253481wib.19.1335800784563;
	Mon, 30 Apr 2012 08:46:24 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm46243376wib.8.2012.04.30.08.46.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 08:46:23 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F9EAE10.6090901@linux.intel.com>
Date: Mon, 30 Apr 2012 17:46:21 +0200
Message-Id: <B3F871E7-38D5-4430-B936-2D906C53E83A@dominion.thruhere.net>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
	<baa0f344e516b3474cf5f1a5e8afcbc392be16de.1335600691.git.dongxiao.xu@intel.com>
	<20120429084538.GA350@jama.jama.net>
	<4F9EAE10.6090901@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnT7LfJbpIwJe8m+V5mUcxDJaa5mKVzquAk6mOwX4GkCT0EmzmkqvoWoTLjydlgnbYaNZPj
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 6/8] ofono: upgrade to version 1.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2012 15:56:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 apr. 2012, om 17:21 heeft Saul Wold het volgende geschreven:

> On 04/29/2012 01:45 AM, Martin Jansa wrote:
>> On Sat, Apr 28, 2012 at 04:12:30PM +0800, Dongxiao Xu wrote:
>>> Signed-off-by: Dongxiao Xu<dongxiao.xu@intel.com>
>>> ---
>>>  .../ofono/{ofono_1.5.bb =3D>  ofono_1.6.bb}           |    2 +-
>>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>>  rename meta/recipes-connectivity/ofono/{ofono_1.5.bb =3D>  =
ofono_1.6.bb} (97%)
>>>=20
>>> diff --git a/meta/recipes-connectivity/ofono/ofono_1.5.bb =
b/meta/recipes-connectivity/ofono/ofono_1.6.bb
>>> similarity index 97%
>>> rename from meta/recipes-connectivity/ofono/ofono_1.5.bb
>>> rename to meta/recipes-connectivity/ofono/ofono_1.6.bb
>>> index dad813f..d0f273b 100644
>>> --- a/meta/recipes-connectivity/ofono/ofono_1.5.bb
>>> +++ b/meta/recipes-connectivity/ofono/ofono_1.6.bb
>>> @@ -1,6 +1,6 @@
>>>  require ofono.inc
>>>=20
>>> -PR =3D "r1"
>>> +PR =3D "r0"
>>=20
>> without checksum change it will fail, right?
>>=20
>> I'll send patch I have for ofono upgrade in my branch.
>>=20
> This seems to have uncovered a problem with the Fetcher, it happily =
pulls the upstream tarball, raises a BBFetchException, and writes the =
checksum failure to the log file, but it seems to still mark the fetch =
complete with a .done file and continues to build.

I've had reports of that bug as well, it is also triggered by things =
like redirects to fancy error pages.=20

regards,

Koen=


