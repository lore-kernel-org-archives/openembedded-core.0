Received: from mx19.lb01.inode.at ([62.99.145.21] helo=mx.inode.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wolfram.stering@hale.at>) id 1RNo5d-0004ZH-MC
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 16:59:58 +0100
Received: from [83.64.51.210] (port=10461 helo=gateway1.hale)
	by smartmx-19.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <wolfram.stering@hale.at>)
	id 1RNnzX-0007cb-UF for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 16:53:40 +0100
Received: from mail1.hale.at (mail2.hale [192.168.100.12])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id pA8FreT8005348
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 16:53:40 +0100
Received: from entw42.hale ([192.168.100.73]) by hale.at with MailEnable ESMTP;
	Tue, 8 Nov 2011 16:53:32 +0100
Message-ID: <4EB9507C.8060507@hale.at>
Date: Tue, 08 Nov 2011 16:53:32 +0100
From: Wolfram Stering <wolfram.stering@hale.at>
Organization: HALE electronic GmbH
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110928 Fedora/3.1.15-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1320190748.git.elizabeth.flanagan@intel.com>	<4EB90155.3070705@hale.at>
	<1320761558.10843.39.camel@ted>
In-Reply-To: <1320761558.10843.39.camel@ted>
X-Enigmail-Version: 1.1.2
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: pA8FreT8005348
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: wolfram.stering@hale.at
MailScanner-NULL-Check: 1321372422.10948@cmpA/Evh0kc6um9zVXDQNQ
X-Spam-Status: No
Subject: Re: [PATCH 0/1] [Yocto Bug 1700] Fix for buildstats diskio on	non physical disks
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
X-List-Received-Date: Tue, 08 Nov 2011 15:59:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 11/08/2011 03:12 PM, Richard Purdie wrote:
> On Tue, 2011-11-08 at 11:15 +0100, Wolfram Stering wrote:
>> On 11/02/2011 07:41 AM, Beth Flanagan wrote:
>>> From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
>>>
>>> tmpfs/encryptfs/ramfs have no entry in /proc/diskstats. This modifies 
>>> buildstats to not collect diskio statistics when we encounter a case where 
>>> the os.major/os.minor is not represented with an entry in /proc/diskstats.
>> A similar issue exists for building on a btrfs partition.
>> I posted a message on Oct 28 concerning buildstats on btrfs volumes.
>> The problem there is, that btrfs's stat() reports fake device ids that
>> cannot be found in /proc/diskstats.
> Did this patch help address that problem for you too?

I'll be able to check that tomorrow and report back.

regards,

- wolfi

> Cheers,
>
> Richard



-- 
Wolfram Stering
 (Entwicklung)
HALE electronic GmbH
Eugen-Müller-Straße 18, 5020 Salzburg, Austria
 Tel: +43 (662) 439011 550
 Fax: +43 (662) 439011 9
http://www.hale.at/
Firmenbuchnummer: FN 66801m HG Salzburg



--
Scanned by MailScanner.



