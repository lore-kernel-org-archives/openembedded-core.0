Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TJoD7-0006O6-5Q
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 18:23:41 +0200
Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 04 Oct 2012 09:10:16 -0700
Received: by mail-pb0-f47.google.com with SMTP id ro12so733359pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 09:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=haLFEGrET2khTdlBprq7pDGT1EGVAwISdPxGqvJ1mQ4=;
	b=i5EGSG1ecvf1+pHfsj4zY5K8fJAyP267Vb1QRYJXwYBUo1vi/CYb29cSPHOZVOj8xw
	1c60c74R1Lvdzqme9PBZ2RzUabwbM9VLtgHLjpwzeiFHEAUCeoaMbt/0fwAP8SZqDFnB
	2WkehAMWtvSHbT/++Rq5KotmHUY7JVj3Fbd5U+L8hdN1VTVTbXPr/gg2Vk7Zara2AUte
	hK/jC0KHnmoAV+YRm8muT6gZ9GqerN9yWR4VvoVQqPKQ5SQ45Fojz0WEIDBxIJK3WaTY
	/JDab5a9c/mAAfrQQs6emmLcu9Znrg9pX9YDjvQLMe98NQnNzmzQ1QPan/AtU+7+E5Ue
	R6Kw==
Received: by 10.66.87.132 with SMTP id ay4mr14269032pab.82.1349367034403;
	Thu, 04 Oct 2012 09:10:34 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id s10sm4469902paz.11.2012.10.04.09.10.33
	(version=SSLv3 cipher=OTHER); Thu, 04 Oct 2012 09:10:33 -0700 (PDT)
Message-ID: <506DB4FA.2040909@intel.com>
Date: Thu, 04 Oct 2012 09:10:34 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1349213439-14199-1-git-send-email-Chase.Maupin@ti.com>
	<1349342479.18301.68.camel@ted>
	<7D46E86EC0A8354091174257B2FED10159242C29@DLEE12.ent.ti.com>
	<1349355495.18301.93.camel@ted>
	<7D46E86EC0A8354091174257B2FED10159242E7C@DLEE12.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015924332D@DLEE12.ent.ti.com>
	<1349360984.18301.103.camel@ted>
	<7D46E86EC0A8354091174257B2FED10159243885@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159243885@DLEE12.ent.ti.com>
