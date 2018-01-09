Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 1119 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 Jan 2018 05:41:50 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0097.outbound.protection.outlook.com [104.47.42.97])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC8671A60
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 05:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=DT5Jr3cZbFM+AxM1SV2e/xvPi7bxpjAYmtA9hlbCdvI=;
	b=QelAJjqn7GraKUQpFAxmAKmYdJNQc4ca2T2/h4XJYXbh5UKnDS/67/cuhTE2YIIPqjK1z52izH9vY7WVUaAeb/5jc0n8tTk6DTWZ4EkQWmIW4oYmNmnqddOIxcphQgdwUIw2wTHjWG+oRA+AylNsRu5npfLWxsYAw1whCV3vAgo=
Received: from BLUPR0301CA0021.namprd03.prod.outlook.com
	(2a01:111:e400:5259::31) by BN1PR0301MB0772.namprd03.prod.outlook.com
	(2a01:111:e400:4c::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.386.5;
	Tue, 9 Jan 2018 05:07:48 +0000
Received: from BN1BFFO11FD032.protection.gbl (2a01:111:f400:7c10::1:176) by
	BLUPR0301CA0021.outlook.office365.com (2a01:111:e400:5259::31) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.386.5 via Frontend Transport; Tue, 9 Jan 2018 05:07:48 +0000
Authentication-Results: spf=neutral (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Neutral (protection.outlook.com: 192.88.168.50 is neither
	permitted nor denied by domain of freescale.com)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD032.mail.protection.outlook.com (10.58.144.95) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.345.12
	via Frontend Transport; Tue, 9 Jan 2018 05:07:17 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	w0957j3Y017810; Mon, 8 Jan 2018 22:07:46 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jan 2018 13:07:40 +0800
Message-ID: <1515474460-24256-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(396003)(39380400002)(346002)(376002)(39860400002)(2980300002)(199004)(189003)(48376002)(53936002)(77096006)(50466002)(104016004)(54906003)(59450400001)(36756003)(5660300001)(47776003)(305945005)(97736004)(4326008)(356003)(2906002)(316002)(8936002)(81166006)(81156014)(51416003)(68736007)(498600001)(16586007)(8656006)(50226002)(6666003)(106466001)(105606002)(6916009)(2351001)(42882006)(8676002)(473944003)(414714003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR0301MB0772;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Neutral;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD032;
	1:mq6yURSfDpT3a/ERxd99tjDzKalNZoEELyQsvCcuqJ3eZGD0f0OnyLGHjXjdIUv8pYKIxvc8ndhOzUEJewy0LTWCB0jM8a1FdFOFKiUW8KV25DzyLjtBDFgfe8Zij9gD
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6c23de9-cf36-4d1b-87fe-08d5571edb25
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060);
	SRVR:BN1PR0301MB0772; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0301MB0772;
	3:AlH1Aca6OTa+C8BnZSb8ytrfc0KNyIuihUaM5GjqltuEkyno6m6GVF1VIHJM0hL8x9ZLukuPD6v6Urr+y5UuLWHbPtMBNNS4/1zgfdPX45wkt/dqpM56/hXIF+YQqeWXUR2AgGMPDkQ0d+PKu118T5qLRp4x+fBoUj7vYxEmwNiHxqKmB4FHIDNH/jkg/WHtbRO38IvIAHFQZPzHmqNNJqPIsWvYwGJ4dHA62Ns5sIuqt1MHuK9A26Dl8ikzyZLg7yGNg7YtPG60FFmC+XPcd6OCtt7k1Lo7WCErzgySsrPFhCbY1fQLHkqOPqJF0jjz6/EpIxVnCMlUnXxpY8Y4zl7x6hNNuhuZuqrd3u3w1Zk=;
	25:hONqiwq7dwOp4pxZftLRLpL8YWIpF1oIwlBcdAFYxM04l3bmmwDYVaHlrKrKk3y78qiNEOT6+35X6wF/E/th3udjboaL7VRjzm3UXCTDVfe21N8+r0Cm/N/Eb9VGjfeW53cCmoScohfcDFwIHa0SEe+JElJHpacEB6AJHjQ6LZaM2WqMDSJZWvpdg177+WXkxnEMegIb2vYKePTtWqpyipFcxgZy6Xh0kKMkY9bPmjULH2ToUJS5kPHURKbtvtlBOoKA5iOzZV84cJh32GIr3ymtNf9XVgbwWVCj9wd4igZs5S8RcXTkT1nQCqjVYHWZVSo+3QVXcgXRmpZkg202BA==
X-MS-TrafficTypeDiagnostic: BN1PR0301MB0772:
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0301MB0772;
	31:zaC2qU50I+cYFZOq6qKz1f/5EzFXGrcoCm+LL++DeeOQig5KvCVDD6lLLH0zvaMh4/uULHl9VSbcWtlQ8B/ge9OfqHUjKdAqcRYnXg/Hog/HM/I9gt/n7mK8B9/RwfUYVgRkIv0KB9eTcNH4mwCooLn5DhHhtk9E4BxWeo8Aaxeb76T6qZMdxYEqeIZv0iKqH2ooNe10qZxk/gQkYHvmaNCPfFL8/VM6QVaaS044WmI=;
	20:xuzpZfYSWiKpzIcnbdnS8dJ010bX5I/lq+wUqOyHVLSNPomOamRWa3rDHmeEfTMRER9SQ/AcwiTb7Fn+dAJaOqHFHwYaY9HTThjKtkXU4RACyTIb0b1a0nODsYNQyc+9BMfGv0tW9h+W18pEllRcgIuhfPAK/anNykf4xbIbOn+QKcd0eKyN2Ngxb7Ok8rkg5CG+QEtyWgnVMctm/7E/s62b5nkS2fACFT7RQMfv2wxvFaG0pl4ZK0QLixdkqfrqEpYirw2cwkrqwrR46XUJTSebGXOWL9x22qJ4Ji3xzk2Lt+bOstiLa6Q9OFSlOy346Ppz1GET2uUXwttDB0CaI9b1hzsZ9WZuj7YN4/hX+pZjG9tVy/EHHPJ/kfNZa7BFmU6oCjJqLcqvX+HSPiDjpL2bSgbmXXKLuc8ffPspOEg+23+GFS/DwxqDnj07DP1St5lMfeImQoJiDxb6Z8WHMVZNkRU26Yf8Kl1NTuEcThz4f5BeWdHMOMULAlAr2vb5oEQcijjhfRe7MxRU0m6T0c9NbLlxrRpXIVYaZQgG4T+O2doZ2Oy6A1Y2jJ1Jv44DgebzBxWHQIvzfzb8ujaFojmsDpCs1QIDmeu9i2evDWo=
X-Microsoft-Antispam-PRVS: <BN1PR0301MB07720BC792CF222FCAF7728084100@BN1PR0301MB0772.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3002001)(93006095)(10201501046)(3231023)(944501075)(6055026)(6041268)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061750153)(6072148)(201708071742011);
	SRVR:BN1PR0301MB0772; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BN1PR0301MB0772; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0301MB0772;
	4:sMWeGSKNIngu2+zsEbVdToqwWLxxUtSCcbuSiSiGuvsQ/xvXndDDNHjmqJ3hJ/4LM1g2z8ul1/a4PVJ9zHR16zHVs2wTEKGwyaObLl8Y1sQCpJ0V221V7Cm/1SACk9yD2OirJysbav3YILm+AvaO4EUoUaDS7glke+tUDbRYMxC9QEvFyZPHO2qE4n41VJ/wNRNbyK+ZjiSnDZXKPCVs5FLSZGoA5vqwLRHvCb2QaPUathhgGA15VsOto0V7ASThAPdlnotArSrbSqsL8UzBubkRHrhPRNu0uCxlyuEi7iXAYcOs6ZhJqdJNOOA7Ch26
