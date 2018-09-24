Return-Path: <urs.fassler@bbv.ch>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0058.outbound.protection.outlook.com [104.47.2.58])
	by mail.openembedded.org (Postfix) with ESMTP id A99EC793D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 20:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bbvSoftwareServices.onmicrosoft.com; s=selector1-bbv-ch;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bsnSxV0ZYGbYPzr7EdPjtQAjdyaAsrHaVNi8dc3GI6o=;
	b=VUjK1rNtirZyBdrzxPQteJcHJmXS7rdVFjrXkhnuJ/KXzUxqJYgugfJl9QRSfT9FUxqkQEruuCDHGlrH5FVxI/3Fsht+hCY5oS05uSdhfJ5fCdf4MvLq6jawp+V7Sx5u07mSLhAli2DQPRyFcwnnGG8IqYs7dXRGUTODrHLcYOM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=urs.fassler@bbv.ch; 
Received: from ofone (213.160.33.170) by
	AM6PR03MB3832.eurprd03.prod.outlook.com (2603:10a6:20b:24::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1143.18; Mon, 24 Sep 2018 13:26:22 +0000
Message-ID: <1537795580.13947.1.camel@bbv.ch>
From: Urs =?ISO-8859-1?Q?F=E4ssler?= <urs.fassler@bbv.ch>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Andreas Oberritter
	<obi@opendreambox.org>, openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2018 15:26:20 +0200
In-Reply-To: <ed51b3579be101e9d2f711ef9f94d16029981f92.camel@linuxfoundation.org>
References: <20180919064135.30249-1-urs.fassler@bbv.ch>
	<20180919171113.21fecc56@t460p>
	<ed51b3579be101e9d2f711ef9f94d16029981f92.camel@linuxfoundation.org>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-Originating-IP: [213.160.33.170]
X-ClientProxiedBy: VI1PR08CA0086.eurprd08.prod.outlook.com
	(2603:10a6:800:d3::12) To AM6PR03MB3832.eurprd03.prod.outlook.com
	(2603:10a6:20b:24::26)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2eb77a13-366c-4e6e-e32f-08d622215250
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR03MB3832; 
X-Microsoft-Exchange-Diagnostics: 1; AM6PR03MB3832;
	3:lzkeSdBrer1s0abRt8JBgy+dKiLr65+itFS08pD2oe5MINxE6zY+AASczPN9ssiyWYrITYGpQ9hCMAPUIYBm8quN1pAIfR1NLSSM9UjK6piSnDWR1fYUtMmfKY/gGT89nOj/9WDWnmdxCFAxg8E07k9WO32tpIpzGZu1KRvWQGxjfYVRPiwMAvNdk7tdOW2J8UAjPFJ5EJ2FaCEjMZDtumLGq0NNvctqwSVtavBA//r+zcUkmvbMob3RZ972KZ5/;
	25:kpFYO+LnBdqn7krCARhUPfqwqTet2coUoyiW2/A+Qlj6BraFaVlnD9J8pkgCHRazFIIhjWhEu7OyvhtnmgukaJZIbOOk1Ma0ffbLJkrHVKP+BHzmi2qtu+2JkfYoaUiZ9waVdVIihLyTmMsdqZdJCNTtoCjeYhqlNkDr2kZL14LegrL+WS1jK8IQ1OZ7eRO3oJ08vEq1q6wJRxhcvkGsIRflZGlrhPRz1UV8bkp59rz9PMVSnzHJydAtOlZ28q+/nTKA8qxm3dsclhoW9USzLW2r2HQZWtL5rokLpm8cqMNwZ1PeKSAvrsofHQwZvTRz3LXhSgywha1RWIL14GC7qQ==;
	31:oARmibXWZiFu5oQ2IcRmu0UtAVVjnR3p2ULlYi++k5u54uk6jebn6GWSr9zOUPi2yVWwKfCfciFf7+S2/3m9yr1ZDDpJlRQ/sTUURY+i+e8DoxZtDEdWW6ct9MNO2l/18KFsUPEQdcr72GcQoBy4i5Feq6CsFKh1zGd/GWaHJMZQN+V1HHcVxLIC6rR9UAf9QoGnJT6BreYYvw9x4r78A174pohbw9wQ/B1qUMoZMRg=
X-MS-TrafficTypeDiagnostic: AM6PR03MB3832:
X-Microsoft-Antispam-PRVS: <AM6PR03MB3832712B91F57889F1ED80B08F170@AM6PR03MB3832.eurprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231355)(944501410)(52105095)(93006095)(93001095)(149066)(150027)(6041310)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051);
	SRVR:AM6PR03MB3832; BCL:0; PCL:0; RULEID:; SRVR:AM6PR03MB3832; 
