Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D8557724F4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 14:55:43 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y7mak-0002rP-FA from Awais_Belal@mentor.com ;
	Sun, 04 Jan 2015 06:55:42 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.213]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id
	14.03.0224.002; Sun, 4 Jan 2015 14:55:41 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Koen Kooi <koen@dominion.thruhere.net>, Nicolas Dechesne
	<nicolas.dechesne@linaro.org>
Thread-Topic: [OE-core] [PATCH] gstreamer1.0-omx: use mulitple SCMs to fetch
	submodules
Thread-Index: AQHQI2TIvmlbJunIkUOUO5qdabwjd5yv6gSAgAAsGv4=
Date: Sun, 4 Jan 2015 14:55:40 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28EA005329@EU-MBX-03.mgc.mentorg.com>
References: <1419846408-31247-1-git-send-email-awais_belal@mentor.com>
	<CAP71WjzrFn=W8QYoDQybKyLxEpi4zL6yN8xkFZK=ze-6YZ_rLw@mail.gmail.com>,
	<ADD5E5A7-ABF1-41DD-A47A-151856FA7468@dominion.thruhere.net>
In-Reply-To: <ADD5E5A7-ABF1-41DD-A47A-151856FA7468@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.68]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-omx: use mulitple SCMs to fetch submodules
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
X-List-Received-Date: Sun, 04 Jan 2015 14:55:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Koen,=0A=
=0A=
Please see the comments here: http://patchwork.openembedded.org/patch/85413=
/=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Koen Kooi [koen@dominion.thruhere.net]=0A=
Sent: Sunday, January 04, 2015 5:17 PM=0A=
To: Nicolas Dechesne=0A=
Cc: Belal, Awais; Patches and discussions about the oe-core layer=0A=
Subject: Re: [OE-core] [PATCH] gstreamer1.0-omx: use mulitple SCMs to fetch=
 submodules=0A=
=0A=
> Op 29 dec. 2014, om 13:41 heeft Nicolas Dechesne <nicolas.dechesne@linaro=
.org> het volgende geschreven:=0A=
>=0A=
> On Mon, Dec 29, 2014 at 10:46 AM, Awais Belal <awais_belal@mentor.com> wr=
ote:=0A=
>> The gstreamer omx package uses a submodule 'common' which=0A=
>> is fetched by the configure script. This approach fails=0A=
>> on non-network builds as the fetcher tries to look upstream=0A=
>> for the submodule.=0A=
>> We now use multiple SCMs, one for the main omx package and=0A=
>> the other for the 'common' submodule so it is available in=0A=
>> the downloads_dir for later use.=0A=
>>=0A=
>=0A=
> we have the same issues with all the others gstreamer1.0-*_git.bb=0A=
> recipes, don't we? maybe we should fix them all. i am not sure if=0A=
> there is a nice way to do it for all recipes, like with a .inc file,=0A=
> to avoid duplication..=0A=
=0A=
Why not use the 'gitsm' fetcher, that's what it's there for after all?=0A=

