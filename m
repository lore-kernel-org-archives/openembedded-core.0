Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1THqbn-0005x7-Up
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Sep 2012 08:33:04 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8T6K7wv011975
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2012 23:20:07 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Fri, 28 Sep 2012 23:20:06 -0700
Message-ID: <50669329.1040607@windriver.com>
Date: Sat, 29 Sep 2012 14:20:26 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <50658E84.9090206@windriver.com> <1348838392.15753.50.camel@ted>
In-Reply-To: <1348838392.15753.50.camel@ted>
X-Originating-IP: [128.224.162.159]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q8T6K7wv011975
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Some problems about nativesdk-perl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Sep 2012 06:33:04 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B409=E6=9C=8828=E6=97=A5 21:19, Richard Purdie wrote:
> On Fri, 2012-09-28 at 19:48 +0800, Kang Kai wrote:
>> Hi Richard,
>>
>> I meet 2 problems about nativesdk-perl.
>>
>> First one is that nativesdk-perl-modules doesn't depends on the single
>> nativesdk-perl-module-xxx which I asked you yesterday, but I still
>> don't know how to fix it.
>> I tried to add one line to perl_5.14.2.bb:
>> RRECOMMENDS_perl-modules_virtclass-nativesdk +=3D
>> "nativesdk-perl-module-config"
>>
>> and it will cover the original value and make nativesdk-perl-modules
>> only depends on nativesdk-perl-module-config.
>> Doesn't "+=3D" work for nativesdk ?
> I will need to investigate this issue further to comment and I'm short
> on time at the moment.
OK. Thanks.

>
>> The second issue is the latest commit for perl(Yocto commit
>> 876ec81c039132d07a5f3d99bae40d6154351d41) . I build
>> meta-toolchain-gmae with it,
>> and the perl @INC path remove the "/opt/poky/1.2
>> +snapshot/sysroots/x86_64-pokysdk-linux" prefix.
>> Is that the right operation?
> No, please try with the patch I just sent applied as this will hopefull=
y
> fix it.
The perl @INC path prefix for toolchain("/opt/poky/1.2+snapshot/...) has=20
been added back by your patch.
But there are still one path in @INC include build environment=20
directories, it seems that the dirs are compiled into libperl.so.  So=20
use sed when do_packages
could not fix this issue.

Regards,
Kai

>
> Cheers,
>
> Richard
>
>



