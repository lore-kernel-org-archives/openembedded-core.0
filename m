Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 379 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 22 Jan 2015 11:02:55 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.209])
	by mail.openembedded.org (Postfix) with ESMTP id 4921771144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 11:02:55 +0000 (UTC)
Received: from [216.82.241.132] by server-17.bemta-8.messagelabs.com id
	33/06-13532-467D0C45; Thu, 22 Jan 2015 10:56:36 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-11.tower-45.messagelabs.com!1421924195!45661300!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.12.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26340 invoked from network); 22 Jan 2015 10:56:35 -0000
Received: from mail.mx4.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-11.tower-45.messagelabs.com with RC4-SHA encrypted SMTP;
	22 Jan 2015 10:56:35 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.389.2;
	Thu, 22 Jan 2015 04:55:56 -0600
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Thu, 22 Jan 2015 04:56:10 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0210.002;
	Thu, 22 Jan 2015 11:56:08 +0100
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: 'Paul Eggleton' <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] Broken toolchain/SDK installation (master and dizzy)
Thread-Index: AQHQNZxoqlmFthqlkkGfWMeUr/EcnZzL8t0w
Date: Thu, 22 Jan 2015 10:56:07 +0000
Message-ID: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0AA8C2@dor-sms-xch01.digi.com>
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0AA80E@dor-sms-xch01.digi.com>
	<1466506.mcZXEbMHsI@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1466506.mcZXEbMHsI@peggleto-mobl5.ger.corp.intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.188]
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean
MIME-Version: 1.0
Cc: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Broken toolchain/SDK installation (master and dizzy)
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
X-List-Received-Date: Thu, 22 Jan 2015 11:03:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On 21/01/15 18:01, Paul Eggleton wrote:
>=20
> I can't necessarily comment on whether this is the best fix, but FWIW I
> had
> noticed this and filed a bug for it already:
>=20
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7032

Thanks for the heads-up. I will keep an eye on it.

The thing that worries me is that Dizzy is affected, including the prebuilt=
 toolchains/buildtools from:

http://downloads.yoctoproject.org/releases/yocto/yocto-1.7.1/buildtools/
http://downloads.yoctoproject.org/releases/yocto/yocto-1.7.1/toolchain/

So it's probably worth updating the bugzilla saying that Dizzy needs a back=
port once fixed in master.

-
Regards,

Javier Viguera


