Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 69429612D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 09:00:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r629012r015877
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jul 2013 02:00:02 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 2 Jul 2013 01:59:59 -0700
Message-ID: <51D296A9.4030403@windriver.com>
Date: Tue, 2 Jul 2013 17:00:25 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1372711267.git.sgw@linux.intel.com>
	<be17effcbc2076d384a7ac882cdae817e4cbf4e9.1372711267.git.sgw@linux.intel.com>
	<3ABD2994-6D45-4A08-B298-C455A0AC05E8@dominion.thruhere.net>
In-Reply-To: <3ABD2994-6D45-4A08-B298-C455A0AC05E8@dominion.thruhere.net>
X-Originating-IP: [128.224.162.233]
Subject: Re: [PATCH 4/4 v2] udev: Add RRECOMMENDS for udev-cache to enable the cache
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
X-List-Received-Date: Tue, 02 Jul 2013 09:00:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2013 04:41 PM, Koen Kooi wrote:
> Op 1 jul. 2013, om 22:48 heeft Saul Wold <sgw@linux.intel.com> het volgende geschreven:
>
>> This will enable the udev cache for sysvinit systems, which does improve post-first
>> boots.
> Can I please get some numbers on that? I haven't used it for years since it actually slowed down boot when I started measuring it and besides that, it's flakey as hell.
On my machine, a minimal image for qemux86 takes about 5 to 6 seconds 
for the udev to finish, with udev cache enabled, it takes less than 1 
second (of course, not for first boot).

//Chen Qi

>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


