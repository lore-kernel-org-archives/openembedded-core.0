Return-Path: <prvs=67329873b5=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 218AE78555
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 09:21:19 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w6D9Kxqh003031; Fri, 13 Jul 2018 04:21:20 -0500
Received: from nam05-dm3-obe.outbound.protection.outlook.com
	(mail-dm3nam05lp0113.outbound.protection.outlook.com
	[216.32.181.113])
	by mx0a-00010702.pphosted.com with ESMTP id 2k5k0py154-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 13 Jul 2018 04:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Poj252CruhnMiu8L0hWN2F5f0v0nzhJMlG849wZ0vT4=;
	b=XIJv/kgN3iqLhQ8XTkRM0CEHX+2AvMQdgOgqeRj8iUhn2p4I+7DCTJtAMMFgsYorLVJ2cJHkaxqkSLWVHnHarkLAhMUzpEnmTO0kYk5UZZlQXIpoTPRJKefemDaK53Naa8jCdj07Dx4VCeTT61uE2q6srCJEEhGgd7bWWs91FQ4=
Received: from ionel-work (80.97.64.55) by
	DM5PR04MB0397.namprd04.prod.outlook.com (2603:10b6:3:9d::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.952.18; Fri, 13 Jul 2018 09:21:17 +0000
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
In-Reply-To: <ca01f644-3389-7e89-07e3-8547fd8cddeb@gmail.com>
References: <20180710134409.16911-1-adrian.ratiu@ni.com>
	<ca01f644-3389-7e89-07e3-8547fd8cddeb@gmail.com>
Date: Fri, 13 Jul 2018 12:22:26 +0300
Message-ID: <8736wnze0d.fsf@ni.com>
MIME-Version: 1.0
X-Originating-IP: [80.97.64.55]
X-ClientProxiedBy: VI1P193CA0003.EURP193.PROD.OUTLOOK.COM
	(2603:10a6:800:bd::13) To DM5PR04MB0397.namprd04.prod.outlook.com
	(2603:10b6:3:9d::18)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69675e9f-1acd-4918-6ae1-08d5e8a1fd34
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR04MB0397; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0397;
	3:03UqEAKFois7dG+JNfj/8Sr6o80OvcQ+4X+zu+aPDX5Ein2bU0Few+j4j/Cwaduf6nEskYCT1+gzaOd7uo0o+pVJdSbUUfHWRgy0TW1Km7f6QiVSN+U+uPK8E7wPlYzWjwqX7uCIWGmeu8Snl7mPcRFJgn572I3fkK+c/gFb+cYrdwq9wYpTLtKgKx1eu0AnRcLSxj9mBoe11ciXMZ817PJFFDE2AbgbuUKHsouJHttUr/PWs/SGHvUXv4ScqsWQ;
	25:lc6+A8eMghtiG668M5bGPwPmqi715DQrJz1yEMWHbHpNmMBZ+cphl3FZa5TQhAlKM84W1YuQI947Ga7k6IhAaiXZgLNjcXXP9Hu7WS3fpIysSod6sEjEzAwaPct5w4iX+oeoFLSIBAJFGPBU0eojvu99RuhgkDAQtTP67OyC+NvccH0RfEClR4y5a5KF4RbfH19HejZEwg8oaWTCycRlO3I+DUODhXKr66U/aCT7loT81DeV0xs2hCrH3+VaqTzHCxxGHWDCZKx60z+8vPsfZei2S+k1jsdd9iH63pDXvXaFhI1tFVO50ptAgoQSgBLCvpGC965jteB+bA+3dUvkww==;
	31:ZT7RlOeRLnDIeWkL5eOwErFCltj3q2IsAzIaGBD5+wg3uPkDj+oZGrsPiL7ROI9IHF8ACh4o1e9/GJSrYdoplamnnOSRTl/s+jyNYVALfIaCbldVDDGiUq9VOeIio2WIyATeq/y6VGn6exomS/Q7DVszHog+CL60U91DPVXAoN6JAP9sBxwNLpnanQCMvZFrGO++5VRUexh3Ur2CKPFbvmWkLhGi23DWJoTBosG54Ms=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0397:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0397;
	20:jzdJrETXpyEBTHcjxYRM5EJK+lCdfIz5K9OmLyejVUFjQDB6MrW+E4+IrIL24m+5g4lf9aK81U7idHKIXwjbto+FbGFw12SooKrIziMqlP1j8PhMIneNlBtjXAx27l5fMW54jv1sHgu478YTqgY9llNu3jKb4wZRUmGNEVES3LvXm2S9Jc38t9Y2p8Yln3hiwNqqfKbZqBuDvycZbaV5Qg/aMPKHv4EtIUWrgAmynzOtTuXCh03EXCvcNa+LCgRvXRSsuwoFmm+SqTaWc1T7ocIZlpovjFg4fbA2GjnlqqS2S2dC7sqLjfrsKWZs4nNRl3p+Kxc75JxR2e+WvSZ/3LE+SDwQA72CMIma6gje9sSNzj/i7M0yVDsprroHbjJJ02W3A0v/Dt7PeFudSx81gvorlB64x+MfGNg4FCB87u7OPpg3cOXLm2Y7UqCq1y9i+3yel4xIHzrUF+TjiBnZ9OKZ7995BxTE675LbtPmc0+ZwMTxecdyQF4C8IUBgODVXkjJ2fvc9gEZ4hWat0l/5XhOZ41+nwZ32ejQsJ0maWSdQTU7S/E/bc8Wk2jr7rOiVGhuelFauDTZ8qQuFG5HGqVBea7kPw3Ak+P5HEy/v9Q=
X-Microsoft-Antispam-PRVS: <DM5PR04MB03976F62938A5904FD272AA5F6580@DM5PR04MB0397.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(145744241990776);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231311)(944501410)(52105095)(10201501046)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR04MB0397; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0397; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0397;
	4:BFyn4NJWDM3fE2ekep/Q/plrRGAQAcDUTAR/HEX66sk9pWBsUrsNiJcdzI61t5oBop3SwDebsaD3OQkLEps7W1Us9MmtlynjZaK98VoCqJJsWdW8OYcYpSQz072+kEMCB9zjkg0AS3XADt+RHUl/hPmNd2MtCElje94Yv7OwE1BiWFShdrdNCOg45oY+c1AYx6qw+2sYD1P4Ulti54HqD4Wp9x1JX+YEre8cQYRcSB3TnEbU7Ci+pNMDa2P/brlNV+UveGHJDhVyAB/HYV/BJRSn/mT4ApLdSjOp6N38MzAD68/MitIo0+dAaNkhFVcQuEd9TqhTJorPQ9WKYHP/S4fc2Zmdd++c2LRSdZjLvj0=
