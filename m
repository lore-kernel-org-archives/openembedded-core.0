Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.45])
 by mx.groups.io with SMTP id smtpd.web09.6208.1631705680182766033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 04:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=SyOHFJel;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.45, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfqgbStNrhtMZTh/FgVGJAn8YUtT7ziGac6zTuONdRKXeP+26bbOowDzOuz1oaslx33Q/4AX44zRzeIEMQJWcLZ70fhVpG/OIDYn9l46d3939uLVHPum1ngYEjKvEIY4B2sCrSSBpYxjtdqeu8F0QSIasNVvdwn1shbeWWols3oLhIzHnhZELb8Y5LDYqDCipYfLN3eIWtFGH0LVdswHA0J3F+LUmF1bFcXFeofK6t+jE1fjVRVq8g37z5ns3RM63BTssX3iVRtPKq8J23HU+eWxpbaoD8Oky+LB8pCf2v/z+tsslooQkFFsRYYDg49fYjaWRyMFQLK0ASo6DBrIKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=KqUL/T4sNMoezzueAHSdG2yCsFFV11cc/i6pEavX950=;
 b=M7jQBndrECW+QftwQkWu7BpKqRnLGSkmpRhz8OpbQwROTC4MCmT+K6n36tL6b7RrP7JqSsAaVD//Qx6dsBz3QDQROm5WbuLDqVSHx1C2DpohJRmAQHuHdX8qD41jywq5lDX/5ZXpDx8YO6X40wOKdEt5ejDGsdYXBfQxOCHp2K6/nKtEkRdM+VAL3e/UluKTvc8aW3wv8QPpoULtfrtvgq7R6cGD9xYEq4jElcypmk9PuYvbZEwg1Vl4Kgc+P87SfAzGUWYfftjcM41UoaGH8mzcRipTJx1iaFH11/z+YBbyqMc+FSd5Bszoy3GQpPtzfG8YNNvO06wfe32lj0+1cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqUL/T4sNMoezzueAHSdG2yCsFFV11cc/i6pEavX950=;
 b=SyOHFJel2Njhg4Tj1n6+HXTIgXFynnOnc8iijOy4TLLxcX+jT5HuMa/56N7SUYcVeqtZ8RGhuxvg4KYcsDJb7TTmfYlg5OhAeaxGAiWVPIxaclMIg7Y+HD8hhJOnzlHu5uKuk9JGmcNHn/EHVfst289WqKZBW9ruD33EsBP2GEU=
Authentication-Results: klausen.dk; dkim=none (message not signed)
 header.d=none;klausen.dk; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB8098.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 11:34:37 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64%7]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 11:34:37 +0000
Date: Wed, 15 Sep 2021 13:34:34 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Kristian Klausen <kristian@klausen.dk>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] systemd: Add tpm2 PACKAGECONFIG
Message-ID: <20210915113434.jajr3nxjjowbyurg@fedora>
References: <20210915102308.1892-1-kristian@klausen.dk>
 <20210915104818.43wown7ss2pcfnky@fedora>
 <YUHZe8zK2lV0lWPy@bob>
