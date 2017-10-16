Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 4741 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 Oct 2017 18:05:24 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0062.outbound.protection.outlook.com [104.47.34.62])
	by mail.openembedded.org (Postfix) with ESMTP id 9AE3B77BC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 18:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Z5sgkEff9vKauNbo4ft0EkAKxNaXYie3ToQkoHVjnvU=;
	b=HmqOwEDsonU6GyOVsdWEFjkE9hDJhqJN47aEfvxam9pG25BLaFS/gX96Hgx7qH+6+hdzt90IyaHGZCkDF8Btd/AiKl5Y8xBQOKrfqbrdcXvbTl5Jyz4KmWmVrcrKoIERKTqL6uV1oLeqCO1/CsI2s2eWdOK5B4MAKh4u7yC8p/4=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from willamette.Home (71.35.172.156) by
	MWHPR0101MB2942.prod.exchangelabs.com (10.174.170.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Mon, 16 Oct 2017 16:31:56 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Oct 2017 09:31:42 -0700
Message-Id: <20171016163143.22844-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [71.35.172.156]
X-ClientProxiedBy: CY4PR06CA0029.namprd06.prod.outlook.com (10.173.44.15) To
	MWHPR0101MB2942.prod.exchangelabs.com (10.174.170.13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eca11688-b44f-4e63-db08-08d514b36ab7
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:MWHPR0101MB2942; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	3:i1xPWZDL1Z2ksAPnTQlYFPg3OAiQWAJHQ2KPZohGVfB/sDdCPcmaVMleV830v20ooQCg8mPshF/KR9b3jCI3e3Ylkv6VzAz4KJs859IDQOXIMPji+4TDUvU3JQKUHTz9qLUc/mDOvixUH0Kt9YbI2rkmd21VY+0uNKAcii/3lQMKDfZezgnmrzBp+EM6uwqNKqB19nUWf4jAWSXLqSYb3Qv5/uyfYz6a5yCEb3PdABNTOnj7tdiv9pas79fZVV4V;
	25:VlTwAunlRLkkHn+orKkG8E7pnTZe8yuRyq9iMWT18TMkwKYKtr/LFhKWBdL9QG+FWcFcJwpwxzf+P0ZFAxxfEZdDWeZPMuLTEQYriEn9E0Lz7VVRt0qwlbUIG1lJ8NMgKB/Y3mitPKWRscmNpehM7yXi9JscelA8exVyNIjTT7TGpiLVe34mxm9MGj+gOIX49u/LSOTJ90m0jrZKKkn2emmvFOpW+w+/ZZoQhCj2WZNGeRd69MN7vLIKrIGnDu7SNZxcWNAJTM9uN3pgRHLo4Df6hxg0/1Q7Ynk83kmVCXGCOCLAu3tvGFDZHHItvYFs148+ptuBOHfTbWgEjtHnhg==;
	31:0U5EtPz8qtITRjTdWl/PaEyDdkYEWnyJER/Dl6O2xPtfoHgGgudrvTriXOHAagflCu55qoecS1mNhVeq1nTjp3c0gzMeVoX52nCZvcPif+rQ2UiR3EJNCJsNEBP22TiNcnFnVq45oQVcTvFRGyoZcTUpVdYHnoA3fJhbxOvJLk0uiQKVK07zzX5XdA5J6qbFd4NRzibRSBZNJn5XiNw29CUmh0CREtO0/fUgUQskZhw=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2942:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	20:QpfRUZVASLO7JWRAhQ/9VpQevDRe+UvtQn++HT7zBsb0FhCOoqUKPVKOzIVDkOO3GqCsuB7GZ1KWuH5Yuz4ijUn2t9B0pZqjDCLrxIaYR5zKxbfU9XNyzp5atGrt1bBWYAkijJZTcF7vv8ysZyI2DHTlLJE2PTa3oN4w+s2f2GfW/n2TE58NdV72ksAugRijHX2G9d08ZtZO0bOOVcAnTzCDgkuxEEhfRNryRQMpgvMQSj/0nyVGlmJz1tBVnK8ll5btdqcLVHHKPf5YOI0DSFYXxJZmXIBLtmWRxvywPQ85/iHCUwP1xQ62kFxNj+TrTJzwLSeWWRsQsHFlpenRsg6rP0YZm65R4MKb6DPENMDeRAW58goHmXIAm3Opg1oxYR5IjE1WYYqlHcrEyezeI8bAACykYSMkQt0+xWcSfbs=;
	4:p4WIW5H6zkKE0VM1ihxd/SFXsjWHmSPIBrVS0WYlZwfd07ZHJccx2wj178RFm/EwPp1WpkGwKeh83J09m9AMNXgI0OVx8Fr2j3zQ6R78ABUtQaRLS1PR8URVgazuisCorAK+vRN3J5NLbvpbBtkuHhc3dRuxUEoiCsaW1LKcBdgJEdZsGaYiiuraE9XhH4/jgNO4CejSM85S/BE1VH7wbzkcALoaGoFiBKLkQHknIx3CpL4MFT0f6RTl5o5ukPlz
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2942A61FF86EE0B15B93016BAB4F0@MWHPR0101MB2942.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(10201501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123555025)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2942; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2942; 
X-Forefront-PRVS: 0462918D61
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(376002)(39830400002)(199003)(189002)(6506006)(6486002)(478600001)(316002)(68736007)(1076002)(36756003)(16586007)(3846002)(6116002)(97736004)(21086003)(86362001)(5660300001)(6916009)(101416001)(69596002)(189998001)(16526018)(6666003)(25786009)(6512007)(5003940100001)(33646002)(47776003)(50986999)(53936002)(48376002)(50466002)(107886003)(2906002)(50226002)(66066001)(105586002)(2351001)(2361001)(4326008)(8936002)(106356001)(305945005)(7736002)(81156014)(81166006)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2942;
	H:willamette.Home; FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0101MB2942;
	23:O2B3D+CN9zdIfSKVLEzWG++4YN0xbMzMmI5gtyJ?=
	=?us-ascii?Q?SGkKHlZk4/ZtaTh3rNvwtvL7AvK+5kcI5r07rDFwLuhUXQMvfyurlzXhRpPP?=
	=?us-ascii?Q?oTCbBjtZX5ZF0lDSmqWJ/+rXYOiDRFkIrsvE25aldm9iBsjRQplxAQtmnzUd?=
	=?us-ascii?Q?x1/Xjj1MQSjmU2Z+o+qrek7ONdRQaXpYE7CnHK677f6iZgI2YtbIKynRAjL5?=
	=?us-ascii?Q?gkQFhL9KiCOaUmG20hmWelAHeQ6+I/AocwSjFzTm5IpBk0hSZBsi2pcOu3LP?=
	=?us-ascii?Q?pFDkLWRX7qaM1SayiO3YxqKtZ+j+n2A47qguFqy0Io0sOe9lRe/QVP1JZgag?=
	=?us-ascii?Q?CM05SVazl0kTFTEj0nIYAPhpJ0VAAs8FO3wQyXEUnP/S9HN6LIKzMR9M30Lj?=
	=?us-ascii?Q?KD9ulEdT6nnrwRXgFbuE7hPFS8Ec2aRPgUeMx2TYKz8cTp7fE6eF1W+XTDw0?=
	=?us-ascii?Q?giwAGKYCGowgZb4ZchjvA5XjjrfkvSpqv1pT+wuO8Y8mwWNZJP4A3O8CdWjS?=
	=?us-ascii?Q?K+TfNWQOtqV6FtAYXPr3DtJchmRum9zpIry/fxBk+M+596MXKoPIhfDowlBM?=
	=?us-ascii?Q?enmgw7gXVfEuiDx0W4rB7K6xIDmdMp4MXCbQ75NZQZKWh6lGl6V01aKg3Umb?=
	=?us-ascii?Q?2YlXXUdN7H/BfottrYgHbewYAGW2cIwK9PRru6UN1QYsVHUeGQjbZEzlMXS9?=
	=?us-ascii?Q?UF5Uzyf4gBoJvJ1+nu0GhGJzNjpKRxjga4Mi6sJ8UnZITdJCsCDMWbeBFStO?=
	=?us-ascii?Q?QZw1junPT+OCWAPjW25dEaYaxMPSvC7QvwhmWCf6LqrWBF/jVIBLDQldp8Gh?=
	=?us-ascii?Q?YJMPjxsYLjggtYP2dpDV325M7nI+gdIszafz4oBYMTdFQAYbkAZpChbNV6Zo?=
	=?us-ascii?Q?YMLKJ2AtQoCl+QnVYjfOAUsv+lUyTXRoBtPQ8MgG2HdvI58g8PV3iHkSaK8Q?=
	=?us-ascii?Q?5c0F6oQHtK7gHaGtyG9z6TWI4R6HNZ9J/YEDltgcCn8JkFrTpJnkKqkAjoVT?=
	=?us-ascii?Q?FX/9J90ScJb6BjCjONNOCUnJPmlUjJd/FtAWo6VbaLbbOo+P2v+WWpo1QoQ+?=
	=?us-ascii?Q?VEnPzPHX0ehtVkPYA3t8+2/9J13KZgzYMmuv4PZG0LkVhO51AJoNAK9opwJA?=
	=?us-ascii?Q?r8vyql3P1BGtzG7c6hfI/WuV+gB4WD98APkLzEwFPhphdSb8ECpCXDg=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	6:GKQyjgExKkl5iWj8oAq1xtWD3Om/VzY0NV+0YMe/r9aR+vHctqHQVaMI2bD/uOt7Jp4KHgG9w46sB4zvKlxl32ThxVPkP+tJ2dDBTZGbfNCGPsZVwXEATq+jzHg1xyknXcI5+kFfg2gM04NedCHHFMOD9Kuy8n8P25JStznLnFygqrMQJVmsHkEvCo/+etEPjE5I0pbmLpFlnfo8uTdZhYKfkmdH5nPRu+1KBm9N0uGQxXWilDl8+3HZLlPaH5TLW0VRxwUJeeC14JWedXrOEAz2jMojmEHfzT360H2Ul6/bvxkCMSN4cf9B6wxkZxUILf8IVUlFmAFQ2kVRU5+Rug==;
	5:n213e/wJXt1NOMeVAcHdNSlbJ6sUqlxt6vqq1T+18tH6j263qP3oXCQfUul2K9xGPepOFlqk0oFkl9LhJDuS1oWMkxkkQEoiilXlZRz8gw0qh/PVTL1cUtMoGdvUhsj6JUTFzYTSDnwwoOwp/ZAUmA==;
	24:dNd0CZwRV12OmXtbTIrjEsaViqvWtclkfJbaQsL+fgN7VKB6GyzTEjw8AxTxBRQsbAXHs3ZXnDt7Rf1FuWffc8/JDHWUk0doaBROnJ+G6qg=;
	7:nLoGWV7gG8WxUOEyhQfGAvWsy+IjJ3yZ0pzO1KKPy/4DDWfUOmBDAVA6Pm28H+g5kyG+2JywL9nfcqzHV/xRB6oxw7BMLcN/gyOyftiITEvbd7ksQ9dfeYJ6rqOR9py3s+CfY3DrtUIRhTvZGdiN2DY96lvhHs1O41haYHApqtxJreBDJkiL8zmM64MhTlK9otHoM9WQri6acVdGME+HE8NAleEtM1H+AYfD7BwXltQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2017 16:31:56.1022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2942
Subject: [PATCH 1/2] systemctl-native: add target.wants to target regex
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
X-List-Received-Date: Mon, 16 Oct 2017 18:05:24 -0000
Content-Type: text/plain

The regex for acceptable systemd WantedBy/RequiredBy targets does not include
target.wants, so a line like this:

WantedBy=multi-user.target.wants

gets silently ignored, even though it works fine on a real system.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index efad14ce17..6e5a1b7181 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -108,7 +108,7 @@ for service in $services; do
 
 	# If any new unit types are added to systemd they should be added
 	# to this regular expression.
-	unit_types_re='\.\(service\|socket\|device\|mount\|automount\|swap\|target\|path\|timer\|snapshot\)\s*$'
+	unit_types_re='\.\(service\|socket\|device\|mount\|automount\|swap\|target\|target\.wants\|path\|timer\|snapshot\)\s*$'
 	if [ "$action" = "preset" ]; then
 		action=`egrep -sh  $service $ROOT/etc/systemd/user-preset/*.preset | cut -f1 -d' '`
 		if [ -z "$action" ]; then
-- 
2.11.0


