Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F07960144
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 03:20:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2A3KVil022420
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Mar 2015 20:20:31 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Mar 2015 20:20:30 -0700
Message-ID: <54FE62FD.8080807@windriver.com>
Date: Tue, 10 Mar 2015 11:20:29 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1425885208.git.liezhi.yang@windriver.com>
	<cd62f62acc964a2d896fd7a7e2a26372589f40a0.1425885208.git.liezhi.yang@windriver.com>
	<E0AC5CCC-475C-413E-BB70-1ABB120235BF@gmail.com>
In-Reply-To: <E0AC5CCC-475C-413E-BB70-1ABB120235BF@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] xinetd: fixe HOMEPAGE and SRC_URI
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
X-List-Received-Date: Tue, 10 Mar 2015 03:20:33 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/09/2015 11:59 PM, Khem Raj wrote:
>
>> On Mar 9, 2015, at 12:15 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> The www.xinetd.org is not available, use github as the HOMEPAGE and
>> pkgs.fedoraproject.org as the SRC_URI.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>> meta/recipes-extended/xinetd/xinetd_2.3.15.bb |    4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
>> index 288186e..f07a33f 100644
>> --- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
>> +++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
>> @@ -1,5 +1,5 @@
>> SUMMARY = "Socket-based service activation daemon"
>> -HOMEPAGE = "http://www.xinetd.org"
>> +HOMEPAGE = "https://github.com/xinetd-org/xinetd"
>>
>> # xinetd is a BSD-like license
>> # Apple and Gentoo say BSD here.
>> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
>> DEPENDS = ""
>> PR = "r2"
>>
>> -SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
>> +SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.gz/77358478fd58efa6366accae99b8b04c/${BP}.tar.gz \
>
> This snapshot can go away too. I would be more comfortable if you just checked it out from github straight.

Thanks, how about use git please ?
SRC_URI = "git://github.com/xinetd-org/xinetd.git;protocol=https

// Robert

>
>>        file://xinetd.init \
>>        file://xinetd.conf \
>>        file://xinetd.default \
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

