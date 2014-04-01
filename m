Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 988A56F9F7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 18:01:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s31I1EKu028024
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Apr 2014 11:01:14 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Tue, 1 Apr 2014 11:01:13 -0700
Message-ID: <533AFEE9.6050001@windriver.com>
Date: Tue, 1 Apr 2014 13:01:13 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <8672BB614B4CCA40A6B3BDD6FD82050B575445A7@COSNADEXC13.usr.ingenico.loc>	<1396374241.5879.50.camel@phil-desktop.brightsign>	<1396374515.5879.54.camel@phil-desktop.brightsign>
	<1396374702.2910.27.camel@ted>
In-Reply-To: <1396374702.2910.27.camel@ted>
Subject: Re: image.bbclass: USE_DEVFS is now useless
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
X-List-Received-Date: Tue, 01 Apr 2014 18:01:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/14, 12:51 PM, Richard Purdie wrote:
> On Tue, 2014-04-01 at 18:48 +0100, Phil Blundell wrote:
>> Also note that the default for USE_DEVFS was (and is) 1, so the lack
>> of this check is actually causing a difference in the default
>> behaviour.  If there's no appetite for reinstating the USE_DEVFS
>> mechanism per se then it seems like it would be a good idea to make
>> the default IMAGE_DEVICE_TABLE be blank in order to restore the
>> previous default of no /dev in the rootfs.
>>
>> At present you get a somewhat arbitrary-seeming smattering of devices
>> from meta/files/device_table-minimal.txt, including such anachronisms
>> as /dev/ttySA0 and /dev/apm_bios.  It's hard to imagine that anybody
>> actually wants this stuff in their rootfs in this day and age.
>
> Can we kill apmd at the same time? Please? :)

Isn't this still used on some ARM and MIPS targets?  (they emulate apm for basic 
power management.)

If that's finally gone away -- I'd love to finally kill apmd and related.

--Mark

> Cheers,
>
> Richard
>


