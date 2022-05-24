Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <7a840793-521d-23c5-e93a-009670c9e8f1@gmail.com>
Date: Tue, 24 May 2022 16:52:01 +0530
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH V4] meta: rust - Bug fix for target definitions returning 'NoneType' for arm
References: <b7357d18166022d50cb688d03bf076bd39d79fb6.camel@linuxfoundation.org>
 <10389.1653387718015832235@lists.openembedded.org>
 <3206ab3223db09451e03becdf55d972789105e18.camel@linuxfoundation.org>
From: "Sundeep KOKKONDA" <sundeep.kokkonda@gmail.com>
In-Reply-To: <3206ab3223db09451e03becdf55d972789105e18.camel@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: richard.purdie@linuxfoundation.org, openembedded-core@lists.openembedded.org

On 24-05-2022 16:34, richard.purdie@linuxfoundation.org wrote:
> On Tue, 2022-05-24 at 03:21 -0700, Sundeep KOKKONDA wrote:
>> Hello Richard,
>>
>> The patch you sent in rust-common.bbclass fixing the 'oe-selftest -r
>> sstatetests.SStateTests.test_sstate_allarch_samesigs' test issue but
>> the regression test shows that the
>> 'sstatetests.SStateTests.test_sstate_32_64_same_hash' is getting
>> failed. So, I think this change is not correct. With this patch, the
>> diffsigs shows 'rust-native' sigdata is changed based on the changed
>> value for RUST_TARGET_SYS variable (in x86_64 :: x86_64-unknown-
>> linux-gnu & in i686 :: i686-unknown-linux-gnu). I tried several
>> attempts to fix it but nothing worked out yet.
> You should have seen a further couple of patches which fixed other
> issues and with current master, the issues should be resolved?

I used old sources. Thanks for info. Issue is fixed.


Thanks,

Sundeep K.

>
> Cheers,
>
> Richard
>
>

