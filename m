Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QntgC-0004Dp-1Z
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 16:41:16 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p71EasWA023886
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 07:36:54 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 1 Aug 2011 07:36:54 -0700
Message-ID: <4E36BA04.8090601@windriver.com>
Date: Mon, 1 Aug 2011 09:36:52 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<44bd82a28e643c335047026c581b34497b6c8fb5.1312182844.git.sgw@linux.intel.com>
	<1312189758.30326.504.camel@phil-desktop>
In-Reply-To: <1312189758.30326.504.camel@phil-desktop>
Subject: Re: [PATCH 17/22] bitbake.conf: Add default tune-${DEFAULTTUNE} override
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
X-List-Received-Date: Mon, 01 Aug 2011 14:41:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/1/11 4:09 AM, Phil Blundell wrote:
> On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
>> From: Mark Hatle <mark.hatle@windriver.com>
>>
>> We need to add the tune-* override in order for more complicated tune
>> features to function properly.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>  meta/conf/bitbake.conf |    3 ++-
>>  1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 9c80f11..11dfb6d 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -637,9 +637,10 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
>>  #
>>  # This works for  functions as well, they are really just environment variables.
>>  # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
>> -OVERRIDES = "${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
>> +OVERRIDES = "${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${TUNEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
>>  DISTROOVERRIDES ?= "${DISTRO}"
>>  MACHINEOVERRIDES ?= "${MACHINE}"
>> +TUNEOVERRIDES ?= "tune-${DEFAULTTUNE}"
> 
> What exactly are the "more complicated tune features" that require this?
> It's not obvious to me that this is a good idea.

See the other patch that Richard commented on.  My understanding was that the
value of the OVERRIDES could change during the multilib configurations.  Seems
that I was wrong here.

The concept behind this was to be able to specify certain values based on an
override instead of having to do inline python.. but it appears that simply
won't work.

(Values such as package_extra_arch, pkgarch, etc..)

--Mark

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