X-Gm-Message-State: ALoCoQmFR/E0twfUZ23WlMpW97SFwprzJj4JxE+sBNIrrXIBwBs/Km+VNwV4V8MNf8g1JUIeRutb
Subject: Re: [PATCH] libtool: Add missing DEPENDS on libtool-cross
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 16:23:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2012 08:50 AM, Maupin, Chase wrote:
>> -----Original Message----- From: Richard Purdie
>> [mailto:richard.purdie@linuxfoundation.org] Sent: Thursday, October
>> 04, 2012 9:30 AM To: Maupin, Chase Cc:
>> openembedded-core@lists.openembedded.org Subject: RE: [OE-core]
>> [PATCH] libtool: Add missing DEPENDS on libtool-cross
>>
>> On Thu, 2012-10-04 at 14:06 +0000, Maupin, Chase wrote:
>>> I tried the following to help narrow this down.  Please let me
>> know if there is something else I could try to help narrow the
>> issue.  I ran:
>>>
>>> bitbake -c cleanall libtool bitbake libtool
>>>
>>> Each time it failed I would get a list of the contents of the
>> work directory and the stamps directory.  My goal here was to be
>> able to find what changed between a pass and a fail.  I kept
>> running the test above until I had a consistent failure, and there
>> were no new packages being added into my work directory and no new
>> stamps being created.  Basically this told me that all the packages
>> that were going to be built from doing "bitbake libtool" were built
>> and that the only package being built was libtool itself.
>>>
>>> I then changed my build steps to do:
>>>
>>> bitbake -c cleanall libtool bitbake libtool-cross bitbake
>>> libtool
>>>
>>> This passed on the first run.  I captured the same work
>> directory contents and stamps contents and then did a diff to see
>> what had changed between these builds.  The diffs were:
>>>
>>> For Stamps diff libtool-failed-stamps libtool-passed-stamps
>>> -----------------------------------------------------------
>>> /arago-tmp-eglibc/stamps$ diff -burpN libtool-failed-stamps
>> libtool-passed-stamps
>>> --- libtool-failed-stamps	2012-10-04 09:11:27.909881710 -0500 +++
>>> libtool-passed-stamps	2012-10-04 09:14:33.997328844 -0500 @@
>>> -23,18 +23,56 @@ external-arago-toolchain-1.0-r2.do_popul
>>> external-arago-toolchain-1.0-
>> r2.do_populate_sysroot.sigdata.bccac35b2b6fecd3cbec49ccc208c6a9
>>> external-arago-toolchain-1.0-r2.do_unpack
>>> external-arago-toolchain-1.0-
>> r2.do_unpack.sigdata.14d8090b51a447ceb4ccf44941781e47
>>> +libtool-2.4.2-r3.0.do_build libtool-2.4.2-r3.0.do_cleansstate
>>> libtool-2.4.2-
>> r3.0.do_cleansstate.sigdata.e2a5d5c89e3be41823e835c18b50dfa3
>>> +libtool-2.4.2-r3.0.do_compile +libtool-2.4.2-
>> r3.0.do_compile.sigdata.ea5125c6ecc524aed598dba3b731d92d
>>> +libtool-2.4.2-r3.0.do_configure +libtool-2.4.2-
>> r3.0.do_configure.sigdata.2e462cacc7c699c75bce74bb7dcf55f4
>>> libtool-2.4.2-r3.0.do_create_srcipk libtool-2.4.2-
>> r3.0.do_create_srcipk.sigdata.caa56f6b8b195ff4e6a063f1288c5f86
>>> libtool-2.4.2-r3.0.do_fetch libtool-2.4.2-
>> r3.0.do_fetch.sigdata.0ccdbfe0aace02237038ae0203de9060
>>> +libtool-2.4.2-r3.0.do_install +libtool-2.4.2-
>> r3.0.do_install.sigdata.9ad203ae762fe0556e7a991ab8a7707c
>>> +libtool-2.4.2-r3.0.do_package.am335x-evm +libtool-2.4.2-
>> r3.0.do_package.sigdata.ffb4b811e7643d5f37afbcffef84f5e8
>>> +libtool-2.4.2-r3.0.do_package_write
>>> +libtool-2.4.2-r3.0.do_package_write_ipk +libtool-2.4.2-
>> r3.0.do_package_write_ipk.sigdata.eb16601f7f4f1afbfabc8542fea3af3
>> 0
>>> libtool-2.4.2-r3.0.do_patch libtool-2.4.2-
>> r3.0.do_patch.sigdata.7d028f6dc6a1bdf32aadc29a6444bebc
>>> libtool-2.4.2-r3.0.do_populate_lic libtool-2.4.2-
>> r3.0.do_populate_lic.sigdata.ebd50cceb0903e1b277ad6f533055373
>>> +libtool-2.4.2-r3.0.do_populate_sysroot.am335x-evm
>>> +libtool-2.4.2-
>> r3.0.do_populate_sysroot.sigdata.43f8d1df81e38dacd301eed5599094f1
>>> libtool-2.4.2-r3.0.do_unpack libtool-2.4.2-
>> r3.0.do_unpack.sigdata.f97c2643ec8f5752b2537f305a45ca7e
>>> +libtool-cross-2.4.2-r3.1.do_build
>>> +libtool-cross-2.4.2-r3.1.do_compile +libtool-cross-2.4.2-
>> r3.1.do_compile.sigdata.c04f058e41aabe9001f0b82764d51d24
>>> +libtool-cross-2.4.2-r3.1.do_configure +libtool-cross-2.4.2-
>> r3.1.do_configure.sigdata.b37940faf1adfcc783e7a66eff351d4b
>>> +libtool-cross-2.4.2-r3.1.do_create_srcipk +libtool-cross-2.4.2-
>> r3.1.do_create_srcipk.sigdata.37082cdfd6eb100923aab805101fe221
>>> +libtool-cross-2.4.2-r3.1.do_fetch +libtool-cross-2.4.2-
>> r3.1.do_fetch.sigdata.79da02e9de369c7964c9b54e291088d5
>>> +libtool-cross-2.4.2-r3.1.do_install +libtool-cross-2.4.2-
>> r3.1.do_install.sigdata.607177b917d48c411c6c2fbaf475867b
>>> +libtool-cross-2.4.2-r3.1.do_package.am335x-evm
>>> +libtool-cross-2.4.2-
>> r3.1.do_package.sigdata.4f0eb910d74ff36b564968e09a8e15f2
>>> +libtool-cross-2.4.2-r3.1.do_package_write
>>> +libtool-cross-2.4.2-r3.1.do_package_write_ipk
>>> +libtool-cross-2.4.2-
>> r3.1.do_package_write_ipk.sigdata.0cc36358a4c5dee1f612fe3a90c60b1
>> a
>>> +libtool-cross-2.4.2-r3.1.do_patch +libtool-cross-2.4.2-
>> r3.1.do_patch.sigdata.a319c3ae77229a7558409abc179ea99d
>>> +libtool-cross-2.4.2-r3.1.do_populate_lic +libtool-cross-2.4.2-
>> r3.1.do_populate_lic.sigdata.82a19386b4380a0077d2b55f8934851a
>>> +libtool-cross-2.4.2-r3.1.do_populate_sysroot.am335x-evm
>>> +libtool-cross-2.4.2-
>> r3.1.do_populate_sysroot.sigdata.8c61b5566945f9a439faa916d70a9fd0
>>> +libtool-cross-2.4.2-r3.1.do_unpack +libtool-cross-2.4.2-
>> r3.1.do_unpack.sigdata.322a15e21f6df957f5ba116da19d5585
>>> linux-libc-headers-3.2-r1.do_compile linux-libc-headers-3.2-
>> r1.do_compile.sigdata.6047c862356fa8f3a56269daf2cde26b
>>> linux-libc-headers-3.2-r1.do_configure
>>>
>>> Notice that the only stamps for steps done between a passing
>> and failing build are for the libtool-cross, as well as the steps
>> after the do_configure step of libtool since it passed this time.
>>>
>>> The work directory difference was
>>> ----------------------------------- --- libtool-failed-work
>>> 2012-10-04 09:17:50.137609986 -0500 +++ libtool-passed-work
>>> 2012-10-04 09:17:50.137609986 -0500 @@ -39,4 +39,5 @@
>>> unifdef-native-2.6.18+git-r0 zlib-native-1.2.6-r1
>>> external-arago-toolchain-1.0-r2 libtool-2.4.2-r3.0
>>> +libtool-cross-2.4.2-r3.1 linux-libc-headers-3.2-r1
>>>
>>> So the only new package I saw show-up in my work directory was
>> libtool-cross.
>>>
>>> Does anyone have any other suggestions of what to look at since
>> my
>>> testing is showing that adding libtool-cross into the build
>> before
>>> libtool allows the build to pass.  I'll try going back to the
>> internal
>>> toolchain instead of my external toolchain as another test to
>> run but
>>> any other ideas would be appreciated.  Is my approach above
>> even
>>> valid?
>>
>> A list of file differences in the sysroots directory would help
>> here. Given the above, this amounts to the contents of the
>> libtool- cross package. Are you able to reproduce this with master
>> or is this denzil based?
>
> It was denzil based, but once I switched to the internal toolchain
> instead of using the external toolchain the issue doesn't occur.  So
> it seems to be rooted in the external toolchain recipe we are using.
> Sorry for the confusion and please ignore this patch.

I have now removed this from my sgarman/deznil-next branches, and this 
happened just in time, as I'm about to start an autobuilder run.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


