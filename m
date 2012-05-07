Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SRQqM-0002YE-JW
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 18:31:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q47GLYrd016167
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 May 2012 09:21:34 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 7 May 2012 09:21:34 -0700
Message-ID: <4FA7F687.6060407@windriver.com>
Date: Mon, 7 May 2012 11:21:27 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1336140272.23777.5.camel@ted>
	<40D28335-BD42-43A4-9414-3E760205A0C7@dominion.thruhere.net>
In-Reply-To: <40D28335-BD42-43A4-9414-3E760205A0C7@dominion.thruhere.net>
Subject: Re: sed: Explicitly disable acl for deterministic builds
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
X-List-Received-Date: Mon, 07 May 2012 16:31:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/4/12 9:15 AM, Koen Kooi wrote:
>
> Op 4 mei 2012, om 16:04 heeft Richard Purdie het volgende geschreven:
>
>>
>> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>> ---
>> diff --git a/meta/recipes-extended/sed/sed_4.2.1.bb b/meta/recipes-extended/sed/sed_4.2.1.bb
>> index 9fbb6e7..92f59e4 100644
>> --- a/meta/recipes-extended/sed/sed_4.2.1.bb
>> +++ b/meta/recipes-extended/sed/sed_4.2.1.bb
>> @@ -13,6 +13,8 @@ SRC_URI[sha256sum] = "8773541ce097fdc4c5b9e7da12a82dffbb30cd91f7bc169f52f05f93b7
>>
>> inherit autotools update-alternatives gettext
>>
>> +EXTRA_OECONF = "--disable-acl"

I'm wondering if ACLs should be a distro flag....

> Missing PR bump
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



