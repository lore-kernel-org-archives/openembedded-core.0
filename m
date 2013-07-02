Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D007261FB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 09:02:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6292rkv015922
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jul 2013 02:02:53 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 2 Jul 2013 02:02:51 -0700
Message-ID: <51D29755.2050507@windriver.com>
Date: Tue, 2 Jul 2013 17:03:17 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1372705105-28268-1-git-send-email-sgw@linux.intel.com>
	<0FAF444A-57CC-45EA-A2A3-3C5B82A9CF79@dominion.thruhere.net>
In-Reply-To: <0FAF444A-57CC-45EA-A2A3-3C5B82A9CF79@dominion.thruhere.net>
X-Originating-IP: [128.224.162.233]
Subject: Re: [PATCH] udev: Add RRECOMMENDS for udev-cache to enable the cache
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
X-List-Received-Date: Tue, 02 Jul 2013 09:02:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2013 04:42 PM, Koen Kooi wrote:
> Op 1 jul. 2013, om 20:58 heeft Saul Wold <sgw@linux.intel.com> het volgende geschreven:
>
>> This will enable the udev cache for sysvinit systems, which does improve post-first
>> boots.
> But will it stay disabled for non-sysv init systems?

I think so. After all, it's not recommended in systemd.
For systemd init systems, there's really no reason to enable udev-cache, 
from my point of view.

Best Regards,
Chen Qi

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


