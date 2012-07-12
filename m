Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1SpDLr-0003Il-H7
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 08:58:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q6C6kxlG026416
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Jul 2012 23:47:00 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 11 Jul 2012 23:46:59 -0700
Message-ID: <4FFE72E1.5070108@windriver.com>
Date: Thu, 12 Jul 2012 14:46:57 +0800
From: Pascal Ouyang <xin.ouyang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1340262834-27560-1-git-send-email-xin.ouyang@windriver.com>
	<CAMKF1sp-vCv1iP3YAgAbEP4=2ruAme+-JnCqxBLXGW5yJ3oyZw@mail.gmail.com>
	<4FEC0EC7.6050800@windriver.com> <4FEC807C.1040803@gmail.com>
	<4FF577CC.3040205@windriver.com>
	<CAMKF1sqqiaXyxxzrreU2+00mmdCAmtpSNXnrXVgF1F5a4b07_g@mail.gmail.com>
	<4FF678A0.4040200@windriver.com>
	<CAMKF1soZH9u+tkih94s276FQCE40gwrc1MKCHaLRX=HoYgv=aQ@mail.gmail.com>
In-Reply-To: <CAMKF1soZH9u+tkih94s276FQCE40gwrc1MKCHaLRX=HoYgv=aQ@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q6C6kxlG026416
Cc: layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: [PATCH] cpan.bbclass: Fix CCFLAGS.
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
X-List-Received-Date: Thu, 12 Jul 2012 06:58:15 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Saul,

I have sent this patch for a while. Please merge this if no objections.=20
Thanks.

- Pascal

On 2012=E5=B9=B407=E6=9C=8806=E6=97=A5 13:39, Khem Raj wrote:
> On Thu, Jul 5, 2012 at 10:33 PM, Pascal Ouyang <xin.ouyang@windriver.co=
m> wrote:
>> On 2012=E5=B9=B407=E6=9C=8805=E6=97=A5 22:57, Khem Raj wrote:
>>>
>>> On Thu, Jul 5, 2012 at 4:17 AM, Pascal Ouyang <xin.ouyang@windriver.c=
om>
>>> wrote:
>>>>
>>>>
>>>> So, I still don't know what is your opinion of this patch.
>>>
>>>
>>> I think we still need the CC and CFLAGS to appear in CCFLAGS since
>>> they sometimes decide ABI etc. that we use and without that
>>> the modules will be incompatible. So may be
>>> appending to CCFLAGS would work instead
>>>
>>
>> Exactly in my patch, this just appends CFLAGS to CCFLAGS.
>>
>
> seems ok I guess
>
>>
>> @@ -26,13 +26,14 @@ cpan_do_configure () {
>>                          test -f $f2 || continue
>>                          sed -i -e "s:\(PERL_ARCHLIB =3D
>> \).*:\1${PERL_ARCHLIB}:" \
>>                                  -e 's/perl.real/perl/' \
>> +                               -e "s/^\(CCFLAGS =3D.*\)/\1 ${CFLAGS}/=
" \
>>                                  $f2
>>                  done
>>          fi
>>   }
>>
>> Thanks.
>> --
>> - Pascal
>>
>>


--=20
- Pascal




