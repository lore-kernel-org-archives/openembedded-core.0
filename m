Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8B74F60043;
	Wed, 29 Jun 2016 19:59:39 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id av7so5144310pac.3;
	Wed, 29 Jun 2016 12:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=JZ/ekcMhntO9Xxy4xdV23JcmTu7FFfk/Ql88fcJ7P9M=;
	b=lGgiRqFJX3s1Kzh0ZfW3MpD3eEOg+n6+S8+GGVG8RQde7govhNScaLqodWHWwrWY/u
	kI8k8h4+5OLQ+EtXWQxP00yifvu0gX1LHH84VhC7URyUXN4DJ6nQQX9jheZQnti+i3jT
	Gwcz582QaJirf4DDpjtTPZK632AyfqT1LU8P8Gf1zofTPNqUpGNYCo3KBx6J4Am3Darq
	hKSG50el/+KrUKNmFxB7/PAeIWf6s92Fnwu5ye91E6hEN0AkQPmptHKrka9Mx70Zwhoi
	DyD8hobHV7TGzaOAIiPwuZlZoQg10YPP6tbOxYpSaSXpQanOHqOPvuSGZZhg32dJ+ToZ
	lycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=JZ/ekcMhntO9Xxy4xdV23JcmTu7FFfk/Ql88fcJ7P9M=;
	b=D3dDSp3J0cqd4CDWeT7n+lwS9pU93lkrMk/nPSV3Y/C/qUVFfoVD+ZtXJEzXb0ZIkf
	j8aI1LDJlxZiCDUy4sjYWjkv/PCdi3MMzNwwLJVzc5cCUmJ4MtYjYpuwWKZCLshh09Vj
	tY3lafWACqX0txlu96nnTzlqT1b4BBdHs8BHnmHXgBwk6wAe+BtiWE9e7wNZuFyPEX1/
	SO3nxAtoJfHUcYVmCYYmNryeYrMLVovJw7G3UFaArM7Sai3fDp+szuPlqFn71LsFUQY6
	uBVaiZV7Cr80Aol4NoUmflZTNL3OSfsmt6eP7OJHc7zLjKVTXEy0hKt7l+4ltdXaAYGE
	NRZw==
X-Gm-Message-State: ALyK8tIEd+VZErAw9AEGB5nBCVPe8zayY31FOZkAa2CVuErdMaecoaTLqs88yZxG7NTJOw==
X-Received: by 10.66.43.240 with SMTP id z16mr14943966pal.114.1467230379625;
	Wed, 29 Jun 2016 12:59:39 -0700 (PDT)
Received: from [10.43.100.29] ([50.233.148.158])
	by smtp.googlemail.com with ESMTPSA id
	rf14sm7925601pab.25.2016.06.29.12.59.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jun 2016 12:59:38 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Joshua Lock <joshua.g.lock@intel.com>
References: <20160629183624.878.59989@opal.openembedded.org>
	<20160629183638.306C4503CA@opal.openembedded.org>
	<CA+chaQd_x4-zuMVxUS_BgSmn77Cs+g-8cEZHujuKqafzZ6BLuA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <577428A8.9040405@gmail.com>
Date: Wed, 29 Jun 2016 12:59:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQd_x4-zuMVxUS_BgSmn77Cs+g-8cEZHujuKqafzZ6BLuA@mail.gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 58/94: openssl: prevent ABI break from earlier krogoth releases
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
X-List-Received-Date: Wed, 29 Jun 2016 19:59:40 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 06/29/2016 12:02 PM, Martin Jansa wrote:
> Please revert this, this is actually breaking the ABI compatibility against
> Krogoth release as reported in pull request.

I thought I removed it when you provided feed back the last time.

my apologies,
Armin

