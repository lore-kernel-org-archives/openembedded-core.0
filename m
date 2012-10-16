Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TNwdQ-0003Au-Jw
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 04:11:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9G1wafC000053
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Oct 2012 18:58:36 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Mon, 15 Oct 2012 18:58:35 -0700
Message-ID: <507CBF6B.6070202@windriver.com>
Date: Tue, 16 Oct 2012 09:59:07 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1350300631.git.kai.kang@windriver.com>
	<decff650be8ca9f3938423a38e869fb1d13baaec.1350300631.git.kai.kang@windriver.com>
	<1350334543.2185.19.camel@ted>
In-Reply-To: <1350334543.2185.19.camel@ted>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q9G1wafC000053
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] nativesdk-packagegroup-sdk-host: add perl modules
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
X-List-Received-Date: Tue, 16 Oct 2012 02:11:57 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B410=E6=9C=8816=E6=97=A5 04:55, Richard Purdie wrote:
> On Mon, 2012-10-15 at 19:32 +0800, Kang Kai wrote:
>> nativesdk-perl is required to cross compile iptables when use
>> meta-toolchain-gmae, and perl modules are needed too.
>> Package nativesdk-perl-modules depends on nativesdk-perl, so just add
>> nativesdk-perl-modules only.
>>
>> [Yocto 3100]
>>
>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>> ---
>>   .../nativesdk-packagegroup-sdk-host.bb             |    3 ++-
>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sd=
k-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-ho=
st.bb
>> index 63fea28..383820a 100644
>> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.=
bb
>> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.=
bb
>> @@ -3,7 +3,7 @@
>>   #
>>
>>   SUMMARY =3D "Host packages for the standalone SDK or external toolch=
ain"
>> -PR =3D "r11"
>> +PR =3D "r12"
>>   LICENSE =3D "MIT"
>>
>>   inherit nativesdk packagegroup
>> @@ -20,6 +20,7 @@ RDEPENDS_${PN} =3D "\
>>       nativesdk-libtool \
>>       nativesdk-autoconf \
>>       nativesdk-automake \
>> +    nativesdk-perl-modules \
>>       "
> This doesn't feel right. Which tool has the perl dependency and why
> doesn't that tool depend on (xxx-)perl-modules?
perl is RDEPENDed by eglibc-mtrace, and nativesdk-eglibc-mtrace is not=20
installed into toolchain.

When use meta-toolchain-gmae to cross iptable, run 'autoreconf' requires=20
nativesdk-perl. But only install nativesdk-perl
can't make perl work properly, so install nativesdk-perl-modules as=20
well. And package nativesdk-perl-modules requires nativesdk-perl,
so I just write "nativesdk-perl-modules" here.

Regards,
Kai

>
> Cheers,
>
> Richard
>
>



