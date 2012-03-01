Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S35mF-00064r-05
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 14:10:35 +0100
Received: by wera1 with SMTP id a1so338167wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 05:02:05 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.74.177 as permitted sender)
	client-ip=10.180.74.177; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.74.177 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.74.177])
	by 10.180.74.177 with SMTP id u17mr10540800wiv.13.1330606925506
	(num_hops = 1); Thu, 01 Mar 2012 05:02:05 -0800 (PST)
Received: by 10.180.74.177 with SMTP id u17mr8430069wiv.13.1330606925459;
	Thu, 01 Mar 2012 05:02:05 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id df3sm41652053wib.1.2012.03.01.05.02.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 05:02:04 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAFZPMoaRYRE1Brig5x-1tnECa1AnFWfYfgg5Gx9qrRsB1EFH4w@mail.gmail.com>
Date: Thu, 1 Mar 2012 14:01:55 +0100
Message-Id: <E78EA744-42DE-4B8F-AC05-DD011DBFE229@dominion.thruhere.net>
References: <CAFZPMoaRYRE1Brig5x-1tnECa1AnFWfYfgg5Gx9qrRsB1EFH4w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnoo2jEdfPZZ49SZgjWgrfqa1l1PuoJfR/SCMc0kOatErOnqiFGgD4njX/W+GJP/audzwcJ
Subject: Re: multiple kernel builds
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
X-List-Received-Date: Thu, 01 Mar 2012 13:10:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 1 mrt. 2012, om 13:50 heeft Sergey Lapin het volgende geschreven:

> Hi, all!
> 
> How could I achieve multiple kernel packages builds in single build?
> 
> I need multiple kernel configurations for single hardware (which will
> live in single build and booted on
> request). So I need to put 2 uImages on one ubifs partition or
> different mtd partitions, which is ok.
> 
> But I need to build both in single run.
> 
> Any ideas?

Have a look at multi-kernel.inc in meta-ti.

regards,

Koen


