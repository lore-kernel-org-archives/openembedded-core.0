Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 983F765D20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 06:28:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5P6S2BD021214
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 23:28:02 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Tue, 24 Jun 2014 23:28:01 -0700
Message-ID: <53AA6BEF.70300@windriver.com>
Date: Wed, 25 Jun 2014 14:27:59 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1403490121.git.kai.kang@windriver.com>
	<a55237b35d54e1c135ac51d273317ae3002a4906.1403490121.git.kai.kang@windriver.com>
	<20140624061105.GC22071@ad.chargestorm.se>
In-Reply-To: <20140624061105.GC22071@ad.chargestorm.se>
X-Originating-IP: [128.224.162.231]
Subject: Re: [PATCH 1/5] iptables: update RRECOMMENDS
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
X-List-Received-Date: Wed, 25 Jun 2014 06:28:02 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年06月24日 14:11, Anders Darander wrote:
> * Kai Kang <kai.kang@windriver.com> [140623 04:34]:
>
>> @@ -15,7 +15,13 @@ RRECOMMENDS_${PN} = "kernel-module-x-tables \
>>                        kernel-module-nf-conntrack \
>>                        kernel-module-nf-conntrack-ipv4 \
>>                        kernel-module-nf-nat \
>> -                     kernel-module-ipt-masquerade"
>> +                     kernel-module-ipt-masquerade \
>> +                     kernel-module-xt-tcpudp \
>> +                     kernel-module-xt-conntrack \
>> +                     kernel-module-ipt-reject \
>> +                     kernel-module-ip6-tables \
>> +                     kernel-module-ip6table-filter \
>> +                    "
> As it's for RRECOMMENDS_${PN} your patch will likely work for everyong.
> Though, you should really only add the ip6* kernel modules if ipv6 is in
> DISTRO_FEATURES.

OK.

Thanks,
Kai



>
> Cheers,
> Anders
>
> (And as a completely unrelated side note, I wonder if it isn't time to
> start looking at adding an ipv4 DISTRO_FEATURE to make it easier to
> build IPv6 only devices...)
>


-- 
Regards,
Neil | Kai Kang


