Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8929BC433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 20:25:03 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.94])
 by mx.groups.io with SMTP id smtpd.web10.31149.1639513500071608263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 12:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=Q+5DeWLJ;
 spf=pass (domain: outlook.com, ip: 40.92.74.94,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDhT2HE0gNuZKlRjQHIcZWQZYrLUnpTgzULzPCUuQQvE7dJxLv5N6spW+RPVht0N9zEaOoGga2szZKFY6NGnuzD22auypXHa635Mji7OWGEbSp6JT/kquDISIPJCy/xsHWPAOX8J63/UHyaWg2nUsB/FH1omRGKbcG4x8D9dw198xEl5kGwTyffxADqChpaJlGSxhX/3LQAd4sLt59c7XqGUUvbHKn5MXcvaYT3K/nRdh2trEuRt7AJ1ThAihxc+UsRlz+BPiklGtWdwV5jmAFhK1MPPAP8SesL2/OQUX/RLGlykdj7/blnSxlc3Q+QDmxuaCawaJfI9/z1cHmnZ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8svj1RJrH6+uc/E4Ith2H9bvxB6sg4Jo+Wl7RHVKknA=;
 b=e9mbhBhr8K1dO5xj3hYiMWlPmvOmoTIBaBxjBRTYi8HR4IZCjs05mYJ9Db729Y64eua1osMPfRuB1Yk2p8suPu14yYRj5xNOFfb3foYul4yA+5IDYx0RERv30XmJwC0185AHEpbjkcCoY3vJvdDDFHh/kq/hnhFfne1QLY0ghHpUzRF/kPhndjoj2mENeZXYEej3kYssLX4TWvlcniiHAtUhGZWAXQSJFbfDyjJp+2bQYQSAg+2m1DBzHvPcv3k+qEWTxj8V4hsqaTOGuKnA/J+QBgxiBjvhwPi9Wii4f8QrJWJ1ak18XsyNNfdIATJq0LaXYR3TPTIIeq4rAMMUfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8svj1RJrH6+uc/E4Ith2H9bvxB6sg4Jo+Wl7RHVKknA=;
 b=Q+5DeWLJv5v0qYC5DF/Amg704xeD0v7abjY8e+UP+JVXEcI/hDxNd+YbUuC8i5WyJSSKx41zXiGR8QCPIIgtG4QEaYYkNwYTHOrwaRvUVf+PXIl1bLkxe+fv7cM4z9u4rrYBfkw4ysklpENl4ghX3ZxHFobnpC0twY9AUAbtRzwQa9XObwrskzwMwwA/XU2gMwYk7NxlymE5R5MNza1Ce63+jttr2VHv8HhOlS6xCKNP50KzXjYcPL9fcRzA+ZhXGGv2yna35fG+0HXOTMy+K/uS9/06Pis7cPVqLp+XfrnssRWcufw+f6mdeEuItoTPhjA6jOyNTkuyrzBvxxINNA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2308.eurprd09.prod.outlook.com (2603:10a6:208:df::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Tue, 14 Dec
 2021 20:24:57 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.014; Tue, 14 Dec 2021
 20:24:57 +0000
Subject: Re: [OE-core] [meta-oe][RFC PATCH] insane: Inappropriate patch
 reasoning
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <16C0B098D197A5E1.12686@lists.openembedded.org>
 <AM9PR09MB464259F10AA7B2E44E403188A8759@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CADkTA4M=vQvNfTirHjAmU3tm7CdhkBrdErEgUqCqSyD749Us+w@mail.gmail.com>
 <AM9PR09MB464226B4422C79E0C7F6E508A8759@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CANNYZj8OabnaRPOs8Sm_B2A9MiLj58cO4FUu6hLR5+QmSby5Tg@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642FAB542134B6923C1DA2DA8759@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 14 Dec 2021 21:24:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CANNYZj8OabnaRPOs8Sm_B2A9MiLj58cO4FUu6hLR5+QmSby5Tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-TMN: [iJi9Oce0dZ/Q2+xi5aIYNRRSJWvVT6tg0BgPjrYE+YWjcpvq12Z5dNzdgyl/HchS]
X-ClientProxiedBy: FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::11) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <225147af-455b-2ff3-e2ec-c322f62a8879@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 901482e4-48bb-4c7e-a98e-08d9bf3fcc05
X-MS-TrafficTypeDiagnostic: AM0PR09MB2308:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jFTtrJP0EgMpqhHvDE28n5OIEwzseLOb+tF79E2f7cfnKpymt4x+mvFh0BPV7M3S3v7m+w+3Vbw2CPlj9jz0UwsVIvXuQxOUPcpb9VlDKkKm1mx8ZmMYDUI7dHoGrTHdRKZfk/qlDjI+5eOyJw22bcVJFSUzmPH1C2RJfkMgCYDbnVmW7bnnfImFIn60T7V1zaPTIqgevnyzhebmJajQqVuedfY0G7BPp3zJ2hwTJLW3xjFLjYY3SQm8JkX32wpqmBVajOnTba1hwEDwaXT9InkDk9pVbm4Vaf+UOJLSqLIYsqujZ4+aKkmhVF7nvVpR1ETvbXgBczqOC5r3m2eY3uZ7MdjXN6iPPWxL2Nt6jyu4rTchzKYz5g9hITZepgmZ9y0sHc20dmQTv70UXHZXbLy/ENEuCN9CoaLMZbAIpBLfllgX/oUuDC/zkEXiD0coojzDEqsJa2cZ0gr1gwhvLrLFs2IyPKyWnIeDojrV8mZSkEi6NwMvBHDzW9piXrWgss44QPF+qhizof8JdwY7eKXUr1uZvY423yOGG1U41nPFwtb+zrUdadPR8NCXCrdzzYEUnnWZ0zyZChQllqLp3uz05neQeLOEi7hL9WsMgdNwV5M5pM2ibMYzu79onut5jA39g/XeiTbeALduf560acV5t9FAQcwxDcQA3G0SPD8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Gt/7UjdlElXS5z4iBZxBT2o/ZnfZ7+K6Z7lxb8yO6jv7qQVIuoqf9beqJQOd?=
 =?us-ascii?Q?FdjDp+Tv3tX6nUomdRw0p76dkKz5k9n+/luD/dXgL5eBsoc5kW18myWm0Q/K?=
 =?us-ascii?Q?SwrE03CBOAjzOBCZqmzCIEToH6PYUtQfdFmhv/g0f0UUgav8xO6SdvI3GgEu?=
 =?us-ascii?Q?10lx5hFJQt2DacuYHNjW+1IuruZnW010wr7xJxUx8Msy+ao5ElrIZcoUgpzf?=
 =?us-ascii?Q?0T4sLfhnMN6hOAEZ8fWrx3n9QYL5zpC1sWvZLDWivZ1L1Pml4VKbZ6yL8IGD?=
 =?us-ascii?Q?qhfb/1bgfDur4PVdHbUT5aqomIzBe5lzjnt+0fiibuv0pKTC8j7MyKD4lFdJ?=
 =?us-ascii?Q?u4eBWphDqaphvY/a5H7yx2H3JZjahOHqxSiNzkaa4lJAsKRsxod1LeZi92Ri?=
 =?us-ascii?Q?qJpuZarTzVKCjH3ZzfbGlw/rwv5pSa5N4pRHVxQLjBnqbE63NgLL1b5UV/87?=
 =?us-ascii?Q?02HZBBjKXDiZplhScL/5rcc1bjH83iTMOaubhnwHMnZ5IoJwVkb4YzeaMj9x?=
 =?us-ascii?Q?o9cmQoCaroVH4BiBhLskscg6he6sDRmc9WzI+PMBExEcum/eCptlf37uRBY6?=
 =?us-ascii?Q?y9YBckITbkuTJgyKM9Nm96uXfvCMp8fW0U7L8hUy7ebeTKudpSFfrf2a5N0D?=
 =?us-ascii?Q?m8oICYvxblm5K3si6m2iGXjCNSsajEh9Y8wxT/8zuRihEbu4Pp917cutKoGk?=
 =?us-ascii?Q?Hmbr8b370qocBgiPKQCl6iH7udWYhPtSZLGt6igJvktz5pRmdhqigNeSO6uu?=
 =?us-ascii?Q?G8FNL6HezW/JmN/aIkQlXy6ELeE2pFsaC2RebRqTq5AWqN0rdsQ8rSoFNYzN?=
 =?us-ascii?Q?S9nuNLRhj/lgBxEtyCN9JWk/qmJsWw61ssZj4n94BkLoL850gFjuoQ3VFZWC?=
 =?us-ascii?Q?EvhtwHftoh72h1f7/Yu4hqsU5NoQRXl17i8Ik+nl/f2pFrv1Krn5kxUACzHY?=
 =?us-ascii?Q?XAwmZxcWhzOhVJKVqQmdJ1jslNUVsPZBcB2JWna2SkdzFNuVqKQEzjUM93y0?=
 =?us-ascii?Q?nKVB5o5u06/aM2b9PhFm2qAvsA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 901482e4-48bb-4c7e-a98e-08d9bf3fcc05
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 20:24:57.8434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2308
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 20:25:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159709


On 14.12.21 21:11, Alexander Kanavin wrote:
> What I would like to see at least is correctly tagging patches with dead=
=20
> upstreams, now that we have the shiny new status for it, and a report=20
> where they can be seen clearly :)

