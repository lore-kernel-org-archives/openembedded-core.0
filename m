Return-Path: <urs.fassler@bbv.ch>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0075.outbound.protection.outlook.com [104.47.2.75])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8247961F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 03:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bbvSoftwareServices.onmicrosoft.com; s=selector1-bbv-ch;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ZPUzSpMvnwTSyw6A8Ndt12AbDi1fj2l6e3cQT6c40bs=;
	b=boECav8oVHtqHlQDP+NADDdTJ3W1N6Uf9DuliRMmFqy8Jkynpr4/Or9gZD8UmaBLXeHcqTP3q4SIZ+n8DI3P3mJxzDJbabMaduK3513A93qi+TRkO1XaBO1bntyMfzO4AEmyq92Y9mPrIUGVxqHum4uTUvBDxKS3kqX5c5UocLA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=urs.fassler@bbv.ch; 
Received: from ofone (213.160.33.170) by
	DB7PR03MB3833.eurprd03.prod.outlook.com (2603:10a6:5:30::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1185.23; Mon, 1 Oct 2018 15:07:52 +0000
Message-ID: <81f6b3430d49d501344d5cb8e8cc70dba668f012.camel@bbv.ch>
From: Urs =?ISO-8859-1?Q?F=E4ssler?= <urs.fassler@bbv.ch>
To: richard.purdie@linuxfoundation.org
Date: Mon, 01 Oct 2018 17:07:49 +0200
In-Reply-To: <8ea9a7fb6034ecee04260ec19fc66af6c348f32e.camel@linuxfoundation.org>
References: <20180919064135.30249-1-urs.fassler@bbv.ch>
	<20180919171113.21fecc56@t460p>
	<ed51b3579be101e9d2f711ef9f94d16029981f92.camel@linuxfoundation.org>
	<1537795580.13947.1.camel@bbv.ch>
	<aad5fbd908a38999b681052115038764caf45c5f.camel@bbv.ch>
	<8ea9a7fb6034ecee04260ec19fc66af6c348f32e.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.0-1 
Mime-Version: 1.0
X-Originating-IP: [213.160.33.170]
X-ClientProxiedBy: VI1P194CA0012.EURP194.PROD.OUTLOOK.COM
	(2603:10a6:800:be::22) To DB7PR03MB3833.eurprd03.prod.outlook.com
	(2603:10a6:5:30::19)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20b97dac-50f6-4dfc-7aee-08d627afa8f5
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR03MB3833; 
X-Microsoft-Exchange-Diagnostics: 1; DB7PR03MB3833;
	3:r5h8HF3kIeEhmOl50jQTiJ+CWRbX1FO4hhSQzbGXTDK++rT5zM7V6RZzaZNgc5NlVD0d8Xc8gRaD9NsgJGTXrEBVrRlosXHBKMj3bDuGFyDTZwZlT3UGwvnYqR8vzxeLEZ/Vawz1bfUk+WiqA77teglaAA2PZ8qd4vqDYdeYD/JWV/s28PY9MuOVWRglT5dYvZEOtlGQMUwZFHl8TI88w9jS2KpHtyitIzXgabyzXzRiOMk3P4wlXOhQ+wKFI+UR;
	25:7sMPYWwO5tfICvwHYNulgxy+7r2KquovDs0HpnVkE3jEoFLKB11EOo0sYuoXtMmyiR5S0k0njih9omxGXeJh4z3g8MjW5gHoIbufdrnbY5H53p4SrpaCR0bwrkp13C2rHW5vcD9ia2L1suNXJsPQvGTYaeBWFHv1m1R/pp4eVcJjCFtMIIJSJbqLDK/qhlL+BattxUw+sYwavavCohDtUv9HA36PDW76g+3cw2oC19N4XRg6AiP53Bzv6DmQ8pu5nJ3u8eiViKKMF07WZYnebuUk2gO0/1kK7xQ6QSHovzaHEeRxZphu5jOkcIQx9q+vwE0kXEGUc7HEPC4lLXY1OA==;
	31:WL9I4rs/OUiHqAmkPtvsjNEvRdqc14KfApA9EGbUvmDzP80lqYfMCL/2ZughZdJdmP75KK+D+PJH7K1DDxFyd9p99rmavbsVRHEV4h3tOm1Gsd85B9OE+kAM85eMUStJBGSFanwm03qEz4rBXxp4Jtj100R8it1SqdscIDRSDHzJpHCyp2AGQEBEuFnplRUWHJ1BbkfL+/YoOITCP1YSJ6a1UQebA+WgMajb9MWjabg=
X-MS-TrafficTypeDiagnostic: DB7PR03MB3833:
X-Microsoft-Antispam-PRVS: <DB7PR03MB3833564A2AA51FB8CA9149CC8FEF0@DB7PR03MB3833.eurprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(3231355)(944501410)(52105095)(93006095)(93001095)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(201708071742011)(7699051);
	SRVR:DB7PR03MB3833; BCL:0; PCL:0; RULEID:; SRVR:DB7PR03MB3833; 
X-Microsoft-Exchange-Diagnostics: 1; DB7PR03MB3833;
	4:LeagjtUsgoEq9UnupF/2tWjrStfu0TT+bBZ8qcuCynXlhT9bK3y1Tz07dYMs7WOL2OstQZoNsrvFTvKnkN4oiGzRvSSDNsWDTyvwGU70VO3NFeG4a10HppCNKWgHmcp5jdi5GLAZHYZV9kC17tRb9ISE49nWYKRHmpAePAlEdHaIA1v4QOMnacv0gIZ7TFQ1UtY9ruf5x/0HchfOC7Z+GLULBDwfIO8irFvN4JD2aia7hP4KSwfTpKJY9X2GBn1ZPCISZyCzrQP/Qzf4CP50t4VXjO4AdfdfnZdkz/vkAIbl4AbDPNUCugcpLI6phJJs
X-Forefront-PRVS: 0812095267
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(346002)(39840400004)(136003)(396003)(376002)(366004)(199004)(189003)(16526019)(316002)(76176011)(6116002)(6486002)(3846002)(33896004)(5820100001)(2906002)(229853002)(23676004)(6496006)(6246003)(52116002)(93886005)(186003)(26005)(58126008)(386003)(36756003)(2870700001)(2616005)(956004)(11346002)(476003)(446003)(47776003)(486006)(478600001)(7736002)(68736007)(2351001)(25786009)(2361001)(34290500001)(5660300001)(105586002)(66066001)(106356001)(53936002)(81156014)(81166006)(8676002)(118296001)(74482002)(97736004)(4326008)(86362001)(8936002)(6666003)(6916009)(305945005)(50466002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR03MB3833; H:ofone; FPR:;
	SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: bbv.ch does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjdQUjAzTUIzODMzOzIzOjdCc2JtUVFQR25qSFBQdWJUdHZteU1HWDE5?=
	=?utf-8?B?NXBlZW1LYk9tbjR5NkpJVEtNNUZqYVprZVFkdS9UZWQ4YkNHMWlpTWRLQlpF?=
	=?utf-8?B?Y0N3REFTMVBsdHh4Z1h2NEtEdGJzcCs1RXJkOStVY0ZRbEo3UWRkRnZkVDNa?=
	=?utf-8?B?SFZRdTViUXVSUnZ4WFJTT2RiaEg0dFpabS83bTFBalJvSHBvQ2FTZjg5TGZY?=
	=?utf-8?B?ZVZMUWZSRU4yNnpLRDdqekJtOFV0OXp4eU5WeFJPRnE2TDNvT2hheTd4L3lq?=
	=?utf-8?B?QlY3RkRsVzJWTTZPQnBid29ZdGZPMHBuSFNDY1dNckFsQVNhZjBVZXZqQWFp?=
	=?utf-8?B?amlOMmZBL3duZkxtN3JVakhSQTVDQ1lVNmIvUDRPZWpsdzZNS012N1B2a2lU?=
	=?utf-8?B?QWpoZEt4TytwT2REVVlZUFVGVWpCdjMxWGpxL0JraWpXMnJEUlFldDNKUTZw?=
	=?utf-8?B?MUhUMnR2RnYvcXZENDNDT25Oc0ZweUV0NVp4eG90bFlWdHV5MzVkNExvVXBK?=
	=?utf-8?B?MVZNeXJsdjE5eGh3QU1yLzlDVGpHR3gyYWc2dytNb2R2ekh4MVFEMVhHSWVG?=
	=?utf-8?B?K2xLL1Y1UDJZT2RoMGtaQmFkalBoeTlYaXYrUndhdC9PckM2QTVBdFEzUWxC?=
	=?utf-8?B?Y3dOeVpPSTZLczJxUDA1L0VGRVNhRzQyckdGTnZEb2xzUTk5NWNDVVRpWDZ3?=
	=?utf-8?B?YVh1SWFmdFUwNTcwQ28rZksrMG9tRStHQS85aFJYbUp3TC9nQmdJVGlOcG1J?=
	=?utf-8?B?dTBrMWM3cTllN3ZydEpYL0ttUG1BVkN2TzNEamZESGhBZXJOOVdXbndzUUI3?=
	=?utf-8?B?S3JDenY4QU1tOUZHMU11eFhKeEg2MzFQcENjT0o0YXpVUERPQ3VqWS9kUFVl?=
	=?utf-8?B?YzVtd0hPMDVjNU9mM05tQU4xWVB1L2Ntd3g0VmY0Y3RSSU9Ha1IxdDdOUEVm?=
	=?utf-8?B?YnZ3T3hFZjRzbzU2VHZ5eU16TlJQeUplZy9Ia1dSeEEwU0d0cjRTdEcvWks2?=
	=?utf-8?B?ZWU5NDl4a0VVcSs1WTZKc01NcWdqNW5BeHJXOHJtMFRtZENqbzJ0cEk0UlEx?=
	=?utf-8?B?TERhZGd5T1l4V1ZDWEhRU2ZiZWE3QTRiSTErenZFZWVlUDNYOHFJNHpFUUpY?=
	=?utf-8?B?T2ZORlBLVmN3MUZqZDBXbkZiWVA5aEtLSW9JdFZtUjBqSVpYbWUzdi9wVENB?=
	=?utf-8?B?ZTk3VGVGTzVlVlJxVzFGVjkxeDlDVXFPaldrWkVmN1oySlhsK21uUHdPeXdr?=
	=?utf-8?B?UXhCQU9WZFNMVllVVmxCWW5nOFNlaWxXNFRRdytjRmpSSkR2cUNrYVcrM0xZ?=
	=?utf-8?B?d25PM0dYZnJPSTcvRHFaZGM3SjBjazlTZWJ6ZGRLcGE2QTNjQW0ybTZwRFFK?=
	=?utf-8?B?TjVjdFBMSndpbHBydmNCVWx0V0hmbTlFVVk1OU1RTjM4TmtjK04vaGNScjNh?=
	=?utf-8?B?cHBHWElMNDNpZWlMWUVSakdQdUNiVERvSzJIcWJvdGVybTBITFdkL3d3eWEx?=
	=?utf-8?B?cG5weDh0WHRGQ1RTZ0pnckFoL0V6UXkxOXR5QmdPNExEc3hqWFRyVzRrS3F4?=
	=?utf-8?B?bW1HNHhTbTdzWjFHN2tPb1czRTNYSXcySGJrbVN6dmRScjhwNXM0Rmk3VUsy?=
	=?utf-8?B?azcvL1YzSlFwV2tDUnJtWW10Ukd3cUVIbDlCVmVtdld0b3JEeXYyNU12ZTVD?=
	=?utf-8?B?d1B1LzZkcUpzUVl5aHREb1JMMWo3SUVtaGZGU3djemxhRjJ3Nkh2TXRMR1NJ?=
	=?utf-8?B?VFBPQTN5L0FPcVRSZ0l1K0V1WVdjQUZuanNiU3QydWx1VVlmTFJ0T1hTWlJq?=
	=?utf-8?B?TWlSUXBsR2QyY0Q2T3I1L1JlVWhDVXNLaHRHWnNwSVJCYVE9PQ==?=
X-Microsoft-Antispam-Message-Info: 5j8yIEx0AouJh5xtEGkdicc47dMei7Dn4Yi/xjUuMQHCRne7Pg8yzmh1bzirP+rw8AZkTHZGIFkdHu+qp03m4/ElEw0MAM/3Ruwj1Xo80hsGFoKabrQC/a0LJ7wvw6Oqf49FB0oaGsO0ec/8WRWH9NzYmJTVWBuuo1Se8M1Y1Dqay0uX573YlY09qMI9vHPW7Ihxj7cxiFH0dQ2IDe/sJ12H00Lt4w3CMWcZ5db06uzYVIPILYbUC8xexMjflcN1tIv2o4D+VHpDJE1AVh8s8b/dDvLiA9Tfvx10p+1Svhja8K2r3bu4JW5ztHW1ydIXhbWjkZ3iBTzsZMQHzbWynbLo2Hu+NsLk4tuVjUqfHe8=
X-Microsoft-Exchange-Diagnostics: 1; DB7PR03MB3833;
	6:0GorpxZxa4O3xhkwGz2LxEzh/hoEIIQU5NQ5Q39biTEA+IZ9pZmAuB2+PQHXnNdZsP+x5kekI5Kd/HTLHkhbun1HJssCBegWwUSfWgiJjXdJa+ti0yoKT/sX0vl8CVtB6RdgXpYcVTzFP2rpeZ34ekuxdO+nzfxqA2u8UBa2/T7xAq3kLV/Lol86m4T6AxswkoNsBV/wAU3+qLVY4g1w95TFShmjAWks5d7tGDHjtGNWcb20XawzICC5fmexCiEs9n7hU5UfACb204FvrHrZgNm1KEjmTUR8LoyGA2KCFCd0OYR2LQrQeWlsRd1665nDKCUQ/t+QkpnKnBAd5k2WoPxQE5kVhC0sPpjI/zhlgqpjpEoBbGcqHUBFBM3HrAvVtV95ZiMd5AAjUnroJqu14bYYJ3tNdGAirpnp4/WLZ9A2Od+x2dEQfGEhUbIFtDNjIpELC31QxLpn8aTprO1z1Q==;
	5:KFPxV7kUBpnEoEkP5/x9oV/fRnYF0w1ZzFehBybG4tsWVYaiKPC43qKXSOgyWMvv4L1F7WST8kIf9cs27mtWu7094Oo3lI+hguJ89dLBdgHok9562eU6rR21fBc33d9LeksB5TUMpYTXj0pUcuSL4Zlkos68rKcOFEIyIytu3/w=;
	7:W/EoR/fenOP1y56IKnSA6HD9sK9d648+IECqSv7r/INF8U/IfWViNbydK38bP/JdFy7Q+4hevHoGO0VYOCNGnnsuaimqtKqiENpFM/EVtVrNhV45IIlaJ9L50Xk/5al/4JANb99wy7IkFzaihwgpSQjJjykuOHW9HtwFKrWpdToyWnNTt6PniESipvVoWXqwpZIB6LpnrH03H9r2u/Faim99+HOAwnObL+POyyEB8GhSXyVxMpBtLVm17tK0X6Yx
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: bbv.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2018 15:07:52.4472 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b97dac-50f6-4dfc-7aee-08d627afa8f5
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 279985bd-2077-4d9d-9797-42238cfc06e2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB3833
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: resolve install conflict with openssh-sftp-server-dev
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
X-List-Received-Date: Tue, 02 Oct 2018 03:38:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-09-25 at 14:54 +0100, richard.purdie@linuxfoundation.org
wrote:
> On Tue, 2018-09-25 at 15:05 +0200, Urs Fässler wrote:
> > On Mon, 2018-09-24 at 15:26 +0200, Urs Fässler wrote:
> > > On Wed, 2018-09-19 at 09:01 -0700, Richard Purdie wrote:
> > > > On Wed, 2018-09-19 at 17:11 +0200, Andreas Oberritter wrote:
> > > > > On Wed, 19 Sep 2018 08:41:35 +0200
> > > > > Urs Fässler <urs.fassler@bbv.ch> wrote:
> > > > > 
> > > > > > Image generation fails with the configuration:
> > > > > >   EXTRA_IMAGE_FEATURES = "ssh-server-dropbear eclipse-debug
> > > > > > dev-
> > > > > > pkgs"
> > > > > > This is due the dependency eclipse-debug -> openssh-sftp-
> > > > > > server 
> > > > > > ->
> > > > > > openssh-dev -> openssh. openssh can not be installed since
> > > > > > it
> > > > > > conflicts
> > > > > > with dropbear.
> > > > > 
> > > > > That's odd. Why does openssh-sftp-server depend on openssh-
> > > > > dev?
> > > > > Does
> > > > > openssh-dev contain a file which it shouldn't, e.g. a
> > > > > dynamically
> > > > > loaded module/plug-in?
> > > > 
> > > > It doesn't, its the fact that "dev-pkgs" are requested in
> > > > IMAGE_FEATURES. "openssh-dev" would be the default for openssh
> > > > packages
> > > > and dropbear-dev would be the default for dropbear packages. 
> > > > 
> > > > The patch here doesn't sound correct. I'm wondering if the
> > 
> > correct
> > > > fix
> > > > is for ${PN}-dev should not depend on ${PN} and whether that
> > > > would fix
> > > > the problem?
> > > 
> > > The dependency from ${PN}-dev to ${PN} seems to be the default
> > > behavior
> > > in Yocto. I don't know the consequences when we change this for
> > > openssh. But it helps in my case.
> > > (I added RDEPENDS_${PN}-dev = "", didn't found a better way)
> > 
> > If somebody know the implication of removing the dependency from
> > ${PN}-dev to ${PN} for openssh and give the ok for it, I am fine
> > with
> > this solution.
> 
> I have an idea of the potential problems but I think we should
> consider
> it. It would need wide testing and is a 2.7 change at this point.

This is imho a change in behavior on a whole different level, but
renders my problem obsolete.

The current behavior is, that the oe-pkgdata-util script first tries to
find openssh-sftp-server-dev. Since there is no such package, the
fallback mechanism is used. It looks what package/recipe provides
openssh-sftp-server. This is openssh, so openssh-dev is installed, even
it is not really related to openssh-sftp-server.
With my patch I try to solve the problem within the current behavior. I
use the default case of the oe-pkgdata-util script by providing
openssh-sftp-server-dev. This is also the case we would have if there
would be some files that belong in openssh-sftp-server-dev.

I understand that you like to solve the problem on the higher level,
but it is out of my scope. Within my scope, the provided patch looks
like the right way.

Is there a change that we find a solution on the openssh package scope?

Kind Regards
Urs



