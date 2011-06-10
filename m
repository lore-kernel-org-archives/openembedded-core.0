Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QUrlH-0002G1-NZ
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 04:47:51 +0200
Received: by pxj1 with SMTP id 1so1459953pxj.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 19:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Wes0e3qyQ1ZxdUo7cLf54G6cIPtD8fcBhPDurUVP5mw=;
	b=tJ6ewfhMyWduIqIJ0RMYW1XN7ECWD1PoAO12kwTOAvu8S5dr43dZYRCfVwG1M8jxSO
	6YSEZqL0L9FkJ52JAu7D4oeZo7hQgM1c+LnYne/bWNRV9c+Yqic/VfY2vn3PBRqHPtuq
	2wQ4P5J9M3eAKqUn9iU/QqOzXOkn9POhRdlPU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=sPXlfQZbulSBOxeECN2sEVAq/IiJ/47p1VgU5J84fJTJTZij0MAqKd2vuE1MH3DbKA
	fQMOD6ZGoilrayE+1t7kwRY54RY1xJMmZgl0LLVOJWnlJlg5bZMtzXHQOt4Zf6Dto5VP
	LDsv7YtX/yKdmIkaDrtKKK2bLnm3E6auzTQ7E=
Received: by 10.143.59.1 with SMTP id m1mr266940wfk.192.1307673870600;
	Thu, 09 Jun 2011 19:44:30 -0700 (PDT)
Received: from [172.23.8.101] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id o16sm2352916wff.13.2011.06.09.19.44.28
	(version=SSLv3 cipher=OTHER); Thu, 09 Jun 2011 19:44:29 -0700 (PDT)
Message-ID: <4DF1850A.1030608@gmail.com>
Date: Thu, 09 Jun 2011 19:44:26 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Thunderbird/3.1.10
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1307667467-467-1-git-send-email-raj.khem@gmail.com>
	<4DF170D5.70805@linux.intel.com>
In-Reply-To: <4DF170D5.70805@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] openssh_5.8p2.bb: Update SRC_URI checksums
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
X-List-Received-Date: Fri, 10 Jun 2011 02:47:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2011 06:18 PM, Saul Wold wrote:
> On 06/09/2011 05:57 PM, Khem Raj wrote:
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>> meta/recipes-connectivity/openssh/openssh_5.8p2.bb | 4 ++--
>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
>> b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
>> index 04d99d9..d5c9e49 100644
>> --- a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
>> +++ b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
>> @@ -26,8 +26,8 @@ SRC_URI =
>> "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
>> file://ssh_config \
>> file://init \
>> "
>> -SRC_URI[md5sum] = "0541579adf9d55abb15ef927048d372e"
>> -SRC_URI[sha256sum] =
>> "5c35ec7c966ce05cc4497ac59c0b54a556e55ae7368165cc8c4129694654f314"
>> +SRC_URI[md5sum] = "88a4a83b0e0e60cd545430d4e4bd7e0c"
>> +SRC_URI[sha256sum] =
>> "e5a1c821dd8dc33a94c445290956d52e03b3c450f9cd448b96d92317fd4cce42"
>>
>> inherit autotools
>>
> This is strange, since we are building in other places with this, please
> confirm you have a good tarball, vs what's in the upstream and on the
> autobuilder.yoctoproject.org downloads area.
>

have you tried

bitbake -ccleanall openssh;bitbake openssh ?

> Thanks
> Sau!



