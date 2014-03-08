Return-Path: <cosmin.paraschiv@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn14138.inbound.protection.outlook.com [207.46.163.138])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB6D6EAC7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Mar 2014 11:46:00 +0000 (UTC)
Received: from [IPv6:2a02:2f0e:902f:ffff::4f72:a912]
	(2a02:2f0e:902f:ffff::4f72:a912) by
	BY2PR03MB128.namprd03.prod.outlook.com
	(10.242.36.28) with Microsoft SMTP Server (TLS) id 15.0.893.10;
	Sat, 8 Mar 2014 11:45:58 +0000
Message-ID: <531B02E6.6070509@freescale.com>
Date: Sat, 8 Mar 2014 13:45:42 +0200
From: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1394199544-19668-1-git-send-email-cosmin.paraschiv@freescale.com>
	<CAMKF1sq_hMS_eeF=aV4YkY6EFZP7gVgjfyabVE4p35uT8uYGRA@mail.gmail.com>
In-Reply-To: <CAMKF1sq_hMS_eeF=aV4YkY6EFZP7gVgjfyabVE4p35uT8uYGRA@mail.gmail.com>
X-Originating-IP: [2a02:2f0e:902f:ffff::4f72:a912]
X-ClientProxiedBy: AMSPR05CA006.eurprd05.prod.outlook.com (10.242.77.164) To
	BY2PR03MB128.namprd03.prod.outlook.com (10.242.36.28)
X-Forefront-PRVS: 0144B30E41
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(24454002)(189002)(199002)(479174003)(377454003)(81686001)(81816001)(79102001)(33656001)(81542001)(95666003)(59766001)(59896001)(83322001)(65806001)(65956001)(80022001)(81342001)(80976001)(76786001)(63696002)(51856001)(50466002)(77096001)(76796001)(74876001)(47776003)(97186001)(19580395003)(19580405001)(23676002)(69226001)(4396001)(53806001)(86362001)(93516002)(92726001)(50986001)(93136001)(76482001)(36756003)(74502001)(90146001)(85306002)(74662001)(85852003)(83072002)(64126003)(46102001)(94946001)(56776001)(54316002)(83506001)(47976001)(87976001)(47446002)(94316002)(49866001)(54356001)(95416001)(42186004)(47736001)(97336001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB128;
	H:[IPv6:2a02:2f0e:902f:ffff::4f72:a912];
	CLIP:2a02:2f0e:902f:ffff::4f72:a912;
	FPR:98EE4CC6.87977CC0.FBD39937.54C191EC.20109; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (: freescale.com does not designate permitted sender hosts)
X-OriginatorOrg: freescale.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Build libatomic
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Mar 2014 11:46:02 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/8/2014 2:13 AM, Khem Raj wrote:
> On Fri, Mar 7, 2014 at 5:39 AM, Cosmin Paraschiv
> <cosmin.paraschiv@freescale.com> wrote:
>> GCC 4.8 includes a new runtime library, libatomic, which supports
>> atomic operations not supported by hardware or the OS. Build it,
>> so other packages can link against it, if needed.
> what all architectures did you test

I have tested the patch on powerpc, powerpc64, i586, x86_64 and arm.