The point of that patch is to have everything more machine readable, so=20
we can have your requested stats and any stats one can think of :-) -=20
and to my understanding that was the whole point of defining these=20
metadata entries.

I think we should head down this road, even if the initial amount of=20
changes might be quite high - but in the end we might have some pretty=20
automated, fancy stats, that will really provide some insights.

If we don't, we might end up in defining more and more new ids for=20
different things already covered by the current approach.

>=20
> Alex
>=20
> On Tue, 14 Dec 2021 at 19:48, Konrad Weihmann <kweihmann@outlook.com=20
> <mailto:kweihmann@outlook.com>> wrote:
>=20
>=20
>=20
>     On 14.12.21 19:38, Bruce Ashfield wrote:
>      > On Tue, Dec 14, 2021 at 1:05 PM Konrad Weihmann
>     <kweihmann@outlook.com <mailto:kweihmann@outlook.com>> wrote:
>      >>
>     [snip]
>=20
>      >>
>      >>
>     meta/recipes-support/vte/vte/0001-Makefile.docs-correctly-substitute-=
gtkdoc-qemu-wrapp.patch:
>      >>=C2=A0 =C2=A0 =C2=A06: Upstream-Status: Inappropriate [oe-core spe=
cific]
>      >>
>      >> or are simply ignoring it at all.
>      >>
>      >> In total that are 352 patches I could indentify in latest master.
>      >>
>      >> I don't want to open up another can of worms, but either we drop =
the
>      >> reasoning from Inappropriate in the patch guideline completely or=
 we
