Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1RJA9i-0004fQ-HO
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 22:32:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9QKQrMs012976
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Oct 2011 13:26:53 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 26 Oct 2011 13:26:53 -0700
Message-ID: <4EA86D09.6070704@windriver.com>
Date: Wed, 26 Oct 2011 16:26:49 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1319652972.git.bruce.ashfield@windriver.com>
	<0ec24ded3f71c54e544d953de65d142717f48022.1319652972.git.bruce.ashfield@windriver.com>
	<1319660702.9583.0.camel@ted>
In-Reply-To: <1319660702.9583.0.camel@ted>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 1/1] linux-libc-headers: provide 3.0.x and 3.1 headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Oct 2011 20:32:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11-10-26 04:25 PM, Richard Purdie wrote:
> On Wed, 2011-10-26 at 14:25 -0400, Bruce Ashfield wrote:
>> This changes makes two different 3.x headers available to the
>> toolchain. The latest 3.0.x and 3.1 tarballs. Compatibility is
>> maintained with older 2.6 headers by creating a new variable
>> that changes the SRC_URI based on the major version number of
>> the kernel.
>>
>> Tested with 2.6.37.2, 3.0.8 and 3.1 builds and boots.
>>
>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>> ---
>>   meta/conf/distro/include/tcmode-default.inc        |    2 +-
>>   .../linux-libc-headers/linux-libc-headers.inc      |   15 +++++-
>>   .../linux-libc-headers/linux-libc-headers_3.0.8.bb |   53 ++++++++++++++++++++
>>   .../linux-libc-headers/linux-libc-headers_3.1.bb   |   53 ++++++++++++++++++++
>>   4 files changed, 120 insertions(+), 3 deletions(-)
>>   create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
>>   create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb
>
> Can someone please explain to me why we don't move some of the bits in
> the .bb file into the .inc rather than duplicating it each time?

I wondered the same thing. I can refactor it if no one
objects.

Bruce

>
> Cheers,
>
> Richard
>



