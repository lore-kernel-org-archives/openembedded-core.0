Return-Path: <chunrong.guo@nxp.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0131.outbound.protection.outlook.com [104.47.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1A977756
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 05:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=gbYqjXfbwu5WTqJi1VnnU2BE5m8Kj24/vf6p5ki0LvY=;
	b=oU06T7d2IySKMnuI+OClThmpZdbk/zDf1x/aEE+1rHAK1lCb1wlMjIIQOk7TuBLxm8LkxFHs3tz5RcrT/zc3FG+8FizB3nM2pDHFFXpBUp/VDY4Rv8U9CEBWJ+IbumUZ9q2qjIwvuLKpVBN6QTRCjAtSx01mW5XsdCAYlJ+gWGw=
Received: from BLUPR0301CA0014.namprd03.prod.outlook.com (10.162.113.152) by
	BN6PR03MB2658.namprd03.prod.outlook.com (10.173.143.145) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1124.9; Wed, 31 May 2017 05:23:17 +0000
Received: from BL2FFO11FD044.protection.gbl (2a01:111:f400:7c09::163) by
	BLUPR0301CA0014.outlook.office365.com (2a01:111:e400:5259::24) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1124.9 via
	Frontend Transport; Wed, 31 May 2017 05:23:17 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD044.mail.protection.outlook.com (10.173.161.140) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1075.5 via Frontend Transport; Wed, 31 May 2017 05:23:17 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4V5NAQs016055; Tue, 30 May 2017 22:23:15 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 May 2017 13:23:05 +0800
Message-ID: <1496208185-25064-3-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1496208185-25064-1-git-send-email-B40290@freescale.com>
References: <1496208185-25064-1-git-send-email-B40290@freescale.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39450400003)(39860400002)(39400400002)(39840400002)(39410400002)(39850400002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(9170700003)(48376002)(50986999)(8656002)(36756003)(6666003)(76176999)(2950100002)(77096006)(106466001)(5660300001)(6916009)(2351001)(54906002)(5003940100001)(4326008)(47776003)(50466002)(81166006)(42882006)(8676002)(105606002)(110136004)(107886003)(356003)(189998001)(2906002)(8936002)(38730400002)(305945005)(104016004)(508600001)(50226002)(85426001)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR03MB2658;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD044;
	1:XoZnPJilZmbqrTIJt+LCgXKjr+MzWPkwzp+1pztoken+ijQvdofSllgDKLPp6GuxY18c4rS+BMtZR9G377coV15Pra1tvZkynQOMMUqPksN//HUzww03IonpGFO5KgRECGA653vWsqyh1S+hZ4xTs9nISt19U1LTiWG0SS6NYmObZujJw88tVsqGzG/lofnPRvAbkf2aiKZZNTp2JL7l6NcEFcCIsPeM5SW2FplWOorYKHExKWEpgowN4qmMIdXgmVvLEPELDEtbu2asIzHNsx+XM4P9BHwWKIFBKGm0SrzfAjwMhRistYZP9Qermat2GhV1RAhO1RZun2YNJoqEV3aTeawQOYse5Qbn2uEYWbE5VlUMJb2kcVB2T8Mbt5aJe1q3HvFM97E5ZxQes/pK6ag28Yrx+D7kqCej3L5DVQ7UI0aWXRflznQhH0robto4i6zz3k96ui0qhVM0dg096upl9fQmmcmiTecugCD/dMqCVl59/UcBeYpvr8BW1bJJClIb2owm4EPSVCbBO6zQeQ==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR03MB2658:
X-MS-Office365-Filtering-Correlation-Id: fc94b9ad-338a-4819-6981-08d4a7e524f5
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081);
	SRVR:BN6PR03MB2658; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB2658;
	3:Pu37dv/MbSzulYxbLiJiyy3RtcW/c9GWrs2axmXQV3s+4rasJKOLUEEfr990Sp1LJwhlpCjdVg8npFYo2eQS+EK8gwyEpycGJ9jG7aoNuotdDAiE811rXkCkm0TRR2Jx+pjvAGuZK15+TwJJWg1CAvar+koQItNiKD2B6QLWhoHPjj3flrfBj2F4Ar9Y9hLCrIFBQOG6G7jq7+7T7O+/+Apx6qluM2/GsqzxU3i3ysGWjiKDw2S8CCqBrNurO7iCAOiHFJoajokB+w3f2tLM4VOlqz9VfsiqZIsnpOADqTJDbN92QhvcIEpzt7AaK4NYMbXxpUjowMznogHqbZ70orIF/yFFyer4jpDa1lApL3ZMS624HtOuLKq4uL7UHdxZa5nYt41g9YJGZ/8PJ47CmjV2EHoxWepqeWqsyLA9UhqBMbDY8JEaeAtpiUMZYT/ZKg8fXugNwPjSlIaquPiklw==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB2658;
	25:xoGmaEm6bsiwqAV6FDpcS2X40TWy9RkQYe+4K1X0o45JXqg+7YJXlTkqFhSHD6VkKuLmoX2+JeTN6JRkqs47teIYisCujUk1NXDxxaGPGDi9e2TSjFLMOCLAMVkzQMKxXQ3dg29X24t7CE0xUNLuQDidyI0cEcYP4z36oLa0EkOz9t/Qf2wdUMeXeiuLGueDnoiuEKfzRDR2C0uv3koVO+h6FbqVh8y8jktxAPKYizOp468HRlrACmrpywBvaZ50gfxiGl4C4KLUeGwT5vtTQVVbMOebihpTQYOZ1SsbC5RbjUb/cwscWFrafrJfQc9G1RLHlAtt8MBP0bvqhNAc84OVuCd7TIxQW13LDibZYjC3Pmf3nuTaiWOeqWE1RAG/TCllNE2KSKFw36ckK3lLomjbqn1QlimUKW7LaSsSIjaqBjGT2bK9la3bqxxg6U+aP1iWXinAbK4Hh8z3gWYQUesfE+qynAZW0w/GryXAZ5Q=;
	31:j/mF9TcalPfQ1KAhWU+CBDiQxBDuvubpRTTbOumU72NA5isIz6iEZvwuny/QWgpr9tT5XqdGh2KEpiTf8LG3qrPiBZMMOsykmNVAPj7lA1WXBLT3ElYGHH26howZ4hGgKQFCjHNhL2WSiM8XvNwHvBd5kKhtPb90T69clzxoW8D6h951mf8LS+khFHvpjVO7r/vJTn6Erxi8JljmvIyPWUA9CsIdwYj2m90dVLKi9iiaCjWcSSkx715uhIjzs5ae6hP4kJTzehwVJH4D4zSEICm5c5XveL0u4cLjlIhp9lI=
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB2658;
	20:dmF1cDBx+tSev8CvhE14XhsHMx6VJvZ3LXqvzKKQOjVq7KUHQOttRLID9sZE5t96jdRfFdiaJQWjk5qI2N0EkMGbeHriRu7Wr8qatM/SLrvAlgsLeu+2nJELCLIK5BepG5YRVs0Vr8j8GPKwlhJ981E46BC40LeMM71YAX5dnbw6OLrHQkNXmKHUSH/HvbxE2AeBTf96ZTzuskIXC22AbdaphHB3CZ4iVB0FIHCKyUaWunkM7hyXsiU2izUgIIvIZ6cb5iR61VY/lTZkiAUkWTLUEPYPecXOfVmWZilyrJ6ZaA8SiCSkHX2++EPi5mb/aw3X2bDCouYfuK9/FiDY95ckk41Z042akbQr9DHdhDvOXl207PpY8oE0ko4/xnJbDeqAk8HeVMLJa2NDJNu8qxSS/fqtn6KYY6+qVliGt5cRBBcYYeJXvR7TvYvyvziUPNEVcZEJQ1jiuxh/OKWgRGAdr0QfC7OzxEA46BpystOYocSKvc0706BrgjVyof70vDeDwRLBuEaJnr6nN7y3prIPZKCUmoa7xYZuhuOdqaqsKO1k9Cxc5RtIHiqWBdWtoo8JO85okvn9JsOrlfdYRvGhMVaTkuLGyaO/1VrJilI=
