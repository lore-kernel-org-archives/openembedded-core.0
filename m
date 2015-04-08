Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1079736BA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 02:23:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t382NXqb017950
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Apr 2015 19:23:33 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Apr 2015 19:23:33 -0700
Message-ID: <55249123.6090008@windriver.com>
Date: Wed, 8 Apr 2015 10:23:31 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1428405830.git.liezhi.yang@windriver.com>	
	<7c8475e9f21581916595d0ef7d587ce3ec1614a9.1428405830.git.liezhi.yang@windriver.com>
	<1428442765.14020.482.camel@linuxfoundation.org>
In-Reply-To: <1428442765.14020.482.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/10] glib-2.0: 2.42.1 -> 2.44.0
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
X-List-Received-Date: Wed, 08 Apr 2015 02:23:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/08/2015 05:39 AM, Richard Purdie wrote:
> On Tue, 2015-04-07 at 04:24 -0700, Robert Yang wrote:
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../{glib-2.0_2.42.1.bb => glib-2.0_2.44.0.bb}     |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta/recipes-core/glib-2.0/{glib-2.0_2.42.1.bb => glib-2.0_2.44.0.bb} (83%)
>>
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.42.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.44.0.bb
>> similarity index 83%
>> rename from meta/recipes-core/glib-2.0/glib-2.0_2.42.1.bb
>> rename to meta/recipes-core/glib-2.0/glib-2.0_2.44.0.bb
>> index 69b3ef8..100799e 100644
>> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.42.1.bb
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.44.0.bb
>> @@ -18,5 +18,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>>
>>   SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
>>
>> -SRC_URI[md5sum] = "89c4119e50e767d3532158605ee9121a"
>> -SRC_URI[sha256sum] = "8f3f0865280e45b8ce840e176ef83bcfd511148918cc8d39df2ee89b67dcf89a"
>> +SRC_URI[md5sum] = "74cf7b4ea200b76e42a4c22c8daf0f93"
>> +SRC_URI[sha256sum] = "f2d362b106a08fa801770d41829a06fcfe287a00421018869eebf5efc796f5b9"
>
> This blew up badly on the autobuilder:
>
> http://errors.yoctoproject.org/Errors/Search/?items=10&query=c8da6d7390ad626c03d5b9b431a97adeaeb60a89

Sorry, the failures are on CentOS 6.6, please ignore this upgrade atm, I will
find a CentOS 6.x to fix the problem.

>
> Cheers,
>
> Richard
>
>
>

