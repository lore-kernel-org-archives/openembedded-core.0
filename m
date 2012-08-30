Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T6u6l-00039S-9B
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 04:03:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7U1pSUg004028
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Aug 2012 18:51:28 -0700 (PDT)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Wed, 29 Aug 2012 18:51:27 -0700
Message-ID: <503EC72D.8090907@windriver.com>
Date: Thu, 30 Aug 2012 09:51:41 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1346236551.git.kai.kang@windriver.com>
	<9f48122d927aa0253b5f5a4e0f3dfe242c557d4e.1346236551.git.kai.kang@windriver.com>
	<1346281003.3283.0.camel@ted>
In-Reply-To: <1346281003.3283.0.camel@ted>
X-Originating-IP: [128.224.162.164]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q7U1pSUg004028
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] Add dependency libidn to 3 packages
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
X-List-Received-Date: Thu, 30 Aug 2012 02:03:47 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B408=E6=9C=8830=E6=97=A5 06:56, Richard Purdie wrote:
> On Wed, 2012-08-29 at 18:39 +0800, Kang Kai wrote:
>> Add dependency libidn to wget, ghostscript and msmtp. These packages
>> check libidn automatically to build with or without libidn.
>> When libidn has been populate to sysroot but doesn't create rpm/deb
>> package, create image will fail as follow:

Hi Richard,

> What do we gain by adding this dependency? Do we need it?
For wget, It can deal international domain name such as=20
"http://stefan.k=C3=B6gl.co.at/"
It is fine to disable it, I'll send V2.

Regards,
Kai

>
> Cheers,
>
> Richard
>
>



