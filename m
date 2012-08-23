Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T4gX1-0003F5-FG
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 01:09:43 +0200
Received: from mail82-co1-R.bigfish.com (10.243.78.249) by
	CO1EHSOBE011.bigfish.com (10.243.66.74) with Microsoft SMTP Server id
	14.1.225.23; Thu, 23 Aug 2012 22:57:35 +0000
Received: from mail82-co1 (localhost [127.0.0.1])	by mail82-co1-R.bigfish.com
	(Postfix) with ESMTP id A54CA8A00B6;
	Thu, 23 Aug 2012 22:57:35 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 2
X-BigFish: VS2(z37d4lz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2hbe9i1155h)
Received: from mail82-co1 (localhost.localdomain [127.0.0.1]) by mail82-co1
	(MessageSwitch) id 1345762653972433_13981;
	Thu, 23 Aug 2012 22:57:33 +0000 (UTC)
Received: from CO1EHSMHS013.bigfish.com (unknown [10.243.78.252])	by
	mail82-co1.bigfish.com (Postfix) with ESMTP id EAA617C0047;
	Thu, 23 Aug 2012 22:57:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS013.bigfish.com
	(10.243.66.23) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 23 Aug 2012 22:57:33 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.3]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Thu, 23 Aug 2012 17:57:33 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] distutils-common-base.bbclass: Pick up
	additional .debug folders:
Thread-Index: AQHNgXyL2GERuLJx7E2eDSLW7YvlgJdoVhiA
Date: Thu, 23 Aug 2012 22:57:31 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A61294C@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1345747597-18078-1-git-send-email-msm@freescale.com>
	<CAJTo0LZNhPx5Fj59mSnGudsmMQxDxNefZi+98HWuiSqdFoTJdQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZNhPx5Fj59mSnGudsmMQxDxNefZi+98HWuiSqdFoTJdQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distutils-common-base.bbclass: Pick up additional .debug folders:
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2012 23:09:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <14C452928A9457419D7F441747612339@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 23, 2012 at 5:13 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
> On 23 August 2012 19:46, Matthew McClintock <msm@freescale.com> wrote:
>>    ${PYTHON_SITEPACKAGES_DIR}/.debug \
>>    ${PYTHON_SITEPACKAGES_DIR}/*/.debug \
>>    ${PYTHON_SITEPACKAGES_DIR}/*/*/.debug \
>> +  ${libdir}/${PYTHON_DIR}/.debug \
>> +  ${libdir}/${PYTHON_DIR}/*/.debug \
>> +  ${libdir}/${PYTHON_DIR}/*/*/.debug \
>
> I thought packages that used distutils generally put their files under
> sitepackages, and not the python base directory...  Are some packages
> doing it wrong?

pexpect was installing /usr/lib/python2.7 and that was my basis for
the correct location so I changed it to ${libdir} to fix that... I
just sent another patch that might address this issue..

-M

>
> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



