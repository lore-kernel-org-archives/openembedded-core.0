Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 82CED6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 09:18:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 12C682612C0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1449054142.git.joshua.lock@collabora.co.uk>
	<b6d0cb53694261e395f44e8948cc94599ff80559.1449054142.git.joshua.lock@collabora.co.uk>
	<20151202211946.GE2248@jama>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <566008FF.8020507@collabora.co.uk>
Date: Thu, 3 Dec 2015 09:18:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151202211946.GE2248@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] connman-conf: mark as allarch and not requiring default deps
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
X-List-Received-Date: Thu, 03 Dec 2015 09:19:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 02/12/15 21:19, Martin Jansa wrote:
> On Wed, Dec 02, 2015 at 11:03:53AM +0000, Joshua Lock wrote:
>> This recipe just installs some data files and thus is architecture
>> independent and doesn't require a compiler and libc in its DEPENDS.
>
> allarch.bbclass already sets INHIBIT_DEFAULT_DEPS

Indeed it does, thanks — I'll send a v2.

Regards,

Joshua

>
>> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
>> ---
>>   meta/recipes-connectivity/connman/connman-conf.bb | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
>> index bef9237..1e119ad 100644
>> --- a/meta/recipes-connectivity/connman/connman-conf.bb
>> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
>> @@ -4,7 +4,9 @@ network interface for a qemu machine."
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
>>
>> -inherit systemd
>> +inherit systemd allarch
>> +
>> +INHIBIT_DEFAULT_DEPS = "1"
>>
>>   SRC_URI_append_qemuall = " file://wired.config \
>>                              file://wired-setup \
>> --
>> 2.4.3
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


