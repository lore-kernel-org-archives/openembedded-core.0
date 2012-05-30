Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SZkXz-0005Aw-Aq
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 17:10:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4UF0VlV014743
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 08:00:31 -0700 (PDT)
Received: from msp-dhcp40.wrs.com (172.25.34.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 30 May 2012 08:00:30 -0700
Message-ID: <4FC6360E.1010007@windriver.com>
Date: Wed, 30 May 2012 10:00:30 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <E071AE73-05A7-4D16-9442-952E65ECA96C@gmail.com>
	<4FC51727.6020205@windriver.com>
	<2A530553-23DF-4CB1-A957-0E2C3D468BDA@gmail.com>
	<CAMKF1sq_G6k_o+o=OZrhuz2iNq6EEhTYT67dA1cssU3LFS5cYQ@mail.gmail.com>
	<CAAB-1yxXDY4O-JV_gpW8eBmfXU=-Jcp4yc0oqZe1WVr6T-rn_w@mail.gmail.com>
	<559834C0-53F2-4E17-8A48-4061CDB0B63B@gmail.com>
In-Reply-To: <559834C0-53F2-4E17-8A48-4061CDB0B63B@gmail.com>
Subject: Re: meta-xilinx: ERROR: Failure expanding variable TUNE_PKGARCH ppc440
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
X-List-Received-Date: Wed, 30 May 2012 15:10:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/12 9:47 AM, Elvis Dowson wrote:
> Hi Khem,
>
>> On Tue, May 29, 2012 at 9:56 PM, Khem Raj<raj.khem@gmail.com>  wrote:
>>> On Tue, May 29, 2012 at 12:46 PM, Elvis Dowson<elvis.dowson@gmail.com>  wrote:
>>>> PACKAGE_EXTRA_ARCHS_tune-ppc440 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc440"
>>>
>>> may be this should be be
>>>
>>>   PACKAGE_EXTRA_ARCHS_tune-ppc440 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppc440"
>>>
>>> other pieces look good
>
>
> What does the -nf suffix do ?

-nf means "no floating" point math.

There are variants of the ppc4xx lines with and without classic Power floating 
point units.

--Mark

> Best regards,
>
> Elvis Dowson
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