In-Reply-To: <YUHZe8zK2lV0lWPy@bob>
X-ClientProxiedBy: AM8P189CA0016.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::21) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM8P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 11:34:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f04f424a-f92e-428e-fe15-08d9783ccc3f
X-MS-TrafficTypeDiagnostic: AM9PR04MB8098:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB80984CB66B901C92171A3C8FC2DB9@AM9PR04MB8098.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t7KvMynsXLLxcrpjBve1IEtjv8GKC30QxCFPuq6MYq16h9aZDg9PnlODl8jA7xcWbxB1wwfn60/rlSqm8ywcuVU0/xx7T0PyWh8twv17uH7cbD251UUZhH8DerVVQXMkz5eZORAGcBgQn5PP793ucKHg4fa2P94Uhkfgi3pdJkrfO196/mctSvhfKVDdaK3G0bZbqAFaqiJw9ZuMhhOVGhVqhqGsu0IhtkWvCc2WLcLNJ2o+ntdiJAAzTtvAhP5xt5CVjsTRpk3PjYGRikXWyJsyvvcbfSKv94jE8WG3t1muzXPzqbtvSmPko4nWqEM4Nu2BtibD3kyRzzTmZYKqUxlxyzupFRPky9UufMMBtxTysR5cG2276BEzbGOIbqt774aPcHwf4QHYx6NKoOMMDdWV0vqvS3EyaxVHaiDEKVv3qLQQTJDHVJAfscbCOZHXfXhUjRP9/+5r7usarKKe39vq6RJYC1yC1pQ05uhPrJHpeCZGGP1HJHc9KhUivZANyYUcL/rd1OMbkw31s/NQe3yav+Cih6i9L/fCc2NqNPqA50ErwOZ8ftku3e0YyVPxYq811sUomCXdDlCb5w+1WO64CHpwgr9awu/p0zpQAUDsAyy29JJ7fQBwntXU5MKISHvD5IAmGwpljHstix4Q+LhQHMwaf2ptc9qfaJKOpCedUjy1PEbtY1x3HMql90Gl/x6zSkXeDZeHNBkO6d86EWy1biO32cCxQi6j1bzIqdzOlCMY2E5YvOb47wa8IhutpHZ7DdXiBZjhJ753EoyP7apSubK+bBKv1MimTHcR9AA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(38100700002)(956004)(66476007)(1076003)(38350700002)(186003)(33716001)(66556008)(8676002)(55016002)(83380400001)(66946007)(9576002)(316002)(8936002)(6496006)(86362001)(9686003)(2906002)(44832011)(4326008)(6916009)(5660300002)(52116002)(966005)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eARapE/NbXFzY/SYq6ENquR1+Lp1rUVo2Vw0LEl6DxDSeu08gGyD9sCjTqeb?=
 =?us-ascii?Q?D0t7RSpKT3G27ObgNqesM0rQZUiFLHWh6jlPAY9kRtbt2M9S75zFZZl0zRF9?=
 =?us-ascii?Q?SevD9Qu7ctXprfW5gk71WsxAcWuxWb6SHTnyvTIjTqW0kdYqUPIvrqkyRsJJ?=
 =?us-ascii?Q?hMvT8jrkjk0P7vECp3ZDjYzoWeR84oOw11Wsr/HzYhaQOp3G0Dc1LtB8qFXX?=
 =?us-ascii?Q?xYj0pCCM6RHXqcdjsTv337pIka8BQeUMECSEaS9FEl7meRBxUUGcxu22Dd3D?=
 =?us-ascii?Q?qofj7pI8tEgJk6Cs1obLvVSpZ4rHwk4woSFicHHo4xR7Ww3bJmW4crMJrhlt?=
 =?us-ascii?Q?e3o5kvEQjsLZMUriKhJ+jhWnp3rW0Zup2/HWBSK4/Y3CHq1eU0VQ8z/NEMRR?=
 =?us-ascii?Q?WAvnfjziPdyJa37FvP0Gw8sLVCmo61/Qj/e2UwCIEpAivvve9Y8ZCai3PGiL?=
 =?us-ascii?Q?i3wgDIULVZzV1si9Pcjayg91nc3zix5KDeKzAzgeBSdLGG5MaHohl76zeGQp?=
 =?us-ascii?Q?xokRfIGYTeAWA8ssiVlhc7qP2d+sKoDhTSsJOvJIbqpDnHhEt97LjAa8bRWL?=
 =?us-ascii?Q?M3qbep0DIY0NpEhMixwvMkDbsemR2pYBO3Arym1KwQjtD+usDnnYWmBRu8Ph?=
 =?us-ascii?Q?uNYk9rrgFyUjAoyddkC7KGaDNjfN0VnY2IOrmct7cIVb7CIp6sH1Au4lWPr9?=
 =?us-ascii?Q?P6hhfEDLJTs1rr9QGKl1vldjCgBebqFFR7WggfjMjIyQjQAHE1HevS0yubm/?=
 =?us-ascii?Q?E1QgLH56XZP4DeY3ezsLkeeEoRxmS+aFlpY/k/Hgv4YFnqiBr0vAEOl+LXs3?=
 =?us-ascii?Q?o6V5pkdlM9hgiRD8TWqqBpRan70PluqDkk9Ef7JP2lfiDDDrapAmLq/ANr7k?=
 =?us-ascii?Q?duOhrNMWtMbQSQCUY2Or853+lYf8YPH/pugjgtVjPKcoO9EiwshH5C58ZOmX?=
 =?us-ascii?Q?zKzc6JnTQeJGDUV6+IlLhIUvfsy0hkwzDD6ocVyQ/w034KJFYz25c2tbuoSE?=
 =?us-ascii?Q?toE+i7IpyoaXl0jrXpQ6Ke9Nkou4pBjw6qfaVG86VWNxrk7oA2ATW8vLFd9Z?=
 =?us-ascii?Q?Mrrf6HIiT1stZTPcTZ9kSFwzX4Vi/P2kt8qcw+QEH60aFOFE3ZGNwkuTXQ2v?=
 =?us-ascii?Q?toOamMmP3M++co8zwOda9dSvKLZ54gykZCPuKUCHW/x4cstsE/2Y+X7AI2+J?=
 =?us-ascii?Q?+oeE5E+5/Fu1UuIzPYZ60AKqsVwaM1L8pSZ/8boWU4csWG2oMwjZEYq+Pew4?=
 =?us-ascii?Q?ebEM6ZnfdHmJr11v61TC2cQewCGfmgyOMkCU6rpVwMYYa5iby46RMqNudppb?=
 =?us-ascii?Q?dOVYxIEJAT3jDVjDIhWK15bl?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04f424a-f92e-428e-fe15-08d9783ccc3f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 11:34:37.0602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNc4v3NCuyEFv2WpaVeiu5gT34K06dJkDr0djpKGtN2z17cb7NmDQwkj9VWYd+34DmNepuIvzzUSbsF4H2bW4msgnaZkZVOye+f2wHjiPcdnEU18/eAh8rDOw1pSnkxh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8098
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kristian,

