Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CC2F36013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 09:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2K9UtFV027125; Fri, 20 Mar 2015 09:30:55 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id O1veyhsclDeF; Fri, 20 Mar 2015 09:30:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2K9Ue6M027102
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Mar 2015 09:30:51 GMT
Message-ID: <1426843840.29168.68.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Date: Fri, 20 Mar 2015 09:30:40 +0000
In-Reply-To: <550BD52C.1040601@linux.intel.com>
References: <550BD52C.1040601@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Policy of explicit disabling of package features
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
X-List-Received-Date: Fri, 20 Mar 2015 09:30:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-03-20 at 10:07 +0200, Tanu Kaskinen wrote:
> It seems to me that a better policy would be to always explicitly 
> disable *all* features that have external dependencies that aren't 
> listed in DEPENDS. That kind of policy should reduce these 
> non-determinism issues. Full compliance with such policy may not be 
> feasible to achieve, since it requires great care to check for new 
> optional dependencies whenever updating to new upstream versions, but I 
> hope that at least "pre-emptive" patches that add explicit feature 
> disabling will be accepted even before anyone has run into actual problems.

This is the policy, if its not in DEPENDS, it shouldn't be using it.

As you say, adherence to that policy can be tricky, its something we try
and improve over time. Where we do find issue we fix them as you've seen
from the patches. We do have better detection of these issues than we've
ever had before.

Cheers,

Richard


