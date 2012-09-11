Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TBJHp-0000Ff-1u
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 07:45:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8B5Wr2w022879
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Sep 2012 22:32:53 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Mon, 10 Sep 2012 22:32:52 -0700
Message-ID: <504ECD16.6090707@windriver.com>
Date: Tue, 11 Sep 2012 13:33:10 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <sgw@linux.intel.com>, <Zhenfeng.Zhao@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1347329133.git.kai.kang@windriver.com>
	<824dcd67b7a31144bd46e58837cbd0f311bb7fa9.1347329133.git.kai.kang@windriver.com>
	<20120911051948.GB3035@sakrah.homelinux.org>
In-Reply-To: <20120911051948.GB3035@sakrah.homelinux.org>
X-Originating-IP: [128.224.162.159]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q8B5Wr2w022879
Subject: Re: [PATCH 1/1] packagegroups-core-lsb: add perl-dev/doc
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
X-List-Received-Date: Tue, 11 Sep 2012 05:45:25 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B409=E6=9C=8811=E6=97=A5 13:19, Khem Raj wrote:
> On (11/09/12 13:00), Kang Kai wrote:
>> File CORE/config.h which is provided by perl-dev and file
>> unicore/version which is provided by perl-doc are required by LSB perl
>> test cases.
>>
>> Add perl-dev and perl-doc to packagegroups-core-lsb.
> hmm adding -dev and -doc to core packaggroups seems like we are wanting
> developement packagegroups which does not seem correct.
>
> why dont we move CORE/config.h into perl proper itself since the header
> is really in /usr/lib its not a typical dev header and unicore/version
> should belong to perl or perl-modules as well
OK. Thanks.

Regards,
Kai
>
>> [Yocto #3052 #3053 #3054 #3055]
>>
>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>> ---
>>   .../packagegroups/packagegroup-core-lsb.bb         |    2 ++
>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb=
.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>> index 32dc58e..cee97bc 100644
>> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>> @@ -168,6 +168,8 @@ DESCRIPTION_packagegroup-core-lsb-perl =3D "Packag=
es required to support libraries
>>       specified in the LSB Runtime languages specification (Perl parts=
)"
>>   RDEPENDS_packagegroup-core-lsb-perl =3D "\
>>       perl \
>> +    perl-dev \
>> +    perl-doc \
>>       perl-modules \
>>       perl-misc \
>>       perl-pod \
>> --=20
>> 1.7.5.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



