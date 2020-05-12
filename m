Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.7911.1589250744370958093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 19:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04C2VPnH003869
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 11 May 2020 19:31:46 -0700
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Mon, 11 May 2020
 19:31:27 -0700
Subject: Re: [OE-core] [PATCH] buildtools-extended-tarball: add nativesdk-glibc
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>, <jpuhlman@mvista.com>
References: <20200506015447.13003-1-kai.kang@windriver.com>
 <080c0849554edd5710f68f6283a020f578968de9.camel@linuxfoundation.org>
From: "kai" <kai.kang@windriver.com>
Message-ID: <f35dd49c-f52b-6d35-9d1b-56775e065bbd@windriver.com>
Date: Tue, 12 May 2020 10:30:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <080c0849554edd5710f68f6283a020f578968de9.camel@linuxfoundation.org>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 04C2VPnH003869
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2020/5/10 =E4=B8=8B=E5=8D=889:40, Richard Purdie wrote:
> On Wed, 2020-05-06 at 09:54 +0800, kai wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It requires gcc 5.0 via OE-Core rev abc741a. On centos 7, the gcc
>> version is too low then it has to build with buildtools-extended-
>> tarball
>> which provides nativesdk-gcc.
>>
>> But it fails to build nspr-native:
>>
>>> gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib
>>> -lnspr4 -lpthread -o abstract
>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>> undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>> undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>> undefined reference to `__clock_settime@GLIBC_PRIVATE'
>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>> undefined reference to `__clock_getres@GLIBC_PRIVATE'
>>> collect2: error: ld returned 1 exit status
>>> make: *** [Makefile:379: abstract] Error 1
>> Add nativesdk-glibc to buildtools-extended-tarball. And it increases
>> size of buildtools-extended-tarball about 3K from 48356989 to
>> 48360329.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
>>   1 file changed, 1 insertion(+)
> This doesn't make sense. Does it mean we need a new uninative version
> instead?
>
> Cheers,
>
> Richard
>
```This works in dunfell, as of right now. This should have been fixed wi=
th:

```https://patchwork.openembedded.org/patch/171584/

Hi Jeremy,

I can't receive mails from maillist for now. So reply here.

I suppose when I build oe-core master on ubunu 16.04, it already=20
contains the commit. I'll double=C2=A0 check it.

Thanks a lot.

--=20
Kai Kang
Wind River Linux