>      >> need to fix that in core (I guess in other layers it is even
>     worse :) )
>      >>
>      >> Any thoughts?
>      >
>      > If we can opt out of the check either in a layer config or a recip=
e,
>      > then the noise can at least be minimized. Since the ecosystem !=3D
>      > oe-core, this level of checking needs to be something that can be
>      > opted-out / disabled.
>      >
>      > Whatever way this goes, I'd suggest that it not merge until the st=
art
>      > of the new year .. luckily RP is in full control of when it merges=
.
>      >
>      > Because I for one, won't be spending the Chrismtas holidays queuin=
g
>      > other people's patches, or fixing status lines in the patches in m=
y
>      > layers :)
>      >
>      > Cheers,
>      >
>      > Bruce
>=20
>     Actually a very good idea, but I'm not sure how fine grained we want
>     these package-qa ids to be... @RP any thoughts?
>=20
>     Basically we can solve the issue either
>     - by keeping the status quo (dropping the reason from the docu)
>     - or having is according to docu
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 - having it as a warning in the first pl=
ace
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 - turning it into an error once we are c=
lean in core and
>     all layers
>     hosted on yocto project's infra
>=20
>     But yeah sure that patch doesn't need to go in this year, as I don't
>     want to ruins everyone's holidays :-)
>=20
>      >>
>      >> On 14.12.21 18:53, Konrad Weihmann wrote:
>      >>> if a patch uses Upstream-Status: Inappropriate it should
>     provide a machine
>      >>> readable reasoning in square brackets.
>      >>>
>      >>> According to latest wiki entry that would be
>      >>>
>      >>> not author
>      >>> native
>      >>> licensing
>      >>> configuration
>      >>> enable feature
>      >>> disable feature
>      >>> bugfix .*
>      >>> embedded specific
>      >>> no upstream
>      >>> other
>      >>>
>      >>> a detailed reasoning could be provided as part of the commit
>     message,
>      >>> but format of the metadata line is fixed.
>      >>>
>      >>> This patch adds a check to insane.bbclass and warns if there is =
a
>      >>> non-compliant reasoning given, or none at all.
>      >>>
>      >>> In a follow-up this should be turned into an error, as it was do=
ne
>      >>> with missing Upstream-Status
>      >>>
>      >>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com
>     <mailto:kweihmann@outlook.com>>
>      >>> ---
>      >>>=C2=A0 =C2=A0 meta/classes/insane.bbclass | 20 ++++++++++++++++++=
++
>      >>>=C2=A0 =C2=A0 1 file changed, 20 insertions(+)
>      >>>
>      >>> diff --git a/meta/classes/insane.bbclass
>     b/meta/classes/insane.bbclass
>      >>> index 240f3aad62..da26f4662c 100644
>      >>> --- a/meta/classes/insane.bbclass
>      >>> +++ b/meta/classes/insane.bbclass
>      >>> @@ -1191,6 +1191,26 @@ python do_qa_patch() {
>      >>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bb.error("Malformed Upstream-Status in
>     patch\n%s\nPlease correct according to %s :\n%s" % (fullpath,
>     guidelines, match_kinda.group(0)))
>      >>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
>      >>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bb.error("Missing Upstream-Status in
>     patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
>      >>> +
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0inappr_message_re =3D
>     r'Inappropriate(\s+\[(?P<reason>.*)\])*'
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0inappr_reasons =3D [
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'not author',
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'native',
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'licensing',
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'configuration',
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'enable feature',
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'disable feature',
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'bugfix .*',
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'embedded specific',
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'no upstream',
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'other',
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0]
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0for match_inappr in re.finditer(inap=
pr_message_re,
>     content, re.IGNORECASE | re.MULTILINE):
>      >>> +
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if 'reason' not in mat=
ch_inappr.groupdict():
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warni=
ng("Missing Upstream-Status:
>     Inappropriate reasoning in patch\n%s\nPlease add according to %s ."
>     % (fullpath, guidelines))
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif not any(re.match(=
x,
>     match_inappr.groupdict().get('reason', '') or '') for x in
>     inappr_reasons):
>      >>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warni=
ng("Malformed Upstream-Status:
>     Inappropriate in patch\n%s\nPlease correct according to %s :\n%s" %
>     (fullpath, guidelines, match_inappr.group(0)))
>      >>>=C2=A0 =C2=A0 }
>      >>>
>      >>>=C2=A0 =C2=A0 python do_qa_configure() {
>      >>>
>      >>>
>      >>>
>      >>>
>      >>>
>      >>
>      >>
>      >>
>      >
>      >
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#159705):
>     https://lists.openembedded.org/g/openembedded-core/message/159705
>     <https://lists.openembedded.org/g/openembedded-core/message/159705>
>     Mute This Topic: https://lists.openembedded.org/mt/87726727/1686489
>     <https://lists.openembedded.org/mt/87726727/1686489>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