On Wed, Sep 15, 2021 at 01:31:07PM +0200, Kristian Klausen wrote:
> Den Wed, Sep 15, 2021 at 12:48:18 +0200 skrev Quentin Schulz:
> > Hi Kristian,
> > 
> > On Wed, Sep 15, 2021 at 12:23:08PM +0200, Kristian Klausen via lists.openembedded.org wrote:
> > > The TPM2 support is used, among other things, for unlocking encrypted
> > > volumes.
> > > 
> > > Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> > > ---
> > >  meta/recipes-core/systemd/systemd_249.3.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/meta/recipes-core/systemd/systemd_249.3.bb b/meta/recipes-core/systemd/systemd_249.3.bb
> > > index c027b88fd6..f8c85dabf0 100644
> > > --- a/meta/recipes-core/systemd/systemd_249.3.bb
> > > +++ b/meta/recipes-core/systemd/systemd_249.3.bb
> > > @@ -128,6 +128,7 @@ PACKAGECONFIG[bzip2] = "-Dbzip2=true,-Dbzip2=false,bzip2"
> > >  PACKAGECONFIG[cgroupv2] = "-Ddefault-hierarchy=unified,-Ddefault-hierarchy=hybrid"
> > >  PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
> > >  PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup,,cryptsetup"
> > > +PACKAGECONFIG[tpm2] = "-Dtpm2=true,-Dtpm2=false,tpm2-tss,tpm2-tss libtss2 libtss2-tcti-device"
> > 
> > Shouldn't the RDEPENDS part of the PACKAGECONFIG be pulled in
> > automatically by Bitbake since I assume the libs they contained are used
> > by the linker for systemd?
> > 
> > Also looking at the tpm2-tss recipe, I'm not sure there's a package
> > named libtss2-tcti-device?
> 
> Are we looking at the same recipe? It is defined in 
> tpm2-tss_3.0.3.bb[1].
> 
> [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__git.yoctoproject.org_cgit_cgit.cgi_meta-2Dsecurity_tree_meta-2Dtpm_recipes-2Dtpm2_tpm2-2Dtss_tpm2-2Dtss-5F3.0.3.bb-3Fid-3De0fca90835169e21ffabe6f2e4b901678236d36e-23n37&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=YhnjtFDUXJqt4E89iFwwS6UgV0wqekVtZVyVfp05TSo&s=DN-nSy3eRWcgLmzegO1kzafrJwuNAp36bKdUuPBwqYo&e= 
> 

I was looking at the one in meta-measured layer. For some reason it
seems the above layer does not appear in the layerindex :/

> > 
> > I would assume that
> > 
> > PACKAGECONFIG[tpm2] = "-Dtpm2=true,-Dtpm2=false,tpm2-tss"
> > 
> > would be enough except if there's dynamic loading of libraries or
> > binaries from tpm2-tss that are required at runtime?
> 
> I my testing it didn't work, presumably due to systemd not linking with 
> libtss2*.so but loading them with dlopen()[2].
> 
> libtss2 is also using dlopen() for loading the TCTI implementation 
> (libtss2-tcti-device in this case)[3].
> 
> [2] https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_systemd_systemd_blob_aff870ef61bda152ea6241f684dcab26a9265e78_src_shared_tpm2-2Dutil.c-23L46-2DL81&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=YhnjtFDUXJqt4E89iFwwS6UgV0wqekVtZVyVfp05TSo&s=tP52Oja6E8aYHPFpUEJnTxBW8ECdM1zaSqG1bk5vpuc&e= 
> [3] https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_tpm2-2Dsoftware_tpm2-2Dtss_blob_9288970a3e657cdee85d08d3813199ec864de3ad_src_tss2-2Dtcti_tctildr-2Ddl.c-23L79-2DL125&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=YhnjtFDUXJqt4E89iFwwS6UgV0wqekVtZVyVfp05TSo&s=qeaguTVVsgGOzAgPagMJBe6qeimxYewI5ufmfYjT97c&e= 
> 

Then:

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
