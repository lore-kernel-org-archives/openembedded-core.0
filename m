Return-Path: <sorenb@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0058.outbound.protection.outlook.com [104.47.32.58])
	by mail.openembedded.org (Postfix) with ESMTP id 498FD65CC7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jul 2017 07:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=mMjz0g9DFnd+uRUIj/izzVNIU8B+6WRjBmArGLh2BTs=;
	b=da8ap5rmKmj/QN73CDLQuz1R4mlNH1oU4R70MheCDhCHvCbxrf2ZCcKcDuSr3o3r/+Sq4zLi88KHJp/RcWffRIJe0tWPBaCxbaqw3UrvQ4QNf0D7V1s2FFnlaoWE5RzHWTqsBCI1CsV9xIi6JMI0n1gy9lcueKG/Id3vn254+oA=
Received: from BLUPR0201CA0003.namprd02.prod.outlook.com (10.163.116.13) by
	BLUPR02MB342.namprd02.prod.outlook.com (10.141.77.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.13; Sun, 9 Jul 2017 07:35:47 +0000
Received: from SN1NAM02FT029.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by BLUPR0201CA0003.outlook.office365.com
	(2a01:111:e400:52e7::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1240.13 via
	Frontend Transport; Sun, 9 Jul 2017 07:35:46 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT029.mail.protection.outlook.com (10.152.72.110) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1220.9
	via Frontend Transport; Sun, 9 Jul 2017 07:35:46 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:51517
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1dU6ks-0003wZ-3t
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Jul 2017 00:35:46 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1dU6ks-0006Gc-0Y
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Jul 2017 00:35:46 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v697Zf6v021268; Sun, 9 Jul 2017 00:35:42 -0700
Received: from [172.19.2.240] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1dU6kn-0006GV-T4; Sun, 09 Jul 2017 00:35:41 -0700
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 9 Jul 2017 00:35:37 -0700
Message-ID: <20170709073537.16106-1-soren.brinkmann@xilinx.com>
X-Mailer: git-send-email 2.13.2.3.g44cd85c14.dirty
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23184.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39410400002)(39400400002)(39860400002)(39840400002)(39450400003)(39850400002)(2980300002)(438002)(189002)(199003)(9170700003)(106466001)(50986999)(81166006)(2351001)(33646002)(47776003)(8936002)(626005)(189998001)(5003940100001)(8676002)(63266004)(76506005)(5660300001)(4326008)(57986006)(77096006)(356003)(107886003)(38730400002)(110136004)(53376002)(36756003)(305945005)(6306002)(2906002)(50226002)(53546010)(1076002)(48376002)(6916009)(575784001)(50466002)(478600001)(6666003)(9786002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB342; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; MLV:sfv; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT029;
	1:xkytot0gLp/053QJ8Shjd+/k4fgvPJFOZwlRn3h4mI12vO/PEArvFDI0dCJ1GSFvNFPPjd47sTnkQ5phY7UxjtHXBGKZuU7/WQ3kFelO+me7hN3KAWiKw78X50vyDaaaP1x5C7hUA5QK/b8cgXCAYT/zRgyoPCFcFKjxdG8IjkZNTFJ9qXj9BA1+Kha6iZqY56HZWb8HnQ7eBLGid7tc7TNwhZ+5gB3+H/WSYzxsx9bDeN7n/I4llH/Yciep4P11v1e6e3ONXHrRXGnu6hGW2S61MkuzIRXXc+J4gNPeemul89/6vqVMfBvqGTSPoU1+8+oG7MiMYziXGbDjMnfZy1KJNVfn4HVjr2rS68tbyuF2rPUyuPTPOoYctBqwXTnS5TsCSttDBpQfpANt4rvNtla6aXC2WH7l8RyVUsN3j4iFSNv28RNT0S9oRbRi1idm3LHgE7brqrx6Jahyw1DBy6HhgO3jHFhTBSVZjGODkXbzemEqwZF5DpZYnRxNfOZMfEmX/ux3O+pKjV4rjK9PwlRHs2rU06OV6qD8JElRgCA8p7VQj5XOGLMdvIJz3WjUKNxF1xYSgMilpHc0kD8wDibWiDXTa6eST8QKAGKJYwN/iXKmRzsDFEzpA3jBO7GZ0JPidUia0HKrtpz1fvqfNOeMr9hWIN7akvMLyQ6kdPuLYAoBLb0BXYE/EaRWzcghAh344m3N+0EfqXFhLrg/tVDv1MZqd7VhoQhlwjUdt/zSjp34pVd3tx7vmNj1+JYEWuX1qRrUPhGKrEMSMdTYDz/ikgZA50TeR7evFgzrkXMy741kkbDelKQNa3HSsD8Q1+YptzK19To5Flo4y8hiLO24f9JPGlxszCjeJmGgIvg=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55429c94-7d7d-46da-987c-08d4c69d1d36
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(8251501002)(2017030254075)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BLUPR02MB342; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB342;
	3:7TbmwtT6ys7ASIDZyDaUzvSmAbqdlvnssZQMNHayUsSGRtS2BBa5ReQD0d6UuQGCYMwLzjae5Zjya7ZK4NauEdn+W/Tagi6c/VUI7D5mm2eEF7BH8I0XoTsoVbwMMHAa02UXb68NZOhyTbzXk0Mgdb0+cG/GloGZdm2xFcFmjks4OLcMNjZoLr8bjxiGLXV/QnTP1nZP21ZnSIQcbeFCeYlUtk+Jgcre4KMn1BJmx3P/KA109M5dQTGxkviUTrW5ghdKT1n8hpE1MghJT6cT6CVg/FyQFeIrX0EpjKees4byyaolFl4QTX7a8VdbaRhgDAG2WzGdnSHtZUoeHxGRsXe0w2Bjmu0hAwlcR2NDZeB7aUIvhfmItFw3FxHa42Onteie028YlyxaCzgwH91Fkd69TYlDwqx/n7d4vE4IBAhUpTO1ChnTdP7kquPqbQoURbnKBSPznKoP7KNW5plf8SW49dWBJMZdiiC2D6DkuBi5AI6d0mPxkdPMRlZafEUJPxdTVodD8CKzZAWy+J1inwcOYyKYeOaVS9MqJmUoHUxVS0hiPCSxr2321DjJ54kJMBJvvx3O7d0EydK3/zW4p48PahCKoAytIhWdCxnIEJ150A/2zmtgCr47i5WlZoO5WEt0b/R2Dft4WjCj5lin4qiG+/5pfhhxSK45JNQVFQedLDc1+pUHNKyhA2buvsUQdMkvUpGNgwhc4GX4AsmZ7UE1fi5q5ovkaboQUINEhTb0Y4C039JN+3wqcFWEb0c7flpmm5XfqyQTgsdPUKMPE6VxW2JJSu0+t83zYM0249bJF+R8oRfuWnOpvsN6P75TErYXsA895Sk/6krC0StUf9LumlRBCXqDCOgo1eBgJoypNYZ3biEPUK0Zcl1YKyKGNGpzXZw78isFY3Ci6U66V7Fv1Zooo/DFkN0V2RvnRo7A6ahMSJQjZjMeMMUg4mrv
X-MS-TrafficTypeDiagnostic: BLUPR02MB342:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB342;
	25:3VP9VJjkPGMsN6JivQxdFLhYEm/vZkX8cf70JZLT3zmerbcxGsnFvZXeN3NU39QZQ9/mgw0+fC6H1+v3POiiEii4vubU7n13D8rU36yINw6N/W2RS0JQk2SCmcRXPDIheXY3qXEV4j6C23JiPX64XCXqhWwureqxMiJWnv+uZVIObWBNPR5XI4TkysWM/FQZPdDjq6KVfeHzscRJlKRl6ZjUtgKnrq76Rmw8pteXqk8/OrOgLp2rfux+Uc3kMD15yEFU6R0xN0kRi/KvMBtn8VY9jgx1C3o4cNEILTAy1Q/voCsBX5YrCMTOIJXYX2VkWqkF1zIemU8n0p+/ehhvazkTRvjHWs1qpp7ZmO/QCZ1nn2r5rQq/4C/D2uY8LJSPMuk6W1AacaKZjhoJL6XcGs/m6whclgpEVpDQ0GxD5ktME5w8sAe51TY4R+x9kJeWGSHGFAmU9ftoxsToxPv6FPMRykUXo7O9VMbjp+iLplJGDbt8F2caZ6OmVLhnQLfVZmfJSfT2VPkMAmer8cwq51p7zrlG5jV0/5svrDPIwKpn2ltmFMpiMPQgC6x+/9QlIK8J0M0/RvGj4kIV43jG40fxnjpDmsLG2TZWlGfbwtOrWTVzyLTPPohBz1nTDK6Q108i5lRdGKOe3Gr4a3NEI/9cUCwhj7PX46H/xDX6EjBilt3sv1bGf+SKaun/WCVGZR8P3SehSeAAl9YT7KV2NUwFFZUIaeNZJLkeE5hwNYypaXwXcoijJo/E1TD5RowINUEFiSrtO5fCyhMXGpBdDYJAABUhCsipMPlvz/Ye/zdRxriqpPwI4F89P00C0F577QVggbfcDuZ61Tq8yjKYglpDcG17r0aTsgMDRhBjaQKDwP4F+0EqHpr7Dn60uaEH1Xn81VnqxKIFfXYD6xo7Puhd6PYBqiTlHufWH4I5IAc=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB342;
	31:2O8PMamTagj1IyRUC/BpVp5O9+wEp6C0AFrkgkyYwZQc2o4MB4GmvfaQGv4G5qiWR5sV4ZvgyJn2p8Gjir8N3lMA7JGYIyC0LfQjmSW0mQcrBciOJMvIqAx8hTShcWHwH6j82JYbnu8p6V1bdMjRifcmjdee6Plml/easBJ0UIYfMHHeTIDZiPDW0E4o4fMxmYDc3qayXDT0AyKqUPy9AUDADHbMs3xHI5ySR7gN6C94Elx3eZYG0FLC1tU/x40E54Gqva5wB8TZ164QgalxSdABnO5MHPKFIQ5pA4TMbWDZX1COYpIrv8HxYw6cezp8BHUkQu14cOJ+n382Rs3m5oJgDDeHg9WQR7PbYgvQnc8COLXePqXbl15MHfdcMjyd+Cz7fh+ZxgtvkeKDKPbRPYURhzEM4c9cffSOK5OrqycsgYw4/Io/No8/4zABydCjW18C+jilIn75BG6Hl+NlOWavGRe8dZPWjaqHra8gOfHW+jutbICaJRR59j6FSf9jJJtV57xUkFyMJHOznZYBQT3XPS3UZvjk4BjM0JJf+WlCTyizZjN4skt3GmSuDNswIi0ca2tl625vxPMF0Jo2ZFVMoqhpDQGEIuJgbn24YDqDFTfuQDTwkZo7HBDKw4fXJTrw1wsjGAZ0f2Ywt7hb19HslCAwrzqo3W457M95/ECXN1wg5lLmPsY5Oej4N//hv0hrkCo9p/4UbCE0SmRSRA==
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB342;
	20:vKuGfw8eTiP4pz9kUh2+zHkK+fMdKqx7vk35svxHXmWEc5f1gpVlIgk4rJkojAC+AeAv08WVPpZ3NaYTxK2jNrKv+SAIp0BDDWmWSABm9waOHEmmClq3ZXLMZBdh0fASFvgS1yr+aWVe4+oUHl/J6QWKUMS0TYQFUQE45Bnh4jQavCsE0P+t/YA2YDscQxEjw/Voq1qbK8AIIDKeT1RlITtLsd0uuoJq9S68PDdnZDl5CmVzEQ8R50sPjwgOl7ZMISlsVpBwEe3UgOxn67/lq4jXm1RTVDXXz3XI1Y6ZcidNrV3XI3U9wdc+w3gAYmh4U8XcKuk71vR+G8qfpbDtDASCXMwrZ0qDM3veB8ib8OM1i8GcShtq2EdxuosHV1oUTX3IjeuZYMC4D92D/yrJRBLynEI9TcVR+cMSPkQy5H63Fid+CVHaVNBTQ9YKme/xFI9AR64kRb7UvBHVBhzEKITtRdiCLdoZf+MyulbVXU2AEkdFREMPEfdAtTTdy2rp
X-Microsoft-Antispam-PRVS: <BLUPR02MB3424323F71C3EB78AA4D438B0A80@BLUPR02MB342.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(133145235818549)(236129657087228)(192813158149592)(167848164394848)(94056789713001);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(13018025)(2017060910075)(13016025)(8121501046)(5005006)(100000703101)(100105400095)(93006095)(93004095)(10201501046)(3002001)(6055026)(6041248)(20161123560025)(20161123564025)(20161123558100)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BLUPR02MB342; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BLUPR02MB342; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR02MB342;
	4:YfQicQX3DrW+bg0PAZ+MsAYnU4p9aomcsY4D4Vzjk+4?=
	=?us-ascii?Q?REeVT9fDr+GmcsKs5Z0Nfmca9pXFAQu/pzE2N6Gqh/AofGFktgtepWTPu/aY?=
	=?us-ascii?Q?vpJxzeuTpu0B8begCWXeX9QIC0phrHa/EPt2mH7GnDIjTghFMgXyrOhYu/6F?=
	=?us-ascii?Q?plRcTAJZ4j/MOaWvguC/RIf33FBq4/K+XmRS287t7y9qTZ8FfIZEYc5S25aY?=
	=?us-ascii?Q?r2bSRr+u/rGkC2oSQU+WLaw8DVYFqo1UDBv/IMIWP1GCDpH3lh+vaaMCIPWe?=
	=?us-ascii?Q?KQlmsO4swmX9elOGD4nDU1XILpZixZFRdfJMXWE6dLMJXdWemfanQ1KFc9sA?=
	=?us-ascii?Q?t9oQs3N+/zkLI30zgXkBNsTPOSmrawxO9ZDgF6MlVtyqZOuR8IYD3FGCHJJT?=
	=?us-ascii?Q?zXVZ3ihaf/tQn/ayN6k7iRlfNVTPv/+nrrKZATgYH16bWBulz3Rdurvw4kFh?=
	=?us-ascii?Q?zJCu+AkZfjKBQEt86qL6cVMX/QCtehQ0qVUTDPUdy+FL2/zsDja+HYo6FdsC?=
	=?us-ascii?Q?trAnOUEY2l21dJkitwuYZRuh1wzVD9XaXmrAPnt6QpjidD5mQW0zmGtIZXd+?=
	=?us-ascii?Q?HFGYl0ypZVK1bdvX01ARrZ4NuX2JV5B6JCegUGhpSPTUkeWxNAeDp5sa3LmN?=
	=?us-ascii?Q?bRYiOVhCAXOPbUwMWpWsZIvppvzBlxww8OJoSi1hqwsMEbscZuh5r9DWOFPD?=
	=?us-ascii?Q?UFzepBkEuqGgdpv/sJ622vbtCyIlgA9wKehngb7kMaDDmcGo99NzNuu/hL38?=
	=?us-ascii?Q?nKRAvSnfv7mufnyv7XQawnnDJ2vaEFJVLy2XOo6SlY7x9EA817VNdbXCxIhS?=
	=?us-ascii?Q?mOxpTgVpPjAO5kBwFOJZXZMWgRBYXjMEeB5KqTJc8n+38UkPbWuDyLjyjYp+?=
	=?us-ascii?Q?r1oL3VpXCQ6JpHp38cqYxspEUii/u4/lL1yE1ysHyS/0ePa8KayFmKK6+jp9?=
	=?us-ascii?Q?JYXU1uDTpcVqlsJfXivU+k/sZEkSfVSWTimoAJouly7YkUcMOhorSRDG6/y7?=
	=?us-ascii?Q?HCtTJnmDLK1L2NpIf8kXFAjWdxgfwdRrYNCSq9b7XjPwv2WLqEDjzPT6/oYy?=
	=?us-ascii?Q?tA7yTNlxeSr8DS7gpSBklUsM3NmMlgeO4+Lz0N9Elr2UKst0zaTrRh2g04em?=
	=?us-ascii?Q?88NHeHu7CJtGHM2ab9Dek9A6aQXDGxoquY0g+FUVwYYxX5iRrWVOFvDyRpLr?=
	=?us-ascii?Q?L4PZMlufzSqClciQ5joN51qyz+M8NB0z5+e9CNViAby63EQn2O+0NvvhOQnQ?=
	=?us-ascii?Q?ncKvO/FGAjUpc83rCG0bbvgIIh/p14a2drlz3I3lj0KO4yCj+jVGZ3wvClfK?=
	=?us-ascii?Q?v1K5cgz+P1oqnDBz/I4IU8yM2omLxIe3Mu2a1ayVPyble2nqVdKx+xVLUyzo?=
	=?us-ascii?Q?p79+X1tgCOxAU+IhVMJ5bRpyAiYo57dppWxut2aFJQFq+gboohK9jMAmvXVm?=
	=?us-ascii?Q?x1xdSNQ=3D=3D?=
X-Forefront-PRVS: 03630A6A4A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR02MB342;
	23:uXGjnQCn4g0tch4LN+c2GRjsPtrF/7MrLB0R0ewHA7?=
	=?us-ascii?Q?R1K7IN0koPPD/pzBdr9RC0FPRQsfbVqfrxIKVJYeQ3GXhWoGnVxtIqmUzEHq?=
	=?us-ascii?Q?3TL50tHtez6Y26atWf7UGHzlQVh7XaCt/bArCFI7UERYsskYcicabEJUHg+U?=
	=?us-ascii?Q?+Jt36SJfoXsJsS+9Hs5o7RiNz7118D0dnjacE4Tb2Ykp408z9hci8spwYjWf?=
	=?us-ascii?Q?R+VUJ54OUeXWXdicgwlU11bAhF4s0vhCJvOrZ0JL7haGAZWnjernrXo/y3lR?=
	=?us-ascii?Q?U7qanfY+0DKamfcR8O5fWsz13T5+tDt5ZA+qtgtnfg2PXpXZcTMzNcfBRcPu?=
	=?us-ascii?Q?o/3hZMRGu7TJ24LylxzdUYrDT4LeOWxUyz+vHERr3F5uUxHWxBZd8hbkKFsZ?=
	=?us-ascii?Q?db1lboZRSynACKftIyOaDknI96ufI+SZsrIIak7y4xqsbQxb9tBEn/zuB1M6?=
	=?us-ascii?Q?1sc5FbivZdBkl1OQqz9rDEf3x0z9siOZudRJTzdkcPd/eWpvCvUYZXqlKjMM?=
	=?us-ascii?Q?FvK8KtB0a4fLENMxO9nReTCrUw8Z/P6bKieeM+9s5MXKkrigy3E4EgAjnNzm?=
	=?us-ascii?Q?3omgoAtb7dJv6uLWdLhHFSVESdfZIPtnxKXuNaQlfxNCCCleYShIEmkj0hRu?=
	=?us-ascii?Q?OAN0oFojR9hn537meLdY3DOyF5zvmnUaAt4GqIHjaZLuyJv94YCVC/k7Q/X9?=
	=?us-ascii?Q?Z0AExsqsqKB6feqUqpPEk3m6PHMAti6xe3I2SwYXyrEmiKcTGeIt9lMPtaLG?=
	=?us-ascii?Q?/Uo8AP13UiO/KDUEbRcCEseQF45ocVuNWrVqCqSmfA3UpUUjKGHBNDZpGkLU?=
	=?us-ascii?Q?W6/efJp4UGNnUhn6gZNmldMEacJXReIQnMAQB53GZcyE3CXWDR31ZzdWJH8P?=
	=?us-ascii?Q?VqDxhOHiuur3QGwE7gS8xrFI8a4oeDHOrOU3I2JAXfLZUdpEE9vo72+UUJ4T?=
	=?us-ascii?Q?SvH92xdt32nVwazbPU5dXA8LGP0kLFn9PkIoA8EUSsQpeUp70L9zM89f7qsz?=
	=?us-ascii?Q?FoY7/eNBauRvtJA8X+k4jyriC/0nI/p5ruDrbRwakrF3TxdlaIg3fp2e4/fW?=
	=?us-ascii?Q?iIIESRQldNUXJFtGwj00gkSqILYgGIWtqcLDo879Jgjz7ouZqMJnoL0Vt07G?=
	=?us-ascii?Q?RQeheVsiYd8JI/0AKlMAwM7SKyoUfJcUWSBe/kP5JWJNtz8TD2MYTInoB4Er?=
	=?us-ascii?Q?1BE10iauiM5TIgBdpyBn2ONH8z1qJNiQwR?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR02MB342;
	6:VewLwatmSOZAaeFNC8+IBLx7o7msgqEEgIrQQJeH2R8?=
	=?us-ascii?Q?IRiL8h2h95kD3gGJ3Dhtinws0oebcPZdWWtOOZnDSR+WfeNv5l/e4btq2NXW?=
	=?us-ascii?Q?PWvdyTq5RfHpvgnyWjNqhmmDLyHnQ+pa9OOVjpaZwI9oraK6OPeQPufUczmO?=
	=?us-ascii?Q?Jw0u37BS07UTzjY2qqQFyq1breeP+mJTDUvVDdi2g2s/XpNQoCSAcgdc2NT3?=
	=?us-ascii?Q?+WJ0Cmm4+DXcEOX2jl31tbs6BVlX81NnCBAaI7qysyHIsw7rnrmIHrCYO8bV?=
	=?us-ascii?Q?0kCyJb3AzuVoCrPLYN6fR5RitkuQR65PbWoKdyFEdE0q1LNQLzuG5p93LsWe?=
	=?us-ascii?Q?LZN7EGrVqa3rVyN4+/d/dIIoELlPFBwOdBdL4SuWc1ju9R1ExyxM0AbqhXAz?=
	=?us-ascii?Q?aviw3tK4JexrdCVoajqNBLqel1ZVr0nlb9JHGNokHEkQXY/Ozectm0jTxbOg?=
	=?us-ascii?Q?DkHexVklbVpQ60xd3rePiWKaAjDUEQt+/jsQJvVJ3c560dih1VmmkJiTQWEK?=
	=?us-ascii?Q?sdz5kVzEmZHlpamqkliiMnh6cdJn9voMcv0e7LFnVGSpxmufwsoBM5t+PkWQ?=
	=?us-ascii?Q?0M0egUIAVMdB8/JdqWMeCeritvRQhlDIMFURdl5tKtQScGU4L8rk6SHxvsPg?=
	=?us-ascii?Q?7QoI6S8O6qGt/gHpelJcCDLYNw1ERaTKxYvzipdL4rTwBlU+h18Cyq/u/bTR?=
	=?us-ascii?Q?A+PKuVsTQ79diBZJO47at0IFQ9uUDJDO0qGEWxHPFFLdoe4H2xRGtiKqgPmL?=
	=?us-ascii?Q?FeokBZtAqHA10L5PtEH4SVDivQFngzQol4midWWkS+2SJGtjIt7hCf3f+36f?=
	=?us-ascii?Q?2l9gi/psVe4G8OZtcz70AM8s5BbsTqz3vpMTAFnEP50LHl0Q3Xj8vC5NYjQ/?=
	=?us-ascii?Q?JTb7jV6Z/R7xLOp3xaC0DPL5mXBA5S8NzJeRehVRPMMtacPhSttw95BRVQmf?=
	=?us-ascii?Q?1sYh7d0Lh//S9l4Vhb9uifT3/hwCwm2q4ehfzWHWFBt6tXFL4QOqyvxSAOqQ?=
	=?us-ascii?Q?t3xWNvgEq2XFcC5LDrL2m?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB342;
	5:VSNE8lShPHmANeZ6g0GEzNTHw7vpk7XBmJjI2WEh446n7hPcfGVQIYyNCz+9Pf734vOszubGBRsiFPWCpCy2xzs6xf36LMM9L95dmCvWA9zWz9EMjFej2WqRhc8uhS5HiBlnGr/iQNiTjoaQMHA6xkxcWc5wRCUhld/ImncxQrgJR9z/LnKedqyk3O0Q/irZ6C5lF1wLGCJgw81IlAKEVmjjE0fnfb+oBJ58OyS0gb9nNX9QYqEFdzuMMI9X+rrZy0RBkcVbGZhgt5/HdFf5tPr5OKkipC42DJ5IyydzF+Gzq6iwTLAKoJpuMGU71je1z1mQH8V9dG0d6WUGmhb4HzlRvh2F66beApE90UpKctJuWb18uY3tQp+Bnpqs482QhhHb3yUUnHActB1bCiuiJbFqjkowT72TnwjfIxZpdg/uhE8+J7VIcCVAv+1+bvQ/JYTYYIafLuBjcRRlMy310IRqVFLB02rmrJL0c96uUz9hDd94MRsJxwqmfbBywYFJ;
	24:WB66UzAEuyI+3gHCgUWQTfqmwmo9Jx7NCgelos1ccfHoHycy/9ARc5JwS0iK4/JSklRtu7SAZ9fhOvc8s59codavHoOtCnInTlgWb7hwN6Q=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB342;
	7:SGv4dEwgbbuP+ZflR2CJy12cVFNAxlMRtwRxRcin1C/RekPtQCLQmH905W8m2IpmlH4Zq99rK2Fsl+KzsW7bz97d44kLcxtwfSJJx6Uw5swJCihpTTK56Uz0/FjQFQCsTVTpzTbUsl4kltrT7Wur5X/Xtj3yik6PNqbWe+I33VnhEBOWBdvnOEFLtJ8i8UrRnrLq7y+Jsx2iwTR1WuyK8dVr+IzRWNm4AaOgvSdgyLJTSHxInVXuM1Yg08oo/NN1xp6OJFf4prgMgURD6MtfNBi0JNq31x7zpg50eOVxiSiiZwgfTokffSMMRAen4njVlStkv00z0VBj8Bg74xtBvgN8YP0ihpIFJCICRd/ILZMWtSLCFo5tJpQ+zDi7posuLeBf3xVecc9G5FHkb7xHbn1b7euTVdzrwa9IsyGbG+2vDbPP6MIcuJ4K4JtU8Y9MJucNqdFjOX1uF3GUWSYmNGH1wJwNoIX4Y4zOfHu56CWEFy7Jw65t0lpDZ1zvjewh2eYR2rBfnh/VA2bMhPCD0OtTwTQFLVS+NQjJk1Z5BT2Z1X5+1KmD3Ol17M89c7tgNKnJDwq8C/qn02wTsnGvYCzB8ReZglJOqMdCHRjAe8h+mg89IYmGbORJGfU5U/PMuSxZRoN2e5vTft0XhII94wzFuwVmpVATM8UoO+jwHikhfNQZexnWg4jet/8QtFGoIKpZtDnm2+58UeJ2O4vxv1LelmwZBU4ozuJfHGqrzZjV4oCSFZSFHu7vM/QUXJe2Ihav/YbPxIUnIhPPbd4Gmc5OFNfB/WY+R4ZangUYvZw=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2017 07:35:46.6177 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB342
Subject: [PATCH v3] valgrind: Update 3.12.0 -> 3.13.0
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
X-List-Received-Date: Sun, 09 Jul 2017 07:35:49 -0000
Content-Type: text/plain

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
v3:
 - rebased onto latest master branch
v2:
 - no change
---
 .../valgrind/0001-fix-build-for-musl-targets.patch | 69 ----------------------
 .../valgrind/0004-Fix-out-of-tree-builds.patch     | 34 +++++++----
 .../{valgrind_3.12.0.bb => valgrind_3.13.0.bb}     | 13 ++--
 3 files changed, 26 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.12.0.bb => valgrind_3.13.0.bb} (92%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch b/meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch
deleted file mode 100644
index dc6feff7ffa0..000000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 1b1a024efd18d44294e184e792c1e039cab02bfe Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 14 Feb 2016 09:14:12 +0000
-Subject: [PATCH] fix build for musl targets
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- configure.ac             | 2 --
- coregrind/vg_preloaded.c | 2 +-
- include/pub_tool_redir.h | 7 +++++--
- 3 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9366dc7..679f514 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1066,8 +1066,6 @@ case "${GLIBC_VERSION}" in
- 	;;
-      2.0|2.1|*)
- 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
--	AC_MSG_ERROR([Valgrind requires glibc version 2.2 or later,])
--	AC_MSG_ERROR([Darwin libc, Bionic libc or Solaris libc])
- 	;;
- esac
- 
-diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
-index 2ea7a7a..e49c832 100644
---- a/coregrind/vg_preloaded.c
-+++ b/coregrind/vg_preloaded.c
-@@ -56,7 +56,7 @@
- void VG_NOTIFY_ON_LOAD(freeres)( void );
- void VG_NOTIFY_ON_LOAD(freeres)( void )
- {
--#  if !defined(__UCLIBC__) \
-+#  if !defined(__UCLIBC__) && defined(__GLIBC__) \
-       && !defined(VGPV_arm_linux_android) \
-       && !defined(VGPV_x86_linux_android) \
-       && !defined(VGPV_mips32_linux_android) \
-diff --git a/include/pub_tool_redir.h b/include/pub_tool_redir.h
-index bac00d7..fbb2ef2 100644
---- a/include/pub_tool_redir.h
-+++ b/include/pub_tool_redir.h
-@@ -242,8 +242,7 @@
- /* --- Soname of the standard C library. --- */
- 
- #if defined(VGO_linux) || defined(VGO_solaris)
--#  define  VG_Z_LIBC_SONAME  libcZdsoZa              // libc.so*
--
-+#  define  VG_Z_LIBC_SONAME  libcZdZa                // libc.*
- #elif defined(VGO_darwin) && (DARWIN_VERS <= DARWIN_10_6)
- #  define  VG_Z_LIBC_SONAME  libSystemZdZaZddylib    // libSystem.*.dylib
- 
-@@ -274,7 +273,11 @@
- /* --- Soname of the pthreads library. --- */
- 
- #if defined(VGO_linux)
-+# if defined(__GLIBC__) || defined(__UCLIBC__)
- #  define  VG_Z_LIBPTHREAD_SONAME  libpthreadZdsoZd0     // libpthread.so.0
-+# else
-+#  define  VG_Z_LIBPTHREAD_SONAME  libcZdZa              // libc.*
-+#endif
- #elif defined(VGO_darwin)
- #  define  VG_Z_LIBPTHREAD_SONAME  libSystemZdZaZddylib  // libSystem.*.dylib
- #elif defined(VGO_solaris)
--- 
-2.7.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
index ed313d644441..39022d04aeb4 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
@@ -1,4 +1,4 @@
-From 38ae233b6893a4eec7f9ed6d8ad02392bca8eaed Mon Sep 17 00:00:00 2001
+From 739421e253e6eba3eb6438651822f80fa9c0502a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 15 Dec 2015 15:31:50 +0200
 Subject: [PATCH 1/2] Fix out of tree builds.
@@ -13,21 +13,21 @@ Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- configure.ac | 64 ++++++++++++++++++++++++++++++------------------------------
- 1 file changed, 32 insertions(+), 32 deletions(-)
+ configure.ac | 68 ++++++++++++++++++++++++++++++------------------------------
+ 1 file changed, 34 insertions(+), 34 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8ab7f9b..9366dc7 100644
+index 3874296fde0b..7a5ba2c8557e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -377,44 +377,44 @@ case "${host_os}" in
+@@ -373,50 +373,50 @@ case "${host_os}" in
  	     9.*)
  		  AC_MSG_RESULT([Darwin 9.x (${kernel}) / Mac OS X 10.5 Leopard])
  		  AC_DEFINE([DARWIN_VERS], DARWIN_10_5, [Darwin / Mac OS X version])
 -		  DEFAULT_SUPP="darwin9.supp ${DEFAULT_SUPP}"
 -		  DEFAULT_SUPP="darwin9-drd.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin9.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin9-drd.supp ${DEFAULT_SUPP}"
++ 		  DEFAULT_SUPP="$srcdir/darwin9.supp ${DEFAULT_SUPP}"
++ 		  DEFAULT_SUPP="$srcdir/darwin9-drd.supp ${DEFAULT_SUPP}"
  		  ;;
  	     10.*)
  		  AC_MSG_RESULT([Darwin 10.x (${kernel}) / Mac OS X 10.6 Snow Leopard])
