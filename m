Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3F8047450D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 22:54:53 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id w7-v6so38282pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 15:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=sEVNKCRrdvpfVHYfnTCK7NHheJQ1rhY/NuH3fK+k90Y=;
	b=qJYBImRoxUp8fqVbuSwYUwJEAnlEqpIPpjZoJqme4AMnGTOZ/LCOM37TwYymN3g3MF
	cF3JkYyxVHw2MPJclRTrkhVDaH9XQ0rwGZb4Cq6xNxw+8fZx9VmVUOGyY89hV5hUprQd
	MAE/gnlyvlZ8XbCmFH2ocrtHyT6f+71pd1xIawbJ5azge2zQP2jq0VI8pnBZkZqy79wO
	wzadem3eSUQ0OJP+iSa54M05l7HyBrEJPK78a22O488A1ANOGPhyW+tT1lHWvfRBe9mR
	H0MEqZ0NY69LYlyt7AYDVech9s11smmKM1y2n+ob2eKdYhxH79L2fmqUYQDxAMZseFiD
	1sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=sEVNKCRrdvpfVHYfnTCK7NHheJQ1rhY/NuH3fK+k90Y=;
	b=oFNO0zXR3ug1Yy/44J14Hy5Sj1KAArOVBSmIX4bXMK3j0KpSTuenLIB1MY48zenaCc
	I+lWZ5cH6e9WyelcGRTv+h2iEMoQXo4ci7RnoYQju581xmB6mSaqYs2UAZuy5ki2BMWG
	fHQYhTek7kk9/SATj+f/rVNsQXbo7KPP+RnwSbv6Ozft5XkyfCuxvFnKOdS8pZACxCgX
	zDDJzIC8BFKzHWzrNJ7YYuWKuFRvknlVlNnX27uZCXpX2Le0yvntfH3MvSUp5Ho9JttL
	qTdWHo3Ymcib5H0hkutZNRNrKrrQkcyR25XAcvWCahlOnvpn5nD7sT0AA3nSmxCmk9Ne
	nDSw==
X-Gm-Message-State: APt69E2ZgkuHxrckSqQ0a7LfubYhQamLvZSlIlAKmX/ADA22kV1znrke
	4yHEQKFqVzXxk95PKe5Ep1PL1A==
X-Google-Smtp-Source: AAOMgpcDjSGM8heFMoQYaQBHddj4OfB4nGEtosCsRH2MPlbOc6MmX0+qMyRiXaNzOK6F6lv6ivGBAQ==
X-Received: by 2002:a62:5486:: with SMTP id
	i128-v6mr3317615pfb.166.1530053694156; 
	Tue, 26 Jun 2018 15:54:54 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:d981:fc82:1d49:d690?
	([2601:202:4000:1184:d981:fc82:1d49:d690])
	by smtp.gmail.com with ESMTPSA id
	n26-v6sm4456539pfi.168.2018.06.26.15.54.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 15:54:53 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <1526595546-3621-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=WUXvABmEMrU2VntSAoeWivquCWpWC6kwG4Xzfyz1-5Og@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4356aafe-b1a7-e41c-8bb8-ca703a93c6b5@gmail.com>
Date: Tue, 26 Jun 2018 15:54:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WUXvABmEMrU2VntSAoeWivquCWpWC6kwG4Xzfyz1-5Og@mail.gmail.com>
Subject: Re: [morty][PATCH] libnl: fix CVE-2017-0553
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
X-List-Received-Date: Tue, 26 Jun 2018 22:54:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 06/25/2018 12:48 PM, Andre McCurdy wrote:
> On Thu, May 17, 2018 at 3:19 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> An elevation of privilege vulnerability in libnl could enable a local
>> malicious application to execute arbitrary code within the context of
>> the Wi-Fi service. This issue is rated as Moderate because it first
>> requires compromising a privileged process and is mitigated by
>> current platform configurations. Product: Android. Versions: 5.0.2,
>> 5.1.1, 6.0, 6.0.1, 7.0, 7.1.1. Android ID: A-32342065. NOTE: this
>> issue also exists in the upstream libnl before 3.3.0 library.
>>
>>   https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-0553
>>
>> Backport fix from upstream 3.3.0 release:
>>
>>   https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb
>>   http://lists.infradead.org/pipermail/libnl/2017-May/002313.html
> Ping.

Thanks for the reminder. it in morty mut build.
- armin
>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  ...eck-for-integer-overflow-in-nlmsg_reserve.patch | 43 ++++++++++++++++++++++
>>  meta/recipes-support/libnl/libnl_3.2.28.bb         |  1 +
>>  2 files changed, 44 insertions(+)
>>  create mode 100644 meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
>>
>> diff --git a/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch b/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
>> new file mode 100644
>> index 0000000..9e22c40
>> --- /dev/null
>> +++ b/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
>> @@ -0,0 +1,43 @@
>> +From 1db543374db3e58faacdfd91e5061a8a595ce505 Mon Sep 17 00:00:00 2001
>> +From: Thomas Haller <thaller@redhat.com>
>> +Date: Mon, 6 Feb 2017 22:23:52 +0100
>> +Subject: [PATCH] lib: check for integer-overflow in nlmsg_reserve()
>> +
>> +In general, libnl functions are not robust against calling with
>> +invalid arguments. Thus, never call libnl functions with invalid
>> +arguments. In case of nlmsg_reserve() this means never provide
>> +a @len argument that causes overflow.
>> +
>> +Still, add an additional safeguard to avoid exploiting such bugs.
>> +
>> +Assume that @pad is a trusted, small integer.
>> +Assume that n->nm_size is a valid number of allocated bytes (and thus
>> +much smaller then SIZE_T_MAX).
>> +Assume, that @len may be set to an untrusted value. Then the patch
>> +avoids an integer overflow resulting in reserving too few bytes.
>> +
>> +Upstream-Status: Backport [https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb]
>> +CVE: CVE-2017-0553
>> +
>> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> +---
>> + lib/msg.c | 3 +++
>> + 1 file changed, 3 insertions(+)
>> +
>> +diff --git a/lib/msg.c b/lib/msg.c
>> +index e8a7e99..f30fd2d 100644
>> +--- a/lib/msg.c
>> ++++ b/lib/msg.c
>> +@@ -410,6 +410,9 @@ void *nlmsg_reserve(struct nl_msg *n, size_t len, int pad)
>> +       size_t nlmsg_len = n->nm_nlh->nlmsg_len;
>> +       size_t tlen;
>> +
>> ++      if (len > n->nm_size)
>> ++              return NULL;
>> ++
>> +       tlen = pad ? ((len + (pad - 1)) & ~(pad - 1)) : len;
>> +
>> +       if ((tlen + nlmsg_len) > n->nm_size)
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb b/meta/recipes-support/libnl/libnl_3.2.28.bb
>> index 26982f3..a74b455 100644
>> --- a/meta/recipes-support/libnl/libnl_3.2.28.bb
>> +++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
>> @@ -12,6 +12,7 @@ DEPENDS = "flex-native bison-native"
>>  SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV', True).replace('.','_')}/${BP}.tar.gz \
>>             file://fix-pktloc_syntax_h-race.patch \
>>             file://fix-pc-file.patch \
>> +           file://lib-check-for-integer-overflow-in-nlmsg_reserve.patch \
>>             file://0001-lib-add-utility-function-nl_strerror_l.patch \
>>             file://0002-lib-switch-to-using-strerror_l-instead-of-strerror_r.patch \
>>             file://0003-src-switch-to-using-strerror_l-instead-of-strerror_r.patch \
>> --
>> 1.9.1
>>


