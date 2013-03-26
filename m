Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UKKVB-0000nc-Pe
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 04:24:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2Q2FtOx025116
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Mar 2013 19:15:55 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 25 Mar 2013 19:15:55 -0700
Message-ID: <51510546.9020303@windriver.com>
Date: Tue, 26 Mar 2013 10:17:42 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1364204199.git.kai.kang@windriver.com>
	<e3e9dea5c45c1b5ba29300e4957dcd611655492e.1364204199.git.kai.kang@windriver.com>
	<1364208777.3097.41.camel@ted>
In-Reply-To: <1364208777.3097.41.camel@ted>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r2Q2FtOx025116
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] libpng: add version 1.2 back
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
X-List-Received-Date: Tue, 26 Mar 2013 03:24:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2013=E5=B9=B403=E6=9C=8825=E6=97=A5 18:52, Richard Purdie wrote:
> On Mon, 2013-03-25 at 18:21 +0800, Kang Kai wrote:
>> Current LSB 4.1 test suite still check libpng12.so, so add libpng 1.2.=
x
>> back, and set it as default verison for linuxstdbase image.
>>
>> [YOCTO 4015]
>>
>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>> ---
>>   meta/conf/distro/include/default-versions.inc   |    3 +++
>>   meta/recipes-multimedia/libpng/libpng_1.2.50.bb |   21 +++++++++++++=
++++++++
>>   2 files changed, 24 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/recipes-multimedia/libpng/libpng_1.2.50.bb
> I'm not entirely happy about this :/ Lets put this into
> meta/recipes-lsb4 along with the other stuff we just have around for
> official compatibility.

OK, I'll send V2.

Regards,
Kai

>
> Cheers,
>
> Richard
>
>
>