@@ -77,9 +77,17 @@ index 8ab7f9b..9366dc7 100644
 +		  DEFAULT_SUPP="$srcdir/darwin15.supp ${DEFAULT_SUPP}"
 +		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
  		  ;;
+ 	     16.*)
+ 		  AC_MSG_RESULT([Darwin 16.x (${kernel}) / macOS 10.12 Sierra])
+ 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_12, [Darwin / Mac OS X version])
+-		  DEFAULT_SUPP="darwin16.supp ${DEFAULT_SUPP}"
+-		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin16.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
+ 		  ;;
               *) 
  		  AC_MSG_RESULT([unsupported (${kernel})])
-@@ -426,13 +426,13 @@ case "${host_os}" in
+@@ -428,13 +428,13 @@ case "${host_os}" in
       solaris2.11*)
          AC_MSG_RESULT([ok (${host_os})])
          VGCONF_OS="solaris"
@@ -95,7 +103,7 @@ index 8ab7f9b..9366dc7 100644
          ;;
  
       *) 
-@@ -1015,29 +1015,29 @@ AC_MSG_CHECKING([the glibc version])
+@@ -982,29 +982,29 @@ AC_MSG_CHECKING([the glibc version])
  case "${GLIBC_VERSION}" in
       2.2)
  	AC_MSG_RESULT(${GLIBC_VERSION} family)
