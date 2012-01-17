Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RnB2j-00020n-8C
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 16:33:49 +0100
Received: by wgbdr11 with SMTP id dr11so2634722wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 07:26:12 -0800 (PST)
Received: by 10.180.93.168 with SMTP id cv8mr24077761wib.2.1326813972367;
	Tue, 17 Jan 2012 07:26:12 -0800 (PST)
Received: from [128.224.170.160] ([89.121.200.106])
	by mx.google.com with ESMTPS id dr7sm14270094wib.3.2012.01.17.07.26.09
	(version=SSLv3 cipher=OTHER); Tue, 17 Jan 2012 07:26:10 -0800 (PST)
Message-ID: <4F159312.8020107@gherzan.ro>
Date: Tue, 17 Jan 2012 17:26:10 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1326799711-31142-1-git-send-email-andrei@gherzan.ro>
	<1326813445.14640.0.camel@ted>
In-Reply-To: <1326813445.14640.0.camel@ted>
Subject: Re: [PATCH] busybox uglic: remove obsolete check for "kernel24"
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
X-List-Received-Date: Tue, 17 Jan 2012 15:33:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2012 05:17 PM, Richard Purdie wrote:
> On Tue, 2012-01-17 at 13:28 +0200, Andrei Gherzan wrote:
>> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>>
>> Busybox checks if MACHINE_FEATURES contains "kernel24". If so, CONFIG_FEATURE_2_4_MODULES will be on "y".
>> kernel24 is no longer present in any machine configuration. The same situation is in uglibc with a
>> different CONFIG mapping.
>>
>> [YOCTO #1901]
>>
>> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
>> ---
>>   meta/recipes-core/busybox/busybox.inc      |    4 +---
>>   meta/recipes-core/uclibc/uclibc-config.inc |    4 +---
>>   2 files changed, 2 insertions(+), 6 deletions(-)
> Merged to master with minor tweaks to the commit shortlog, thanks.
After a "git pull" I can't see the change.

@g


