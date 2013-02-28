Received: from exprod5og108.obsmtp.com ([64.18.0.186])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.donnelly@ge.com>) id 1UB5Yq-0003D8-1C
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 16:38:30 +0100
Received: from alpmlip10.e2k.ad.ge.com ([12.43.191.1]) (using TLSv1) by
	exprod5ob108.postini.com ([64.18.4.12]) with SMTP
	ID DSNKUS92Fl/fHPxeDPsYiLmSW3mCQVtmHQgm@postini.com;
	Thu, 28 Feb 2013 07:22:00 PST
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by alpmlip10.e2k.ad.ge.com with ESMTP/TLS/RC4-SHA;
	28 Feb 2013 10:18:03 -0500
Received: from selma.edi.geip.ge.com ([3.26.68.70])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 28 Feb 2013 10:18:02 -0500
Received: from [3.26.68.199] (fyvie.edi.geip.ge.com [3.26.68.199])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by selma.edi.geip.ge.com (Postfix) with ESMTPS id 3DACAE21E0;
	Thu, 28 Feb 2013 15:18:01 +0000 (GMT)
Message-ID: <512F7528.3050605@ge.com>
Date: Thu, 28 Feb 2013 15:18:00 +0000
From: Martin Donnelly <martin.donnelly@ge.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130215 Thunderbird/17.0.3
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <434694260eb81cd89b2911f4169d2f23f1cf7cab.1361890071.git.martin.donnelly@ge.com>
	<63c4fc136f2bd29337c20a277af9f8996d237bfe.1361890071.git.martin.donnelly@ge.com>
	<512EE090.3070304@linux.intel.com>
In-Reply-To: <512EE090.3070304@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] shadow: remove grpconv argc check
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
X-List-Received-Date: Thu, 28 Feb 2013 15:38:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 28/02/2013 04:44, Saul Wold wrote:
> On 02/27/2013 04:58 AM, Martin Donnelly wrote:
>> The patched version of grpconv takes arguments but the check on
>> argc was not removed. This patch removes this check which
>> otherwise results in a spurious warning during rootfs creation.
>>
>> Signed-off-by: Martin Donnelly <martin.donnelly@ge.com>
>> ---
>>   .../shadow/files/add_root_cmd_options.patch        |   12 +++++++++++-
>>   1 files changed, 11 insertions(+), 1 deletions(-)
>>
>> diff --git
>> a/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
>> b/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
>> index 5edd3b8..ab87e35 100644
>> --- a/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
>> +++ b/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
>
> This patch needs a header also with Upstream-Status: Signed-off-by: and
> a brief explaination (if needed).
>

The existing patch already has the header and Upstream-Status in it, my 
patch to it simply makes the behaviour of the modified pwconv and 
grpconv in shadow-native consistent. I'll resend this patch with the 
Signed-off-by added to the header if you still want that?

Thanks

Martin