X-Forefront-PRVS: 07326CFBC4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(366004)(346002)(136003)(376002)(396003)(39860400002)(199004)(54094003)(189003)(48376002)(25786009)(16526019)(316002)(186003)(76176011)(6116002)(50466002)(3846002)(229853002)(5660300001)(956004)(39060400002)(16586007)(6496006)(11346002)(446003)(478600001)(2616005)(68736007)(476003)(105586002)(26005)(53546011)(47776003)(305945005)(106356001)(7736002)(14444005)(486006)(8936002)(6666003)(81166006)(81156014)(36756003)(8676002)(97736004)(66066001)(86362001)(51416003)(52116002)(6246003)(2906002)(6486002)(53936002)(386003)(107986001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0397; H:ionel-work; FPR:;
	SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR04MB0397;
	23:XGWAxRIfNqDarWXHgXlK4kuEe/jZQUyO0oUnr8jB4?=
	=?us-ascii?Q?5WAjjQoxDUh5E5SLgJfOHurIzMIXoMvoLLe/5VCsG00smdi77ntSSl5DCpv9?=
	=?us-ascii?Q?TPDtMOh+Odw38LYvBU/F4GEiCQdpM3EGjNlie3YGM0CV24kMro07Xja/w5xd?=
	=?us-ascii?Q?zqRSQTHsa7++J7mOx4UO6Fjnq2kC+qiVvvAisio8VVGxOggPqm+8rP6x+Tah?=
	=?us-ascii?Q?wAqap/wruZszr+EmQE2iePVwkEFzADbCfWZSOdFiiA0JyZcJX0GOSg9jyER9?=
	=?us-ascii?Q?f5ZQJ0zqYHumhxSyHEtSGClfEv1y38u7Y0gJPDvgN3l51SgvUQufTzYEl2ny?=
	=?us-ascii?Q?+IiweqnP4HkSzL9T41KD6wSmgEtrYc136gIIkOCMM7lN8KcDSr08G8t6nIqa?=
	=?us-ascii?Q?lqeU826ZQQrz9R9HV6+9Ru0jKxAvsX/djAPLpKB8OG0B8qj1uoJk6HPzd4My?=
	=?us-ascii?Q?RG/rXRU6GMZQhR4g37mZkXj3c8lwqxz/I4DFvAcIbDP6DeL71seyT3tWPzTC?=
	=?us-ascii?Q?piaylr16YyvL8mMGfzphsGVlocTTmBgVjbvP1xMfoU3zs/UeRZo26ZmeKH5J?=
	=?us-ascii?Q?kceVLw5RyIxvpBqlF9PTDweNms9rI1ZFcOBN3z2Grz3qnU74Nuiv0Nkl8DXv?=
	=?us-ascii?Q?k4MroIwgG/LyVoEPvbvDQnScqA6zEDvpAHwdOw86s8xAIstIKTxvyb4+Kj1y?=
	=?us-ascii?Q?XUmP6bXgUMk3vUnXhpFO8Ssrk0OzBWFl9GM6FhSwcgeYpxAbb9vtoDsHzuT1?=
	=?us-ascii?Q?cW0AdF9VZEiCa91N7y7Sxf7AsreKDFzQp9Rnrl2EvfjoPPL8lPHOvKa3g7r5?=
	=?us-ascii?Q?41eimbZPrUWqlEii7zayC3GjFe0vAJNrNRotB2j/sjVKcu6bXprD1MeMxybS?=
	=?us-ascii?Q?8TgkR7FShRIRr285u+aG5qHA9cPDsuE72EzKZG+/cy+ryUdrWuaB+eTkR249?=
	=?us-ascii?Q?DBoFYHSDJvnR22K2EJaPZZ51T0s8XU0cD8VTS/nTzoS91/l/R9EH0RBvQ7rm?=
	=?us-ascii?Q?2vnOIIJF9TMXItE5Kmwk1abdnD+KY+PD3lM4Etona6fA8R/xx9zg1eAh1iP9?=
	=?us-ascii?Q?+ZZyMRqachwMj8dB5rdw/TWxIM1PA893c+o6asckbe2t9x/A1qum4aO6Ed7p?=
	=?us-ascii?Q?v5OlmtT1rWSFAU5hNpQXfwr/Z3c0sNKpETsM9qzaB3T6eiBldZ95mjPHkphr?=
	=?us-ascii?Q?ApkQcemlQeRGBATgOgBM36CUgYWi4TXUC4/7iVMqknswSo0SFh1Gc9O8n0KN?=
	=?us-ascii?Q?5blju+J4qWi734OAgc=3D?=
X-Microsoft-Antispam-Message-Info: uCdocKCmvyVF6jpfbPwvLlllLTFTdoxQX/VXWwRSgexG5i2HKb9elZtntAVHZa9QvzZ++C57XKH3NE9uzRt7ceFpuZG+EpRDP03wPOo7tA3dJAnBm4gcwj65R1zix8rtu3wu8V9eFqSODRl7umG1NUFtQSw1S6+E0db+QdybJf0DJ8BkKvODblH+FEVIRQZRMXP0zqfC76LYmgNwb3KkjVg6h3ZGD3MG16W26Wl38WfKwAIO5wF9/ihYFncqGTxYDRisTaF2vGcVRd1zZf6AJjNMomaE+XzoxAU+ID/S215OTuM3wPGVKE4wJCNB2u7YNk8kadTomQwxQohZAw885xojOiG/Okj2oQRLIDZzNqs=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0397;
	6:IiBiJwQD1CeVm05Zs1xPEcLz0Bkz7NPubLtWVr5ueyjoBfMJzQO5NoUYrdRHfm34EhNPvJObxz/DRpnJsbBmeXkkt3ly55GGVKhWLfcO+oOWQCBuKs0nssr4wyNtf3gTi6fgjwZq0XxBOlz6LVt0RBkMV9FHIFkaNXTvXnVPEXk0LZavAJwQGV7Nkp032YGviJlF/addbz1hE3/02Z1C9hh+zn3UXoUmjo07sfxRVWy3nYdHtcofQddsl0mq1EuZwkCPXyKCuD/ncrI29V3VSue6ywHRIML/J2WY+ONrWAtPg1KGAo3XS4ip26Col9OAHqi9jYk8W3ojbNcZMEkStJlr22NKOmkhAJO64l6Go6Vva1VRWBPN8gCjbND2G8j6QTx1cIuiLlncNhPVoyqd/5uXnu5XTz8fcNJQJFJReYj/hJllp8oHY6aO27A8JZhvAaCr8FfyXUyAqwIS0v3H6A==;
	5:nchVoC16KFbLRfRxVUfQJatq+AAkAgpHfCl5WNqQbKor5UIljHqW3OdnVWesAWkM/Rp73ABydfrbxyN9TAxBc4Mzze3QW4a+QDmdTKyZhiIO/yju3vp6wZK0MODt9IO+R7mJdpRhWGhFrjm+I3gy2wBXMS5Ms5h7IJKuck9TVVs=;
	24:WqoxMuNJryA9W7IWK28UjIkJ8pzojG2my08+U5Hac/KGN5paJLCJ83rUZbI69IVplllkyWScMs646uUCzaaCXC7XdBF4bn6lXezd50aWDyI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0397;
	7:ctunRp2NmSA0JA+OgZks0vDW4i10KYb4ibyuCAbHvhhyrcdXTd6mNTlHfu196erCW79Qq2o+tqscyIsB86zGxxQuH6rmJUlHBl0YFO0Hm3olensWPGwvq2QurUs2y22GZUcsODw4Z28+UlzYOYpWJv3RPxHqWwqhmwclyuic48+cRZihSC3/yhdnbahdGtlDNOqXGZVJpatM9KePJpXQ0/Xx8WTIMN0YIgI3Mscgf5kIQKuOYBcuck4B9JIV427L
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2018 09:21:17.1437 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69675e9f-1acd-4918-6ae1-08d5e8a1fd34
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0397
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-13_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1806210000 definitions=main-1807130070
Subject: Re: [] default-providers: introduce VIRTUAL-RUNTIME_initscripts
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
X-List-Received-Date: Fri, 13 Jul 2018 09:21:20 -0000
Content-Type: text/plain

On Thu, 12 Jul 2018, Khem Raj <raj.khem@gmail.com> wrote:
> On 7/10/18 7:44 AM, Ioan-Adrian Ratiu wrote:
>> Commits 1202307b24 ("lsbinitscripts: don't use update-alternatives")
>> cdcebd81c87 ("initscripts: don't use update-alternatives") and
>> 061fa614cec ("update-alternatives.bbclass: refuse to manage SysV init
>> scripts") make sure that the lsbinitscripts and initscripts packages
>> conflict with eachother and can't be alternatives.
>> 
>> lsb has a hardcoded dependency on lsbinitscripts which makes it
>> impossible to install on systems using initscripts (acl depends on
>> initscripts) and lsbinitscripts also has a runtime dependency on the
>> full util-linux package making it an unwanted dependency on busybox
>> systems.
>> 
>> Therefore introduce VIRTUAL-RUNTIME_initscripts to choose between the
>> versions of /etc/init.d/functions and allow installing lsb alongside
>> initscripts avoiding the full util-linux dependency.
>> 
>> Default it to lsbinitscripts so we don't have a change in the existing
>> behavior; distros/users can override it in their conf when needed.
>> 
>
> We already have PREFERRED_RPROVIDER_initd-functions I wonder if that is
> the right option to use here.

(I've sent patch v2 which fixes a build-error causing typo, sorry for it :)

We could use PREFERRED_RPROVIDER_initd-functions but that currently
defaults to "initscripts". In all my layers nothing is using that
variable, so would it be ok to change its default to lsbinitscripts to
preserve the current default lsb/util-linux behaviour?

Or are you ok with using it as is, leaving the default to "initscripts"
and just change the lsb dependency?

>
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> ---
>>  meta/conf/distro/include/default-providers.inc               | 1 +
>>  meta/recipes-extended/lsb/lsb_5.0.bb                         | 3 +--
>>  meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
>> index e65c1ed323..37e7478ea0 100644
>> --- a/meta/conf/distro/include/default-providers.inc
>> +++ b/meta/conf/distro/include/default-providers.inc
>> @@ -23,6 +23,7 @@ VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-opkg"
>>  VIRTUAL-RUNTIME_apm ?= "apm"
>>  VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
>>  VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
>> +VIRTUAL-RUNTIME_initscripts ?= "lsbinitscripts"
>>  VIRTUAL-RUNTIME_wireless-tools ?= "iw wireless-tools"
>>  VIRTUAL-RUNTIME_base-utils ?= "busybox"
>>  VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
>> diff --git a/meta/recipes-extended/lsb/lsb_5.0.bb b/meta/recipes-extended/lsb/lsb_5.0.bb
>> index df4812e4bc..6cb1751664 100644
>> --- a/meta/recipes-extended/lsb/lsb_5.0.bb
>> +++ b/meta/recipes-extended/lsb/lsb_5.0.bb
>> @@ -8,8 +8,7 @@ LSB_CORE_x86 = "lsb-core-ia32"
>>  LSB_CORE_x86-64 = "lsb-core-amd64"
>>  RPROVIDES_${PN} += "${LSB_CORE}"
>>  
>> -# lsb_release needs getopt, lsbinitscripts
>> -RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt} lsbinitscripts"
>> +RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt} ${VIRTUAL-RUNTIME_initscripts}"
>>  
>>  LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
>>  
>> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>> index 53d100ce74..74547b0773 100644
>> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>> @@ -118,7 +118,7 @@ RDEPENDS_packagegroup-core-lsb-misc = "\
>>      gettext \
>>      gettext-runtime \
>>      groff \
>> -    lsbinitscripts \
>> +    ${VIRTUAL_RUNTIME-initscripts} \
>>      lsbtest \
>>      lsof \
>>      strace \
>> 

