Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T4wb2-0007Uv-FQ
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 18:18:56 +0200
Received: from mail255-va3-R.bigfish.com (10.7.14.245) by
	VA3EHSOBE005.bigfish.com (10.7.40.25) with Microsoft SMTP Server id
	14.1.225.23; Fri, 24 Aug 2012 16:06:48 +0000
Received: from mail255-va3 (localhost [127.0.0.1])	by
	mail255-va3-R.bigfish.com (Postfix) with ESMTP id 81C5B80007D;
	Fri, 24 Aug 2012 16:06:48 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 2
X-BigFish: VS2(z37d4lz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2hbe9i)
Received: from mail255-va3 (localhost.localdomain [127.0.0.1]) by mail255-va3
	(MessageSwitch) id 1345824406561428_28204;
	Fri, 24 Aug 2012 16:06:46 +0000 (UTC)
Received: from VA3EHSMHS037.bigfish.com (unknown [10.7.14.249])	by
	mail255-va3.bigfish.com (Postfix) with ESMTP id 86201100045;
	Fri, 24 Aug 2012 16:06:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS037.bigfish.com
	(10.7.99.47) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 24 Aug 2012 16:06:46 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.3]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Fri, 24 Aug 2012 11:06:45 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH] distutils-common-base.bbclass: Pick up
	additional .debug folders:
Thread-Index: AQHNgXyL2GERuLJx7E2eDSLW7YvlgJdo00OAgACiZAA=
Date: Fri, 24 Aug 2012 16:06:45 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6160FE@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1345747597-18078-1-git-send-email-msm@freescale.com>
	<CAJTo0LZNhPx5Fj59mSnGudsmMQxDxNefZi+98HWuiSqdFoTJdQ@mail.gmail.com>
	<20120824062509.GR3029@jama.jama.net>
In-Reply-To: <20120824062509.GR3029@jama.jama.net>
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
X-List-Received-Date: Fri, 24 Aug 2012 16:18:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CE011B1B855EE048851210C584E68F5E@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2012 at 1:25 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Aug 23, 2012 at 11:13:08PM +0100, Burton, Ross wrote:
>> On 23 August 2012 19:46, Matthew McClintock <msm@freescale.com> wrote:
>> >    ${PYTHON_SITEPACKAGES_DIR}/.debug \
>> >    ${PYTHON_SITEPACKAGES_DIR}/*/.debug \
>> >    ${PYTHON_SITEPACKAGES_DIR}/*/*/.debug \
>> > +  ${libdir}/${PYTHON_DIR}/.debug \
>> > +  ${libdir}/${PYTHON_DIR}/*/.debug \
>> > +  ${libdir}/${PYTHON_DIR}/*/*/.debug \
>>
>> I thought packages that used distutils generally put their files under
>> sitepackages, and not the python base directory...  Are some packages
>> doing it wrong?
>
> Yes, almost all python-* recipes after this patch
> http://git.openembedded.org/openembedded-core/commit/?id=3D3b23feca31480c=
c56f55301fd0274e622c40b522
>
> I have 9 such recipes in my dep tree.

Martin,

Can you look at:

http://patches.openembedded.org/patch/35245/

-M

>
> Cheers,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=



