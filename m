Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1SrH9x-0003Ww-HI
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 01:26:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6HJQvZI028410
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jul 2012 12:26:58 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 17 Jul 2012 12:26:58 -0700
Message-ID: <5005BC7F.4040804@windriver.com>
Date: Tue, 17 Jul 2012 15:26:55 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1342551849-18372-1-git-send-email-yao.zhao@windriver.com>
	<5005B87F.8000408@linux.intel.com>
In-Reply-To: <5005B87F.8000408@linux.intel.com>
X-Originating-IP: [128.224.147.210]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] dbus-glib: fix compile error when enable-tests
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
X-List-Received-Date: Tue, 17 Jul 2012 23:26:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-07-17 03:09 PM, Saul Wold wrote:
> On 07/17/2012 12:04 PM, Yao Zhao wrote:
>> test-service-glib-include-glib-only.patch: fixes the compiling failure
>> that test-service-glib.c includes glib/gquark.h not glib.h directly.
>>
>
> I hope that you will re-submit the unit test packaging also, that will 
> be good to have.
>
Yes, I will and I am testing just in case I made mistakes.
>
>> [YOCTO #2762]
>>
>> Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
>> ---
>>   .../test-service-glib-include-glib-only.patch      |   13 
>> +++++++++++++
>>   meta/recipes-core/dbus/dbus-glib.inc               |    4 +++-
>>   2 files changed, 16 insertions(+), 1 deletion(-)
>>   create mode 100644 
>> meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch
>>
>> diff --git 
>> a/meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch 
>> b/meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch 
>>
>> new file mode 100644
>> index 0000000..e0bc0c6
>> --- /dev/null
>> +++ 
>> b/meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch
>> @@ -0,0 +1,13 @@
>
> This is missing a patch header, Upstream-Status and Signed-off-by:
>
will do!

yao
> Sau!
>
>> +diff --git a/test/core/test-service-glib.c 
>> b/test/core/test-service-glib.c
>> +index 3355890..7291f35 100644
>> +--- a/test/core/test-service-glib.c
>> ++++ b/test/core/test-service-glib.c
>> +@@ -11,7 +11,7 @@
>> + #include <string.h>
>> + #include <glib/gi18n.h>
>> + #include <glib-object.h>
>> +-#include <glib/gquark.h>
>> ++#include <glib.h>
>> +
>> + #include "my-object.h"
>> + #include "my-object-subclass.h"
>> diff --git a/meta/recipes-core/dbus/dbus-glib.inc 
>> b/meta/recipes-core/dbus/dbus-glib.inc
>> index da2845a..f554ce8 100644
>> --- a/meta/recipes-core/dbus/dbus-glib.inc
>> +++ b/meta/recipes-core/dbus/dbus-glib.inc
>> @@ -11,7 +11,9 @@ DEPENDS = "expat glib-2.0 virtual/libintl 
>> dbus-glib-native dbus"
>>   DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
>>
>>   SRC_URI = 
>> "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
>> -           file://no-examples.patch"
>> +           file://no-examples.patch \
>> +           file://test-service-glib-include-glib-only.patch \
>> +"
>>
>>   inherit autotools pkgconfig gettext
>>
>>
>




