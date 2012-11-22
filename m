Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TbMgn-0004KW-JN
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 03:38:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAM2Oks4006999
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2012 18:24:46 -0800 (PST)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 21 Nov 2012 18:24:44 -0800
Message-ID: <50AD8D19.1090708@windriver.com>
Date: Thu, 22 Nov 2012 10:25:29 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1353490311.git.kai.kang@windriver.com>
	<bbf45c7739e8d08864c771446b487a5169e1f488.1353490311.git.kai.kang@windriver.com>
	<CAP9ODKoae1cD-qkN=VfSpLDRZO=yrcCXyhEmE+5+ZQbjahpU5w@mail.gmail.com>
	<1353519268.10459.22.camel@ted>
	<CAP9ODKp1gmCuvfnowtK2kyPajCOZoAS4b+0ocW0=-eNs1HUK8w@mail.gmail.com>
	<1353531361.10459.27.camel@ted>
	<CAP9ODKpTfV_Lvi_0OhLrsGQxqSMwoqJjoR9yeCDkSkouV8ZqpA@mail.gmail.com>
In-Reply-To: <CAP9ODKpTfV_Lvi_0OhLrsGQxqSMwoqJjoR9yeCDkSkouV8ZqpA@mail.gmail.com>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	qAM2Oks4006999
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] msmtp: add link to ${libdir}/sendmail
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
X-List-Received-Date: Thu, 22 Nov 2012 02:38:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B411=E6=9C=8822=E6=97=A5 04:57, Otavio Salvador wrote:
> On Wed, Nov 21, 2012 at 6:56 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org>  wrote:
>> On Wed, 2012-11-21 at 15:37 -0200, Otavio Salvador wrote:
>>> On Wed, Nov 21, 2012 at 3:34 PM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org>  wrote:
>>>> On Wed, 2012-11-21 at 09:28 -0200, Otavio Salvador wrote:
>>>>> On Wed, Nov 21, 2012 at 7:38 AM, Kang Kai<kai.kang@windriver.com>  =
wrote:
>>>>>> LSB tests check file ${libdir}/sendmail, and the file was created =
by
>>>>>> package lsbsetup. Because lsbsetup is dropped, create the link in =
msmtp.
>>>>>>
>>>>>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>>>>> I think it is wrong. You should to use alternatives for it.
>>>> Not necessarily, its not a file conflict problem, it just needs to e=
xist
>>>> at all...
>>> What if I want to use another smtp and still be lsb compliance?
>> The issue is we already have the "sendmail" bindir entry under update
>> alternatives control so this means adding an alternative of the
>> alternative which I think is getting convoluted. Ideally this symlink
>> just needs to exist which ever smtp is installed.
>>
>> So I think the better answer may be to move the link to the lsbtest
>> suite, or some kind of lsb-collateral package.

I will move the links to package lsb.

Thanks,
Kai


> This is a nicer solution indeed as this allow for reuse of same
> solution among other packages.
>



