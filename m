Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UDQ1r-0002RX-SQ
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Mar 2013 02:53:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r271bJ8P019268
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Mar 2013 17:37:19 -0800 (PST)
Received: from [128.224.162.206] (128.224.162.206) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 6 Mar 2013 17:37:18 -0800
Message-ID: <5137EF4C.4050302@windriver.com>
Date: Thu, 7 Mar 2013 09:37:16 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
References: <cover.1362545190.git.hongxu.jia@windriver.com>
	<20130306211447.27f6b262@e6520eb>
In-Reply-To: <20130306211447.27f6b262@e6520eb>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r271bJ8P019268
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [danny][PATCH 0/2]fix toolchain relocation issues
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
X-List-Received-Date: Thu, 07 Mar 2013 01:53:57 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03/07/2013 04:14 AM, Eric B=C3=A9nard wrote:
> Hi Hongxu,
>
> Le Wed, 6 Mar 2013 12:58:45 +0800,
> Hongxu Jia <hongxu.jia@windriver.com> a =C3=A9crit :
>
>> Rebase to danny.
>>
>> [YOCTO #3984]
>>
>> The following changes since commit e89f812a0af56beda951c1dce6113a61d6d=
b8cda:
>>
>>    bitbake: knotty.py: fix unknown event bb.event.DiskFull (2013-03-04=
 10:17:20 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib hongxu/fix-toolchain-relocatio=
n-danny
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dhongxu/fix-=
toolchain-relocation-danny
>>
>> Hongxu Jia (2):
>>    perl-nativesdk:fix toolchain relocation issues
>>    populate_sdk_base.bbclass:fix toolchain relocation issues
>>
> while at it, may you please also cherry-pick
> e7a21cd69a326ab7e2d0e410db28f24956f61208
> which is "toolchain-scripts.bbclass: add PYTHONHOME variable to
> environment-setup"
>
> as the problem described in [YOCTO #3839] is also present in danny.
>
> Thanks
> Eric
Ok, I will handle it and resend the patch later.

Thanks,
Hongxu


