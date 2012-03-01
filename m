Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S2zRO-0004UY-C8
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 07:24:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q216G8NJ016005
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Feb 2012 22:16:08 -0800 (PST)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 29 Feb 2012 22:16:07 -0800
Message-ID: <4F4F13A8.5070009@windriver.com>
Date: Thu, 1 Mar 2012 14:14:00 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Paul Menzel <paulepanter@users.sourceforge.net>
References: <cover.1328774359.git.xiaofeng.yan@windriver.com>	
	<92a87a54f47245d723727bd190c35323e66ad3ea.1328774359.git.xiaofeng.yan@windriver.com>
	<1328778363.5379.3.camel@mattotaupa>
In-Reply-To: <1328778363.5379.3.camel@mattotaupa>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q216G8NJ016005
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] libx11-1.4.4: Add patch makekeys_crosscompile.patch
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
X-List-Received-Date: Thu, 01 Mar 2012 06:24:38 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B402=E6=9C=8809=E6=97=A5 17:06, Paul Menzel wrote:
> Dear Xiaofeng,
>
>
> Am Donnerstag, den 09.02.2012, 16:05 +0800 schrieb Xiaofeng Yan:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> LSB 4.1 complain a host contamination error from libx11 because of abs=
ent
>> patch "makekeys_crosscompile.patch" from libx11-trim-1.4.4.
>>
>> [YOCTO #1970]
> could you squash both patches please?
>
> Also please add the output from the cover letter to the commit message.
>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>>   .../libx11-1.4.4/makekeys_crosscompile.patch       |   45 ++++++++++=
++++++++++
>>   1 files changed, 45 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/makek=
eys_crosscompile.patch
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_cros=
scompile.patch b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_cro=
sscompile.patch
>> new file mode 100644
>> index 0000000..e5eacf0
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_crosscompil=
e.patch
>> @@ -0,0 +1,45 @@
>> +Because the size of "unsigned long" is different between 32-bit
>> +and 64-bit, judge whether target is 32-bit or 64-bit and tell
>> +"makekey".
> Trailing space at the end.
>
> Could you also add the error message to the patch file in a *separate*
> patch please. Preferably before copying it.
>
Do you mean I use an separated file to record error message?
So there are two file here. one is for  makekeys_crosscompile.patch,=20
another is for a file to record error message. right?
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: dbuitenh@windriver.com
>> +
>> +--- libX11-1.3.4.orig/src/util/makekeys.c	2010-01-15 09:11:36.0000000=
00 +0800
>> ++++ libX11-1.3.4/src/util/makekeys.c	2011-05-24 19:04:25.454774908 +0=
800
> [=E2=80=A6]
>
>
> Thanks,
>
> Paul



