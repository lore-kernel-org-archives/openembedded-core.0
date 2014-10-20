Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5245260097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 14:47:50 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1XgEFS-0006tM-Lf from drew_moseley@mentor.com ;
	Mon, 20 Oct 2014 07:47:50 -0700
Received: from NA-MBX-03.mgc.mentorg.com ([fe80::9a:1569:df57:45b8]) by
	SVR-ORW-FEM-06.mgc.mentorg.com ([147.34.97.120]) with mapi id
	14.03.0181.006; Mon, 20 Oct 2014 07:47:50 -0700
From: "Moseley, Drew" <drew_moseley@mentor.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] poky: daisy: grub: add cmdpath to grub
	configuration file
Thread-Index: AQHP7HJlUEuHc7pvjkmzmaZFXoGYp5w5hhSA
Date: Mon, 20 Oct 2014 14:47:47 +0000
Message-ID: <1B0A53F7-51E1-4F30-88DC-BDA77726B158@mentor.com>
References: <1413554888-31319-1-git-send-email-drew_moseley@mentor.com>
	<CAJTo0LZ_AHXgUwSUZp5_k-NcmEzOAcN9e-p=gPzsELsfE+LHag@mail.gmail.com>
In-Reply-To: <CAJTo0LZ_AHXgUwSUZp5_k-NcmEzOAcN9e-p=gPzsELsfE+LHag@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.34.91.1]
MIME-Version: 1.0
Cc: Arindam Nath <arindam.nath@amd.com>, "Polepalli,
	Ravikiran" <Ravikiran_Polepalli@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] poky: daisy: grub: add cmdpath to grub configuration file
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
X-List-Received-Date: Mon, 20 Oct 2014 14:47:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8EBF85D56A73FE4FAB44321FEBB82F51@mentor.com>
Content-Transfer-Encoding: quoted-printable

On Oct 20, 2014, at 10:30 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 17 October 2014 15:08, Drew Moseley <drew_moseley@mentor.com> wrote:
>> An issue was found where when yocto is installed to a hard disk
>> from a live USB key, no matter what boot order was selected in
>> the BIOS menu, the grub menu of the USB key would always show
>> up. The issue was narrowed down to the way grub configuration
>> file gets embedded into the standalone bootx64.efi image.
>>=20
>> The commit prepends ($cmdpath) to the search path for grub.cfg,
>> thus making sure the UEFI environment itself sets this to the
>> correct device path. This in-turn lets the grub.cfg of the boot
>> device to be loaded.
>=20
> Presumably this needs to go to master too?
>=20
> Ross

Yes, that would be best.  I guess the original subject was a bit misleading=
.  Apologies for that.  The intent is mainly to get this into master and, i=
f possible, dizzy.  Getting it into daisy would be nice but I'm not sure it=
's a critical enough fix for that.

Thanks,
Drew=

