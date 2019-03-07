Return-Path: <jan.kiszka@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id A46A37CF0B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 17:57:33 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x27HvScS026249
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 7 Mar 2019 18:57:28 +0100
Received: from [139.23.113.92] ([139.23.113.92])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x27HvS8b000871;
	Thu, 7 Mar 2019 18:57:28 +0100
To: "Davis, Michael" <michael.davis@essvote.com>
References: <46d4a7de-f19f-8fa2-63b7-f21431d3435c@siemens.com>
	<655290B7709079438B7932553958E60DA164130D@ESS-EX01.essvote.corp.local>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <58fb974f-6ed7-5f84-fc1d-5cbf2da7d4ab@siemens.com>
Date: Thu, 7 Mar 2019 18:57:28 +0100
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <655290B7709079438B7932553958E60DA164130D@ESS-EX01.essvote.corp.local>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: npm offline build for yocto
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
X-List-Received-Date: Thu, 07 Mar 2019 17:57:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07.03.19 15:22, Davis, Michael wrote:
> Unfortunately no.  I could never get the cache to prefill correctly with node 8 and haven't tried any of the newer versions.  The way they did the sha1/256/512 sums made it impossible to prefill the cache, and the import of tars just didn’t work.

I suspect the cache does not match packages coming in via different channels 
(add tarball vs. fetch url).

> 
> I ended up using yarn and building the app outside of bitbake, though with yarn the offline problem would become much easier.   It has much better support for offline builds than node / npm does.  If I had to start again I would start with adding support for yarn and go from there.  Node appears to be a dead end unless / until they fix the offline build.
> 
> 
> Simple guide I followed to get offline yarn working.  It shouldn't be hard to translate into a system much like the npm part of bitbake.
> https://yarnpkg.com/blog/2016/11/24/offline-mirror/
> 

Sounds reasonable. Let me play with that, maybe try an ad-hoc integration into 
our layer first.

Thanks,
Jan

> Mike
> -----Original Message-----
> From: Jan Kiszka <jan.kiszka@siemens.com>
> Sent: Thursday, March 07, 2019 3:37 AM
> To: Davis, Michael <michael.davis@essvote.com>
> Cc: OE-core <openembedded-core@lists.openembedded.org>
> Subject: npm offline build for yocto
> 
> Hi Michael,
> 
> I found your progress report (and unanswered question) on that topic in http://lists.openembedded.org/pipermail/openembedded-core/2018-April/268639.html.
> Did this effort go further?
> 
> I just ran into it again while updating https://github.com/siemens/meta-iot2000
> to Node.js >v6. I also played with prefilling the cache, but likely in the wrong way.
> 
> Thanks,
> Jan
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate Competence Center Embedded Linux
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

