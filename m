Return-Path: <carol.zhu@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0086.outbound.protection.outlook.com [104.47.2.86])
	by mail.openembedded.org (Postfix) with ESMTP id DC0AB71D86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 10:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RdZ/YjpPqQzWeY6ZlNmou9nlmNVFR0xw5FtBeyUWJSM=;
	b=r8CnIhalU5gK7gjLwGH3HtHxo/AIZIsiUlmxFRykFSsHcg51T4j/na95be37/n5bD/wi3nyB55LZKxzdxDPTYQOEIWFOBDUVvBWn/H7IrK3khMKj1XqmMcQ8TApZ+QK2f82VJbUEZvedNwsZzfOswlrUwh8SF+MVFjLFGQJhNt8=
Received: from AM5PR0401MB2674.eurprd04.prod.outlook.com (10.169.246.8) by
	AM5PR0401MB2673.eurprd04.prod.outlook.com (10.169.240.151) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1101.14;
	Mon, 22 May 2017 10:13:45 +0000
Received: from AM5PR0401MB2674.eurprd04.prod.outlook.com
	([fe80::34e0:a42:f88f:964b]) by
	AM5PR0401MB2674.eurprd04.prod.outlook.com
	([fe80::34e0:a42:f88f:964b%15]) with mapi id 15.01.1101.019;
	Mon, 22 May 2017 10:13:45 +0000
From: Carol Zhu <carol.zhu@nxp.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Thread-Topic: [OE-core] [poky][PATCH 0/6] Add patches for
	gstreamer1.0-plugins-bad V1.10.4
Thread-Index: AQHSzVjP26Anocpq60a3FguZiQlmIaH1RKQAgAABPwCACrTJ0A==
Date: Mon, 22 May 2017 10:13:45 +0000
Message-ID: <AM5PR0401MB2674AE793FC63BFA09BF94ECE9F80@AM5PR0401MB2674.eurprd04.prod.outlook.com>
References: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
	<CAHiDW_GksyO+YLMzejrL+9=tgw4wdAPrRjHf32h321fi=_F2ag@mail.gmail.com>
	<9678201e-569c-33dc-4844-8f249fa28780@linux.intel.com>
In-Reply-To: <9678201e-569c-33dc-4844-8f249fa28780@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
	header.d=none; linux.intel.com;
	dmarc=none action=none header.from=nxp.com; 
x-originating-ip: [199.59.226.141]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2673;
	7:JSPsjk4WybP0knKAvLUC6LOLnZn8n8lMnkkdIgd3sFS8Cni/CUrWGNgrZw7+QaiEUQ6A22Ec2ccAzESvP7wFiou15QGdMy2Ou/4uuLs4GZiLgud4x39w6cHnDRK35R2lRSjQrEoZRQK48JLw5vGYx2IG3ygSL/M/8NJc4VXyqD17S8oBisO7vOp7tRCV17gIjwwZYGCN9cge+FgUSyQzrALKk385KkFh3CFNm/2WQbqwsr1oeZ3i+JuGWrWXZICAoUk3yO0g7XfUWAsisX5vI/x7T/9LcV8bFe2q9DmrRBuhvi2zbJDhBwxbHScLvi/oC5u9fPtZD3ww/5z1eKJs1Q==
x-ms-traffictypediagnostic: AM5PR0401MB2673:
x-ms-office365-filtering-correlation-id: 35713daa-fe1d-472f-782f-08d4a0fb3b5f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081);
	SRVR:AM5PR0401MB2673; 
x-microsoft-antispam-prvs: <AM5PR0401MB2673E85B9DEFB5E5768BBE22E9F80@AM5PR0401MB2673.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249)(228905959029699); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(6055026)(6041248)(20161123558100)(20161123564025)(20161123562025)(20161123555025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148);
	SRVR:AM5PR0401MB2673; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0401MB2673; 
x-forefront-prvs: 03152A99FF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39450400003)(39400400002)(39850400002)(39410400002)(39840400002)(39860400002)(13464003)(377454003)(24454002)(33656002)(6246003)(81166006)(7736002)(2900100001)(5660300001)(8936002)(38730400002)(9686003)(6436002)(110136004)(54906002)(2950100002)(6916009)(3280700002)(53936002)(230783001)(99286003)(74316002)(305945005)(66066001)(55016002)(8676002)(478600001)(25786009)(53546009)(229853002)(3660700001)(7696004)(5250100002)(2906002)(102836003)(189998001)(50986999)(4326008)(76176999)(3846002)(86362001)(54356999)(6116002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2673;
	H:AM5PR0401MB2674.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2017 10:13:45.8649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2673
Cc: Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 0/6] Add patches for gstreamer1.0-plugins-bad V1.10.4
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
X-List-Received-Date: Mon, 22 May 2017 10:28:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Here are some explanations.

- 0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch
  Two enhancements for qmlglsrc:
  1. Need set use-default-fbo to qquickwindow during set property to suppor=
t change render target on the fly.
  2. Calculate qmlglsrc refresh frame rate in qtglwindow.
  It adds some common features for qmlglsrc to make app development much ea=
sier.

- 0003-player-Add-configuration-for-enabling-accurate-seeks.patch
- 0004-player-Add-get-track-number-media-info-API.patch
- 0005-player-Add-overlayvideorenderer-video-sink.patch
- 0006-gst-player-fix-gst-player-failed-to-load-external-su.patch
  These are gstplayer related patches.
  And by above gstplayer backport patches, we enhanced some API to make it =
much easier to use for users.=20
  Without these API enhancements,  some features may not be realized (like =
accurate seek, video sink configuration) when using gstplayer API.
  So it would be better if they can be picked.

- 0007-glupload-fix-memory-leak-when-use-a-GVal.patch
  This patch fixes a memory leak issue in glupload, which is common.



B.R.
Carol


-----Original Message-----
From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com]=20
Sent: Monday, May 15, 2017 7:42 PM
To: Carol Zhu <carol.zhu@nxp.com>
Cc: Jussi Kukkonen <jussi.kukkonen@intel.com>; Patches and discussions abou=
t the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky][PATCH 0/6] Add patches for gstreamer1.0-plugi=
ns-bad V1.10.4

On 05/15/2017 02:37 PM, Jussi Kukkonen wrote:

> The patches could be considered for Pyro (not too fond of backported=20
> new features though -- I don't think oe-core should normally do that).

Yes; you do need to explain why these are useful to oe-core users in genera=
l.

There's a ton of gstreamer bugfixes that can be backported in a similar way=
, so why these and not the others?


Alex

