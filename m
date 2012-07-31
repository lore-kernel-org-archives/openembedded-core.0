Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1Sw3FC-0004HJ-Rn
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 05:35:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6V3O1lL006046
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Jul 2012 20:24:01 -0700 (PDT)
Received: from [128.224.162.163] (128.224.162.163) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Mon, 30 Jul 2012 20:24:01 -0700
Message-ID: <50174FD1.6020805@windriver.com>
Date: Tue, 31 Jul 2012 11:24:01 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343639174-29579-1-git-send-email-rongqing.li@windriver.com>
	<lyk3xlfutp.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyk3xlfutp.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q6V3O1lL006046
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] perf-3.4: fix hardcoded slang include dir
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
X-List-Received-Date: Tue, 31 Jul 2012 03:35:39 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 2012=E5=B9=B407=E6=9C=8830=E6=97=A5 17:43, Enrico Scholz wrote:
> <rongqing.li-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:
>
>> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
>> ...
>> +	sed -i "s:-I/usr/include/slang:-I${STAGING_INCDIR}:" ${S}/tools/perf=
/Makefile
>
> You are patching an already staged file here:
>
>   | S =3D "${STAGING_KERNEL_DIR}"
>
> When want to fix it in this way (another workaround might be adding
> 'WERROR=3D0' to EXTRA_OEMAKE), it must be done in kernel.bbclass.
>
>
Thanks, I will modify it.

-Roy

> Enrico
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--=20
Best Reagrds,
Roy | RongQing Li