X-Forefront-PRVS: 0547116B72
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR0301MB0772;
	23:bV4P6WOzDQd1zW8s+R6WV89KiY2jIq3ZK7liObR?=
	=?us-ascii?Q?2KFu7O9rP9tn69YnHA17Tj0S7TUdJAwfbUwJSsgwu/z81iekFNERcHvFHHch?=
	=?us-ascii?Q?geXMtA5F74fkY4eOY7l9yNGWgcTDLA609ADHettyZa7IXEyrw3i+57BeTatL?=
	=?us-ascii?Q?xQ/S8ObUEdIQ5+QbnrVhY2TnPM3o5T5XnyyA6d0AbWQ8+XWBbLPQMH2/JysO?=
	=?us-ascii?Q?3dLQZb87meUlO3dOpwDTLd+XkjP1CxmOP4/TwpY96IEZvRtscGFRzF5V5+rQ?=
	=?us-ascii?Q?aAi3OGwbAQD3aP9Cd3u3RhCcL8vxEPcWWePuUbmwcbpSJlKiMjfB/uhIF6cT?=
	=?us-ascii?Q?2eTVcy+g4WeZSkTzpppIunvecmMThJeUFTr4aU7/X+dxVrlDkrMLeRz2+gxZ?=
	=?us-ascii?Q?7azd/eLX7ld/Pef0FWVz4tWhY9Outuj4AeCJA22PYgn6MpBwaWY24FjSrlQS?=
	=?us-ascii?Q?3geHPC9Qcmk+aF3uwJGf98GePAuS2vYCQ+FtoMMtf03ie2sJ+L2Hh0InnwEm?=
	=?us-ascii?Q?9ZYjDcFvWAwxT38+AwS0uwyYQHz3JQlZrChGZ4xFwwOAWJoNpwc9hlSVfdCR?=
	=?us-ascii?Q?8uXX5HgRiOe/2FKcBsseTP0yfWzTWAcL/nm1d8NXlPOKnhEMTvM2q6TG1LAd?=
	=?us-ascii?Q?RLn3T+52cocxO8BkIA3C9VqwCR/rHspFE9DJqGi5bmMNh2qSuveKMihVZnYn?=
	=?us-ascii?Q?hrzW51KKkz0awJL2+NaujIF/xKmp4vOxEdLii3sabvo1jlQLkST2hUuqSVEA?=
	=?us-ascii?Q?q/1rP2cvsxE0SghOCXFwIAnWzHjvOPHbaiovuCz8m8WgBClYrocahTemBt6V?=
	=?us-ascii?Q?x7Rw2z5D8EQ4mtfMenEK9DzireOu/BP9uhPQL/+B8lHuUjPh2q65BlGY3abn?=
	=?us-ascii?Q?j8YPPILR2eAzF6buW8o0tEbBlNl3mpU5OP9Iezh5Ezrc7Mx6FqIWuSqjUxof?=
	=?us-ascii?Q?VIBi30dHRYwvIyJBBej6/BQC3/9OqBSBMrsVHrWSet2bRZ1oZStlXoF7Ux0H?=
	=?us-ascii?Q?NJQZO8IvV5KTKoAvL4S63E95j?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0301MB0772;
	6:7uDJINgiu/6XmiJtVxjXD660GRSTTwGTlB3wuVACi3ZT/I1XbslUYo0VSST8nHoqt4yBmjyWqNo8uVKIH6p08D0HmuFAPK4DCgykHoatH6H2z28VPzpzuYze8XNTs8WrrHvaEqg/fDEDPYROxk8O/2RhbvnTKuaV2Gg4c4JGaYWFF1290cY9xYPAaKzDRqTtPel/Q/2NyDM9Yb3eo6/MUYVqfnLoSHs92kPxGshYILKzH+dCqxd/yMRAoufYkB6ZApcnzsKgfJbA6cEPAAXQQjhB5P42htLR2H7gg2l3kWqqxwyd8T4tJRUxIebhodCdNIZskAMP9J48tNRI+omTl0XCTOdgf+83F27DLG+WGuk=;
	5:ecBwTDARxvDqUW0U81KKkFKBJsQ1MUdR6StMoYKYKGpoVNWpYdOofPdxenpL/R1Tqu5Y1hgrvm4TPNV7i5ElpytwCFM+mzGsoLdxa6JBFAfxOkc4J0Wy4F4nnDvnO051+XYrJ/A1KY1lRGA4yWprwbx19/5QchLq2ofKjz5bQu0=;
	24:eukFmmMyNU1zCEMkYDE5gmSmdGPJ6t5UXEiOIkFFEIS2wLjlFBF9/PZhVrQLxHaL6dXxZaY3uURr6GdixT3e2JeE8rdaAS2xL8ymZX67Ocs=;
	7:gxQZGGVSAugfRdVYLL5gOvefVPewbHsjhLafc+UIhOHDrC/szItaYDmLaMRLyPR3wIfCm8/mYLvIW5YeS2bb9wDfIC/m251r4J2FADXgZl+deC25O3rjFS5XHgy1oAIKiihcD2ePdOexpquIK2V9fgvqQktjnhhMcjgTBmXUczxOnrZYUT3hc6avbYyZ1CK6b4WYdL5PvVPY3khW8YltEgcad78ZQFyqhCfvrYb5HpD/1NOQa/c+YxeA/tmQC6Gi
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2018 05:07:17.8382 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c23de9-cf36-4d1b-87fe-08d5571edb25
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR0301MB0772
Cc: chunrong.guo@nxp.com
Subject: [PATCH] coreutils: fix u-a for link
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
X-List-Received-Date: Tue, 09 Jan 2018 05:41:51 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

