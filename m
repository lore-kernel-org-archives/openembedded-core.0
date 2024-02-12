Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C793C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 06:43:27 +0000 (UTC)
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
 by mx.groups.io with SMTP id smtpd.web11.1449.1707720204827280271
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 22:43:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=M/74NZjP;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=M/74NZjP;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.163, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.89] ([62.197.243.174])
	by cmgsmtp with ESMTPSA
	id ZQ2ErOLjYsdmGZQ2Erq7gS; Mon, 12 Feb 2024 07:43:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1707720202; bh=xxybgZVmpIyIqH05/4k/l6fDjOErlgs64ftkev3LL14=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=M/74NZjPZBNsiPoRg4JFBVmbyZhxFup0le4Mca66EGW92xP5z4TI5UEDCosYFyKQX
	 u5FA63tis+E9DUZnq0cj8kBmX59EGQhK24uzJJhGwgLKYzILR8olIVicrmZZ5BRYa0
	 /T+eJCFz+YBIr+Cha/isYgGmCdsS77H/DVoWwVBTANY7SBweztYb6zBtXZj64p0/dJ
	 /f/8ikpBQT0KVjY2e/tNh8TdzZvhLZxcE6Tshmm77XskxZhOVVOwthtXrZXkB8O8y6
	 iN/U8VduI68UEq+9WPqguhlJ5qyvggFjIWKwcSDv1AYCComt7/mMtbXmFMgv4r9SnJ
	 DrJ9pxzsdFjPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1707720202; bh=xxybgZVmpIyIqH05/4k/l6fDjOErlgs64ftkev3LL14=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=M/74NZjPZBNsiPoRg4JFBVmbyZhxFup0le4Mca66EGW92xP5z4TI5UEDCosYFyKQX
	 u5FA63tis+E9DUZnq0cj8kBmX59EGQhK24uzJJhGwgLKYzILR8olIVicrmZZ5BRYa0
	 /T+eJCFz+YBIr+Cha/isYgGmCdsS77H/DVoWwVBTANY7SBweztYb6zBtXZj64p0/dJ
	 /f/8ikpBQT0KVjY2e/tNh8TdzZvhLZxcE6Tshmm77XskxZhOVVOwthtXrZXkB8O8y6
	 iN/U8VduI68UEq+9WPqguhlJ5qyvggFjIWKwcSDv1AYCComt7/mMtbXmFMgv4r9SnJ
	 DrJ9pxzsdFjPg==
Message-ID: <4609194f-c7b5-49bd-a607-f602797f0334@skyrain.eu>
Date: Mon, 12 Feb 2024 07:43:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] patchtest: Add selftest for test
 cve_check_ignore
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>
Cc: openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org
References: <20240210135259.563083-1-simone.p.weiss@posteo.com>
 <c7d59770-b975-4608-ae0d-0ac8dd1531d9@skyrain.eu>
 <051501a2118aa94251de40fbaee00f424ff4c6f7.camel@posteo.net>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <051501a2118aa94251de40fbaee00f424ff4c6f7.camel@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOB8QUdLOP7UShVYNwQ45ulKG9cF5DVpOWEsPiuQ7GVIy1FCFpr6Cv+oVIHlaFC6P/P3wuOH+UAyu20iL5Uivx4y9eeeF/IbT29XGymNU/1VWxwCCDUp
 V2exFQK/QW4jMsx3luCHGDhOxwjKiFYPHcxWmPyMLXOdFjzUrGxFwGJZN//M8jsh9tFuk7uTHCM1L7V3NOHSUoF1THZiff/G6WxmNXBo3EfQzztX24HOlGUx
 lng6w4ffQf73Mf+1pR8ejAMGILkzLiVJOKfMQcJgj1MB4rpEO4LTEiTn46fdSn6P
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 06:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195300

Hi Simone,

OK, looks fine, but... what is the difference between 
https://github.com/openembedded/openembedded-core/blob/master/meta/lib/oeqa/selftest/cases/cve_check.py#L224 
? I added a small test there, while we were adding this feature. Does it 
mean, that is not sufficient?

Regards,
Andrej