X-Microsoft-Exchange-Diagnostics: 1; AM6PR03MB3832;
	4:Ztuqlv/UiLLwLxTgbeXDBC4VOt9XaZL+m/8QW4Qfe1zl2qOa74sopVpa+8ypAtL+O+xU5UQm9kBaUpksxskc1do1KKZrnupd7+UBAii2HaWMQ0EH0Wg39LcuKF6zSycn0lOl8OerGO9/NZwzBBhKjZW9UAt+SLOaC8FNJkJmjzdDli1uNxbdpcda03OPIjzR6fUNvRS0AmPqz8FTkfDHbNtppwGLRARle9Cx0WK7Dv21CGi4NR0gPoPNcuDgJsWaNb6eAIdWYFCVKc6FOVh/sw==
X-Forefront-PRVS: 0805EC9467
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(376002)(39840400004)(346002)(396003)(136003)(366004)(189003)(199004)(478600001)(74482002)(956004)(106356001)(5660300001)(6246003)(2870700001)(97736004)(16526019)(186003)(68736007)(103116003)(2906002)(6486002)(26005)(5820100001)(50466002)(53936002)(316002)(50226002)(23676004)(33896004)(66066001)(8676002)(25786009)(229853002)(3846002)(7736002)(6116002)(8936002)(47776003)(6496006)(486006)(2616005)(110136005)(446003)(11346002)(86362001)(36756003)(386003)(76176011)(52116002)(81156014)(105586002)(81166006)(476003)(305945005)(99106002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB3832; H:ofone; FPR:;
	SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: bbv.ch does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTZQUjAzTUIzODMyOzIzOno3Y01JUk1mbDBNOWNVMWRwN2Y4b250QXFF?=
	=?utf-8?B?eDRqV3ZKNmlvWTU2VFpkK1c3OWVFS0t2RWFRWm9oSUIwOUpFTWlzaWFwUFJ2?=
	=?utf-8?B?alZkOVBlUmM1V09nWG4rSUdwT0dyY0N3T2pXUmp3SFl0SnpDYzlESGpHYlhj?=
	=?utf-8?B?SThmaFlEdHJqcDlUVFVvaUJaVHZuZ2ZoN3p1cmxsa1lHR1RxMUJHZFVYcGFu?=
	=?utf-8?B?emFlVDBTSkxzRS9obWtmMmh2MmtRclhSV1RkcnZ0WUZXZCtibUZTclJYS242?=
	=?utf-8?B?UXV4SFp6WU4yaWxrSXFWREFXWUhxV2Jyb2M1ZzkvRldJK20wYldlODhISm1K?=
	=?utf-8?B?R1hGaHo4VHc4NitIYlRjUDNyQ2U5RnZyWkZYbVJSVTN3c29sMTdjNktHcnZT?=
	=?utf-8?B?Ti9GbDRaRFhsajdGR08yTTZtN0J6OTdXeFpHcTdlMy8zYkJRL3VEUlYxN1Iy?=
	=?utf-8?B?cUgzWjFONGRtdVkwbDVCeUd1K2JzNHpRUWRWTnRhaldqM2Q1d3NsQWJSSEUv?=
	=?utf-8?B?bi9qWlQveEo5VkJGOXo4Q3JmRCsySkpzWHN2ZmFhYXhVV2ZJeVU1RzdYNVRS?=
	=?utf-8?B?Q2ZJeEFnbHRGaXdRTEttK0pxQS9SQTRqOVlJdU5pbnhDeGNLUHN6Z0JSMW1Q?=
	=?utf-8?B?c1hHc2w5QTZSajBjOTV0R1lUVlFqczJYWVRvZ3VPTHBIeWIzU2d4N3RtQUVG?=
	=?utf-8?B?aHNkaEwrdU9ZbmorVFc3OUJYZHdYV2U2NlFqbU5KVHFGVE5aem1pYmJLbTE0?=
	=?utf-8?B?WTljWTNlTHRmWlBaOTk1NDQrYklhOG9scnJPdkhCd0ZyT0Yyd2JVWDNEL09J?=
	=?utf-8?B?U25QNW0wMEp3OGs4aE54bCtJZmlrNnB3Uldxd3lxbEV3SEFQZGdQTnR4OGNU?=
	=?utf-8?B?TEgvWHduSWVLb29qYmh2RktuOHI4NDVER2E0d04vM3VSdUo2Rzl3SXdGOG44?=
	=?utf-8?B?MmpEWDBkUDJWQmNvc090SU9RbUJFWFMwNmlES1AxcElycGt0Qjh4K3dBOCs3?=
	=?utf-8?B?U09RQnBVd1lPWEI1YU5WODZVQUJzRVpqVHkwRXRTRENqN0xEa0NSaHozM0F0?=
	=?utf-8?B?TjVCRnpMN2xiZjlMN2dPNnY1SDFlczlsbUdMUlN1eUc4VlR0VWw0ZlFpdzRx?=
	=?utf-8?B?clZrbzQxU1pyMHNOUlpLeDR3bVV2OWVYdTB0SzRWWC8zQkhqZTlLK1VqQjk4?=
	=?utf-8?B?MWVqV3lxb0tlM2I4RVFqUFhQWEUrQlc1VWt4ZFhxbUdFcVcrSXRJSkZaa09M?=
	=?utf-8?B?RlBQcjNsQUovVjROV3NWNmNEbWQzQWR2TE95Zkwzd3g4eVZuWks0RTBEZ1FY?=
	=?utf-8?B?dHJaN1NTbmRSTm50bTNEYmx0U20vSVRvbHNxQjNUQkM5d0xrUDNYUXgzTkNm?=
	=?utf-8?B?elU2VDZuRmtEZHdWMjAvUW1UcDIySEJ2NVdPTE92M3gvSjdOem5kTjZobEZm?=
	=?utf-8?B?cm9lckFFNFluQTdzeGRudmFEWFJnNWhBdHRxY056YzRZc1dsekRvWkdCZzIr?=
	=?utf-8?B?YTNoNGFLSUd2eEFCdkFDRmttTG45QmVRTnUyK09WZkFLVEZhUk50aUVvQ3Yy?=
	=?utf-8?B?RnlUc0JtUjc1T3Z5VjFYaDB1VmdtL1lBL0FSbzNxSWlZaHpOREgwcFFXaWtR?=
	=?utf-8?B?VitqODFTMVN1dDFpMnFHbjJFSC9lcFNEdkU5VXVMazk2aStIRkl5UEdqalps?=
	=?utf-8?Q?1tVJ8iKts04YuRrhlM=3D?=
X-Microsoft-Antispam-Message-Info: lMslCRQpqOavKURHGpjIM0T2TTT1tpO4Gn0FyYj/vhArV6L5+EgMP1jz+4nE633p3mCpjqmGJwcwCVyoyDlndf7yfspY09dQlOMq1WOTTbDXsqCVORLkEBAbYNWlzbwdvzYVqCyyMkBLF2Vktk3XlsLVfpPUqYrehujdadxa8R3QakRRs9EXeisjfveSEgixsGCA0UZS9D+DusaehyfPLTDB7dViQN6JwT003WSiQYiuBeOo/AFrPohBv/MCSk5tmAB4YsktlzE2GTsECjiOyoapfrTitX1o0ZngZ4ooCfycqvN/0e8RFjtDfEUAdVY6VI7C8G03hia2WLa3cFIR7BRKxA6bahqUGuXSYsSo5h0=
X-Microsoft-Exchange-Diagnostics: 1; AM6PR03MB3832;
	6:/9CMjdR4kMhg9dK3KWQ6foSQynolpjKOMW0CfjQX76oEye1eaMLlwnwO6RusJICxFqicmPHjTMRgFeKFa/qpLGaIp30f78BZyJj7h0BHfHUTFP2/KgicDnS7N9qHMIAOcCSExLDLfluj+pjZ2Xf7JJ76lk03d4JyqRSDMHKV13a5syXvc++wlsCF2KkyjLGv4L+0uMI2Ej6fDlBDQaTFP6qccVjgZgPBADOBZehThhTQ6yKGNtjJgevfepAlzHlUdiy+itVzvcCneUFFXPEhxnFt41AxbOBgmM6akr0iwtcFR2YVMR1EBREvX/Sk9NVs3+UYD69IkxqHPr+Npgr7e7YZlukVZ8s9/O9j6S0P0Ea12cKi/RqUeZxH4MSiJK4U41geuWrxc3ILyvzJqUL20NdF7872Q8H/c29dkNVrm6IVeE2pZx43Xw4ZW3sTVuGkaBxVcTaLGBtzkUUjqEzE7Q==;
	5:QnYgbsoZ4N52yTpJQ2P2lYfeilwsjp093e2pEhd1MV+cK8eHNG14A4zNm0FFrKbwImUKbCfyYnACOCfCiy/IPzSeNhHzVWh7JsjUnmnoFVDpb2mHAfRHEADTDFBhUvqOihE7hj14NWY/+72CbVdsF92V4OPimi2WPBhhxwKvvHw=;
	7:2e2+j+GdtxM6y5NaCBMvMtGgVUpvgsWMBd9P/QAjeof3A1sKZdhMaHG5L/cF5JpdjSgTQcG/hGdYJBBoziDAfP4TSDN0qqBjgmgpeXxAHfHv/yeSO5QKzLsYEyckWNU2X9u6k0WQlR167CzmaMCI5whx5uBuObq34b/1Pd6cO2DcnJSacfAC1QQCXnOQm4S+hdCphCUISTzD4UaBOdGh9zwS+N26MU18KUCdUFVmvy0RPeun0ExcvN/Ui+gSM4we
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: bbv.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2018 13:26:22.7926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb77a13-366c-4e6e-e32f-08d622215250
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 279985bd-2077-4d9d-9797-42238cfc06e2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3832
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
X-List-Received-Date: Mon, 24 Sep 2018 20:03:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-09-19 at 09:01 -0700, Richard Purdie wrote:
> On Wed, 2018-09-19 at 17:11 +0200, Andreas Oberritter wrote:
> > On Wed, 19 Sep 2018 08:41:35 +0200
> > Urs Fässler <urs.fassler@bbv.ch> wrote:
> > 
> > > Image generation fails with the configuration:
> > >   EXTRA_IMAGE_FEATURES = "ssh-server-dropbear eclipse-debug dev-
> > > pkgs"
> > > This is due the dependency eclipse-debug -> openssh-sftp-server ->
> > > openssh-dev -> openssh. openssh can not be installed since it
> > > conflicts
> > > with dropbear.
> > 
> > That's odd. Why does openssh-sftp-server depend on openssh-dev?
> > Does
> > openssh-dev contain a file which it shouldn't, e.g. a dynamically
> > loaded module/plug-in?
> 
> It doesn't, its the fact that "dev-pkgs" are requested in
> IMAGE_FEATURES. "openssh-dev" would be the default for openssh
> packages
> and dropbear-dev would be the default for dropbear packages. 
> 
> The patch here doesn't sound correct. I'm wondering if the correct
> fix
> is for ${PN}-dev should not depend on ${PN} and whether that
> would fix
> the problem?

The dependency from ${PN}-dev to ${PN} seems to be the default behavior
in Yocto. I don't know the consequences when we change this for
openssh. But it helps in my case.
(I added RDEPENDS_${PN}-dev = "", didn't found a better way)

Another workaround is, when I don't allow the generation of an empty
${PN}-dev package. I have the same considerations as with the previous
idea.

I see the problem that dev-pkgs automatically installs openssh-dev if I
select the openssh-sftp-server.
The nice solution would be to tell Yocto not to install openssh-dev
when openssh-sftp-server and dev-pkgs is configured. But I have no idea
if or how this is possible.

Unfortunately I didn't found a recipe where this problem is also
solved.

Kind Regards
Urs