> On Wed, Jun 29, 2016 at 8:37 PM, <git@git.openembedded.org> wrote:
> 
>> rpurdie pushed a commit to branch krogoth
>> in repository openembedded-core.
>>
>> commit 4d1cb0646eafca44fae5321f48c6114a32fbf164
>> Author: Joshua Lock <joshua.g.lock@intel.com>
>> AuthorDate: Thu May 12 13:06:34 2016 +0100
>>
>>     openssl: prevent ABI break from earlier krogoth releases
>>
>>     The backported upgrade to 1.0.2h included an updated GNU LD
>>     version-script which results in an ABI change. In order to try and
>>     respect ABI for existing binaries built against fido this commit
>>     partially reverts the version-script to maintain the existing ABI
>>     and instead only add the new symbols required by 1.0.2h.
>>
>>     Suggested-by: Martin Jansa <martin.jansa@gmail.com>
>>     (From OE-Core rev: 480db6be99f9a53d8657b31b846f0079ee1a124f)
>>
>>     Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>     Signed-off-by: Armin Kuster <akuster@mvista.com>
>>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  .../openssl/debian1.0.2/version-script.patch       | 31
>> +++++++++++++++-------
>>  1 file changed, 22 insertions(+), 9 deletions(-)
>>
>> diff --git
>> a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
>> b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
>> index 29f11a2..f53efdb 100644
>> ---
>> a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
>> +++
>> b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
>> @@ -15,8 +15,8 @@ Index:
>> openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
>>  ===================================================================
>>  --- /dev/null  1970-01-01 00:00:00.000000000 +0000
>>  +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld 2014-02-24
>> 22:19:08.601827266 +0100
>> -@@ -0,0 +1,4608 @@
>> -+OPENSSL_1.0.2d {
>> +@@ -0,0 +1,4621 @@
>> ++OPENSSL_1.0.0 {
>>  +      global:
>>  +              BIO_f_ssl;
>>  +              BIO_new_buffer_ssl_connect;
>> @@ -4314,6 +4314,14 @@ Index:
>> openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
>>  +              CRYPTO_cbc128_decrypt;
>>  +              CRYPTO_cfb128_encrypt;
>>  +              CRYPTO_cfb128_8_encrypt;
>> ++
>> ++      local:
>> ++              *;
>> ++};
>> ++
>> ++
>> ++OPENSSL_1.0.1 {
>> ++      global:
>>  +              SSL_renegotiate_abbreviated;
>>  +              TLSv1_1_method;
>>  +              TLSv1_1_client_method;
>> @@ -4475,7 +4483,15 @@ Index:
>> openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
>>  +              BIO_s_datagram_sctp;
>>  +              BIO_dgram_is_sctp;
>>  +              BIO_dgram_sctp_notification_cb;
>> ++} OPENSSL_1.0.0;
>> ++
>> ++OPENSSL_1.0.1d {
>> ++      global:
>>  +              CRYPTO_memcmp;
>> ++} OPENSSL_1.0.1;
>> ++
>> ++OPENSSL_1.0.2 {
>> ++      global:
>>  +              SSL_CTX_set_alpn_protos;
>>  +              SSL_set_alpn_protos;
>>  +              SSL_CTX_set_alpn_select_cb;
>> @@ -4613,23 +4629,20 @@ Index:
>> openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
>>  +              BUF_strnlen;
>>  +              sk_deep_copy;
>>  +              SSL_test_functions;
>> -+
>> -+      local:
>> -+              *;
>> -+};
>> ++} OPENSSL_1.0.1d;
>>  +
>>  +OPENSSL_1.0.2g {
>>  +       global:
>>  +               SRP_VBASE_get1_by_user;
>>  +               SRP_user_pwd_free;
>> -+} OPENSSL_1.0.2d;
>> ++} OPENSSL_1.0.2;
>>  +
>>  Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl.ld
>>  ===================================================================
>>  --- /dev/null  1970-01-01 00:00:00.000000000 +0000
>>  +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl.ld
>> 2014-02-24 21:02:30.000000000 +0100
>>  @@ -0,0 +1,10 @@
>> -+OPENSSL_1.0.2 {
>> ++OPENSSL_1.0.0 {
>>  +      global:
>>  +              bind_engine;
>>  +              v_check;
>> @@ -4644,7 +4657,7 @@ Index:
>> openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/openssl.ld
>>  --- /dev/null  1970-01-01 00:00:00.000000000 +0000
>>  +++
>> openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/openssl.ld
>> 2014-02-24 21:02:30.000000000 +0100
>>  @@ -0,0 +1,10 @@
>> -+OPENSSL_1.0.2 {
>> ++OPENSSL_1.0.0 {
>>  +      global:
>>  +              bind_engine;
>>  +              v_check;
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>>
> 
> 
> 

