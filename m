Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A30787E790
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 21:57:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5JLuRds007442
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Jun 2019 14:56:37 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.194]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0439.000;
	Wed, 19 Jun 2019 14:56:16 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] parted: change device manager
	check in ptest
Thread-Index: AQHVJuWzOqva9bpzTkGVmtP3VZvvvqaj9nOA//+PNGA=
Date: Wed, 19 Jun 2019 21:56:16 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84FA80EE62@ALA-MBD.corp.ad.wrs.com>
References: <20190619212647.23685-1-joe.slater@windriver.com>,
	<4613a7cbefe6f6a342f33e129834e5cc10f30fc1.camel@linuxfoundation.org>
In-Reply-To: <4613a7cbefe6f6a342f33e129834e5cc10f30fc1.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.119.234]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] parted: change device manager check in ptest
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
X-List-Received-Date: Wed, 19 Jun 2019 21:57:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I will send a patch upstream.   Joe=0A=
________________________________________=0A=
From: Richard Purdie [richard.purdie@linuxfoundation.org]=0A=
Sent: Wednesday, June 19, 2019 2:39 PM=0A=
To: Slater, Joseph; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [oe-core][PATCH 1/1] parted: change device manager c=
heck in ptest=0A=
=0A=
On Wed, 2019-06-19 at 14:26 -0700, Joe Slater wrote:=0A=
> t6001-psep should check for device manager the same way as=0A=
> other ptests for parted -- look for an environment variable.=0A=
>=0A=
> Signed-off-by: Joe Slater <joe.slater@windriver.com>=0A=
> ---=0A=
>  meta/recipes-extended/parted/files/dm_check.patch | 22=0A=
> ++++++++++++++++++++++=0A=
>  meta/recipes-extended/parted/parted_3.2.bb        |  1 +=0A=
>  2 files changed, 23 insertions(+)=0A=
>  create mode 100644 meta/recipes-extended/parted/files/dm_check.patch=0A=
>=0A=
> diff --git a/meta/recipes-extended/parted/files/dm_check.patch=0A=
> b/meta/recipes-extended/parted/files/dm_check.patch=0A=
> new file mode 100644=0A=
> index 0000000..bc0e95f=0A=
> --- /dev/null=0A=
> +++ b/meta/recipes-extended/parted/files/dm_check.patch=0A=
> @@ -0,0 +1,22 @@=0A=
> +parted: change check for device-manager=0A=
> +=0A=
> +Other ptests use this method.=0A=
> +=0A=
> +Upstream-Status: Pending=0A=
> +=0A=
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>=0A=
=0A=
This sounds like something which should be an obvious/easy fix for=0A=
upstream, any chance we can submit it?=0A=
=0A=
I'm hoping we can get our patch load down a bit so pushing obvious=0A=
things to upstream is good...=0A=
=0A=
Cheers,=0A=
=0A=
Richard=0A=
=0A=

