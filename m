Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U5JOB-0005xi-AA
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 18:11:28 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 9D925D22B4; Tue, 12 Feb 2013 17:54:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 3512FD22B4;
	Tue, 12 Feb 2013 17:54:31 +0100 (CET)
Message-ID: <511A73C3.9040000@linaro.org>
Date: Tue, 12 Feb 2013 17:54:27 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1360679147-24511-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1360686604.30425.41.camel@ted>
In-Reply-To: <1360686604.30425.41.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tclibc-eglibc: use glibc-thread-db as eglibc-thread-db does not exist(?)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 17:11:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 12.02.2013 17:30, Richard Purdie pisze:
> On Tue, 2013-02-12 at 15:25 +0100, Marcin Juszkiewicz wrote:
>> | Collected errors:
>> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-core-standalone-hhvm-sdk-target:
>> |  *    eglibc-thread-db *
>>
>> eglibc-thread-db is listed in LIBC_DEPENDENCIES and used by SDK. Package
>> ends as "libthread-db1" and provides glibc-thread-db.
>>
>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> ---
>>  meta/conf/distro/include/tclibc-eglibc.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Package renaming should take care of this. If it doesn't happen, that is
> a bug in the package renaming. This just hacks around it.
> 
> How do we reproduce this?

In my case "bitbake meta-toolchain" was enough as most of things went
from sstate-cache. Will do clean build during night.



