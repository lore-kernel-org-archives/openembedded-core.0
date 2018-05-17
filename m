Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 83D7C744F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 02:37:17 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id az12-v6so1559826plb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 19:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Dro68w6Juhff6ICJ4h+i56XEwU0RSsdWSX3bukDTqDg=;
	b=lobOLxh/gTwa7b4CoFA7rmZn2o9umvnYXw6n23ZvfBcRQG+VTKEm4iSOtXsO0MoNoT
	dW4uDyslcznQDd83LL1SgzSq+YAXlfP9EKa/1Wt6ItRc6MBjDW3bf+jEP89eKhaQKsCU
	Tte4gUdDPrrsFdSR/K+B3Ohhmg9u/+1Ah3+nZaRF7C5FELePaqh1yUfDUIUlVmrx4SxV
	u3XlCS4WW21Vq7dGoCAfoyHDR0MkHy6s8u1mtuR5KuNqJVy75QR6+R7cXVgfk6+NYzsM
	2gQB5I2ldDMUQ90HmEIdNtRx8qc0LZS+5lGUiY72Wq0Qa34hQ4I4gwAXBYznPFpButDC
	PDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Dro68w6Juhff6ICJ4h+i56XEwU0RSsdWSX3bukDTqDg=;
	b=V9QCN3xPe/9M1CIQxIA0FIrFr8YLWIXrbtuQj1XFN3kLSFMVGOal/JEk06cKWLORBD
	/VvbHna63PFYEzce2YrPMEy9JN06NkQst6sGW9y2Fb/dCOOK9pyYDy7y0rpPrW8XC13w
	NhTH3ODI397gHeMOZ0rhRRgd/vTMowuhLkX6ApMFXjMkIuo9vnoiBKf9SaVp2W/amBCG
	mKkKUL+CMfxaU6iJ9wfX8brlYF+2HOT5KY1zeGAA1/igGV+cMOPRNb6/3ncRvGMSRZME
	nLC8CIp/1taptTmh1SpRXQWTyLkn431ldfbicAFbehaKE7EgXc6zcqX3Y6cL6efMMkZ4
	PV2w==
X-Gm-Message-State: ALKqPwcHXvTQZ/KX6TkzttRlc1ObUgmKwzqF8SwrjOjKX2xdKWopx8Hh
	/4wwMRFWl5Bhc8zfAfnaibJbdA==
X-Google-Smtp-Source: AB8JxZoYXLtTBbeE+x68YrIATaZlp4wjh5ic3iKM/92GUjIk+J/Wd0H9NerBeJresHMvnp4kR6GhuQ==
X-Received: by 2002:a17:902:8305:: with SMTP id
	bd5-v6mr3373528plb.13.1526524637793; 
	Wed, 16 May 2018 19:37:17 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:fc4a:d9da:dd5c:80ff?
	([2601:202:4000:1184:fc4a:d9da:dd5c:80ff])
	by smtp.gmail.com with ESMTPSA id
	g20-v6sm5843430pfi.163.2018.05.16.19.37.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 May 2018 19:37:17 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <1526082723-13508-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=U56fvKy5m6xv75LAzEDp5Sk8NWorjw4FSFkAi1=BNkMQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <5d651a74-f258-7573-4081-568bac0481f1@gmail.com>
Date: Wed, 16 May 2018 19:37:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=U56fvKy5m6xv75LAzEDp5Sk8NWorjw4FSFkAi1=BNkMQ@mail.gmail.com>
Subject: Re: [rocko][PATCH] libnl: fix CVE-2017-0553
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
X-List-Received-Date: Thu, 17 May 2018 02:37:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 05/15/2018 01:14 PM, Andre McCurdy wrote:
> On Fri, May 11, 2018 at 4:52 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
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
>> Backport fix from upstream libnl 3.3.0 release:
>>
>>   https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb
>>   http://lists.infradead.org/pipermail/libnl/2017-May/002313.html
> Armin, please let me know if this is OK and I'll send the same fix for
> pyro and morty.

this is fine. I have it in stable/rocko-mnut pending build rotation

thanks,
Armin
>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  ...eck-for-integer-overflow-in-nlmsg_reserve.patch | 43 ++++++++++++++++++++++
>>  meta/recipes-support/libnl/libnl_3.2.29.bb         |  2 +
>>  2 files changed, 45 insertions(+)
>>  create mode 100644 meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
>>
>> diff --git a/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch b/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
>> new file mode 100644
>> index 0000000..594dd06
>> --- /dev/null
>> +++ b/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
>> @@ -0,0 +1,43 @@
>> +From 3e18948f17148e6a3c4255bdeaaf01ef6081ceeb Mon Sep 17 00:00:00 2001
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
>> +index 9af3f3a..3e27d4e 100644
>> +--- a/lib/msg.c
>> ++++ b/lib/msg.c
>> +@@ -411,6 +411,9 @@ void *nlmsg_reserve(struct nl_msg *n, size_t len, int pad)
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
>> diff --git a/meta/recipes-support/libnl/libnl_3.2.29.bb b/meta/recipes-support/libnl/libnl_3.2.29.bb
>> index 7d4839b..4ce80e8 100644
>> --- a/meta/recipes-support/libnl/libnl_3.2.29.bb
>> +++ b/meta/recipes-support/libnl/libnl_3.2.29.bb
>> @@ -12,7 +12,9 @@ DEPENDS = "flex-native bison-native"
>>  SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
>>             file://fix-pktloc_syntax_h-race.patch \
>>             file://fix-pc-file.patch \
>> +           file://lib-check-for-integer-overflow-in-nlmsg_reserve.patch \
>>  "
>> +
>>  UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
>>
>>  SRC_URI[md5sum] = "a8ba62a5c4f883f4e493a46d1f3733fe"
>> --
>> 1.9.1
>>


