Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Feb 2020 10:02:42 UTC
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 24E7E60CED
	for <openembedded-core@openembedded.org>;
	Mon, 10 Feb 2020 10:02:42 +0000 (UTC)
IronPort-SDR: BNwZ8eVL6mwIu2jXcrWRKUmnOCHnH9LfWBrYbziiZZNYX+pyh5BJgnNvSh7B12f5z6Phcb0dBM
	333YmCOEu+jh9gKvUnVkjhefDTWBar0fcQsTLGmSbho/znzWOj3dQXdChtNK8cxnoZQ1nXZKdc
	c4x28xEK2/7phIpqv+eFSgTDQbO1iTeJDPCaI/GRG2cdUnLGgHqrf+MLFgDbXunGK8I0UGnt7L
	+7asE3PxKHXtQDIRHP4nrmTkmuUrfp3/o5O5P5pUocLVJFwHveHxW5KWbW3Iu/SpU9sf0318IL
	cAk=
X-IronPort-AV: E=Sophos;i="5.70,424,1574118000"; 
   d="scan'208";a="5101909"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>, Armin Kuster
	<akuster808@gmail.com>, Anuj Mittal <anuj.mittal@intel.com>
Thread-Topic: [OE-core] [zeus 00/29] Patch review
Thread-Index: AQHV32NsUiySI8ABoUyk5lNFUAakHqgUAreAgAAshnA=
Date: Mon, 10 Feb 2020 09:55:34 +0000
Message-ID: <2cd46664933442f788e7d5ef62b184eb@XBOX03.axis.com>
References: <cover.1581264380.git.akuster808@gmail.com>
	<e84c869d-1f1c-fdcf-4994-02277ab9d266@kontron.de>
In-Reply-To: <e84c869d-1f1c-fdcf-4994-02277ab9d266@kontron.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: "openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
Subject: Re: [zeus 00/29] Patch review
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
X-List-Received-Date: Mon, 10 Feb 2020 10:02:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Schrempf Frieder
> Sent: den 10 februari 2020 09:07
> To: Armin Kuster <akuster808@gmail.com>; openembedded-
> core@openembedded.org
> Subject: Re: [OE-core] [zeus 00/29] Patch review
>=20
> Hi Armin,
>=20
> On 09.02.20 17:09, Armin Kuster wrote:
> > These are the additional changes to help address reproducibility issues
> > and additional fixes we would like to be included in 3.0.2
> >
> > Please have comments back by Tuesday
>=20
> I have two questions/comments:
>=20
> 1. When I look at the zeus-next branch, why do I see only patches 7 to
> 29 from this series applied and what about patches 1 to 6? Am I missing
> something?

That is a really good question, and one I too would like an answer to.

> 2. Patch 5 (devtool/standard.py: Allow recipe to disable menuconfig
> logic) goes hand in hand with a change to the u-boot recipe, that is
> also in master (c634b8db1a8b). This patch seems to be missing here.

That one is probably my fault. We have a local recipe that defines a=20
menuconfig task and thus I needed the correction for devtool and sent=20
a request for it to be backported. However, since we do not use u-boot,=20
I did not think of that part, which obviously should be backported too.=20

> Regards,
> Frieder

//Peter


