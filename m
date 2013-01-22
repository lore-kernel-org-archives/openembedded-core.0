Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TxTG8-00052G-15
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 03:06:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0M1p3uP004509
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Jan 2013 17:51:03 -0800 (PST)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Mon, 21 Jan 2013 17:51:02 -0800
Message-ID: <50FDF0D5.8000105@windriver.com>
Date: Tue, 22 Jan 2013 09:52:21 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1358754984.git.kai.kang@windriver.com>
	<36a8eaeb4853ea8ce5faa235e106e496b69bf356.1358754984.git.kai.kang@windriver.com>
	<1358763940.14265.45.camel@ted>
In-Reply-To: <1358763940.14265.45.camel@ted>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r0M1p3uP004509
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] external-python-tarball: code refactoring
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
X-List-Received-Date: Tue, 22 Jan 2013 02:06:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2013=E5=B9=B401=E6=9C=8821=E6=97=A5 18:25, Richard Purdie wrote:
> On Mon, 2013-01-21 at 15:59 +0800, Kang Kai wrote:
>> external-python-tarball only can be built when inherit package_ipk now.
>> Update it and split the populate python operation to separated bbclass
>> according the value of PACKAGE_CLASSES, then it could be built for rpm
>> and deb too.
>>
>> [Yocto 3006]
>>
>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>> ---
>>   meta/classes/populate_python_deb.bbclass          |   42 +++++++++++=
+++
>>   meta/classes/populate_python_ipk.bbclass          |   43 +++++++++++=
++++
>>   meta/classes/populate_python_rpm.bbclass          |   59 +++++++++++=
+++++++++
>>   meta/recipes-core/meta/external-python-tarball.bb |   61 ++++-------=
----------
>>   4 files changed, 155 insertions(+), 50 deletions(-)
>>   create mode 100644 meta/classes/populate_python_deb.bbclass
>>   create mode 100644 meta/classes/populate_python_ipk.bbclass
>>   create mode 100644 meta/classes/populate_python_rpm.bbclass
> No, sorry but this isn't right. We already have package specific
> functions to do these things, we should be trying to reuse those. If we
> can't reuse the functions, we need to improve them so we can.

OK, I'll try to use the existed function.

Thanks,
Kai
>
> Cheers,
>
> Richard
>
>