X-Microsoft-Antispam-PRVS: <BN6PR03MB26583356934914B3ABE5860C84F10@BN6PR03MB2658.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700073)(100105000095)(100000701073)(100105300095)(100000702073)(100105100095)(6040450)(601004)(2401047)(5005006)(13018025)(13016025)(8121501046)(93006095)(3002001)(100000703073)(100105400095)(10201501046)(6055026)(6041248)(20161123564025)(20161123555025)(20161123562025)(20161123560025)(20161123558100)(201703131423075)(201703011903075)(201702281528075)(201703061421075)(6072148)(100000704073)(100105200095)(100000705073)(100105500095);
	SRVR:BN6PR03MB2658; BCL:0; PCL:0;
	RULEID:(100000800073)(100110000095)(100000801073)(100110300095)(100000802073)(100110100095)(100000803073)(100110400095)(100000804073)(100110200095)(100000805073)(100110500095);
	SRVR:BN6PR03MB2658; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR03MB2658;
	4:WuENaYpCVLhbu/sJS3wSl6H27Alv7ZEP6wpblAD+N4?=
	=?us-ascii?Q?K5DoKKKYGox7rfu20Ofx1xxBc30rf5NtWH0RahCrdrDidq8b9qUu5xYOeypu?=
	=?us-ascii?Q?OWKAJTsGz8A3tPXwITQf0x0O3EkMMuz0OMMY6lrumon9j3Y9uQ5IsGjDgAmx?=
	=?us-ascii?Q?mhFlR7WOrUBArL+amh3saB3ghN6yXk8QCZe2N5cyAQhRQgLLBbMG9az4Il7N?=
	=?us-ascii?Q?eGB0RGICi09EwSLZffrLwGxeKJO6kae7u2YpgKGx0D34BsCp3ARigeejarnH?=
	=?us-ascii?Q?UYkSV7AZiiQvItECkLrTTN3skg5gfBtq5OafBlkPQcowHWx17CVRrYMdkP1v?=
	=?us-ascii?Q?3ECrvDRonwNltx2Pb/8xxaiDly1fO2BPHFKOth/JD7uM1ELwxW9K7CjIwPJk?=
	=?us-ascii?Q?StpYbwwV5mLmGlce2kxSRtIUXjZACooYJVzcDa2XWrLDi18iCFxW/dPp8RGx?=
	=?us-ascii?Q?Ku2SAF07G3tW2YigN7x2HRzXO+Q9IX2cZ/nKfLSKlPkJsbyldpbxa62Tb73Y?=
	=?us-ascii?Q?aNuqQwWtrCE5Wgs5pMoRrUkr3nB6VQT7M/oRDjzyO7FEyomxIBN7wcerr9fk?=
	=?us-ascii?Q?WadI0lDEXZeBXKY+OfYG+uvVtY5JUWlPCFOOMCYkAeS8nQwrm1vDnKE954Az?=
	=?us-ascii?Q?RwWrHmVj7sRRe15luCyxYhWho++5H87wvlsQcdosBiqtUW4UId+hKFoV1h25?=
	=?us-ascii?Q?P1RSOknpD8L7/cddef52V6BXr4BPjXX4CA3GU82DVewuzYbPUhDGB3esaLa+?=
	=?us-ascii?Q?R+P31NVPwP10mIuSE86rmjF+wNHzKIUwEXWAEyB1ywJbsy13fqtdo6GcZNwR?=
	=?us-ascii?Q?rI4sOl0xX+AeNXZp/+qo06wmZ3sSN1hWVtz8hT4tEItR5idcm4x6nWYLG7WY?=
	=?us-ascii?Q?xw0BQz+0JGmFHss1WGXeyR9xH5py8jNbLpca1nUIGGOQrvLYXpO8wAfycYs3?=
	=?us-ascii?Q?PFyUhNnx1NdFA51bl2ZCrN78W9DlriwfuR3Ae8mIDHukbPcHegsQC9QbkQgF?=
	=?us-ascii?Q?9LnYIs2hV7OPmASBYT1BoxrVk/AD86WxaQ6vuVl6rRcHEqM1/yk5B4S0mCUC?=
	=?us-ascii?Q?wDhEJkDYmBCO8xcZrGMeiG2GgqoUH/OL/9Fn6/mNjs8n1q3GEPVU/r8e+WNM?=
	=?us-ascii?Q?1Q5prTmoCmcQoa1xQ1t8RQMADgLW677S1+9RdhS86WzFKD7IxlEBrMT7oDS7?=
	=?us-ascii?Q?AXChUKcJ2hoYRIbpnKjLd2qlCGiJz5286HfU/J5cD6WSFQDDE4WPFOm9V4qb?=
	=?us-ascii?Q?A7Yi46ROoHVOTW61LOwv79vyQ2GZwXI+Jo1cUZ?=
