Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE21609B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 01:59:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6O1xSkO020057
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 18:59:28 -0700 (PDT)
Received: from msp-dhcp3.wrs.com (172.25.34.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 23 Jul 2014 18:59:28 -0700
Message-ID: <53D0687F.8050404@windriver.com>
Date: Wed, 23 Jul 2014 20:59:27 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1406155290-25903-1-git-send-email-ben.shelton@ni.com>	<20140723185052.74ad39d3@e6410-2>
	<CAMKF1sqy70-p_sJ9waC6yJGxxfcY=Fgbr=DdK6Cv019GM=YNEg@mail.gmail.com>
In-Reply-To: <CAMKF1sqy70-p_sJ9waC6yJGxxfcY=Fgbr=DdK6Cv019GM=YNEg@mail.gmail.com>
Subject: Re: [PATCH] eglibc: Make ld.so.conf more flexible
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
X-List-Received-Date: Thu, 24 Jul 2014 01:59:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/14, 8:48 PM, Khem Raj wrote:
> On Wed, Jul 23, 2014 at 4:50 PM, Peter Seebach
> <peter.seebach@windriver.com> wrote:
>> On Wed, 23 Jul 2014 17:41:30 -0500
>> Ben Shelton <ben.shelton@ni.com> wrote:
>>
>>> Most modern distros will include conf files in /etc/ld.so.conf.d/
>>> when generating the ld.so cache. This change will bring that flexibility.
>>
>> I was just looking at a patch to do roughly this. Mine added a
>> USE_LDCONFIG_CONF_D flag, and then had eglibc's install create the directory
>> and append that line to ld.so.conf if the flag was set. I'm not sure whether
>> the extra functionality justifies the effort. I would suggest that, if
>> this is going to be unconditionally present, the directory should be too.
>
> Many embedded systems dont use ldconfig and we have USE_LDCONFIG knob
> to control it.
> This should fall under that knob as well.

Original idea was two knobs.. one for USE_LDCONFIG, and one for using the 
ld.so.conf.d directory and setup.

The later has been requested of me many times, but we've not implemented it 
generically.  I think it's time to do so -- but it should be tied to 
USE_LDCONFIG at a minimum, I just don't know if it should always be enabled or 
just sometimes.  (Always means the ld.so.conf file gets the include line, so 
it's NOT a lot of bytes.)

--Mark

>>
>> -s
>> --
>> Listen, get this.  Nobody with a good compiler needs to be justified.
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


