Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SUqC4-0004bz-DI
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 04:11:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4H21rZI024976
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 May 2012 19:01:54 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 16 May 2012 19:01:53 -0700
Message-ID: <4FB45BEF.6070204@windriver.com>
Date: Thu, 17 May 2012 10:01:19 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1337162056.git.xiaofeng.yan@windriver.com>
	<a918712a769df875f9e59f7a5aa233b7316705c2.1337162056.git.xiaofeng.yan@windriver.com>
	<4FB38961.2000702@linux.intel.com>
In-Reply-To: <4FB38961.2000702@linux.intel.com>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q4H21rZI024976
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ncurses: Disable parallel make
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
X-List-Received-Date: Thu, 17 May 2012 02:11:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B405=E6=9C=8816=E6=97=A5 19:02, Saul Wold wrote:
> On 05/16/2012 01:10 PM, xiaofeng.yan@windriver.com wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> Ncurses failure non-gplv3 build by race issue. So disable parallel \
>> make when building this package.
>>
> This is not the best approach as you disable PARALLEL_MAKE for both=20
> non-gplv3 and gplv3 versions. Further, we want to get rid of [M1]=20
> setting as much as possible, so this patch is not helping that.
>
> Did you try running on a large many core machine? It might help if you=20
> have some other builds going also to stress the machine.
>
> Sau!
Thanks for your reply. The most cores I have are eight. I also set=20
PARALLEL_MAKE=3Dj1000 and 10000. I think I need try to find new way for=20
fixing bugs.

Thanks
Yan
>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>> meta/recipes-core/ncurses/ncurses.inc | 2 ++
>> 1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-core/ncurses/ncurses.inc=20
>> b/meta/recipes-core/ncurses/ncurses.inc
>> index ae99e2c..b115e46 100644
>> --- a/meta/recipes-core/ncurses/ncurses.inc
>> +++ b/meta/recipes-core/ncurses/ncurses.inc
>> @@ -29,6 +29,8 @@ BUILD_CPPFLAGS +=3D "-D_GNU_SOURCE"
>> # natives don't generally look in base_libdir
>> base_libdir_virtclass-native =3D "${libdir}"
>>
>> +PARALLEL_MAKE =3D ""
>> +
>> # Helper function for do_configure to allow multiple configurations
>> # $1 the directory to run configure in
>> # $@ the arguments to pass to configure
>



