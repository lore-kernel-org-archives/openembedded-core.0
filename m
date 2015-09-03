Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC2E76FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 17:10:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t83HAXag025292
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Sep 2015 10:10:34 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Thu, 3 Sep 2015 10:10:33 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1441291646.git.joshua.lock@collabora.co.uk>
	<9f749745e56f33bc00d0e08dd4951840b29a557d.1441291646.git.joshua.lock@collabora.co.uk>
	<1441293176.24871.118.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55E87F08.6020902@windriver.com>
Date: Thu, 3 Sep 2015 12:10:32 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1441293176.24871.118.camel@linuxfoundation.org>
Subject: Re: [PATCH 3/9] systemd: remove hard-coded paths in FILES entries
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
X-List-Received-Date: Thu, 03 Sep 2015 17:10:36 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 9/3/15 10:12 AM, Richard Purdie wrote:
> On Thu, 2015-09-03 at 15:58 +0100, Joshua Lock wrote:
>> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
>> ---
>>  meta/recipes-core/systemd/systemd_219.bb | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
>> index 4d32fd5..fbd86e8 100644
>> --- a/meta/recipes-core/systemd/systemd_219.bb
>> +++ b/meta/recipes-core/systemd/systemd_219.bb
>> @@ -306,10 +306,10 @@ FILES_${PN} = " ${base_bindir}/* \
>>                  ${exec_prefix}/lib/sysctl.d \
>>                  ${exec_prefix}/lib/sysusers.d \
>>                  ${localstatedir} \
>> -                /lib/udev/rules.d/70-uaccess.rules \
>> -                /lib/udev/rules.d/71-seat.rules \
>> -                /lib/udev/rules.d/73-seat-late.rules \
>> -                /lib/udev/rules.d/99-systemd.rules \
>> +                ${base_libdir}/udev/rules.d/70-uaccess.rules \
>> +                ${base_libdir}/udev/rules.d/71-seat.rules \
>> +                ${base_libdir}/udev/rules.d/73-seat-late.rules \
>> +                ${base_libdir}/udev/rules.d/99-systemd.rules \
>>                 "
>>  
>>  FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
>> @@ -327,7 +327,7 @@ RRECOMMENDS_${PN} += "systemd-serialgetty systemd-vconsole-setup \
>>  
>>  PACKAGES =+ "udev-dbg udev udev-hwdb"
>>  
>> -FILES_udev-dbg += "/lib/udev/.debug"
>> +FILES_udev-dbg += "${base_libdir}/udev/.debug"
> 
> From what I remember, this is intentional and this change likely breaks
> multilib. You don't want two sets of rules on a multilib system.

Correct.. it has to go into /lib or if everything is move to /usr, then /usr/lib.

--Mark

> Cheers,
> 
> Richard
> 
> 
> 


