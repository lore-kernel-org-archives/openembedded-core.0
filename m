Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 18705 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Jun 2017 05:44:17 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0045.outbound.protection.outlook.com [104.47.40.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA5D7199D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 05:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/YOuiRXdwPBOrMYotPxgWzO2Ho0km6i/6C3f8eUSYd8=;
	b=oc+2w/xyyOdGPU15WM2XbRgwuczCxFZdM+nLvr/O2OD5LrmBLgpKtrIV6T3XhdGP+9Qd7rTI9VJ1pegHlbhejBlLx6Tu1GDNL4wrAiSmKSXyFNkltivzjF4psKKsnMyizEr1kA5XelAvhOsXtl7Oisht5salDUtwjFlhEneagf8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from willamette.conference.local (210.131.143.241) by
	CY4PR0101MB2934.prod.exchangelabs.com (10.171.223.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1124.9; Thu, 1 Jun 2017 05:44:16 +0000
From: Martin Kelly <mkelly@xevo.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Jun 2017 14:43:54 +0900
Message-ID: <1496295834-15479-1-git-send-email-mkelly@xevo.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [210.131.143.241]
X-ClientProxiedBy: SG2PR04CA0026.apcprd04.prod.outlook.com (10.162.195.164) To
	CY4PR0101MB2934.prod.exchangelabs.com (10.171.223.139)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2934:
X-MS-Office365-Filtering-Correlation-Id: 87c9f428-b783-4160-5c03-08d4a8b13eb4
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY4PR0101MB2934; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	3:SSi9OWI8POKgb73hBJGKB15GDaQwr1ZKoekLgtdA4tpSUMO199+a/OOez1mfZ0tQqaIizvTV/KWSHOk1ay6jdIxvTQn9eK/LVAr7z+IzayurLqadNpqN/jGjI602ujoDYFZrEmoDLt2iEss+WgJxz/QgAdn1gCDZK6JiONq4coLzy+W1tNwfE28iHM+jy+04WbuoL+K/336R/6WKI4jpO8ufaMr8Qr7iSbSt5ntFHmwWe8g/bGwyOlg6vYPRiKzUgWV+yCizAz1kaotpoBmEFqZinlrXuJPXrLlzCiCaIsJ4yt9HLmOJV9XpE9VKtGGJFk0KRIHliUz58sm/hM5r+w==;
	25:6pix0y+xwvwtjp4dtb6irmq5u5uIkcCxKWr6P2n35569VndRGBsairDfQzsT24gZhJsXfQcLDCu6SrwrFmRSZ74qp6Q9MBZiKfTx3qdSDPXqTkV58m/QMhEZFEy5D/jdv/hzuylEYdpkzrI6ulTcpb5VPT2sQWbIyOROgD/i+EStywOpZvUJNslH/vGMP1J/3najT9WAh6GyCr+8UYpkcPPkLK9BPVCWPF/0I+d7tGvZS0qlIOa3tnM0NWhvuTNEfwV/PrA6QU6iq8UTLxllMH0jMufqqfulQj6lhVW+Ch/rFEiRE2MMfhpO/dgrFtqdY5kRjCHbrjnQy9x+uurXoFzVdeF0myn8W2v8EL2r3EUWssetCjXKQIIFShWteUz+Jz14QnngwV/KgwLAqxKclTVOjPxbq4SA6LhsmyuDhrotvN2eLZIQ30F3JVQb7M7Q/uRAQtyhWJIQgeU0dH2JXESBUkeYFZaS9ZUvR/44SUo=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	31:VrhEcBV3gvpJQZ8egGDsnQGaLBpySAgukXbjNxyXjK5lKYYo0oJOJ4jdUrs/Gqm8gsNvsltjJxCt1Vx+qY0FaR/CXzi6hbwgM5BH+be7FoW9bL2FkJj3gezWj1c5h73LsaDxlUzsJv5s/ljXB1SN1RZxvZP/faghU+a+kJSGeZAxbRGcKs2BNaSFcfb7gAOImL+rQ+7piC7t5FE71C5IUx3Ss6nF6mlSwx08g3uwwCo=;
	20:IqZXtCN8pIG7XuptoSnCW/uYfHG8diAggnA/xhZTjiDKmgNHjC9FQY2guopZ/2OpTGAqNA+dfIu+AweR3kefkQuWL6eS03OdVGSPLmlnSo2tHYfZcCZJBhR+tbQeQqO0E8HPih9wFn3Vano+kb4pJQt4+d0rd20swHDbrGIcJt114tK2V1rprBGpzfCU8NYpuZ1fFR1fE8QFNXZVoKIUENsrsxjhydgPPdVMuSv0yNgeSy2juN1Yl8xi0lsr1GVgTqMF0mYsilGNapTuYym4xRjLOR/3Dp3P68FQ7rAnWaDWq9dqOzImI7xh5Vkj2HWFlbNVb4EbNGEytdH6fwJx8g==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB29347776CBEEE2303FBBBB39ABF60@CY4PR0101MB2934.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(6041248)(20161123560025)(20161123558100)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123562025)(6072148);
	SRVR:CY4PR0101MB2934; BCL:0; PCL:0; RULEID:;
	SRVR:CY4PR0101MB2934; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	4:VF5P8A7xw6uEm/DaoL1W8A75mY4SysRtT1+doUXGiP3ScnfJLULqydXii/1RfqboemI9s9NXM0zsfTrm3fTDO3erQ1rKPqIgsm4LlZPvzrUaX4Sk8HYqKg2oAwnl20XlR25j1ZvcxN2bcX1r3ls49qqLh2H7dRCyhNRGZSCcYSHZbB+pYZnRmy+vfJhAAyPRIu3Sgmd2UZE/xb7uEBBf5MiGlaNqTUuh1twKAT7WTqTFS5cRxarQTOegLJHV65bXsC6cO1ylz9Rfl3Cpjbvd+1XpC/be2rq98THUVJeUhMtZtpPsGzzip2QkXJVNw+be2cCXCrUBgkAQVrqdSsKYwng1jaAbQ477lYr5fqJ7wVh+TaKMZbP35M6LM3UcYvO+w0DCrmKDCgzEFrOuqezMXEAri6NpyyK9yX5SekuzPbXaqLl3OgTEjyo/i8OsZ5pxKFx6K1dNUMpu6D5kqdn3t/RX4hT2nGhe2rg75Tnq1Yrrep3yS24b2STyO1a/wjIuRfiS2mhDur+CDas+SUw7DbknPuILgmfJeJqJLfcjZriDf0bfyqd1+x6n+e4NMqxO14Rx/IhQ/Vls+Y9XPQDRt0poi2FG5t1xDXKOrJqC4rG8S/rGFpvw14OeJGtsA/jY702L8/W0SdctMUXYIo47c67sNU0Gr+MBZTGBFsVxBechYJDO5eAq0hPFE1IY6HfJOEUpdxYET4/M+QCt4svAA6T6FgRFuwOubfplbccFNZWfFrgLPkgnxtfmeOrTK7pYN4YKN/VlQb6tFWemJ8Qkiw==
X-Forefront-PRVS: 0325F6C77B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39830400002)(39410400002)(39400400002)(110136004)(6512007)(53936002)(54906002)(478600001)(5003940100001)(6306002)(86362001)(6506006)(6916009)(6666003)(305945005)(7736002)(25786009)(6486002)(4326008)(50226002)(8676002)(81166006)(107886003)(38730400002)(5660300001)(966005)(2351001)(189998001)(47776003)(33646002)(50986999)(50466002)(2906002)(42186005)(6116002)(3846002)(36756003)(66066001)(48376002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2934;
	H:willamette.conference.local; FPR:; SPF:None; MLV:sfv; LANG:en;
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2934;
	23:rOkfeNoGIDBaqF2xdQixATNcC/laJ6XsOzkoGId?=
	=?us-ascii?Q?tGwg1YioBuI6MOndqDlKTTBEGrVEv3j0UiaAhV07S3buOR+xHvE1piuIXndb?=
	=?us-ascii?Q?ihRU5UKzLHu+rnLxsWyMwgbZlmLioT198OoVnKtyuENU5o3pQ0wPHp7+Qzs9?=
	=?us-ascii?Q?Jsy70dcEbXN4oGHXHWUTHpOQkmffHlaGEGMifLjNFQ6Hz9WhprsHFfXpWVRI?=
	=?us-ascii?Q?/HvLXLrBXaZl+Oj5twTRZmRDen4RpBsX+6wPgT41xkImxEDUOMge6FjjS2M2?=
	=?us-ascii?Q?WZqIJQJk6XkZt5Dp58cbk7zl0l4YyZpKlQnYrl63xCN1Zh0WVZtIoVIPZcKi?=
	=?us-ascii?Q?+VfJXSVWZaw9t6bSvp2JKUSyN5gv0qG4Dj96ArI7oMxKkdYx2NoEILnJtiP4?=
	=?us-ascii?Q?FK5Ax8N3udg7ePSIT+lNT2m+T0vfpciVyOKzJvXipU0nVGX630CTPMqArOto?=
	=?us-ascii?Q?YsYMzJOWfHNGxUJfmOAAkTM/mKtSSVBlHFMki/s9Iw4s1HGTjKqkBIXYbgTn?=
	=?us-ascii?Q?QeKPnzD7a7BZ0kpaB8ycb74ID5mOkvLEpKfr9FAeAH6yeFampdjJW1wnya3x?=
	=?us-ascii?Q?RZmWT05ZnXmToUnLqnarbgyinLbfPOzVwr+vOATQMcEBrp+ec0FZ31S2ksyx?=
	=?us-ascii?Q?bwcVvq4raDpX1AWhTM7CGu3D9o47zWnXPKkiExNdShbqMoDIHDPkP2a388HH?=
	=?us-ascii?Q?9h2poq9OJkO7qTqfXs6KTApdoBsXzEMTw0q6iWyGMMPWugQgJn5Ed7ObdEGa?=
	=?us-ascii?Q?CHUUhB6FwJ7YuMQcv9SQteokXexBduHuxE9tXRwcJdaLjIsUCzkIIX10/N3t?=
	=?us-ascii?Q?Z0P4dkXjPR3eBiJ/AnNFNh6Qj/EWFa/h6Fb5LiuszURijGGxnyCn7cA6aT9O?=
	=?us-ascii?Q?DrSV7F8vdF9yk+krGhqCCjXOtkYDRFZ9w7Q7BHo6M0uR4A2HhHRWqdVOa+ML?=
	=?us-ascii?Q?WeH+aC1A5F8YkH3pH6ln3ExH6i3m7xFhdWqDNAz+IPu/4FAwZhiBsUEBYhji?=
	=?us-ascii?Q?LqiRfW+InzjEykkHQXrCeVI3U8u8jI+Lh/jCo+z+3W7ax6qDmcEwnGqNaO+n?=
	=?us-ascii?Q?E24sYPrw=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	6:A61Gnv8W2qk1NnT6EhyRAOcT6w7XaBMvwZXitMslp+uJEyqlfES6stoHaTo8c5Rjjhn2urNOMevgaytrnutbG0tZm7jkJ2jOBvRN97sID9yWt4tTJfzkRcMrfNJDY7DfyphgyBmFPCAGs4ecB261pg32sJSD3b4BjsmJJcDxxaeyNZN0dDsV8lcWWA/poHGVbjI/UBUSsn8GHLPPepzoBb9I+ikLxZhMVMb3x0lEv/AjwywRyEKF8X+Ynv1ATHcbF8JRCUXQX486WZrYuCKVh95XHHwsMa/tbS0T36pG4j4/hoix3wuCWTYW2SkTGSaTFcZZP17HqWvl0vTofJm8B535l/PSW+yuG4woGIY91lSvuTfDi45kME0d4BSzoRlNHROzMdeqQITGwh8HruSwZ2ItrW+57n/QLL4aBNOEPBg9JJ2l21PKKjpxTUIbJJQYYfiYir83qEvgOekg3nxE3FB961b2Scen768eAROV5D5LgBQnC96qV1YBGnQOrPPSnUhUcOHB9jE4jQ6kYcBnPg==;
	5:ncpu/ML9F1FWegaQ9/DPfUwcVPwLCpX3PCplNyPKbg7ho3WoN/+SAOXbJdZSPYkuQHMfTB9UNQo2swjvzwg4aWvdKcWuE1uZYnaVjuNT7upUzh9rbQb/DSlOMHdDk6rGvQt3d5SRg96iv2xLNIN50w==;
	24:U6yHKxO9uHwHvrAwk4DKQxQ0dfiQeJBcFF+dxXPSMVdiYuYcveJ+w5TomuqaVWfLXIgBW7ATqdXicgHGeqPFPqhNtAu4khrGvnchH6mctQA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	7:8wK8oiEK6SCCIR8uhqoLIOhaKe5G+vxzGHVY7hbGRdqN0EtIc0eJRnn5mfjApHL/tvnUUgx3hxZ2cZ8wcu/xK4kSv9rw33n95YcZYyck1mrZbGhLVz1NWY66tj8ihMzOaTJlvmPNFVtXs+ylTxZg4RgmRBH1x64Rq4X+Vi5r0H4H5PYBGFxaGmrGYkZxu55Oz7w/N7CNV0TkdjJlz4CCGGVocEXRoNg6lsUwPGPWpNJDS6NW+90ubB+3INYN29b051xjCxUftztwmAzuylvjvPqhWAnJzGubjpXeITXpHv7KjnmUmvHLzw/CSY6GX8z1aKoZ5d17gVSN9m/kP3O5oQ==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2017 05:44:16.2124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2934
Subject: [PATCH] tcf-agent: kill with USR2 in systemd stop
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
X-List-Received-Date: Thu, 01 Jun 2017 05:44:18 -0000
Content-Type: text/plain

tcf-agent ignores SIGTERM, so upstream uses USR2 instead. This issue was noticed
by Jan Kiszka and Brian Avery around the same time:

https://patchwork.openembedded.org/patch/139546/
https://patchwork.openembedded.org/patch/139560/

However, these patches fixed only the init scripts, not the systemd service
file. This patch fixes the systemd file.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
index fd9a6c4..a486ac7 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
@@ -5,6 +5,8 @@ After=network.target
 [Service]
 Type=forking
 ExecStart=@SBINDIR@/tcf-agent -d -L- -l0
+KillSignal=USR2
+SuccessExitStatus=USR2
 
 [Install]
 WantedBy=multi-user.target
-- 
2.1.4


