Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1UCdi5-0001SA-Gd
	for Openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 23:18:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r24M1h83003395
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Mar 2013 14:01:43 -0800 (PST)
Received: from [172.25.32.35] (172.25.32.35) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 4 Mar 2013 14:01:43 -0800
Message-ID: <513519C6.6000700@windriver.com>
Date: Mon, 4 Mar 2013 16:01:42 -0600
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1361930646-10689-1-git-send-email-jason.wessel@windriver.com>
	<512EB861.1050504@linux.intel.com>
In-Reply-To: <512EB861.1050504@linux.intel.com>
X-Enigmail-Version: 1.5.1
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] syslinux.bbclass: Add a default serial console option and real boot menu support
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
X-List-Received-Date: Mon, 04 Mar 2013 22:18:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 02/27/2013 07:52 PM, Saul Wold wrote:
> On 02/26/2013 06:04 PM, Jason Wessel wrote:
>>   syslinux_iso_populate() {
>>   	syslinux_populate ${ISODIR} ${ISOLINUXDIR} isolinux.cfg
>>   	install -m 0644 ${STAGING_LIBDIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
>> +	if [ x${AUTO_SYSLINUXMENU} = x1 ] ; then
> I believe that the convention is for these string tests to be quoted, 
> here and below.

No problem.  I'll fix that.  Someone's mail server was hoarding mail for bulk delivery (I'll assume it was mine given the influx in the past 24 hours).  I didn't get this until yesterday but it looks like it was sent last week.

I'll send a v2 of the patch shortly.

Cheers,
Jason.


