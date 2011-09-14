Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R3qYu-0002MV-9j
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 16:35:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8EEUSj4029948
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 07:30:28 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 14 Sep 2011 07:30:27 -0700
Message-ID: <4E70BA82.60606@windriver.com>
Date: Wed, 14 Sep 2011 09:30:26 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <840A81C1B782724A8EB52725BD519EFF18E621@MBX20.4emm.local>
	<4E6A3770.4060307@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF18E85D@MBX20.4emm.local>
	<4E6E1C1D.7010500@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF18E950@MBX20.4emm.local>
	<1315905402.2519.116.camel@phil-desktop>
	<4E6FFAC6.60404@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF18EAAF@MBX20.4emm.local>
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF18EAAF@MBX20.4emm.local>
Subject: Re: Problem with new image-prelink
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
X-List-Received-Date: Wed, 14 Sep 2011 14:35:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/13/11 8:33 PM, James Limbouris wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Mark Hatle
>> Sent: Wednesday, 14 September 2011 8:52 AM
>> To: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] Problem with new image-prelink
>>
>> Please try the new version of the prelinker.  I just sent a pull request for it,
>> but there was a missing typecast on a printf.  This was causing problems on
>> various systems, and likely could be causing the issue that you observed on
>> ARM
>> as well.
>>
>> I did build the latest version for the ARM target, and successfully ran it there
>> under QEMU.
>>
>> --Mark
> 
> Thanks Mark - all working, on host and target.

Does this also resolve the initial issue you found, QT failing to work after
prelinking?

If not, I'd like to open a new defect on it and see if we can figure out the
cause still...

--Mark

> James
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