@@ -135,7 +143,7 @@ index 8ab7f9b..9366dc7 100644
  	;;
       2.*)
  	AC_MSG_RESULT(${GLIBC_VERSION} family)
-@@ -1046,8 +1046,8 @@ case "${GLIBC_VERSION}" in
+@@ -1013,8 +1013,8 @@ case "${GLIBC_VERSION}" in
  	AC_DEFINE([GLIBC_MANDATORY_INDEX_AND_STRLEN_REDIRECT], 1,
  		  [Define to 1 if index() and strlen() have been optimized heavily (x86 glibc >= 2.12)])
  	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
@@ -146,7 +154,7 @@ index 8ab7f9b..9366dc7 100644
  	;;
       darwin)
  	AC_MSG_RESULT(Darwin)
-@@ -1057,7 +1057,7 @@ case "${GLIBC_VERSION}" in
+@@ -1024,7 +1024,7 @@ case "${GLIBC_VERSION}" in
       bionic)
  	AC_MSG_RESULT(Bionic)
  	AC_DEFINE([BIONIC_LIBC], 1, [Define to 1 if you're using Bionic])
@@ -155,7 +163,7 @@ index 8ab7f9b..9366dc7 100644
  	;;
       solaris)
  	AC_MSG_RESULT(Solaris)
-@@ -1079,11 +1079,11 @@ if test "$VGCONF_OS" != "solaris"; then
+@@ -1051,11 +1051,11 @@ if test "$VGCONF_OS" != "solaris"; then
      # attempt to detect whether such libraries are installed on the
      # build machine (or even if any X facilities are present); just
      # add the suppressions antidisirregardless.
@@ -171,5 +179,5 @@ index 8ab7f9b..9366dc7 100644
  
  
 -- 
-2.6.2
+2.13.2.3.g44cd85c14
 
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
similarity index 92%
rename from meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
index 4cf80620313d..75a2d3a1c2b0 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://valgrind.org/"
 BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
 LICENSE = "GPLv2 & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://include/pub_tool_basics.h;beginline=1;endline=29;md5=ebb8e640ef633f940c425686c873f9fa \
-                    file://include/valgrind.h;beginline=1;endline=56;md5=4b5e24908e53016ea561c45f4234a327 \
+                    file://include/pub_tool_basics.h;beginline=6;endline=29;md5=d4de0407239381463cf01dd276d7c22e \
+                    file://include/valgrind.h;beginline=1;endline=56;md5=ad3b317f3286b6b704575d9efe6ca5df \
                     file://COPYING.DOCS;md5=24ea4c7092233849b4394699333b5c56"
 
 X11DEPENDS = "virtual/libx11"
@@ -12,7 +12,7 @@ DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} \
         "
 
-SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
+SRC_URI = "ftp://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://run-ptest \
@@ -33,11 +33,8 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch \
            file://0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch \
            "
-SRC_URI_append_libc-musl = "\
-           file://0001-fix-build-for-musl-targets.patch \
-"
-SRC_URI[md5sum] = "6eb03c0c10ea917013a7622e483d61bb"
-SRC_URI[sha256sum] = "67ca4395b2527247780f36148b084f5743a68ab0c850cb43e4a5b4b012cf76a1"
+SRC_URI[md5sum] = "817dd08f1e8a66336b9ff206400a5369"
+SRC_URI[sha256sum] = "d76680ef03f00cd5e970bbdcd4e57fb1f6df7d2e2c071635ef2be74790190c3b"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
 
-- 
2.13.2.3.g44cd85c14.dirty


