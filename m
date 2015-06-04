Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id A0266756C8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 17:13:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 5CB81601437
Message-ID: <55708752.7080500@collabora.co.uk>
Date: Thu, 04 Jun 2015 18:13:54 +0100
From: Joshua Lock <joshua.lock@collabora.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1431752323-17235-1-git-send-email-Martin.Jansa@gmail.com>
	<20150604084740.GE2376@jama>
In-Reply-To: <20150604084740.GE2376@jama>
Subject: Re: [fido][PATCH] e2fsprogs: install populate-extfs.sh
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
X-List-Received-Date: Thu, 04 Jun 2015 17:13:59 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/15 09:47, Martin Jansa wrote:
> On Sat, May 16, 2015 at 06:58:43AM +0200, Martin Jansa wrote:
>> From: Martin Jansa <martin.jansa@gmail.com>
>
> ping

This has been queued in my fido-next branch[1] for a while, I'm hoping 
to do an autobuilder run and propose it for merge to fido over the next 
few days.

Regards,

Joshua

>>
>> * install populate-extfs.sh from contrib, be aware that in order
>>    to use it you need to set DEBUGFS shell variable, otherwise it will
>>    try to use debugfs from relative path which is almost always
>>    incorrect:
>>      CONTRIB_DIR=$(dirname $(readlink -f $0))
>>      DEBUGFS="$CONTRIB_DIR/../debugfs/debugfs"
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>> index 66065bc..abc959f 100644
>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>> @@ -54,6 +54,8 @@ do_install () {
>>   	oe_multilib_header ext2fs/ext2_types.h
>>   	install -d ${D}${base_bindir}
>>   	mv ${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs
>> +
>> +	install -v -m 755 ${S}/contrib/populate-extfs.sh ${D}${base_sbindir}/
>>   }
>>
>>   do_install_append_class-target() {
>> --
>> 2.4.0
>>
>