X-Forefront-PRVS: 0324C2C0E2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR03MB2658;
	23:P1R/i2CIOOuhF8D1byx8S+UVzatYvHSUEe/2bI2fL?=
	=?us-ascii?Q?EC6e0IjampbtLjTFG5Dx9pxePFf92udLCW4duNOr8cO+f5fgrRJaagEIFg4p?=
	=?us-ascii?Q?z+eqvY3Bop9drtBnQcIW4UxZ8QRybdGb6ETcW+Rw/fuI0913skkzP4bROa2C?=
	=?us-ascii?Q?OHxBzQz4Id+Dd1Et0lPsHHGBbAbSd4Nr6HT8/Ejs3aRbxL7YAN4OL8Nr8afG?=
	=?us-ascii?Q?K1LMWWNz4SYP9QILihncEQMyBPBHPPdH3I4sno19WCto+bWPGSyTv6jRZLWe?=
	=?us-ascii?Q?E6Mn6vtfpnBpcbR7ceC1Yw+kgWQGx1UdzDce5DAuTpiatbO0qkh/1wfBLV93?=
	=?us-ascii?Q?EZSdegFk4B+scu4mvYqrCAMFR8hhHCsqxyPjy7cDuCRRkLx5KdTwFm+jEsYr?=
	=?us-ascii?Q?dgYzPFAtQ0IS1wyho9xtqDF24x4OKAGn0INrD0fGlPJ42lJ6b5wml6c7u3kG?=
	=?us-ascii?Q?7rmiUyHqJeB087k+3tP4yIJ9CS07erTNy7zq+Q1BPaTZM2v6lO7JsFZehxKQ?=
	=?us-ascii?Q?MxFvvchyp39KG+9n15Zx/VjyKPvWruIUdOscDxhHqojJ0fowFnhg2RdDIfpY?=
	=?us-ascii?Q?52jI/1GytvVWmAn+rrXxDUbbRA+pKhQtM/5iux7ibiAfDGJ/nMKbmKj4FJyg?=
	=?us-ascii?Q?HeyBp642eWjur7ucXR9PclInq5TXrtYprJVSVWG+8kz0bIF+Cl4/WV+f8B38?=
	=?us-ascii?Q?zNZbMM6sPrRCjeIRAt7k1lxe10kbX0RiLJGYSyNHtbHEiXasBOOmohL3wlyS?=
	=?us-ascii?Q?mfBboNGe/NkgdNRa/jpSvAF9ip/MyA+4jqAwMYYrTs+2QEAsl6LvaeK9Zl2i?=
	=?us-ascii?Q?PdJdMH3XJCI/s09JhdvZwf/W0Ywfu8nSmTTTp4TIsBsVRy4wFtEu/xbSSBlm?=
	=?us-ascii?Q?hd6/ji4rYfquCYmQCXXA/dq8SKAZ3dklE470N0kfiCO1owIkWhd0Q1lgMzIm?=
	=?us-ascii?Q?Jj/aNN7L31j5jPx0K19xeUM+YZ+eqE78o3Djm4s0NPm7IyfUYaYmqPMk86sr?=
	=?us-ascii?Q?Pllvzm6FeCOOlm5M91c1p6kEJ8n7XZj8BcaUnXB1lNonEjUUrNqZR0ABa0lb?=
	=?us-ascii?Q?jqqnEJDCNTA9ESbiviRXHr4LkNVNPBRsL/7buEs+yiaP2jAGnNf5aomxhtww?=
	=?us-ascii?Q?IhsFNNvaakADsTGI8R6hvoC2+QqszUkWCoNux6eEmx5D1VFA9QRn8NZV5Re3?=
	=?us-ascii?Q?0fK9RRhwBNolaC53P+SaqfLtGG6ocub2Gny?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB2658;
	6:W3DOtZzzSw874a8q27VgtuXnOra/JxW7b5O81IhzoH6jy1Vvdth/9e1+G3KUCimbIdoiZZGENA9RKW16Q8e/6mtTyLIqVZX+QYQC1Munm1wFfE5FpzHm9cIzbTQYtZGb7qbJ7W/aP6pmy8RQjW5vrjogS7MwhBMh6rYwkVvSyNe7vd2qr1NBw5qz5L3RGvoQSiOdjbO5lhYmafDuSINzy7Ey88XqeKYjPo2hodckgPsUwWESoEpPDntAvFVMQGuEAo/h7pKgHJrSZHC8nJXJh+JwbytjGzlAXrc9qg56JZvBFbmJzrERyh/5GmweJ0Dh72jh0EjqFv+k1OhOS/F5ImXrH3RbZ2RLy/ic1eb6nfAXoNEmRytaUpwtakahQJj8sU7/XkOil3x5kKkyVSXE5YXRDgHB455D744AoQhK5JHaS+/ZoKer5Kk2v4WYHISPB6KdjpM4R6IBKYxtI5KQjzYTosP6b24iSUkjf2Fo6JEJzdsANIQxVjBDV6ElREVfAuSUpeLKZjyXXdzMTlWmQW5pl4xIIHgPCQZ+ami3zPU=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB2658;
	5:EEbFGIuT1ySVlfvPtCCAZJe2rJI/65n9hV81x320l2wP5eMsUmQ0vcpaEkQYmeHn17uLW2zF2DjVrBSVj95lnCzAxwgCiu6T/MP7wnFoyJsb4HJ+RRMsFFlpRn7dvGG0OK8iJMYfzkMilHw4b8dlX0Yg1Ylo6ENK6hon4VjBPIRcw6iVsVs7mIeW0eMINT3M1r3Ww/M2I3Um3eUihGOWfZg7yjDiN1HP3fnDG9hoHk0NlP3zK0CX572+jw5lkHIMukVbmjFqcE1+vFRQm2272JsZMlEQYM4mKzuzoDfZeBsGWzs0ywuDdKPzHm4fYufK3kmpY/LpkJ+Bgnbligf61UKjXaFMowosiBMY7d8egfBmlbR/vFpmpN+uB0JSZ79xNceGyNR+jq2FWVSXnTN8R6L8bGBBFXYxRFIoBTO6IYEKuemSjTsAzY+4jrbG9HizLXYp+Xd3y+ud/jdfoasfpNam6f0oifBsfkSQMqgFrt/ee3xeJ9AOU0Zc1AeyTvn9;
	24:Mebs0FnfdzfOYlzwhFVa2k1gxsZsyqSSQVgyrsJAYy+JpimrjhNjqbg/do5rVNfCDyKwUTrHoKXr3o6vD4YGoy8SXINsiwU7+CBbvClPKWo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB2658;
	7:7p9qGWiXzGELGjgj/ktH5DmCDcRhxB0nSQdmoIJXwZG8tE1IGFtXqrBfBRCt8qyYjLgU0RdmFcbNQsL/AWTbtkUySIi68XHgw8gZV0UXXk7pGe13V7aVkdfITTkr8ne1+6DxJMLAbbi6ZCPpVMrt7QJV+z0sOjo2i1NZczVNxx2wB3V5Uxan7gDW/pnxYJlsM1w9/dPbdC/lE+k21zqG5y8w5/B6SWRf6i7yOs5XukxNN180AK0x6W6ks2E+qTcqPaUbW0ll7pXde9dsWq35jChYX3WUWbxa2PSW+cT1UC/v1hHNGwUxdLrWwkRZIY8ghoaE1HGZE+YEgsPnO0Elkw==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2017 05:23:17.3779 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2658
Cc: chunrong.guo@nxp.com
Subject: [PATCH V2 3/3] kernel-fitimage: fix KERNEL_DEVICETREE includes subdirectory issue
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
X-List-Received-Date: Wed, 31 May 2017 05:23:17 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

     * For example:
       KERNEL_DEVICETREE ?= "freescale/fsl-ls1046a-rdb.dtb"

       ${DTB}= "freescale/fsl-ls1046a-rdb.dtb"

       but only fsl-ls1046a-rdb.dtb  should be used in fit-image.its

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/kernel-fitimage.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 9fa836f..08644ea 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -347,6 +347,7 @@ fitimage_assemble() {
 				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
 			DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
+                        DTB=`basename ${DTB}`
 			if [ ! -e "${DTB_PATH}" ]; then
 				DTB_PATH="arch/${ARCH}/boot/${DTB}"
 			fi
-- 
1.9.0


