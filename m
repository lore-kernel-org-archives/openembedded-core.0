Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8FBD07870E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Dec 2017 00:38:07 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id k134so5179165pga.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 16:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Iqo+4oluhQdC70WLl6n2nG4Tfw7+8w4sIQqBARh9T6Q=;
	b=U3STbsDTNFtFZEFV6uI8gkqqDKfasZLrbc6czJVd4BCk6nQ5BNR9OGsmxP25cPuyo4
	DGxMpQlOzmKrBUt1t6hY9kenwszspr4A8j6+IyCWmD7tZAUEnFMmXsiGW5JRHsDLiNJM
	AwA0QlmZ4rvIPziTWP9POWtDmiGioivwnJiB68QS8WOrCkPTUhI3dFefME2qJ5dF2y6t
	DOPbAjvPjzzp6Bg+UapP7p8dwQbhLQ4+h6IaJ0GY1LyWo5e5Mu7tWbK2fBJxlqSpFjRR
	LtUPcO9m8hCoaZBQVL622bkDzV4EAk8usSs2/jEYrudYkATd5BVI9yTa/xhBruAsJk0x
	0GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Iqo+4oluhQdC70WLl6n2nG4Tfw7+8w4sIQqBARh9T6Q=;
	b=rCGVlYoiJt+fj5kIJGXwoY/qIq1AtqrbNIOrusZWA3SU0mt2PpaSCZAQdDO1j2TWLY
	9Pzd7fjbJr5Hi6l9X5ZKVXUO03gddmxV5ryfItFYBe8SXeZJL1WQkbn+GVGrvp/yTm8q
	JUa5XayYwocI4SZmC7hNj3CPvvnpUo2VCMWkS3NfIpneb19JcI+svSOrIkudIJG67Zfd
	tJXJoJct+3lTDURMAdBhG51MTw5rICr2esOArc3jNyJsHvQ1shQ3OnZ/bDb040zAZQBY
	u5jYenUbqbhN+ms1k13CeFWFYGy8SmBy7ExkvoAASRiXuMV6W7pnYBRZkc0DiF3sqrsI
	r4AQ==
X-Gm-Message-State: AJaThX6YqztoI3toZB3Ag1TVZz3UZpdmg1A9OIALq0w3U7BWUDU26MfW
	mxZfU7y9AcaVlwA3tRVkDp/DnPLA71AOnRCD3pY=
X-Google-Smtp-Source: AGs4zMbtrjJ66SAUbC9t4VjQZYaSkvKFmcz0KpJi/Uepb1BgA4LxSRqR8wrjmk++lZu+g284m3lw99LQZKtgKb4Qalo=
X-Received: by 10.101.73.203 with SMTP id t11mr7526933pgs.446.1512175088494;
	Fri, 01 Dec 2017 16:38:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Fri, 1 Dec 2017 16:37:38 -0800 (PST)
In-Reply-To: <CAJ86T=VKWCdmAXRMV8dqSnQS=MdHX=H3odPHKtydB6SCEFyrMQ@mail.gmail.com>
References: <cover.1510192517.git.raj.khem@gmail.com>
	<826373113902dd8d6284ec49a2ea2076c7e298c0.1510192517.git.raj.khem@gmail.com>
	<CAJ86T=VKWCdmAXRMV8dqSnQS=MdHX=H3odPHKtydB6SCEFyrMQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Dec 2017 16:37:38 -0800
Message-ID: <CAMKF1srPGiyC3YfwyZBKW7+Ttm037dCoOg8D9i=m3qq04Og1_w@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] musl: Update to 1.1.18
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
X-List-Received-Date: Sat, 02 Dec 2017 00:38:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 1, 2017 at 4:31 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Nov 8, 2017 at 5:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Rich Felker (9):
>>       fix access by setjmp and longjmp to __hwcap on arm built as thumb2
>>       for executing init array functions, use function type with prototype
>>       fix read-after-free type error in pthread_detach
>>       fix incorrect base name offset from nftw when pathname ends in slash(es)
>>       in dns parsing callback, enforce MAXADDRS to preclude overflow
>>       release 1.1.17
>>       fix regression in glob with literal . or .. path component
>>       fix build regression on ARM for ISA levels less than v5
>>       release 1.1.18
>>
>> Szabolcs Nagy (1):
>>       math: rewrite fma with mostly int arithmetics
>>
>> Will Dietz (1):
>>       posix_spawn: use larger stack to cover worst-case in execvpe
>
> With the version of musl currently included in rocko, various apps
> (including bash) segfault at startup when compiled as Thumb2. The "fix
> access by setjmp and longjmp to __hwcap on arm built as thumb2" commit
> from musl 1.1.18 fixes that.
>
> However the other changes in musl 1.1.18 look pretty useful too, so
> unless there's strong objection, I'd like to suggest aligning rocko
> with the musl 1.1.18 release. ie cherry-picking the following two
> commits from oe-core master to rocko:
>
>   c3f0a70 musl: Update to 1.1.18
>   3953c54 musl: Update to latest
>

It seems good to me. Please send a pull and CC Armin

>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-core/musl/musl_git.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
>> index 671de326fb..932c9a27a0 100644
>> --- a/meta/recipes-core/musl/musl_git.bb
>> +++ b/meta/recipes-core/musl/musl_git.bb
>> @@ -3,9 +3,9 @@
>>
>>  require musl.inc
>>
>> -SRCREV = "48be5b6313d7b827acf555769e93b389fa9f6307"
>> +SRCREV = "eb03bde2f24582874cb72b56c7811bf51da0c817"
>>
>> -PV = "1.1.16+git${SRCPV}"
>> +PV = "1.1.18+git${SRCPV}"
>>
>>  # mirror is at git://github.com/kraj/musl.git
>>
>> --
>> 2.15.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

