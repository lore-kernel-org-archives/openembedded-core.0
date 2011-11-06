Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RNC3B-0005OF-KI
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 00:22:53 +0100
Received: from mail-gy0-f180.google.com ([209.85.160.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 06 Nov 2011 15:16:39 -0800
Received: by gyh20 with SMTP id 20so8572437gyh.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Nov 2011 15:16:38 -0800 (PST)
Received: by 10.43.44.199 with SMTP id uh7mr40388540icb.25.1320621395980;
	Sun, 06 Nov 2011 15:16:35 -0800 (PST)
Received: from [192.168.1.12] (c-98-246-160-155.hsd1.or.comcast.net.
	[98.246.160.155])
	by mx.google.com with ESMTPS id 3sm31105964pbx.14.2011.11.06.15.16.34
	(version=SSLv3 cipher=OTHER); Sun, 06 Nov 2011 15:16:35 -0800 (PST)
Message-ID: <4EB7155A.1050808@intel.com>
Date: Sun, 06 Nov 2011 15:16:42 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
References: <840A81C1B782724A8EB52725BD519EFF1A8F25@MBX20.4emm.local>
	<840A81C1B782724A8EB52725BD519EFF1A8F4E@MBX20.4emm.local>
	<4EA825F0.1030504@windriver.com> <4EA83ACB.4040001@intel.com>
	<4EB6EE8E.4000401@eukrea.com>
In-Reply-To: <4EB6EE8E.4000401@eukrea.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: useradd changes to dbus, base-passwd
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
X-List-Received-Date: Sun, 06 Nov 2011 23:22:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 11/06/2011 12:31 PM, Eric Bénard wrote:
> Hi Scott,
>
> Le 26/10/2011 18:52, Scott Garman a écrit :
>> Grepping through our classes, it looks like I can detect the nativesdk
>> within
>> useradd.bbclass by checking for bb.data.inherits_class('nativesdk', d).
>>
>> I've filed a bug for this and will develop a patch to ensure useradd is
>> becomes a no-op for nativesdk builds:
>>
>> http://bugzilla.pokylinux.org/show_bug.cgi?id=1702
>>
> here is a patch tentative which allowed me to compile meta-toolchain-qte.
> Is that the right way to solve the problem (in which case I'll submit
> the patch with comment & sob)?

Hi Eric,

This looks good, thank you! Two questions though:

When I was testing my own variation of this fix out, I found that 
testing bb.data.inherits_class('nativesdk', d) did not work as I 
expected. It returned false for a recipe I was testing with that used 
BBCLASSEXTEND = "native nativesdk". So instead I was checking if PN 
ended with -nativesdk. Are you certain the inherits_class test works?

My second question is why the autotools_do_install is needed for the 
nativesdk case?

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


