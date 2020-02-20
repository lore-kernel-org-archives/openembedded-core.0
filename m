Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
X-Greylist: delayed 586 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 20 Feb 2020 17:02:41 UTC
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE21615D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 17:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1FCE69C0179;
	Thu, 20 Feb 2020 11:52:56 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id O2HP7T2CyVLJ; Thu, 20 Feb 2020 11:52:55 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5797D9C01E8;
	Thu, 20 Feb 2020 11:52:55 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id Prk0FxYILV3t; Thu, 20 Feb 2020 11:52:55 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 375759C0179;
	Thu, 20 Feb 2020 11:52:55 -0500 (EST)
Date: Thu, 20 Feb 2020 11:52:55 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <248874866.3048780.1582217575008.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <18c55700df9ee84ea44fbffc93ba4e9f3c0e1663.camel@linuxfoundation.org>
References: <20200220150318.20003-1-malus.brandywine@gmail.com>
	<18c55700df9ee84ea44fbffc93ba4e9f3c0e1663.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC80 (Linux)/8.8.11_GA_3737)
Thread-Topic: Set default CONNECTIVITY_CHECK_URIS to
	https://www.yoctoproject.org/
Thread-Index: 2ZMBiSLh7VDuvyHgB8yvIK2UicyVfw==
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Set default CONNECTIVITY_CHECK_URIS to https://www.yoctoproject.org/
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
X-List-Received-Date: Thu, 20 Feb 2020 17:02:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On Feb 20, 2020, at 4:27 PM, Richard Purdie richard.purdie@linuxfoundation.org wrote:
> On Thu, 2020-02-20 at 10:03 -0500, Nataliya Korovkina wrote:
>> Signed-off-by: Nataliya Korovkina <malus.brandywine@gmail.com>
>> ---
>>  meta/conf/distro/include/default-distrovars.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/meta/conf/distro/include/default-distrovars.inc
>> b/meta/conf/distro/include/default-distrovars.inc
>> index 433d4b6651..6c9155b2ae 100644
>> --- a/meta/conf/distro/include/default-distrovars.inc
>> +++ b/meta/conf/distro/include/default-distrovars.inc
>> @@ -48,4 +48,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
>>  # fetch from the network (and warn you if not). To disable the test
>> set
>>  # the variable to be empty.
>>  # Git example url: git://git.yoctoproject.org/yocto-firewall-
>> test;protocol=git;rev=master
>> -CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
>> +CONNECTIVITY_CHECK_URIS ?= "https://www.yoctoproject.org/"
> 
> Why would that be better?
> 
> There have been several requests to change this however I'm not sure we
> can find one perfect url we can use :(

Hi Nataliya,

I am one of those who made a request:
http://lists.openembedded.org/pipermail/openembedded-core/2020-January/291926.html

Since I have created 3 pages on GitHub pages, GitLab pages and Bitbucket pages:
- https://connectivitycheck.github.io
- https://connectivitycheck.github.io
- https://connectivitycheck.bitbucket.io

I think we could use them in a mirrored way like Richard have suggested (in my thread).

I cannot do it right now, but this is definitely on my roadmap
because I still see the issue regularly.

Best Regards,
Jean-Marie