* busybox installs link to base_bindir not bindir
  /bin/link -> busybox

* so u-a for coreutils fails: update-alternatives: Error: cannot register alternative link to /usr/bin/link since it is already registered to /bin/link

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta/recipes-core/coreutils/coreutils_8.28.bb | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.28.bb b/meta/recipes-core/coreutils/coreutils_8.28.bb
index 8a9e80c..a1cd8f7 100644
--- a/meta/recipes-core/coreutils/coreutils_8.28.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.28.bb
@@ -48,10 +48,10 @@ PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
 PACKAGECONFIG[single-binary] = "--enable-single-binary,--disable-single-binary,,"
 
-# [ df mktemp base64 gets a special treatment and is not included in this
+# [ df link mktemp base64 gets a special treatment and is not included in this
 bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
-                join link logname md5sum mkfifo nice nl nohup nproc od paste pathchk \
+                join logname md5sum mkfifo nice nl nohup nproc od paste pathchk \
                 pinky pr printenv printf ptx readlink realpath runcon seq sha1sum sha224sum sha256sum \
                 sha384sum sha512sum shred shuf sort split stdbuf sum tac tail tee test timeout\
                 tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
@@ -83,7 +83,7 @@ do_install_class-native() {
 }
 
 do_install_append() {
-	for i in df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
+	for i in df link mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
 
 	install -d ${D}${base_bindir}
 	[ "${base_bindir}" != "${bindir}" ] && for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i.${BPN}; done
@@ -107,8 +107,8 @@ do_install_append() {
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base64 mktemp df"
-ALTERNATIVE_${PN}-doc = "base64.1 mktemp.1 df.1 lbracket.1 groups.1 kill.1 uptime.1 stat.1  hostname.1"
+ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base64 mktemp df link"
+ALTERNATIVE_${PN}-doc = "base64.1 mktemp.1 df.1 link.1 lbracket.1 groups.1 kill.1 uptime.1 stat.1  hostname.1"
 
 ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
 
@@ -124,6 +124,10 @@ ALTERNATIVE_LINK_NAME[df] = "${base_bindir}/df"
 ALTERNATIVE_TARGET[df] = "${bindir}/df.${BPN}"
 ALTERNATIVE_LINK_NAME[df.1] = "${mandir}/man1/df.1"
 
+ALTERNATIVE_LINK_NAME[link] = "${base_bindir}/link"
+ALTERNATIVE_TARGET[link] = "${bindir}/link.${BPN}"
+ALTERNATIVE_LINK_NAME[link.1] = "${mandir}/man1/link.1"
+
 ALTERNATIVE_LINK_NAME[lbracket] = "${bindir}/["
 ALTERNATIVE_TARGET[lbracket] = "${bindir}/lbracket.${BPN}"
 ALTERNATIVE_LINK_NAME[lbracket.1] = "${mandir}/man1/lbracket.1"
-- 
1.9.0


