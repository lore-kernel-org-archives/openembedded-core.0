Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0044.outbound.protection.outlook.com
	[104.47.37.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3810F6007A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 21:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=BK8VyRfB27DP8CFPezQHwmHLSabSgQbzsC0vpXNXeNs=;
	b=pt8ZJqRf+2TCB/dXbHOLzXfDZAnx5oIM/KIfeIHwfsB3Qb3oAdQf43np7QNYLmsr9M5WGLW05ihf0zOMekj1Y+3dUUsQ9cnBHGnujTankc8OzqEfZAvNr4W7kvR8kq4do+Fqdbn4v+3j0TCao8k1PBHJ+GK0YpRPUcaqa7egE1g=
Received: from MWHPR02CA0016.namprd02.prod.outlook.com (10.168.209.154) by
	BLUPR02MB003.namprd02.prod.outlook.com (10.242.190.154) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.734.8; Tue, 22 Nov 2016 21:03:50 +0000
Received: from BL2NAM02FT008.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by MWHPR02CA0016.outlook.office365.com
	(2603:10b6:300:4b::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.734.8 via
	Frontend Transport; Tue, 22 Nov 2016 21:03:49 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none;nathanrossi.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT008.mail.protection.outlook.com (10.152.76.162) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.734.4
	via Frontend Transport; Tue, 22 Nov 2016 21:03:49 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1479; Count:15
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1c9IEG-0003R9-3f; Tue, 22 Nov 2016 13:03:48 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1c9IEF-0007zf-W8; Tue, 22 Nov 2016 13:03:48 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uAML3dQF020898; Tue, 22 Nov 2016 13:03:39 -0800
Received: from [172.19.74.183] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1c9IE7-0007y7-4t; Tue, 22 Nov 2016 13:03:39 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Nov 2016 13:00:16 -0800
Message-ID: <1479848416-5318-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22714.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-IncomingHeaderCount: 15
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(377424004)(189002)(199003)(54534003)(92566002)(50466002)(36756003)(77096005)(36386004)(38730400001)(81166006)(8676002)(6666003)(81156014)(63266004)(8936002)(6916009)(5660300001)(5003940100001)(50986999)(626004)(2351001)(50226002)(305945005)(47776003)(9786002)(106466001)(189998001)(356003)(48376002)(7846002)(33646002)(2906002)(110136003)(4326007)(107986001)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB003; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT008;
	1:rkxjgE9Kw+iwmIvUehZ55SlivRrnve+s7EdWgxYTS/iLHpV6rNCxxxNBViIrtHFhjFy4919fzOdqfPl/ZsSjaIZy2iHef/KISASSQ+5Hg2EJo8WyZlyG31TaEosMfXRO8WtkxwiIxvXBfe2VDn3jqOkuGZ4wLTB33E97EE+DOmw6VFHcjcdGlgzAL8Uk2Drnr0CaFWuUAzD1LCnQsAvmO4pLlOBt2E2V2oO8ooGcWs4vmwaNZmtf18pnBkqI2wmYstw1m7jg2cIjU4UGpqKHeSjfIcpOC9h/cdQcTFW5aXQWdHJ26Uj77nw4afNU/B+XefXmHv62sb9Xt8lYbqfzeTgoQSNq3c5zffxA2zPovhVIWrkGHcYjUpHdj0NT8Xv7HFE0DHyPKFsYVJnIpU8x76yEp+t3nvR1BXIM2/KZp9h6XkjOqT75p/Pil+012rKAvE7t3js0xQHEhlGxmwJ/OOBW2NdliKuYH4qiCsq9ByTTYy80Nx4gJMmK4mdbB3EPj592BapkvymLET59hJpvxBVh4KF++Cb9stF1bskNDYwN7eY9qR8FPQFJzH0hLOvnHkKWEH8r8B9bzQ5UD/SkZuKQGoWYlqftyrc2prSrw0w=
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB003;
	2:iDHNMEGN16nmcqXA3ir45QdTAb78OhRhlBFZFBeUeZL0wXdr4TrDMqyh7TNhE4DJcWwp8rMxSE4DWLGzswzdt2AxcUhVk9Yb3OAJxCzh1l0ojpioA80kC1/5+ZTM5QPxS/E80vYBOrurTgBdzwtjw1kIDmitdPf8oJssMuZbj6g=;
	3:1uqi7vS4vYF4Bkig+X9VV5m5sivvP1/Q+EeTUYOFBIC49zc5K4dQSgmqSwH+0JQkFd5wtUs7vE4E+eQeS97e3PR8U5/CGBfU8vzc6zR8ObmHzaKOdM+amLoZ1GnADm8LzYR/CEOJWLiPfp4zyAyC8QczsYlDndskjc/EdkHg5HdTorgGqML3ZJy1SyHwZwT9r3bXQW9qS/c2zZOuwBH1kw7Ts5yc9zmD8HBmfU9S+ex1rWRHuJx+5GFfY9uv0JIxR4q2xZZXCxS0omTM0QEtfyWjmYB8bxgww2p8ziIVsEQ=
X-MS-Office365-Filtering-Correlation-Id: 3df27039-86de-4c23-f2ec-08d4131b0ea5
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:BLUPR02MB003; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB003;
	25:8GG51GhOG7xmiKSf8l5kOQ50tMD18pt0xFE7VtUgDGnWvjHP0EsFqxyhEHyZiTkgjSjFxDDPdQDkE/2OKlwfzuKDS37LkDJSBBqdzEAD0YoqKzkYyPjIVJExZhVP2Pdwlg7AtRKFEfCHgVViTbw4XjpWIwsgq1wIUVhkEGet1tWtPFiAjw1tv8VQdOSZSrfKTeGe7GUJj5eYtOzWEsD/gGJ68cJGBf0GYTF2itH0C1FDDqUfLiZwuG4KsxQe0DKyzHk7MQ/sVe/IBEsjhctfnddlpSk5s+209Pi33cqo749LVJnJTeIViuEVJnVoRXcrJuzgcfO5WKzd9nR+QAoSTMiAyEJVcRZ1NjFWNHwVfiiYNfWVNgt0T4xoV3M5TIw8w3S8ZdqHC6FQrBFYl7U0k2OUmW0xKToMWVQQPgBIX43gBOyzYw/zOjPscqwXU1NsruERL/H+Qn/84g1zdjhozA==;
	31:6VNNff8RzLqeQBhbxwmsR2jUAZ8YAcuksTTrkQY9MHumUVnk7Rtn4OAeq2qnGVYy5mL457aERKLpe/SO8ve2mkGaCPLEfZAtJ/k9lqE+jjyALYv231PzH3Ta+vFIHhoJWbg7uixbnrKThWTZvZfA05ffFCXww2Spnup8C/9N5LhpIPcdUngiAqGL4+VHvoTXigR/M6AA9gXrBMzRf9Zu0NxdTcOx1iBU3zgqYc6t3r17I4BCPr8m078F0koPuEPuJScgZRJtYMQIkyqe83ffXf0J1Iq2AHmwokgn2hZoP94=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB003;
	20:pFV8MdSHv3m54FNDF8SiNf7Oe5RwgFCrJuOspl0ocRSbkPJlAr27ifd3FcFSVkBVaoX+oCYNycKuY64o8I3pmJS055foK1vyJcZVksqGq2Hx18bQbuYLOJGowPrgd38MXeNP9uXgNollzaJk+umh/jT67ewBmsqOcqN3u9feNNIKabLaiwtLHg2HQRJeobMQopTX4uRKsXEuYdbj2SklO8UE/c5tQGtzdeYR9QXKxGmlu0K6IUybeVTpYhIeBhHnwbetWh06IhcJAP/kuXUtPLnZbxUuLrCQ1mH7a/qTYoYyTMuqniXakc5rSP8x7PjSoyvtAOvvwowGZsQNlUGCH8fasPLxwDnvFyrUqb051EIN7tbLtaS6uIhis2g4yP/Qcf6VYsKR4CSCp6DA723CO6sJjjNty+f33THfILhnHzoMkaJBRRH64hzRKmnNchH5UOanficEhsOSV/XfTKrvkkGAjWtkRt3iKerJNp3Wh7yGg1ftMpWFcTNKBCb8jfOX
X-Microsoft-Antispam-PRVS: <BLUPR02MB003B790402FAC5C2C738EC1B9B40@BLUPR02MB003.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6045199)(6040307)(6060326)(601004)(2401047)(5005006)(13024025)(13015025)(13017025)(13023025)(8121501046)(13018025)(10201501046)(3002001)(6055026)(6041248)(6061324);
	SRVR:BLUPR02MB003; BCL:0; PCL:0; RULEID:; SRVR:BLUPR02MB003; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB003;
	4:8sH4ZVGmFwS2giG9UJNoK9QjvoUjA1iO3z+NrwsUPZDFrkOtIjdIwu5cjoWp8RLi8f3Pd96FbISlliFNHBgZV9nNqi8YB99aW7UYSl/dVYE8vvhdegLqv1Tta9Ocn4XamuB4z+gP5DvCgX8pCnzK7UF+wh7W4lUPMZHgfBmP1UDXETPdUrKD7ypSXfTJsRDnZyMEXgULYaQNp6XXIFO5Jr9/ncQGTjovOno4aQnq7UaR2hCuysyu21x/n3lEfLmgr8jl88LHJ8BuyldaIhS9fjNxneQ9E6rQRfH14oUTishNsaBvGNNjHx5FiAziyCo603htcu2+Ijd4veNbbJmzjf0KGBXCZOGnwcWvDuT2pCFUl+8LAZasA+RottlYJTQJytaSzTg82piEpOrrvoC0PLAdKhBU+4h7cjJXK54Ha65pIk364wE934O8nCuW8QS8ZlqY/U2KLXZwjEOqlPgufCKFm+5/KSi/Az/rbO4EQRcF1sk+jnGdOjHAUqxpC3RFT9tmbIIRGfrzMYBb+NWwfI6hm9Wlo1qkqXw3HlTXiUAxp8RhDxWCPPPQGyKMzmTCdfnWWc8uIdjD0sxJ8zatLVZVrGp42i31Dh4EPumaWVKtBl3iFJat4vcT2EgGx3M1
X-Forefront-PRVS: 0134AD334F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR02MB003;
	23:LhJCw+zYb9a+tyobHhP1P0hN2b0u6GuBmTKzX/zUPz?=
	=?us-ascii?Q?nb0MDvv1iS037sNmd/duJkpscnZst6Avnw2Jm1OEO5P0E+w4VvGnnrTtiBGx?=
	=?us-ascii?Q?PEz/gIoX1nJylXF2/WYv/PAFDhh4MHKqnW01m0ySrevVdAkkgJHmA7g5ZOFG?=
	=?us-ascii?Q?LdxA9YGgxGLX7UlXV97ENZ2kJt6UWn8wIHQeUl28bFtPCsSKSmvzW7qx3872?=
	=?us-ascii?Q?Gadm3+JOItZE757iSd/OaoZbenywYpllZ4fK5uDObEhcs7MTgUXAjYNtdWbm?=
	=?us-ascii?Q?IwFtA9a/gER+2kJHD7qJX0MIC2TQ5YHLT3BT0m/MWePcVqZH4otBM9SnhqYn?=
	=?us-ascii?Q?88OafrxYHZ7f4ACCeoxaHruZr91jVaJO9OzIoOcVvOTpm7BV5QagKB99haqY?=
	=?us-ascii?Q?RvTvZjftZNfMuQcibXM0u11eEb/RQqxpOYDsii9WQGomEeTZgSaeXxTcJ7j1?=
	=?us-ascii?Q?eW+a3Zj4wJrh5i35lMmnfGE8f0TXm/vkI2XsKVKQD+3Dj55mtcQeuQVPJ2pN?=
	=?us-ascii?Q?7untkXfnB/NUvx6JysMlBeRwMm3ugFe+Q/xQFqgsPLv+BIQjiJmkG872iVo3?=
	=?us-ascii?Q?kjGTF5KNyZarudiS+hGPYwZVejwrNgB5V+aT1tx02PZFIgUlvUSKnI1i1lEE?=
	=?us-ascii?Q?rc2CRMpLsmWGktpN+Hrm+6aXPlwcfqJ4aZYyh6HmsZeDsL2hQeXMSGK5d5Am?=
	=?us-ascii?Q?Pg4sehPww+Xz8/WeOvzSWYPbLOCGoa7iI0H9XMnhHmkQrkbmDizIcKCuer+7?=
	=?us-ascii?Q?0f1KKrtv5OAhP/vgINFVCUo8eSZogZ0zHEfR380UooF7/dlfg9dQm7cln10P?=
	=?us-ascii?Q?zCQsIGiwAMqQqEk188NaJ6lGv/Tz8eTPvBuNmRw5luEjeXsg+1f9G3gTxMVz?=
	=?us-ascii?Q?F0DQAUFG3K7hyOm3j41cEnK9f6E2wW7UW34h/FeTz9MdC1fzrBYU3yyjV4L6?=
	=?us-ascii?Q?AtacqJpAEBEJToHy+zQy+IFNUDb5AVQ5ssAPH6N/s7ZNnoEqQm1o1A6c9tgB?=
	=?us-ascii?Q?c=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB003;
	6:NVG+02cWu6Bexp219i1/4sAAu01ohb4UvQrkuAtXLJoJjiagHitzEmQPrpPzIfm5fHmG6rt1Pv9qP+dZuRkjL/vt0NpVVZG//qAUnjeum02HtAJ1ihE0vBs7p4AfaOW3285kHacP7txlKaewxSr/h8TRToa7+/Zy8whxlA8a2ZXSmbtqfIE2M0zwp1hCpW1q6pr7wd+LMx1U0u1cbQW3J2ejziPpHrtva1VPeFjJNRhR/whPtNAsd90cthRDjps/X7kSHgl2fcnm6nq8HgfZ3reboBHLzf2ATuFTkcwe8dN4uVTSJfWPbKF8WobUMOqU8Z0welV+yeUPDxMvrD2jnxdeVdEhOY9gir/zbozfl3W3wwsQv6IM3SKurUOPpK/G;
	5:vxj7IAO27CsASEI5sCnAFCYOwuBaBUfqXqFq9pTY6n5XsTI7Tpp+EREMhh0JJjyln9F3FMNiGjjB7dIp2lps4+dDpP/VZ+CTMsIyW6ld61k0fGCu+/lH8hErSYVLN++drwtL/3xXaU4C2CbTMVw8fg==;
	24:ReCdzj+/vSh+ndRCIBdLa9YZODP8WhX6i4/gtkk9gxxH6OmnoX7AHUecvSHgU8ot0lDUXOmR8JjzDfZ3XsDgcVIEts5gCGl9zuYG4sURKJQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB003;
	7:dDEju2XXI7pS/kNCt00IPMbUP02wTaDglTrpKBCnY3Wk59K69jciNKsJE1Z5tChs9Dnjz8zfiH20fRbct1kdSPO4VGQ52HlhHo5hkfrPWrCejRQfPlUo8qpTIvvOyailEYgGTSeYy6w4WCF92e2OvMPoMYqcI4r7WJfbuzU9PrrWi3UEv5mUZa4L1Wz6mLeccqyUzP6nBI5bLQcHXxZy8tGbZ2gBz0ONlPA2Dh3i0MEqwJoSTAXcqHmh7iLLGfvLGl7B/+rsPB6JwcdcvyxB1n3iuyxA+EduCknOGJrCkTq+rJFHEn0k7JHkv6RQPmfYx9+1C6GiEfl55wbM0vjlnqMQm1rNbbIQj7HTpvsNyXc=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2016 21:03:49.2665 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB003
Subject: [PATCH] binutils-2.27.inc: Fix alignment frags for aarch64
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
X-List-Received-Date: Tue, 22 Nov 2016 21:37:22 -0000
Content-Type: text/plain

There was bug with alignment frags for aarch64 in binutils. This is
fixed in master of binutils. This patch backports the fix to binutils
2.27 version.

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/binutils/binutils-2.27.inc   |   1 +
 ...eration-of-alignment-frags-in-code-sectio.patch | 139 +++++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/recipes-devtools/binutils/binutils-2.27.inc
index fc81721..90518bf 100644
--- a/meta/recipes-devtools/binutils/binutils-2.27.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
@@ -37,6 +37,7 @@ SRC_URI = "\
      file://0015-binutils-mips-gas-pic-relax-linkonce.diff \
      file://0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch \
      file://0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch \
+     file://0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
new file mode 100644
index 0000000..f8b46be
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
@@ -0,0 +1,139 @@
+From 4a4286465b5d6c28968bc2b29ae08daca7f219a3 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Fri, 18 Nov 2016 11:42:48 -0800
+Subject: [PATCH] Fix the generation of alignment frags in code sections for AArch64.
+
+PR gas/20364
+* config/tc-aarch64.c (s_ltorg): Change the mapping state after
+aligning the frag.
+(aarch64_init): Treat rs_align frags in code sections as
+containing code, not data.
+* testsuite/gas/aarch64/pr20364.s: New test.
+* testsuite/gas/aarch64/pr20364.d: New test driver.
+
+Backporting the patch from binutils mainline
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=7ea12e5c3ad54da440c08f32da09534e63e515ca
+
+Upstream-Status: Backport
+
+Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
+---
+ gas/ChangeLog                       | 10 ++++++++++
+ gas/config/tc-aarch64.c             | 10 +++++++---
+ gas/testsuite/gas/aarch64/pr20364.d | 13 +++++++++++++
+ gas/testsuite/gas/aarch64/pr20364.s | 28 ++++++++++++++++++++++++++++
+ 4 files changed, 58 insertions(+), 3 deletions(-)
+ create mode 100644 gas/testsuite/gas/aarch64/pr20364.d
+ create mode 100644 gas/testsuite/gas/aarch64/pr20364.s
+
+diff --git a/gas/ChangeLog b/gas/ChangeLog
+index a39895a..fad06dc 100644
+--- a/gas/ChangeLog
++++ b/gas/ChangeLog
+@@ -1,3 +1,13 @@
++2016-08-05  Nick Clifton  <nickc@redhat.com>
++
++	PR gas/20364
++	* config/tc-aarch64.c (s_ltorg): Change the mapping state after
++	aligning the frag.
++	(aarch64_init): Treat rs_align frags in code sections as
++	containing code, not data.
++	* testsuite/gas/aarch64/pr20364.s: New test.
++	* testsuite/gas/aarch64/pr20364.d: New test driver.
++
+ 2016-08-03  Tristan Gingold  <gingold@adacore.com>
+ 
+ 	* configure: Regenerate.
+diff --git a/gas/config/tc-aarch64.c b/gas/config/tc-aarch64.c
+index ddc40f2..74933cb 100644
+--- a/gas/config/tc-aarch64.c
++++ b/gas/config/tc-aarch64.c
+@@ -1736,13 +1736,13 @@ s_ltorg (int ignored ATTRIBUTE_UNUSED)
+       if (pool == NULL || pool->symbol == NULL || pool->next_free_entry == 0)
+ 	continue;
+ 
+-      mapping_state (MAP_DATA);
+-
+       /* Align pool as you have word accesses.
+          Only make a frag if we have to.  */
+       if (!need_pass_2)
+ 	frag_align (align, 0, 0);
+ 
++      mapping_state (MAP_DATA);
++
+       record_alignment (now_seg, align);
+ 
+       sprintf (sym_name, "$$lit_\002%x", pool->id);
+@@ -6373,11 +6373,15 @@ aarch64_init_frag (fragS * fragP, int max_chars)
+ 
+   switch (fragP->fr_type)
+     {
+-    case rs_align:
+     case rs_align_test:
+     case rs_fill:
+       mapping_state_2 (MAP_DATA, max_chars);
+       break;
++    case rs_align:
++      /* PR 20364: We can get alignment frags in code sections,
++	 so do not just assume that we should use the MAP_DATA state.  */
++      mapping_state_2 (subseg_text_p (now_seg) ? MAP_INSN : MAP_DATA, max_chars);
++      break;
+     case rs_align_code:
+       mapping_state_2 (MAP_INSN, max_chars);
+       break;
+diff --git a/gas/testsuite/gas/aarch64/pr20364.d b/gas/testsuite/gas/aarch64/pr20364.d
+new file mode 100644
+index 0000000..babcff1
+--- /dev/null
++++ b/gas/testsuite/gas/aarch64/pr20364.d
+@@ -0,0 +1,13 @@
++# Check that ".align <size>, <fill>" does not set the mapping state to DATA, causing unnecessary frag generation.
++#name: PR20364 
++#objdump: -d
++
++.*:     file format .*
++
++Disassembly of section \.vectors:
++
++0+000 <.*>:
++   0:	d2800000 	mov	x0, #0x0                   	// #0
++   4:	94000000 	bl	0 <plat_report_exception>
++   8:	17fffffe 	b	0 <bl1_exceptions>
++
+diff --git a/gas/testsuite/gas/aarch64/pr20364.s b/gas/testsuite/gas/aarch64/pr20364.s
+new file mode 100644
+index 0000000..594ad7c
+--- /dev/null
++++ b/gas/testsuite/gas/aarch64/pr20364.s
+@@ -0,0 +1,28 @@
++ .macro vector_base label
++ .section .vectors, "ax"
++ .align 11, 0
++ \label:
++ .endm
++
++ .macro vector_entry label
++ .section .vectors, "ax"
++ .align 7, 0
++ \label:
++ .endm
++
++ .macro check_vector_size since
++   .if (. - \since) > (32 * 4)
++     .error "Vector exceeds 32 instructions"
++   .endif
++ .endm
++
++ .globl bl1_exceptions
++
++vector_base bl1_exceptions
++
++vector_entry SynchronousExceptionSP0
++ mov x0, #0x0
++ bl plat_report_exception
++ b SynchronousExceptionSP0
++ check_vector_size SynchronousExceptionSP0
++
+-- 
+2.7.4
+
-- 
2.7.4


