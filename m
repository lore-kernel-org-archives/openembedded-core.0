Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SDNxl-0002CO-Ip
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 00:37:01 +0200
Received: from mail119-ch1-R.bigfish.com (10.43.68.248) by
	CH1EHSOBE016.bigfish.com (10.43.70.66) with Microsoft SMTP Server id
	14.1.225.23; Thu, 29 Mar 2012 22:27:57 +0000
Received: from mail119-ch1 (localhost [127.0.0.1])	by
	mail119-ch1-R.bigfish.com (Postfix) with ESMTP id 186C82C0838;
	Thu, 29 Mar 2012 22:27:57 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I936eK1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail119-ch1 (localhost.localdomain [127.0.0.1]) by mail119-ch1
	(MessageSwitch) id 1333060075800690_1958;
	Thu, 29 Mar 2012 22:27:55 +0000 (UTC)
Received: from CH1EHSMHS028.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.243])	by mail119-ch1.bigfish.com (Postfix) with ESMTP id
	BFB65C0045;	Thu, 29 Mar 2012 22:27:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS028.bigfish.com
	(10.43.70.28) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 29 Mar 2012 22:27:55 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Thu, 29 Mar 2012 17:27:55 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/1] genext2fs: support large files and
	filesystems without using large amounts of memor
Thread-Index: AQHNDfsv5itsOEByWE2PW4yCGgKnZQ==
Date: Thu, 29 Mar 2012 22:27:54 +0000
Message-ID: <CAEsOVNdZ5DrAb-HUq+0tTO8Jnf+_NbBRxV=KSLxAR_Gnr3Fc7g@mail.gmail.com>
References: <cover.1332952962.git.dexuan.cui@intel.com>
	<1333058859.18082.44.camel@ted>
In-Reply-To: <1333058859.18082.44.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: Re: [PATCH 0/1] genext2fs: support large files and filesystems without using large amounts of memor
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 29 Mar 2012 22:37:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4A75836C64B9AD4B8CDB75D9728F1D57@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 5:07 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-03-29 at 00:51 +0800, Dexuan Cui wrote:
>> Hi RP, Saul, Paul, Darren, Mark, Josh and joaohf and all, please comment=
.
>>
>> Let's figure out if this big patch is accepatable or not...
>>
>> With this patch, I can successfully create a 8.5GB .ext3 file with genex=
t2fs.
>> The speed is slow -- I spent about 1.5 hours.
>
> If these patches solved all the problems and made things work
> wonderfully I'd probably say we'd take them. Unfortunately I don't
> consider taking 1.5 hours to build am 8GB filesystem "wonderful", its
> rather worrying and I don't think its performing any where need fast
> enough for our needs :(.
>
> Patching genext2fs at this point in the cycle is a rather risky
> undertaking too and I'm getting very concerned about this.
>
> We might have to look at alternative ways to solve this problem. I think
> Darren said he might help look at this and has some other ideas. Darren?

Can fuse offer some option here?

-M=



