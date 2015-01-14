Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E80DE72BAB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 18:59:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 14 Jan 2015 10:57:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,757,1413270000"; d="scan'208";a="661874170"
Received: from unknown (HELO swold-mobl5.amr.corp.intel.com) ([10.252.252.162])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2015 10:59:52 -0800
Message-ID: <54B6BCA7.7080402@linux.intel.com>
Date: Wed, 14 Jan 2015 10:59:51 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1420843293.git.sgw@linux.intel.com>
	<932bb762022801092df9d39dd5eb25aadcf1c2cf.1420843293.git.sgw@linux.intel.com>
	<54B6BBA9.20501@gmail.com>
In-Reply-To: <54B6BBA9.20501@gmail.com>
Subject: Re: [PATCH 3/5] security_flags: disable pie support for libaio, blktrace and ltp
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
X-List-Received-Date: Wed, 14 Jan 2015 19:00:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/14/2015 10:55 AM, akuster808 wrote:
> Do we need this for Dizzy?
>

No this is not needed for dizzy, this is something that happened after I 
updated libaio, so it's just affects the new libaio with blktrace and ltp.

Sau!

> - armin
>
> On 01/09/2015 02:51 PM, Saul Wold wrote:
>> libaio when built with pie and fpie does not link correctly with
>> blktrace or ltp
>> so we need to disable those flags until a better solution comes along.
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   meta/conf/distro/include/security_flags.inc | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/conf/distro/include/security_flags.inc
>> b/meta/conf/distro/include/security_flags.inc
>> index 840f68a..d6f7e9c 100644
>> --- a/meta/conf/distro/include/security_flags.inc
>> +++ b/meta/conf/distro/include/security_flags.inc
>> @@ -16,6 +16,7 @@ SECURITY_CFLAGS_pn-lttng-tools_arm =
>> "${SECURITY_NO_PIE_CFLAGS}"
>>
>>   SECURITY_CFLAGS_pn-aspell = "${SECURITY_NO_PIE_CFLAGS}"
>>   SECURITY_CFLAGS_pn-beecrypt = "${SECURITY_NO_PIE_CFLAGS}"
>> +SECURITY_CFLAGS_pn-blktrace = "${SECURITY_NO_PIE_CFLAGS}"
>>   # Curl seems to check for FORTIFY_SOURCE in CFLAGS, but even assigned
>>   # to CPPFLAGS it gets picked into CFLAGS in bitbake.
>>   #TARGET_CPPFLAGS_pn-curl += "-D_FORTIFY_SOURCE=2"
>> @@ -43,6 +44,7 @@ SECURITY_CFLAGS_pn-gst-plugins-gl =
>> "${SECURITY_NO_PIE_CFLAGS}"
>>   SECURITY_CFLAGS_pn-gstreamer1.0-plugins-good =
>> "${SECURITY_NO_PIE_CFLAGS}"
>>   SECURITY_CFLAGS_pn-harfbuzz = "${SECURITY_NO_PIE_CFLAGS}"
>>   SECURITY_CFLAGS_pn-kexec-tools = "${SECURITY_NO_PIE_CFLAGS}"
>> +SECURITY_CFLAGS_pn-libaio = "${SECURITY_NO_PIE_CFLAGS}"
>>   SECURITY_CFLAGS_pn-libcap = "${SECURITY_NO_PIE_CFLAGS}"
>>   SECURITY_CFLAGS_pn-libgcc = "${SECURITY_NO_PIE_CFLAGS}"
>>   SECURITY_CFLAGS_pn-libid3tag = "${SECURITY_NO_PIE_CFLAGS}"
>> @@ -51,6 +53,7 @@ SECURITY_CFLAGS_pn-libglu = "${SECURITY_NO_PIE_CFLAGS}"
>>   SECURITY_CFLAGS_pn-libpcap = "${SECURITY_NO_PIE_CFLAGS}"
>>   SECURITY_CFLAGS_pn-libpcre = "${SECURITY_NO_PIE_CFLAGS}"
>>   SECURITY_CFLAGS_pn-libproxy = "${SECURITY_NO_PIE_CFLAGS}"
>> +SECURITY_CFLAGS_pn-ltp = "${SECURITY_NO_PIE_CFLAGS}"
>>   SECURITY_CFLAGS_pn-lttng-ust = "${SECURITY_NO_PIE_CFLAGS}"
>>   SECURITY_CFLAGS_pn-mesa = "${SECURITY_NO_PIE_CFLAGS}"
>>   SECURITY_CFLAGS_pn-mesa-gl = "${SECURITY_NO_PIE_CFLAGS}"
>>

