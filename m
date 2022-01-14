Return-Path: <chanho61.park@samsung.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8475DC433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 01:14:01 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mx.groups.io with SMTP id smtpd.web11.1315.1642122839646155092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@samsung.com header.s=mail20170921 header.b=orCPPJJq;
 spf=pass (domain: samsung.com, ip: 203.254.224.24,
 mailfrom: chanho61.park@samsung.com)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20220114011356epoutp01ab7095babbb8903003fb0e876da42b13~J-gT4-yPp0457004570epoutp01Q
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 01:13:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20220114011356epoutp01ab7095babbb8903003fb0e876da42b13~J-gT4-yPp0457004570epoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1642122836;
	bh=1g/ZdMya5PqHm6LXVRU4UMIccuP/0ZgG1y35KuYZPrU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=orCPPJJqrMpsyxET6js717u/8PjEw4aI46Z8JgbsmWpqUCKM1ZfnLrQPfdAXJc9IT
	 9OjFndYk0W82sZsuBhFaHKGbzEkyfT1MASqRbDJV9dEcJHZmiuFMERknKYFBM8jrjh
	 uezhOGPiV3fyaNGV48d2MzpdFXF6+RuqYOO81cm0=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20220114011356epcas2p458f77c5a9351738fc7e29a4f2b432571~J-gTopITc1228412284epcas2p4Z;
	Fri, 14 Jan 2022 01:13:56 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.101]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4JZjxF4w2mz4x9Q0; Fri, 14 Jan
	2022 01:13:53 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	58.8F.51767.E4EC0E16; Fri, 14 Jan 2022 10:13:50 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20220114011350epcas2p16efb8acbdc4d9edceee83569e10cc359~J-gOIUNfo0916009160epcas2p12;
	Fri, 14 Jan 2022 01:13:50 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20220114011350epsmtrp23bc6a14cf78d94e46f11871d42d7c32d~J-gOHuZJz3149231492epsmtrp2k;
	Fri, 14 Jan 2022 01:13:50 +0000 (GMT)
X-AuditID: b6c32a45-447ff7000000ca37-76-61e0ce4eeace
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	C6.6B.08738.E4EC0E16; Fri, 14 Jan 2022 10:13:50 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20220114011350epsmtip1ecb5fbc6477aa5ec0cb3a9bdafee4198~J-gN833Vv1276212762epsmtip1B;
	Fri, 14 Jan 2022 01:13:49 +0000 (GMT)
