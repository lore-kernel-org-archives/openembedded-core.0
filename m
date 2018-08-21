Return-Path: <sukdo399@daum.net>
Received: from mail-smail-vm74.hanmail.net (mail-smail-vm74.daum.net
	[211.231.106.73])
	by mail.openembedded.org (Postfix) with ESMTP id 554B37900C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:11:11 +0000 (UTC)
Received: from mail-hmail-smtp3.pg1.krane.9rum.cc ([10.194.31.36])
	by mail-smail-vm74.hanmail.net (8.13.8/8.9.1) with SMTP id
	w7L7B3BB030769; Tue, 21 Aug 2018 16:11:03 +0900
X-Hermes-Message-Id: m7LGB2xfS1945410081
Received: from mail-qpsmtp-vm4 ([10.61.241.127]) by hermes of
	mail-hmail-smtp3.pg1.krane.9rum.cc (10.194.31.36) with ESMTP id
	m7LGB2xfS1945410081; Tue, 21 Aug 2018 16:11:02 +0900 (KST)
Received: from [182.212.44.138] (HELO [192.168.219.137]) (182.212.44.138)
	by  (8.12.9/8.9.1) with ESMTPA; ??, 21  8?? 2018 16:11:02 +0900
Authentication-Results: mail-qpsmtp-vm4; auth=pass (plain) smtp.auth=sukdo399
Errors-To: <sukdo399@daum.net>
X-Originating-IP: 182.212.44.138
To: Khem Raj <raj.khem@gmail.com>
References: <20180820232105.20179-1-sukdo399@daum.net>
	<CAMKF1sr+670v4NnJqh++SVrFRaFFMXf3ZfNQkoBJXCZJgOnWsQ@mail.gmail.com>
From: Seokha Ko <sukdo399@daum.net>
Message-ID: <1eba2212-41ee-01e4-d5e0-98567dbd468b@daum.net>
Date: Tue, 21 Aug 2018 16:10:50 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr+670v4NnJqh++SVrFRaFFMXf3ZfNQkoBJXCZJgOnWsQ@mail.gmail.com>
X-HM-UT: qXZ0Qt+h/LakpjrGGn7R0fFdugrUhY3upSfJ6//IJWw=
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nativesdk-packagegroup-sdk-host: Add wayland-scanner to the SDK native toolchain
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
X-List-Received-Date: Tue, 21 Aug 2018 07:11:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

currently nativesdk-wayland-dev package copies bin directory which 
includes wayland-scanner only.

And, IMHO, if there are other tools for dev package, we need them for 
nativesdk target also.

Thank you.


On 08/21/2018 09:50 AM, Khem Raj wrote:
> On Mon, Aug 20, 2018 at 4:26 PM Seokha Ko <sukdo399@daum.net> wrote:
>> The wayland-scanner was missing from the native toolchain for SDK build
>> because it's copied from wayland dev package.
>>
>> Signed-off-by: Seokha Ko <sukdo399@daum.net>
>> ---
>>   .../packagegroups/nativesdk-packagegroup-sdk-host.bb            | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
>> index e2f6169994..4dc6eea23e 100644
>> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
>> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
>> @@ -23,7 +23,7 @@ RDEPENDS_${PN} = "\
>>       nativesdk-makedevs \
>>       nativesdk-dnf \
>>       nativesdk-cmake \
>> -    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland-dev', '', d)} \
> Do we need the whole dev package ? if not I would suggest to package
> it into a separate output package
> and include that along with nativesdk-wayland
>
>>       nativesdk-sdk-provides-dummy \
>>       "
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


