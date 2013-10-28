Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8461C6D1A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 20:53:19 +0000 (UTC)
Message-ID: <526ECEBE.508@communistcode.co.uk>
Date: Mon, 28 Oct 2013 20:53:18 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1382345775-1338-1-git-send-email-ml@communistcode.co.uk>
	<CAMKF1spfQ7hiR8S_=cboV1+p2B4yMF+vqfHpWr1bha883MbvTg@mail.gmail.com>
In-Reply-To: <CAMKF1spfQ7hiR8S_=cboV1+p2B4yMF+vqfHpWr1bha883MbvTg@mail.gmail.com>
Cc: Jack Mitchell <jmitchell@cbnl.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe][PATCHv2] libjson: update to 0.11 and rename to json-c
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Oct 2013 20:53:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2013 19:32, Khem Raj wrote:
> On Mon, Oct 21, 2013 at 1:56 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> From: Jack Mitchell <jmitchell@cbnl.com>
>>
>> libjson is now known as json-c, it keeps support for the old
>> libjson namespace so it shouldn't break anything. Built without
>> parallel make as it would fail when it tries to link to link back
>> to itself, which is odd, but the official word is: don't build in
>> parallel.
>>
>> Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
>> ---
>>
>>   v2: rebased to latest master
>>
>>   meta/conf/distro/include/seperatebuilddir.inc     |  2 +-
>>   meta/recipes-devtools/json-c/json-c_0.11.bb       | 13 +++++++++++++
>>   meta/recipes-devtools/libjson/libjson_0.9.bb      | 14 --------------
>>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc |  2 +-
>>   4 files changed, 15 insertions(+), 16 deletions(-)
>>   create mode 100644 meta/recipes-devtools/json-c/json-c_0.11.bb
>>   delete mode 100644 meta/recipes-devtools/libjson/libjson_0.9.bb
>>
>> diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
>> index c067183..e1a5c6b 100644
>> --- a/meta/conf/distro/include/seperatebuilddir.inc
>> +++ b/meta/conf/distro/include/seperatebuilddir.inc
>> @@ -294,7 +294,7 @@ B_pn-libice = "${SEPB}"
>>   B_pn-libice-native = "${SEPB}"
>>   B_pn-libid3tag = "${SEPB}"
>>   B_pn-libidn = "${SEPB}"
>> -B_pn-libjson = "${SEPB}"
>> +B_pn-json-c = "${SEPB}"
>>   B_pn-libksba = "${SEPB}"
>>   B_pn-libmad = "${SEPB}"
>>   B_pn-libmatchbox = "${SEPB}"
>> diff --git a/meta/recipes-devtools/json-c/json-c_0.11.bb b/meta/recipes-devtools/json-c/json-c_0.11.bb
>> new file mode 100644
>> index 0000000..e0391f5
>> --- /dev/null
>> +++ b/meta/recipes-devtools/json-c/json-c_0.11.bb
>> @@ -0,0 +1,13 @@
>> +SUMMARY = "JSON-C implements a reference counting object model that allows you to easily construct JSON objects in C"
>> +HOMEPAGE = "https://github.com/json-c/json-c/wiki"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
>> +
>> +SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${P}.tar.gz"
>
>
> be explicit and use BPN-PV so that if someday someone creates a
> mutation with native of nativesdk then it works there too.
> and keep RPROVIDE'ing libjson might make folks with feeds happier.
> and use git format-patch -M next time

Thanks for the feedback Khem. My local copy actually has the RPROVIDES 
already and that will come in V3. The patch was formatted with -M, I 
think git couldn't cope with the move and the changes, so just decided 
it was a full rewrite.

As for the BPN-PV, I don't really understand, I just grepped for 
libjson, and changed all the occurrences... the separate build dir being 
one of them, how would you expect the change to look?

Cheers,
Jack.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

-- 

