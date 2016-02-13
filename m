Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8BB7391A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 08:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1D8AZAV001308; Sat, 13 Feb 2016 08:10:35 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qkhLMe4fH-MD; Sat, 13 Feb 2016 08:10:35 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1D8AVm0001301
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 13 Feb 2016 08:10:33 GMT
Message-ID: <1455351031.16142.338.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Sat, 13 Feb 2016 08:10:31 +0000
In-Reply-To: <56BE56F9.2030806@windriver.com>
References: <1455300000.16142.331.camel@linuxfoundation.org>
	<56BE56F9.2030806@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "saul.wold" <saul.wold@intel.com>
Subject: Re: [PATCH] scripts/runqemu-internal: Work around qemux86 PAT bugs in linux 4.4.1
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
X-List-Received-Date: Sat, 13 Feb 2016 08:10:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-02-12 at 17:04 -0500, Bruce Ashfield wrote:
> On 2016-02-12 1:00 PM, Richard Purdie wrote:
> > Since the upgrade of qemux86 to 4.4.1 we're seeing PAT issues when
> > starting the X server. We need to fix the problem but the failing
> > sanity tests mask out other issues and we need a workaround.
> > 
> 
> I was out of the day and didn't notice if any logs were available
> for the issue ? Is there a pointer to the failing logs ?
> 
> Obviously I didn't notice this in any of my runs. I'll check 4.4.x
> for anything that looks suspicious, and can bisect if needed.

Your inbox should have details of it under "poky: update qemu* to
prefer 4.4 kernel", the logs are in there. There was a promising
looking patch upstream but it didn't help.

It reproduced easily with a "MACHINE=qemux86 bitbake core-image-sato;
runqemu qemux86" and then watch X fail to start.

It also looks like we have a new perf race:

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/build
s/657/steps/BuildImages/logs/stdio

Cheers,

Richard




