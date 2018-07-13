Return-Path: <prvs=67329873b5=adrian.ratiu@ni.com>
X-Greylist: delayed 1076 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 13 Jul 2018 13:02:46 UTC
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 3435876099
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 13:02:45 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w6DCf8iW013034; Fri, 13 Jul 2018 07:44:49 -0500
Received: from nam03-dm3-obe.outbound.protection.outlook.com
	(mail-dm3nam03lp0019.outbound.protection.outlook.com [207.46.163.19])
	by mx0b-00010702.pphosted.com with ESMTP id 2k5d8vysw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 13 Jul 2018 07:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=iwCPZbezOSOZECE6UP2HCulqJhy20FQGgpMbqAPUHAk=;
	b=Zyrc34mdvucZK3dxrvWC2tk3ccaD7NCZrZ1/3/r01hKSRkbeYVFaYbvclKlVNTbKjffCI/TL8QpjKo4z/W24MbTTjZiIngFgNj3P4Q+OJrcYD93ITu9rBxDiIDqbF575VV0IWlHGAbP973u17bWCEheU9P8gG0Mes83193Vc0yE=
Received: from ionel-work (80.97.64.55) by
	DM5PR04MB0395.namprd04.prod.outlook.com (2603:10b6:3:9d::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.952.18; Fri, 13 Jul 2018 12:44:47 +0000
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
In-Reply-To: <918da0cc-b3f8-b34c-91cb-7a8c0e550741@gmail.com>
References: <20180710134409.16911-1-adrian.ratiu@ni.com>
	<ca01f644-3389-7e89-07e3-8547fd8cddeb@gmail.com>
	<8736wnze0d.fsf@ni.com>
	<918da0cc-b3f8-b34c-91cb-7a8c0e550741@gmail.com>
Date: Fri, 13 Jul 2018 15:45:59 +0300
Message-ID: <87zhyvxq0o.fsf@ni.com>
MIME-Version: 1.0
X-Originating-IP: [80.97.64.55]
X-ClientProxiedBy: DB6PR0202CA0022.eurprd02.prod.outlook.com
	(2603:10a6:4:29::32) To DM5PR04MB0395.namprd04.prod.outlook.com
	(2603:10b6:3:9d::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06402b29-266d-4d4b-8ac8-08d5e8be6b08
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR04MB0395; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	3:g6Ru70zHw+WvKAU6E7uPEpJsZ4G8iiUtoIHYm7Ll08sNAnRDl/IhiCYmacaQanMIsaO5xNX0YYi2hmz1GFyehUPUKwV3ZpVBxi+X/8LihqZ3cClpu5XKPZDrk8Z3d2Nzccy9eFz9FxGs6s8vKmF9IyzJrvhIHkHTgXmAU6284ZmaZrXVvxj97BiBNnw7wmYzOj/vAtBLx+un8aT3XxTEDPfI6En7r8PkzkubF9uGq9YbVTFVdgfgVvssZJfufLKz;
	25:DVRGzCIjThQYImJhCT9PfWrGi0FHxtMxTnH+fZ/JeGsG8b0u/VWNXDdPqVFcujRJs8XO9oqLSif7AvWjVG0KbdsrzQTMycpq4Z3YqgkVo8KKFL7uaSLmmS8J1rwxL4/oKRa1EHLIgQ9WT2ZHZzVpmVgFK17MHjeXgAzEFKTKNNzW2XACiS+jAUQma9gjCJ2vedleZpZemZ9eCfVnlU9ttKXDtYb2Ct4lBhmnMr/dN4jX2z/nUSkQaizN8uQo3+rHx2Ij9Iz96mZkBtUTm5J4U6EwO46RmJgSLHCObLY3gFRyI82k97/Nd6tFZJl5U31ck60GA+0sK439BQjlRuXRsA==;
	31:EHgTatcMTJcNoHnkv0diPgfaLWIcsz94zCAJejVrgoZTVWJ+ShdTcljcZDB71E3kx1NB4aUvKB2D6Ac6uHR1yYHloWBW5dZh0Fnx3RBe2iFmwmra43Oj82UegqsFlhJeRj+udNMTbF9rdd+5nxTZKZnHg0wTyF9sQo2FVqRNf505GJiKRKS89jkb43rt54beEUSD/FRrGwBajr3zQHPSDE7hAGhbvBLa+82Is4F6yPM=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0395:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	20:ucu1wwy5ISPi7D8A3vXs+cBFj4suyOeseHxgZbpCZ6YJ0Ry9CxEXw/HehSei4dRnSwPHMzIfKyWq3u8vcW/BLy5hAGoqo92gM+yYLGzf9KqUAfxP34uSoW7WSJ0Bt+1MbJ75QPKtSeew7vBkXZxlr5Dw7faRVIaENtkQoHWx4923c+snYSN3Va4FnLUm1YXlCuork3Xq4UBoB5Y5byf3tp9YsNJUP+fDgAWpM7Ug9oionF7qDoY2I/IRUBNlu1RZxZYWekW8DiCWIOpgQ5cD7Izm/vsBuisQe2ijSo9hOwx0cZFBAYF4Cg2+8n32k+PQiV1mVZ+TvXMjQ9QclAe5UxNUem15snSYdV6zR/WQEVTZOEsSwSRcVbrMmylOX9vlYzsAyYzQqPHYd9+gXRAt/9QeDKhCAa3nZ6/0tE5EHx9Qb9KxDGqZp+K6LesTsgblw52GIzuIhkgPbU3EIjejldrlE9kw3LQniXq+LSyQVXpjPKUmKPu+EQ8scIIehaEDiufOekhbfbIiqBUpbDoV1y8/K7R5UPdQ2eVlveAJF0YbiFfArEvc9u6j9pcEd0ftpKN2dOgUgiz/Ve79BVv6yqksg2Wonj7mITVcxbK8csM=
X-Microsoft-Antispam-PRVS: <DM5PR04MB0395C58AC97C01DD819C2582F6580@DM5PR04MB0395.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(145744241990776);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(3231311)(944501410)(52105095)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR04MB0395; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0395; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	4:MZ7vV3iMoX6gR4ges/bqlFYLtQ1hYjPtlpkjMCkg3+6BAGtc2BFbrx5VzqDohlliJT1L4NTc0VGHJW4EWNlV3vECaS8TUYvKiHPynWRvWGyXVd0OoOGdm7Q0ZRgu6aqM4Ttq0ucNR57pkIZN4Nv1IsJ8ZmYFT/PDqJr+JdadyfegQ2vOLYeH30gek0pFpPqJMGk30i8wq6FhzRSNhpNdUZkw7QI/KgpvH1ubUmQEiNNygfxLjRTCNU141v5qXvP+j+XddMImho6rIZshSflp5qjgXMt+HDmHXY0SvkH1JIzJ85LKs9V5dF7A92yy1sLXUk+rkswMq+k/D2YC4yoex97EqJGhLw0ixBHnciTg7p0=
X-Forefront-PRVS: 07326CFBC4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(366004)(346002)(376002)(396003)(199004)(189003)(54094003)(8936002)(2616005)(8676002)(956004)(81166006)(6116002)(81156014)(486006)(25786009)(5660300001)(106356001)(105586002)(53546011)(446003)(11346002)(97736004)(476003)(36756003)(2906002)(3846002)(68736007)(16586007)(47776003)(186003)(305945005)(7736002)(16526019)(53936002)(316002)(478600001)(50466002)(14444005)(66066001)(6246003)(386003)(6666003)(6496006)(93886005)(76176011)(229853002)(6486002)(48376002)(86362001)(51416003)(39060400002)(26005)(52116002)(107986001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0395; H:ionel-work; FPR:;
	SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR04MB0395;
	23:gRtBbGt5eVsg4Y2yYliEBq8AIf/RiXSUp6DYXVtan?=
	=?us-ascii?Q?5DazDVLd88S1AykTJWkEwUgGUy5M6OascBlgdACxDWmjGKHS0gp4o3nV0YHo?=
	=?us-ascii?Q?NXFosl/4OBNtfJo+Y8J67SCNGLebZvoRdVhPxuBqHNuXk6+MLuRHlsVUfVZA?=
	=?us-ascii?Q?nNGCPR/SFj23Sz2w7xpyeJ/jpCcM7tdg4ZOI5u1xWemDeZZND3ssh5OcwjQj?=
	=?us-ascii?Q?Hm+SlzOCoccHP2Nk0IH7bgaP2JmZcVurHrqvfHahjUjf/Ch1/ygZsYH0zv0n?=
	=?us-ascii?Q?JUurN8XNOhH72tL0VanqM7lBMQV/pfghuUdvxv1TnIcww5B95MgrL0OVYkC8?=
	=?us-ascii?Q?U+MYQhEUjZvGz1LyUsJ3Gknghi9Kvf7BFRrHMv/V/jN3xqqt43o2uGJw8u4r?=
	=?us-ascii?Q?ACHPAJPgs6rUOg0yYKD3cp2dmQOkVbwONqmFjxE4Ri31OyZaNKjremSyHMWf?=
	=?us-ascii?Q?zIKwDhFKEAmV94dZWz3yz0MeU4UHgw1ELiQD8BdI9DfaR4JCVdofQgDguwic?=
	=?us-ascii?Q?/YQ1snUETykSSpyG0yuIjmWVS9tUB7vWldUIKNU5BeLFNYK56x4hPmKTI2Pf?=
	=?us-ascii?Q?LHARuKL+liHUCOZ8UqhsWTAePBsKxsvp/pwl7YAO3LQq+RIDQYbLwFo0wVfu?=
	=?us-ascii?Q?uXyLX/+iNAyW7ki1noEzP7scxlh2PdYh/ha9jQ7iEoS2q3JuSizxiOS14SZs?=
	=?us-ascii?Q?dQ0W9wr8XTzPFVWzeM6mcj9JgUyBaVFQZALptCQmPFvBsHiZKZUe1H/GjYGY?=
	=?us-ascii?Q?+dk1VdD87YIfOGQRvDHvrkcIGiqqXuPQAsex6GxIbngNvSEz0YFJ3tO0Cfim?=
	=?us-ascii?Q?TRgci4rk0y2WnR/CuVeGFf3OGM8lzXiNzsCLZDvLCJQYBkR86+Cz9L4HD2uW?=
	=?us-ascii?Q?Eirr/qx7NcRbUhYXD/u4i7ae6h/uRWW4ryd0ptVIgfv30WorSU6/D//Zt5Ki?=
	=?us-ascii?Q?yNq/T44+/ZTiZ/z2Bo/Tmp8pCZTQL9gnQFanMkjD1CK0j+GimDloAiogrEWj?=
	=?us-ascii?Q?hR+DGw7UKJ/lQO5KxNOW82zj6+M5KMb9gTTQWpjx0I9S5FKEpTb2DIDvjSvQ?=
	=?us-ascii?Q?Sy0C/hezsKKki0fPW75VzidAe6aCL30PVFipRZ8nalv7OhCgqZ4IrxKioEK9?=
	=?us-ascii?Q?9osif3Ky13/jLWHjDRfW4RGIO1gnklPIx50twbtNgYW9rnjnM9Zu0/j07oEI?=
	=?us-ascii?Q?b5xIWTsp6BfxMIllkkeiR+eTRIdjchiWx0AfY5yYJh/QIMk1h3aqOS6X2nrS?=
	=?us-ascii?Q?u1kaL83BLOuo57PGlT5oyqw/8NOwEhAZCFi5McM?=
X-Microsoft-Antispam-Message-Info: SCJOd9rnAAqa1qDcmhf+VCfCFyXuHeOZwKf/CY7frGEE1/U/r00nOkNQuuejv4haXsFN7f7kJn4y6mkfcJFv+Aq8RXMk4Pk/f5hh7xvA8OaZ7kPP4ZrJsRb9mmX0cxph4Rh14iLnNlWeYoOTqNyBKjGDM/13sIz772MJU2uE4zoZGi54WJzEF2W750jzjnsmRjnineIM7L2RkOHhI2g9TPZ8JAHEK8azjB+7PJePOGGPURqQfT8zsdK/RFf3F4CdxDkRobY8SYwitcd3gbeX78XhHj4DBfHrXe+Ugrfhedn888Bg5ML21FdDfxi33CP07ViQ3j3Jk68+KVXLwujUAaTAFE0iBhiEzVzCKbadAdQ=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	6:0BQLeinISoIITWv7KkRuTkEY1i8Ikx8Ui1R0398z9z/BvNrBPfi78ty/SXBZBiWB+dS6LuclJoJBnP/X1NXCVa09aCkzz4x8fALmJ0SWQHaNGgKU59O7s5G76MHMyFs7UYfPyHh3tBW5puyS56vsHoJ4IOCMQ3RvDhFWdfpMKCmQWdEIsTquYwaRaIIilop4RsEzVcixxeYXB4waWWFnNvDLrF8gTuOqlHzLB9/fGgxkG4sn03N2rhCf250oxrbgUb9Kgn5WiUf1XX3AgXLYl+32PuTZ9A2Sm9BF7pFe3/rmwIieZGDvWrGGM141M2YQD7YkImXtV8gK8Ga0e1lg0R1B9GDuGhmlph+GYESBE6UV3Y7z5PmI8/FugPX02EO15FNY+NBQonUDzSkt2PAEyc0gUfA72bzMSajulVv0/wzhWq6eGN7YF4OFYD/0JS+0CJrnFMGi/4JVbod70fO4ZQ==;
	5:17+Xd+NN9RvXqR9f7ocXDgG2DPJCH0VPl6fzXt8iVz2Nm3HZyiYDDyraXtB5wVxlMk7uQJmCShlT9h/VXX8iPS97WHV7MoDEGDnF0OG58YLTevjBigNFiZpp47DKjlpPDz/mgGpSop17jvLvPbxAp+wbL6lUNvUoEkehSX9E9Nk=;
	24:D6YU6rHjYqtYJzrErk52EhAIykJYWs584NKkOsxQMWE/APRitVT9EV2wmsJ3R0F0C8hW9dNxXjWPa5HFlkRAZO+pX6OqTNi1k4BldtjOYlE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	7:AUxWFUDcWJFbS8Na7yUJ7UTxEm7yO00HkL+OBv9me1RbXC5cmoSTN/0SZc+Bi+YsdnEoiTCaKs8LYMvGvK1ybwDvcQAK3QDL2TBm6xtnS1K8mR36oce4tqXj+4rgvFbkVvZQSBw9VHter+jtMh6sxL56T7CbKh03L0me0AUAfFJa61r8xC85c6syvMlofEXTRMldvTG5iKQoy8TP6OMrjbEreH3UYIK9q+5bsSr/x31+yyVrlejLSxBj10uVsZBX
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2018 12:44:47.3640 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06402b29-266d-4d4b-8ac8-08d5e8be6b08
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0395
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-13_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1806210000 definitions=main-1807130103
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
X-List-Received-Date: Fri, 13 Jul 2018 13:02:46 -0000
Content-Type: text/plain

On Fri, 13 Jul 2018, Khem Raj <raj.khem@gmail.com> wrote:
> On 7/13/18 3:22 AM, Ioan-Adrian Ratiu wrote:
>> On Thu, 12 Jul 2018, Khem Raj <raj.khem@gmail.com> wrote:
>>> On 7/10/18 7:44 AM, Ioan-Adrian Ratiu wrote:
>>>> Commits 1202307b24 ("lsbinitscripts: don't use update-alternatives")
>>>> cdcebd81c87 ("initscripts: don't use update-alternatives") and
>>>> 061fa614cec ("update-alternatives.bbclass: refuse to manage SysV init
>>>> scripts") make sure that the lsbinitscripts and initscripts packages
>>>> conflict with eachother and can't be alternatives.
>>>>
>>>> lsb has a hardcoded dependency on lsbinitscripts which makes it
>>>> impossible to install on systems using initscripts (acl depends on
>>>> initscripts) and lsbinitscripts also has a runtime dependency on the
>>>> full util-linux package making it an unwanted dependency on busybox
>>>> systems.
>>>>
>>>> Therefore introduce VIRTUAL-RUNTIME_initscripts to choose between the
>>>> versions of /etc/init.d/functions and allow installing lsb alongside
>>>> initscripts avoiding the full util-linux dependency.
>>>>
>>>> Default it to lsbinitscripts so we don't have a change in the existing
>>>> behavior; distros/users can override it in their conf when needed.
>>>>
>>>
>>> We already have PREFERRED_RPROVIDER_initd-functions I wonder if that is
>>> the right option to use here.
>> 
>> (I've sent patch v2 which fixes a build-error causing typo, sorry for it :)
>> 
>> We could use PREFERRED_RPROVIDER_initd-functions but that currently
>> defaults to "initscripts". In all my layers nothing is using that
>> variable, so would it be ok to change its default to lsbinitscripts to
>> preserve the current default lsb/util-linux behaviour?
>> 
>> Or are you ok with using it as is, leaving the default to "initscripts"
>> and just change the lsb dependency?
>> 
>
> if it is unused then change it to lsbscripts.
>

Ok, thanks. Please discard these VIRTUAL-RUNTIME_initscripts patches.

>>>
>>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>>> ---
>>>>  meta/conf/distro/include/default-providers.inc               | 1 +
>>>>  meta/recipes-extended/lsb/lsb_5.0.bb                         | 3 +--
>>>>  meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 2 +-
>>>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
>>>> index e65c1ed323..37e7478ea0 100644
>>>> --- a/meta/conf/distro/include/default-providers.inc
>>>> +++ b/meta/conf/distro/include/default-providers.inc
>>>> @@ -23,6 +23,7 @@ VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-opkg"
>>>>  VIRTUAL-RUNTIME_apm ?= "apm"
>>>>  VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
>>>>  VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
>>>> +VIRTUAL-RUNTIME_initscripts ?= "lsbinitscripts"
>>>>  VIRTUAL-RUNTIME_wireless-tools ?= "iw wireless-tools"
>>>>  VIRTUAL-RUNTIME_base-utils ?= "busybox"
>>>>  VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
>>>> diff --git a/meta/recipes-extended/lsb/lsb_5.0.bb b/meta/recipes-extended/lsb/lsb_5.0.bb
>>>> index df4812e4bc..6cb1751664 100644
>>>> --- a/meta/recipes-extended/lsb/lsb_5.0.bb
>>>> +++ b/meta/recipes-extended/lsb/lsb_5.0.bb
>>>> @@ -8,8 +8,7 @@ LSB_CORE_x86 = "lsb-core-ia32"
>>>>  LSB_CORE_x86-64 = "lsb-core-amd64"
>>>>  RPROVIDES_${PN} += "${LSB_CORE}"
>>>>  
>>>> -# lsb_release needs getopt, lsbinitscripts
>>>> -RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt} lsbinitscripts"
>>>> +RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt} ${VIRTUAL-RUNTIME_initscripts}"
>>>>  
>>>>  LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
>>>>  
>>>> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>>>> index 53d100ce74..74547b0773 100644
>>>> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>>>> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>>>> @@ -118,7 +118,7 @@ RDEPENDS_packagegroup-core-lsb-misc = "\
>>>>      gettext \
>>>>      gettext-runtime \
>>>>      groff \
>>>> -    lsbinitscripts \
>>>> +    ${VIRTUAL_RUNTIME-initscripts} \
>>>>      lsbtest \
>>>>      lsof \
>>>>      strace \
>>>>

