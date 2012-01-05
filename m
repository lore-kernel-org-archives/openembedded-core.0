Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Riqja-00076x-Fj
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 18:04:10 +0100
Received: by qcqw6 with SMTP id w6so405711qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 08:56:47 -0800 (PST)
Received: by 10.229.135.85 with SMTP id m21mr1040472qct.26.1325782607098;
	Thu, 05 Jan 2012 08:56:47 -0800 (PST)
Received: from [128.224.170.134] ([89.121.200.106])
	by mx.google.com with ESMTPS id v5sm44400553qao.21.2012.01.05.08.56.45
	(version=SSLv3 cipher=OTHER); Thu, 05 Jan 2012 08:56:46 -0800 (PST)
Message-ID: <4F05D64D.4070906@gherzan.ro>
Date: Thu, 05 Jan 2012 18:56:45 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1325781559-18967-1-git-send-email-andrei@gherzan.ro>
	<1325781698.28005.132.camel@phil-desktop>
In-Reply-To: <1325781698.28005.132.camel@phil-desktop>
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wpa-supplicant: Patch this recipe order to remove a duplicate defconfig file
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
X-List-Received-Date: Thu, 05 Jan 2012 17:04:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2012 06:41 PM, Phil Blundell wrote:
> On Thu, 2012-01-05 at 18:39 +0200, Andrei Gherzan wrote:
>> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>>
>> Instead of having two defconfigs we can have only one and append this file with de specific
>> CONFIG if GPLv3 packages are allowed.
> As I said the other day, I think it would be better to just have one
> defconfig and turn off the GPLv3 stuff entirely.  Do you know of anybody
> who actually wants to use it?
>
> p.
>
>

Now about that extra config. The idea of having it into a build were 
gplv3 packages are allowed, was support for TLS/IA which was designed to 
be used in the EAP-TTLSv1
https://lists.yoctoproject.org/pipermail/poky/2011-December/007386.html

I will commit a change with just one defconfig which will be edited in 
bb file similar to this commit. Is this ok?



