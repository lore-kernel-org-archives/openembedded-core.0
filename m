Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBE4860043
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Apr 2015 03:24:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t323OulF023923
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Apr 2015 20:24:56 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 1 Apr 2015 20:24:55 -0700
Message-ID: <551CB686.5090405@windriver.com>
Date: Thu, 2 Apr 2015 11:24:54 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1427874748.git.liezhi.yang@windriver.com>
	<ef4bd808c72bfaa4a7615db04cd27fdb98ab38bf.1427874748.git.liezhi.yang@windriver.com>
	<20150401175921.GK14928@jama>
In-Reply-To: <20150401175921.GK14928@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] piglit: add PACKAGECONFIG for freeglut
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
X-List-Received-Date: Thu, 02 Apr 2015 03:25:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/02/2015 01:59 AM, Martin Jansa wrote:
> On Wed, Apr 01, 2015 at 12:53:00AM -0700, Robert Yang wrote:
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-graphics/piglit/piglit_git.bb |    3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
>> index 68ac7e7..e33e4a7 100644
>> --- a/meta/recipes-graphics/piglit/piglit_git.bb
>> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
>> @@ -21,6 +21,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
>
> Does this change resolve:
> REQUIRED_DISTRO_FEATURES = "x11"
> ?
>
> If yes, then you should remove it.

I'm afraid not since it depends on virtual/libx11.

// Robert

>
>>   # contents out of $S and $B.
>>   B="${S}"
>>
>> +PACKAGECONFIG ??= ""
>> +PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
>> +
>>   # CMake sets the rpath at build time with the source tree, and will reset it at
>>   # install time. As we don't install this doesn't happen, so force the rpath to
>>   # what we need.
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