On 11.02.2024 13:33, Simone Weiß wrote:
> On Sun, 2024-02-11 at 12:45 +0100, Andrej Valek wrote:
>> Hi Simone,
>>
>> Is there a special reason, why you're adding already removed feature
>> https://lists.openembedded.org/g/openembedded-core/message/189917 ?
>>
>> Regards,
>> Andrej
>>
> Hi Andrej,
>
> I am not adding an already removed feature here:)
>
> - This is a selftest, so it is used to test patchtest itself and not
> patches with patchtest.
> - The test from patchtest tested is also not
> test_cve_presence_in_commit_message, which deals with the commit message
> of a patch, but one dealing with the use of CVE_STATUS in the meta data of
> a recipe test_cve_check_ignore.
>
> Cheers,
> Simone
>> On 10.02.2024 14:52, Simone Weiß wrote:
>>> From: Simone Weiß <simone.p.weiss@posteo.com>
>>>
>>> Add a selftest for the recently introduced check for CVE_CHECK_IGNORE.
>>>
>>> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
>>> ---
>>>    .../TestMetadata.test_cve_check_ignore.fail   | 30
>>> ++++++++++++++++++
>>>    .../TestMetadata.test_cve_check_ignore.pass   | 31
>>> +++++++++++++++++++
>>>    2 files changed, 61 insertions(+)
>>>    create mode 100644
>>> meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.f
>>> ail
>>>    create mode 100644
>>> meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.p
>>> ass
>>>
>>> diff --git
>>> a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
>>> .fail
>>> b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
>>> .fail
>>> new file mode 100644
>>> index 0000000000..3574463ade
>>> --- /dev/null
>>> +++
>>> b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
>>> .fail
>>> @@ -0,0 +1,30 @@
>>> +From c4ca86b9cca3643097db0328e2f34dccffbba309 Mon Sep 17 00:00:00
>>> 2001
>>> +From: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
>>> +Date: Sat, 10 Feb 2024 13:18:44 +0100
>>> +Subject: [PATCH] selftest-hello: add CVE_CHECK_IGNORE
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=UTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +This should fail the test_cve_tag_format selftest.
>>> +
>>> +Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
>>> +---
>>> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb          | 3
>>> ++-
>>> + 1 file changed, 2 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-
>>> hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-
>>> hello_1.0.bb
>>> +index 547587bef4..3ef9b87c34 100644
>>> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
>>> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
>>> +@@ -16,4 +16,5 @@ do_install() {
>>> +       install -m 0755 helloworld ${D}${bindir}
>>> + }
>>> +
>>> +-BBCLASSEXTEND = "native nativesdk"
>>> +\ No newline at end of file
>>> ++CVE_CHECK_IGNORE = "CVE-2024-12345"
>>> ++BBCLASSEXTEND = "native nativesdk"
>>> +--
>>> +2.39.2
>>> +
>>> diff --git
>>> a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
>>> .pass
>>> b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
>>> .pass
>>> new file mode 100644
>>> index 0000000000..10f942a6eb
>>> --- /dev/null
>>> +++
>>> b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
>>> .pass
>>> @@ -0,0 +1,31 @@
>>> +From 7d4d3fee0c7111830ee9b2b049ae3ce265b26030 Mon Sep 17 00:00:00
>>> 2001
>>> +From: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
>>> +Date: Sat, 10 Feb 2024 13:23:56 +0100
>>> +Subject: [PATCH] selftest-hello: add CVE_STATUS
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=UTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +This should pass the test_cve_tag_format selftest.
>>> +
>>> +Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
>>> +---
>>> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb         | 4
>>> +++-
>>> + 1 file changed, 3 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-
>>> hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-
>>> hello_1.0.bb
>>> +index 547587bef4..9908b3b417 100644
>>> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
>>> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
>>> +@@ -16,4 +16,6 @@ do_install() {
>>> +       install -m 0755 helloworld ${D}${bindir}
>>> + }
>>> +
>>> +-BBCLASSEXTEND = "native nativesdk"
>>> +\ No newline at end of file
>>> ++CVE_STATUS[CVE-2024-12345] = "not-applicable-platform: Issue only
>>> applies on Windows"
>>> ++
>>> ++BBCLASSEXTEND = "native nativesdk"
>>> +--
>>> +2.39.2
>>> +
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#195273):
>>> https://lists.openembedded.org/g/openembedded-core/message/195273
>>> Mute This Topic: https://lists.openembedded.org/mt/104277396/3619876
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:
>>> https://lists.openembedded.org/g/openembedded-core/unsub [
>>> andrej.v@skyrain.eu]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


