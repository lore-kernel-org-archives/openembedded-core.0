Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QMLZZ-0006Zq-8o
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 16:48:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4HEjcRa002364
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 07:45:38 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 17 May 2011 07:45:38 -0700
Message-ID: <4DD28A11.6080003@windriver.com>
Date: Tue, 17 May 2011 09:45:37 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1305633118.2429.188.camel@phil-desktop>	<1305633770.3424.229.camel@rex>	<1305634164.2429.193.camel@phil-desktop>	<1305641835.2429.228.camel@phil-desktop>
	<1305642925.3424.251.camel@rex>
In-Reply-To: <1305642925.3424.251.camel@rex>
Subject: Re: [PATCH v2] image-prelink: remove hardcoded path assumptions
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
X-List-Received-Date: Tue, 17 May 2011 14:48:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 5/17/11 9:35 AM, Richard Purdie wrote:
> On Tue, 2011-05-17 at 15:17 +0100, Phil Blundell wrote:
>> Signed-off-by: Phil Blundell <philb@gnu.org>
>> ---
>>  meta/classes/image-prelink.bbclass |   13 +++++--------
>>  1 files changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
>> index ee0951c..350c29d 100644
>> --- a/meta/classes/image-prelink.bbclass
>> +++ b/meta/classes/image-prelink.bbclass

...

>>  	# prelink!
>> -	${STAGING_DIR_NATIVE}/usr/sbin/prelink --root ${IMAGE_ROOTFS} -amR
>> +	${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf

...

>>  
>> -	# Cleanup temporary file, it's not needed...
>> -	rm -f ${IMAGE_ROOTFS}/etc/prelink.cache
>> -
> 
> The patch description and what it does don't quite match (the rm is
> removed and options are added to prelink).

I agree the commit message needs some more description.  Just as an FYI.  The -N
option causes the prelinker to not generate/save the cache file.  While the -c
tells it to read a specific .conf file.

So the actual code changes are good, the description is the only thing that
needs to be improved, so someone not familiar with the prelinker can understand
the change.

--Mark

> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