From: "Chanho Park" <chanho61.park@samsung.com>
To: <yocto@lists.yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Cc: <richard.purdie@linuxfoundation.org>, <steve@sakoman.com>
Subject: Question of Yocto dunfell LTS period
Date: Fri, 14 Jan 2022 10:13:49 +0900
Message-ID: <000801d808e3$fcea94e0$f6bfbea0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdgI4yUt5Jh1eqcPSly31MHmvpdyrQ==
Content-Language: ko
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA+NgFmpkk+LIzCtJLcpLzFFi42LZdljTQtfv3INEg8N7tC3u/HzHbvHj2URW
	i9PbZCw2drxjdGDx2D93DbvHuY0rGD1mnnrE7LHl8Wu2AJaobJuM1MSU1CKF1Lzk/JTMvHRb
	Je/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoJVKCmWJOaVAoYDE4mIlfTubovzSklSF
	jPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMe8sSC94zV+x50sjawDiXuYuR
	k0NCwERiwoPL7F2MXBxCAjsYJTZPWMYM4XxilJjzaS1U5jOjxPq9k1lhWi7fWcsCkdjFKHH6
	9RpWCOcFo8Tahg2MIFVsAvoSLzu2ASU4OEQEAiT+r0kACTML2Eo8PzmVBcQWFtCV+N+2gx3E
	ZhFQlZjbcg7M5hWwlJg15TkLhC0ocXLmExaIXnmJ7W/nQN2tIPHz6TKwg0QE9CSWTF/BBFEj
	IjG7sw3sBQmBW+wSK2ZtBbtBQsBFondFDUSvsMSr41vYIWwpic/v9rJB1HczSkx6eRcqMYNR
	4t3NHAjbWGLWs3ZGkDnMApoS63fpQ4xUljhyC+o0PomOw3/ZIcK8Eh1tQhCN6hIHtk9ngbBl
	JbrnfIYGoYfE24t/WCYwKs5C8uQsJE/OQvLMLIS9CxhZVjGKpRYU56anFhsVGMKjOjk/dxMj
	OC1que5gnPz2g94hRiYOxkOMEhzMSiK8/UX3E4V4UxIrq1KL8uOLSnNSiw8xmgKDfSKzlGhy
	PjAx55XEG5pYGpiYmRmaG5kamCuJ83qlbEgUEkhPLEnNTk0tSC2C6WPi4JRqYIpbttDD40A6
	m9Gv53+sXLtuB95/NTXw5DNpr89JUe8myJSxZxvP4Gz6V7xY6/PirYobb15euK/NK+zRysQL
	D6elHbr2+WPQ8qnrr9qHd2+S+XGM3UG6cEXHE+3oQ/vOpH9vfvd3l1XQxpd+Nq8XKTmKbV64
	bIfzxkX6xpceqTue+Dc/JkV0m3TtkkdvFHdqnfix5/qPplPZkhMn7jjSr39MTETuiLP//XmG
	s3a+f9gXeeTwtyvGcsusJvqbvtmfkL1ukc3P13FPVd4lsF1UejcvoGblAtN1Jk3bjujm7T8S
	XH7oo1GMmtShIsV5XxYmOJ+cL3nefsPTv2kqXK/mTJwkM7/BTeR45Xqe/77bNu90X6rEUpyR
	aKjFXFScCABV53tiFAQAAA==
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsWy7bCSnK7fuQeJBo9v8Frc+fmO3eLHs4ms
	Fqe3yVhs7HjH6MDisX/uGnaPcxtXMHrMPPWI2WPL49dsASxRXDYpqTmZZalF+nYJXBn3liUW
	vGeu2POkkbWBcS5zFyMnh4SAicTlO2tZuhi5OIQEdjBKzLt4iAUiISvx7N0OdghbWOJ+yxFW
	iKJnjBKL5ywDK2IT0Jd42bENKMHBISIQIPF/TQJImFnAXuLrgj+sILawgK7E/zaIOSwCqhJz
	W86B2bwClhKzpjxngbAFJU7OfMIC0asnsX79HEYIW15i+9s5UIcqSPx8ugxspghQzZLpK5gg
	akQkZne2MU9gFJyFZNQsJKNmIRk1C0nLAkaWVYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5
	uZsYwSGvpbWDcc+qD3qHGJk4GA8xSnAwK4nw9hfdTxTiTUmsrEotyo8vKs1JLT7EKM3BoiTO
	e6HrZLyQQHpiSWp2ampBahFMlomDU6qBiddjfZBKSOi5FTmbG1qv2x0+yP3nuu/23Z93b/4e
	sXT+Y2PvTdX7Ts2tfsC/cI+Zx70VH5sK/xxT5FtTax+2r16e49fZczNq7KxPHZI2OWRT9P+c
	F7vSs9el26bllHQ5X0qT32MdKb2p7+wWlzlpdndDys5NUihb94lp20XjB+d+1qvLTb3+/ot+
	Q57NPuurUd2a25UOTXR6tFB3y4kfE2OvvPFg4EuzWWLo0el4NCbudM/m7XLazsIqh3RnP4nY
	0RL3P4hFVXcey9QIfuFUieSWm6+XvGueIHRhQ9+/3udZPd/d92U8Vt+QHrtD7lXQ/7pvu1Jv
	s+qvm+vyoThL2PqUNOuX59ka9SsVJO7ZpCixFGckGmoxFxUnAgCTPXWk6AIAAA==
X-CMS-MailID: 20220114011350epcas2p16efb8acbdc4d9edceee83569e10cc359
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220114011350epcas2p16efb8acbdc4d9edceee83569e10cc359
References: 
 <CGME20220114011350epcas2p16efb8acbdc4d9edceee83569e10cc359@epcas2p1.samsung.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 01:14:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160552

Dear folks,

I found the lts period of Yocto dunfell has been extended from 2022.04 to
2024.04[1].
AFAIK, a Yocto LTS version has 2 years period. I tried to find any notice
regarding this but I just found Richard's e-mail[2] in last year.
Can I find any thread or notice regarding this extension?

[1]: https://wiki.yoctoproject.org/wiki/Releases
[2]:
https://lore.kernel.org/yocto/3878e27fb895718b8c5d65f444fea443a56e0587.camel
@linuxfoundation.org/

Best Regards,
Chanho Park


