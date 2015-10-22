Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D0704770A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:17:45 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZpHcf-0007W4-Mf from Noor_Ahsan@mentor.com ;
	Thu, 22 Oct 2015 08:17:45 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.18]) by
	SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) with mapi id
	14.03.0224.002; Thu, 22 Oct 2015 16:17:45 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC] rawcopy.py: Copy source file in image creation
	build folder
Thread-Index: AQHRDBpMmQJRJH2xI0egLkJjuEGttZ53e44AgAAloOA=
Date: Thu, 22 Oct 2015 15:17:44 +0000
Message-ID: <365E1805BC95084CBE82381A0B86999401095FBD20@EU-MBX-01.mgc.mentorg.com>
References: <1445443468-8394-1-git-send-email-noor_ahsan@mentor.com>
	<5628EC6A.2090803@linux.intel.com>
In-Reply-To: <5628EC6A.2090803@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Subject: Re: [RFC] rawcopy.py: Copy source file in image creation build folder
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
X-List-Received-Date: Thu, 22 Oct 2015 15:17:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Leonardo Sandoval [mailto:leonardo.sandoval.gonzalez@linux.intel.com]=
=20
Sent: Thursday, October 22, 2015 7:02 PM
To: Ahsan, Noor; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC] rawcopy.py: Copy source file in image creation=
 build folder


> +        else:
> +            dst =3D os.path.join(cr_workdir, source_params['file'])
> +            dd_cmd =3D "cp src dst"
> +            exec_cmd(dd_cmd)
>

the constructed dst variable is not being included into the dd_cmd, is it? =
I would expect something like

dd_cmd =3D "cp %s %s" % (src, dst)


yeah missed out. Will look into that but does this mechanism make sense?

