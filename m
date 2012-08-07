Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1SyowC-0006yt-Vb
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 20:55:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q77IhfQW006036
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 11:43:41 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Tue, 7 Aug 2012 11:43:41 -0700
Message-ID: <502161DC.9020705@windriver.com>
Date: Tue, 7 Aug 2012 14:43:40 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1344360704-23172-1-git-send-email-yao.zhao@windriver.com>
	<502152B8.6070100@gmail.com> <50215ED9.3070505@windriver.com>
	<1344364223.4874.16.camel@x121e.pbcl.net>
	<50216009.6020601@windriver.com>
	<1344364696.4874.19.camel@x121e.pbcl.net>
In-Reply-To: <1344364696.4874.19.camel@x121e.pbcl.net>
X-Originating-IP: [128.224.147.210]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q77IhfQW006036
Subject: Re: [PATCH] cracklib, zlib: install to /lib instead of /usr/libxx
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
X-List-Received-Date: Tue, 07 Aug 2012 18:55:29 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12-08-07 02:38 PM, Phil Blundell wrote:
> On Tue, 2012-08-07 at 14:35 -0400, Yao Zhao wrote:
>> On 12-08-07 02:30 PM, Phil Blundell wrote:
>>> Where do libz.a and libz.so end up after your patch?
>> =E2=94=9C=E2=94=80=E2=94=80 zlib-dev
>> =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 lib
>> =E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 libz.so -> libz.so.1.2=
.7
>> =E2=94=94=E2=94=80=E2=94=80 zlib-staticdev
>> =E2=94=94=E2=94=80=E2=94=80 lib
>> =E2=94=94=E2=94=80=E2=94=80 libz.a
> I found the output from "tree" a bit hard to read, but that doesn't loo=
k
> right to me.
any reason? It shouldn't go to lib, but still /usr/libxx?

yao
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




