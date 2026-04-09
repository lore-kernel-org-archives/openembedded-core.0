Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D2CE98FBC
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:17:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126110.1775715415269777183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CwE2IHjf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394hWvo3576489
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Apr 2026 06:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=rLJppNSDt4B3AuDp5c86ZaqEWCEGidAC5P7kPlh+mZY=; b=CwE2IHjfy7CU
	IAUPMX5F66BoADFvIx+R10vfXIhYN89Vfpp8HGanPc8pWvPS8BjsrH+OrNyQQ6cL
	sQRmLGHtLbqi/ExRscYopBHtp9uE2dhpop0ygAJsyFhIqm8g6gKX0iiufTkpOkDO
	7xYuzCK4OKkYUTwsXQGFD9KW2YcRbc2leEMANgQ293aaLaiBLjvSb2RPGTFKerRv
	WicrktkBGckmuf7R7Y3f/B2r6EWLCG1IBCPkjyJ3PMpR7iRTjpJBmnR/GAg5Lhlu
	V0//cr//U/JT8LQwFKPMSzLxeQTNQZOBrbFcACeQmfGwbF0t67WWNVxYKLkFjKaj
	9i8qIWvBCA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqkr6f-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:16:53 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:16:53 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:16:52 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 12/12] libpcap: 1.10.4 -> 1.10.6
Date: Thu, 9 Apr 2026 14:16:39 +0800
Message-ID: <20260409061639.1688205-13-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d74455 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=RwghQLH8AAAA:8
 a=t7CeM3EgAAAA:8 a=fk1lIlRQAAAA:8 a=mHr6GJ5fAAAA:8 a=69EAbJreAAAA:8
 a=7TI16aTXAAAA:8 a=a_U1oVfrAAAA:8 a=ClgcVpS-2PsLtnOWRpoA:9
 a=VgwvI4OzJUB2oPFM:21 a=n9nybW_iuiH3Rhfh8WpK:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=U75ogvRika4pmaD_UPO0:22 a=N127T80v9oXcZuUJjtVr:22 a=DEwQIqO_8HGhUEVxq3Bz:22
X-Proofpoint-ORIG-GUID: uMSyO4O__88qhhVSlbbZrLYugW-55eVT
X-Proofpoint-GUID: uMSyO4O__88qhhVSlbbZrLYugW-55eVT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfX3/fSVuSywP+y
 lTQ6OHIWLtB0Dn8KMnQilqMkp9IZvlwGzm5JNI56bdHeC4+3geJPsW10v7Yp6ihI4NxLlJPuE4J
 W/hiH59kFZYmN8tIZTySQR4+uZ3wSZinaZfFLW69q3qpBdT+P4DkgvFB6DU1SwQuHedgPm3GStd
 cCtuNbmTzeByJfYoWLlpQJjbB+zbGtIasRYJsaoWDfb44ItxLGfdUC6On2oa9vBUPmbQxSfgcCn
 qpilwMrgwON/OyT/yk00qHqFva/M4L6cldxp2lVwGFM8kSEyOqhxPoi5N7jColbrHs7wUz0hBy0
 A+d5oVivcTKZkNcOzp9eeN/AgL8/33tCb3GgsCIhVyDHRc+/e3M9yOQ8YBQirJ9wJLTkhpl2J4U
 PtBV9ntGmvryQoNVvd9tXX6JSbr7VrjJNOl9GxP7w0to9R8/7LZz2BbBYV0q3DlyqGsc87nnuWy
 tnivLIpDBVaPFloGS6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234888

From: Kai Kang <kai.kang@windriver.com>

Upgrade libpcap from 1.10.4 to 1.10.6 which includes fix for CVEs.

Remove backported patches which have been incorporated in 1.10.6:

* CVE-2023-7256-pre1.patch
* CVE-2023-7256.patch
* CVE-2024-8006.patch
* CVE-2025-11961-01.patch
* CVE-2025-11961-02.patch
* CVE-2025-11964.patch

[1]: https://nvd.nist.gov/vuln/detail/CVE-2025-11961
[2]: https://nvd.nist.gov/vuln/detail/CVE-2025-11964

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../libpcap/libpcap/CVE-2023-7256-pre1.patch  |  37 --
 .../libpcap/libpcap/CVE-2023-7256.patch       | 365 ---------------
 .../libpcap/libpcap/CVE-2024-8006.patch       |  42 --
 .../libpcap/libpcap/CVE-2025-11961-01.patch   |  38 --
 .../libpcap/libpcap/CVE-2025-11961-02.patch   | 433 ------------------
 .../libpcap/libpcap/CVE-2025-11964.patch      |  33 --
 .../{libpcap_1.10.4.bb => libpcap_1.10.6.bb}  |   8 +-
 7 files changed, 1 insertion(+), 955 deletions(-)
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-02.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.4.bb => libpcap_1.10.6.bb} (83%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patch
deleted file mode 100644
index 64abfb85cd..0000000000
--- a/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 73da0d4d65ef0925772b7b7f82a5fbb3ff2c5e4f Mon Sep 17 00:00:00 2001
-From: Rose <83477269+AtariDreams@users.noreply.github.com>
-Date: Tue, 16 May 2023 12:37:11 -0400
-Subject: [PATCH] Remove unused variable retval in sock_present2network
-
-This quiets the compiler since it is not even returned anyway, and is a misleading variable name.
-
-(cherry picked from commit c7b90298984c46d820d3cee79a96d24870b5f200)
-
-Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/73da0d4d65ef0925772b7b7f82a5fbb3ff2c5e4f]
-CVE: CVE-2023-7256 #Dependency Patch
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- sockutils.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/sockutils.c b/sockutils.c
-index 1c07f76fd1..6752f296af 100644
---- a/sockutils.c
-+++ b/sockutils.c
-@@ -2082,7 +2082,6 @@ int sock_getascii_addrport(const struct sockaddr_storage *sockaddr, char *addres
-  */
- int sock_present2network(const char *address, struct sockaddr_storage *sockaddr, int addr_family, char *errbuf, int errbuflen)
- {
--	int retval;
- 	struct addrinfo *addrinfo;
- 	struct addrinfo hints;
- 
-@@ -2090,7 +2089,7 @@ int sock_present2network(const char *address, struct sockaddr_storage *sockaddr,
- 
- 	hints.ai_family = addr_family;
- 
--	if ((retval = sock_initaddress(address, "22222" /* fake port */, &hints, &addrinfo, errbuf, errbuflen)) == -1)
-+	if (sock_initaddress(address, "22222" /* fake port */, &hints, &addrinfo, errbuf, errbuflen) == -1)
- 		return 0;
- 
- 	if (addrinfo->ai_family == PF_INET)
diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.patch
deleted file mode 100644
index fffcb2704a..0000000000
--- a/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.patch
+++ /dev/null
@@ -1,365 +0,0 @@
-From 2aa69b04d8173b18a0e3492e0c8f2f7fabdf642d Mon Sep 17 00:00:00 2001
-From: Guy Harris <gharris@sonic.net>
-Date: Thu, 28 Sep 2023 00:37:57 -0700
-Subject: [PATCH] Have sock_initaddress() return the list of addrinfo
- structures or NULL.
-
-Its return address is currently 0 for success and -1 for failure, with a
-pointer to the first element of the list of struct addrinfos returned
-through a pointer on success; change it to return that pointer on
-success and NULL on failure.
-
-That way, we don't have to worry about what happens to the pointer
-pointeed to by the argument in question on failure; we know that we got
-NULL back if no struct addrinfos were found because getaddrinfo()
-failed.  Thus, we know that we have something to free iff
-sock_initaddress() returned a pointer to that something rather than
-returning NULL.
-
-This avoids a double-free in some cases.
-
-This is apparently CVE-2023-40400.
-
-(backported from commit 262e4f34979872d822ccedf9f318ed89c4d31c03)
-
-Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/2aa69b04d8173b18a0e3492e0c8f2f7fabdf642d]
-CVE: CVE-2023-7256
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- pcap-rpcap.c    | 48 ++++++++++++++++++++--------------------
- rpcapd/daemon.c |  8 +++++--
- rpcapd/rpcapd.c |  8 +++++--
- sockutils.c     | 58 ++++++++++++++++++++++++++++---------------------
- sockutils.h     |  5 ++---
- 5 files changed, 72 insertions(+), 55 deletions(-)
-
-diff --git a/pcap-rpcap.c b/pcap-rpcap.c
-index ef0cd6e49c..f1992e4aea 100644
---- a/pcap-rpcap.c
-+++ b/pcap-rpcap.c
-@@ -1024,7 +1024,6 @@ rpcap_remoteact_getsock(const char *host, int *error, char *errbuf)
- {
- 	struct activehosts *temp;			/* temp var needed to scan the host list chain */
- 	struct addrinfo hints, *addrinfo, *ai_next;	/* temp var needed to translate between hostname to its address */
--	int retval;
- 
- 	/* retrieve the network address corresponding to 'host' */
- 	addrinfo = NULL;
-@@ -1032,9 +1031,9 @@ rpcap_remoteact_getsock(const char *host, int *error, char *errbuf)
- 	hints.ai_family = PF_UNSPEC;
- 	hints.ai_socktype = SOCK_STREAM;
- 
--	retval = sock_initaddress(host, NULL, &hints, &addrinfo, errbuf,
-+	addrinfo = sock_initaddress(host, NULL, &hints, errbuf,
- 	    PCAP_ERRBUF_SIZE);
--	if (retval != 0)
-+	if (addrinfo == NULL)
- 	{
- 		*error = 1;
- 		return NULL;
-@@ -1186,7 +1185,9 @@ static int pcap_startcapture_remote(pcap_t *fp)
- 		hints.ai_flags = AI_PASSIVE;	/* Data connection is opened by the server toward the client */
- 
- 		/* Let's the server pick up a free network port for us */
--		if (sock_initaddress(NULL, NULL, &hints, &addrinfo, fp->errbuf, PCAP_ERRBUF_SIZE) == -1)
-+		addrinfo = sock_initaddress(NULL, NULL, &hints, fp->errbuf,
-+		    PCAP_ERRBUF_SIZE);
-+		if (addrinfo == NULL)
- 			goto error_nodiscard;
- 
- 		if ((sockdata = sock_open(NULL, addrinfo, SOCKOPEN_SERVER,
-@@ -1311,7 +1312,9 @@ static int pcap_startcapture_remote(pcap_t *fp)
- 			snprintf(portstring, PCAP_BUF_SIZE, "%d", ntohs(startcapreply.portdata));
- 
- 			/* Let's the server pick up a free network port for us */
--			if (sock_initaddress(host, portstring, &hints, &addrinfo, fp->errbuf, PCAP_ERRBUF_SIZE) == -1)
-+			addrinfo = sock_initaddress(host, portstring, &hints,
-+			    fp->errbuf, PCAP_ERRBUF_SIZE);
-+			if (addrinfo == NULL)
- 				goto error;
- 
- 			if ((sockdata = sock_open(host, addrinfo, SOCKOPEN_CLIENT, 0, fp->errbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
-@@ -2340,16 +2343,16 @@ rpcap_setup_session(const char *source, struct pcap_rmtauth *auth,
- 		if (port[0] == 0)
- 		{
- 			/* the user chose not to specify the port */
--			if (sock_initaddress(host, RPCAP_DEFAULT_NETPORT,
--			    &hints, &addrinfo, errbuf, PCAP_ERRBUF_SIZE) == -1)
--				return -1;
-+			addrinfo = sock_initaddress(host, RPCAP_DEFAULT_NETPORT,
-+			    &hints, errbuf, PCAP_ERRBUF_SIZE);
- 		}
- 		else
- 		{
--			if (sock_initaddress(host, port, &hints, &addrinfo,
--			    errbuf, PCAP_ERRBUF_SIZE) == -1)
--				return -1;
-+			addrinfo = sock_initaddress(host, port, &hints,
-+			    errbuf, PCAP_ERRBUF_SIZE);
- 		}
-+		if (addrinfo == NULL)
-+			return -1;
- 
- 		if ((*sockctrlp = sock_open(host, addrinfo, SOCKOPEN_CLIENT, 0,
- 		    errbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
-@@ -2950,19 +2953,19 @@ SOCKET pcap_remoteact_accept_ex(const char *address, const char *port, const cha
- 	/* Do the work */
- 	if ((port == NULL) || (port[0] == 0))
- 	{
--		if (sock_initaddress(address, RPCAP_DEFAULT_NETPORT_ACTIVE, &hints, &addrinfo, errbuf, PCAP_ERRBUF_SIZE) == -1)
--		{
--			return (SOCKET)-2;
--		}
-+		addrinfo = sock_initaddress(address,
-+		    RPCAP_DEFAULT_NETPORT_ACTIVE, &hints, errbuf,
-+		    PCAP_ERRBUF_SIZE);
- 	}
- 	else
- 	{
--		if (sock_initaddress(address, port, &hints, &addrinfo, errbuf, PCAP_ERRBUF_SIZE) == -1)
--		{
--			return (SOCKET)-2;
--		}
-+		addrinfo = sock_initaddress(address, port, &hints, errbuf,
-+		    PCAP_ERRBUF_SIZE);
-+	}
-+	if (addrinfo == NULL)
-+	{
-+		return (SOCKET)-2;
- 	}
--
- 
- 	if ((sockmain = sock_open(NULL, addrinfo, SOCKOPEN_SERVER, 1, errbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
- 	{
-@@ -3122,7 +3125,6 @@ int pcap_remoteact_close(const char *host, char *errbuf)
- {
- 	struct activehosts *temp, *prev;	/* temp var needed to scan the host list chain */
- 	struct addrinfo hints, *addrinfo, *ai_next;	/* temp var needed to translate between hostname to its address */
--	int retval;
- 
- 	temp = activeHosts;
- 	prev = NULL;
-@@ -3133,9 +3135,9 @@ int pcap_remoteact_close(const char *host, char *errbuf)
- 	hints.ai_family = PF_UNSPEC;
- 	hints.ai_socktype = SOCK_STREAM;
- 
--	retval = sock_initaddress(host, NULL, &hints, &addrinfo, errbuf,
-+	addrinfo = sock_initaddress(host, NULL, &hints, errbuf,
- 	    PCAP_ERRBUF_SIZE);
--	if (retval != 0)
-+	if (addrinfo == NULL)
- 	{
- 		return -1;
- 	}
-diff --git a/rpcapd/daemon.c b/rpcapd/daemon.c
-index 8d620dd604..b04b29f107 100644
---- a/rpcapd/daemon.c
-+++ b/rpcapd/daemon.c
-@@ -2085,7 +2085,9 @@ daemon_msg_startcap_req(uint8 ver, struct daemon_slpars *pars, uint32 plen,
- 			goto error;
- 		}
- 
--		if (sock_initaddress(peerhost, portdata, &hints, &addrinfo, errmsgbuf, PCAP_ERRBUF_SIZE) == -1)
-+		addrinfo = sock_initaddress(peerhost, portdata, &hints,
-+		    errmsgbuf, PCAP_ERRBUF_SIZE);
-+		if (addrinfo == NULL)
- 			goto error;
- 
- 		if ((session->sockdata = sock_open(peerhost, addrinfo, SOCKOPEN_CLIENT, 0, errmsgbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
-@@ -2096,7 +2098,9 @@ daemon_msg_startcap_req(uint8 ver, struct daemon_slpars *pars, uint32 plen,
- 		hints.ai_flags = AI_PASSIVE;
- 
- 		// Make the server socket pick up a free network port for us
--		if (sock_initaddress(NULL, NULL, &hints, &addrinfo, errmsgbuf, PCAP_ERRBUF_SIZE) == -1)
-+		addrinfo = sock_initaddress(NULL, NULL, &hints, errmsgbuf,
-+		    PCAP_ERRBUF_SIZE);
-+		if (addrinfo == NULL)
- 			goto error;
- 
- 		if ((session->sockdata = sock_open(NULL, addrinfo, SOCKOPEN_SERVER, 1 /* max 1 connection in queue */, errmsgbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
-diff --git a/rpcapd/rpcapd.c b/rpcapd/rpcapd.c
-index e1f3f05299..d166522c9f 100644
---- a/rpcapd/rpcapd.c
-+++ b/rpcapd/rpcapd.c
-@@ -611,7 +611,9 @@ void main_startup(void)
- 		//
- 		// Get a list of sockets on which to listen.
- 		//
--		if (sock_initaddress((address[0]) ? address : NULL, port, &mainhints, &addrinfo, errbuf, PCAP_ERRBUF_SIZE) == -1)
-+		addrinfo = sock_initaddress((address[0]) ? address : NULL,
-+		    port, &mainhints, errbuf, PCAP_ERRBUF_SIZE);
-+		if (addrinfo == NULL)
- 		{
- 			rpcapd_log(LOGPRIO_DEBUG, "%s", errbuf);
- 			return;
-@@ -1350,7 +1352,9 @@ main_active(void *ptr)
- 	memset(errbuf, 0, sizeof(errbuf));
- 
- 	// Do the work
--	if (sock_initaddress(activepars->address, activepars->port, &hints, &addrinfo, errbuf, PCAP_ERRBUF_SIZE) == -1)
-+	addrinfo = sock_initaddress(activepars->address, activepars->port,
-+	    &hints, errbuf, PCAP_ERRBUF_SIZE);
-+	if (addrinfo == NULL)
- 	{
- 		rpcapd_log(LOGPRIO_DEBUG, "%s", errbuf);
- 		return 0;
-diff --git a/sockutils.c b/sockutils.c
-index a1bfa1b5e2..823c2363e0 100644
---- a/sockutils.c
-+++ b/sockutils.c
-@@ -1069,20 +1069,21 @@ get_gai_errstring(char *errbuf, int errbuflen, const char *prefix, int err,
-  * \param errbuflen: length of the buffer that will contains the error. The error message cannot be
-  * larger than 'errbuflen - 1' because the last char is reserved for the string terminator.
-  *
-- * \return '0' if everything is fine, '-1' if some errors occurred. The error message is returned
-- * in the 'errbuf' variable. The addrinfo variable that has to be used in the following sockets calls is
-- * returned into the addrinfo parameter.
-+ * \return a pointer to the first element in a list of addrinfo structures
-+ * if everything is fine, NULL if some errors occurred. The error message
-+ * is returned in the 'errbuf' variable.
-  *
-- * \warning The 'addrinfo' variable has to be deleted by the programmer by calling freeaddrinfo() when
-- * it is no longer needed.
-+ * \warning The list of addrinfo structures returned has to be deleted by
-+ * the programmer by calling freeaddrinfo() when it is no longer needed.
-  *
-  * \warning This function requires the 'hints' variable as parameter. The semantic of this variable is the same
-  * of the one of the corresponding variable used into the standard getaddrinfo() socket function. We suggest
-  * the programmer to look at that function in order to set the 'hints' variable appropriately.
-  */
--int sock_initaddress(const char *host, const char *port,
--    struct addrinfo *hints, struct addrinfo **addrinfo, char *errbuf, int errbuflen)
-+struct addrinfo *sock_initaddress(const char *host, const char *port,
-+    struct addrinfo *hints, char *errbuf, int errbuflen)
- {
-+	struct addrinfo *addrinfo;
- 	int retval;
- 
- 	/*
-@@ -1094,9 +1095,13 @@ int sock_initaddress(const char *host, const char *port,
- 	 * as those messages won't talk about a problem with the port if
- 	 * no port was specified.
- 	 */
--	retval = getaddrinfo(host, port == NULL ? "0" : port, hints, addrinfo);
-+	retval = getaddrinfo(host, port == NULL ? "0" : port, hints, &addrinfo);
- 	if (retval != 0)
- 	{
-+		/*
-+		 * That call failed.
-+		 * Determine whether the problem is that the host is bad.
-+		 */
- 		if (errbuf)
- 		{
- 			if (host != NULL && port != NULL) {
-@@ -1108,7 +1113,7 @@ int sock_initaddress(const char *host, const char *port,
- 				int try_retval;
- 
- 				try_retval = getaddrinfo(host, NULL, hints,
--				    addrinfo);
-+				    &addrinfo);
- 				if (try_retval == 0) {
- 					/*
- 					 * Worked with just the host,
-@@ -1117,14 +1122,16 @@ int sock_initaddress(const char *host, const char *port,
- 					 *
- 					 * Free up the address info first.
- 					 */
--					freeaddrinfo(*addrinfo);
-+					freeaddrinfo(addrinfo);
- 					get_gai_errstring(errbuf, errbuflen,
- 					    "", retval, NULL, port);
- 				} else {
- 					/*
- 					 * Didn't work with just the host,
- 					 * so assume the problem is
--					 * with the host.
-+					 * with the host; we assume
-+					 * the original error indicates
-+					 * the underlying problem.
- 					 */
- 					get_gai_errstring(errbuf, errbuflen,
- 					    "", retval, host, NULL);
-@@ -1132,13 +1139,14 @@ int sock_initaddress(const char *host, const char *port,
- 			} else {
- 				/*
- 				 * Either the host or port was null, so
--				 * there's nothing to determine.
-+				 * there's nothing to determine; report
-+				 * the error from the original call.
- 				 */
- 				get_gai_errstring(errbuf, errbuflen, "",
- 				    retval, host, port);
- 			}
- 		}
--		return -1;
-+		return NULL;
- 	}
- 	/*
- 	 * \warning SOCKET: I should check all the accept() in order to bind to all addresses in case
-@@ -1153,30 +1161,28 @@ int sock_initaddress(const char *host, const char *port,
- 	 * ignore all addresses that are neither?  (What, no IPX
- 	 * support? :-))
- 	 */
--	if (((*addrinfo)->ai_family != PF_INET) &&
--	    ((*addrinfo)->ai_family != PF_INET6))
-+	if ((addrinfo->ai_family != PF_INET) &&
-+	    (addrinfo->ai_family != PF_INET6))
- 	{
- 		if (errbuf)
- 			snprintf(errbuf, errbuflen, "getaddrinfo(): socket type not supported");
--		freeaddrinfo(*addrinfo);
--		*addrinfo = NULL;
--		return -1;
-+		freeaddrinfo(addrinfo);
-+		return NULL;
- 	}
- 
- 	/*
- 	 * You can't do multicast (or broadcast) TCP.
- 	 */
--	if (((*addrinfo)->ai_socktype == SOCK_STREAM) &&
--	    (sock_ismcastaddr((*addrinfo)->ai_addr) == 0))
-+	if ((addrinfo->ai_socktype == SOCK_STREAM) &&
-+	    (sock_ismcastaddr(addrinfo->ai_addr) == 0))
- 	{
- 		if (errbuf)
- 			snprintf(errbuf, errbuflen, "getaddrinfo(): multicast addresses are not valid when using TCP streams");
--		freeaddrinfo(*addrinfo);
--		*addrinfo = NULL;
--		return -1;
-+		freeaddrinfo(addrinfo);
-+		return NULL;
- 	}
- 
--	return 0;
-+	return addrinfo;
- }
- 
- /*
-@@ -2089,7 +2095,9 @@ int sock_present2network(const char *address, struct sockaddr_storage *sockaddr,
- 
- 	hints.ai_family = addr_family;
- 
--	if (sock_initaddress(address, "22222" /* fake port */, &hints, &addrinfo, errbuf, errbuflen) == -1)
-+	addrinfo = sock_initaddress(address, "22222" /* fake port */, &hints,
-+	    errbuf, errbuflen);
-+	if (addrinfo == NULL)
- 		return 0;
- 
- 	if (addrinfo->ai_family == PF_INET)
-diff --git a/sockutils.h b/sockutils.h
-index a488d8fcb4..30b8cfe0b7 100644
---- a/sockutils.h
-+++ b/sockutils.h
-@@ -138,9 +138,8 @@ void sock_fmterrmsg(char *errbuf, size_t errbuflen, int errcode,
-     PCAP_FORMAT_STRING(const char *fmt), ...) PCAP_PRINTFLIKE(4, 5);
- void sock_geterrmsg(char *errbuf, size_t errbuflen,
-     PCAP_FORMAT_STRING(const char *fmt), ...)  PCAP_PRINTFLIKE(3, 4);
--int sock_initaddress(const char *address, const char *port,
--    struct addrinfo *hints, struct addrinfo **addrinfo,
--    char *errbuf, int errbuflen);
-+struct addrinfo *sock_initaddress(const char *address, const char *port,
-+    struct addrinfo *hints, char *errbuf, int errbuflen);
- int sock_recv(SOCKET sock, SSL *, void *buffer, size_t size, int receiveall,
-     char *errbuf, int errbuflen);
- int sock_recv_dgram(SOCKET sock, SSL *, void *buffer, size_t size,
diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch
deleted file mode 100644
index 6819aedd20..0000000000
--- a/meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 8a633ee5b9ecd9d38a587ac9b204e2380713b0d6 Mon Sep 17 00:00:00 2001
-From: Nicolas Badoux <n.badoux@hotmail.com>
-Date: Mon, 19 Aug 2024 12:31:53 +0200
-Subject: [PATCH] makes pcap_findalldevs_ex errors out if the directory does
- not exist
-
-(backported from commit 0f8a103469ce87d2b8d68c5130a46ddb7fb5eb29)
-
-Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/8a633ee5b9ecd9d38a587ac9b204e2380713b0d6]
-CVE: CVE-2024-8006
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- pcap-new.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/pcap-new.c b/pcap-new.c
-index be91b3f8db..d449ee623c 100644
---- a/pcap-new.c
-+++ b/pcap-new.c
-@@ -230,6 +230,13 @@ int pcap_findalldevs_ex(const char *source, struct pcap_rmtauth *auth, pcap_if_t
- #else
- 		/* opening the folder */
- 		unixdir= opendir(path);
-+		if (unixdir == NULL) {
-+			DIAG_OFF_FORMAT_TRUNCATION
-+			snprintf(errbuf, PCAP_ERRBUF_SIZE,
-+			    "Error when listing files: does folder '%s' exist?", path);
-+			DIAG_ON_FORMAT_TRUNCATION
-+			return -1;
-+		}
- 
- 		/* get the first file into it */
- 		filedata= readdir(unixdir);
-@@ -237,7 +244,7 @@ int pcap_findalldevs_ex(const char *source, struct pcap_rmtauth *auth, pcap_if_t
- 		if (filedata == NULL)
- 		{
- 			DIAG_OFF_FORMAT_TRUNCATION
--			snprintf(errbuf, PCAP_ERRBUF_SIZE, "Error when listing files: does folder '%s' exist?", path);
-+			snprintf(errbuf, PCAP_ERRBUF_SIZE, "Error when listing files: does folder '%s' contain files?", path);
- 			DIAG_ON_FORMAT_TRUNCATION
- 			closedir(unixdir);
- 			return -1;
diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch
deleted file mode 100644
index 73c3ab3f5c..0000000000
--- a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 7224be0fe2f4beb916b7b69141f478facd0f0634 Mon Sep 17 00:00:00 2001
-From: Denis Ovsienko <denis@ovsienko.info>
-Date: Sat, 27 Dec 2025 21:36:11 +0000
-Subject: [PATCH] Rename one of the xdtoi() copies to simplify backporting.
-
-CVE: CVE-2025-11961
-Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/7224be0fe2f4beb916b7b69141f478facd0f0634]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- nametoaddr.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/nametoaddr.c b/nametoaddr.c
-index dc75495c..bdaacbf1 100644
---- a/nametoaddr.c
-+++ b/nametoaddr.c
-@@ -646,7 +646,7 @@ pcap_nametollc(const char *s)
- 
- /* Hex digit to 8-bit unsigned integer. */
- static inline u_char
--xdtoi(u_char c)
-+pcapint_xdtoi(u_char c)
- {
- 	if (c >= '0' && c <= '9')
- 		return (u_char)(c - '0');
-@@ -728,10 +728,10 @@ pcap_ether_aton(const char *s)
- 	while (*s) {
- 		if (*s == ':' || *s == '.' || *s == '-')
- 			s += 1;
--		d = xdtoi(*s++);
-+		d = pcapint_xdtoi(*s++);
- 		if (PCAP_ISXDIGIT(*s)) {
- 			d <<= 4;
--			d |= xdtoi(*s++);
-+			d |= pcapint_xdtoi(*s++);
- 		}
- 		*ep++ = d;
- 	}
diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-02.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-02.patch
deleted file mode 100644
index 2dca7908ef..0000000000
--- a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-02.patch
+++ /dev/null
@@ -1,433 +0,0 @@
-From b2d2f9a9a0581c40780bde509f7cc715920f1c02 Mon Sep 17 00:00:00 2001
-From: Denis Ovsienko <denis@ovsienko.info>
-Date: Fri, 19 Dec 2025 17:31:13 +0000
-Subject: [PATCH] CVE-2025-11961: Fix OOBR and OOBW in pcap_ether_aton().
-
-pcap_ether_aton() has for a long time required its string argument to be
-a well-formed MAC-48 address, which is always the case when the argument
-comes from other libpcap code, so the function has never validated the
-input and used a simple loop to parse any of the three common MAC-48
-address formats.  However, the function has also been a part of the
-public API, so calling it directly with a malformed address can cause
-the loop to read beyond the end of the input string and/or to write
-beyond the end of the allocated output buffer.
-
-To handle invalid input more appropriately, replace the simple loop with
-new functions and require the input to match a supported address format.
-
-This problem was reported by Jin Wei, Kunwei Qian and Ping Chen.
-
-(backported from commit dd08e53e9380e217ae7c7768da9cc3d7bf37bf83)
-
-CVE: CVE-2025-11961
-Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/b2d2f9a9a0581c40780bde509f7cc715920f1c02]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- gencode.c    |   5 +
- nametoaddr.c | 367 +++++++++++++++++++++++++++++++++++++++++++++++----
- 2 files changed, 349 insertions(+), 23 deletions(-)
-
-diff --git a/gencode.c b/gencode.c
-index 3ddd15f8..76fb2d82 100644
---- a/gencode.c
-+++ b/gencode.c
-@@ -7228,6 +7228,11 @@ gen_ecode(compiler_state_t *cstate, const char *s, struct qual q)
- 		return (NULL);
- 
- 	if ((q.addr == Q_HOST || q.addr == Q_DEFAULT) && q.proto == Q_LINK) {
-+		/*
-+		 * Because the lexer guards the input string format, in this
-+		 * context the function returns NULL iff the implicit malloc()
-+		 * has failed.
-+		 */
- 		cstate->e = pcap_ether_aton(s);
- 		if (cstate->e == NULL)
- 			bpf_error(cstate, "malloc");
-diff --git a/nametoaddr.c b/nametoaddr.c
-index f9fcd288..f50d0da5 100644
---- a/nametoaddr.c
-+++ b/nametoaddr.c
-@@ -703,39 +703,360 @@ __pcap_atodn(const char *s, bpf_u_int32 *addr)
- 	return(32);
- }
- 
-+// Man page: "xxxxxxxxxxxx", regexp: "^[0-9a-fA-F]{12}$".
-+static u_char
-+pcapint_atomac48_xxxxxxxxxxxx(const char *s, uint8_t *addr)
-+{
-+	if (strlen(s) == 12 &&
-+	    PCAP_ISXDIGIT(s[0]) &&
-+	    PCAP_ISXDIGIT(s[1]) &&
-+	    PCAP_ISXDIGIT(s[2]) &&
-+	    PCAP_ISXDIGIT(s[3]) &&
-+	    PCAP_ISXDIGIT(s[4]) &&
-+	    PCAP_ISXDIGIT(s[5]) &&
-+	    PCAP_ISXDIGIT(s[6]) &&
-+	    PCAP_ISXDIGIT(s[7]) &&
-+	    PCAP_ISXDIGIT(s[8]) &&
-+	    PCAP_ISXDIGIT(s[9]) &&
-+	    PCAP_ISXDIGIT(s[10]) &&
-+	    PCAP_ISXDIGIT(s[11])) {
-+		addr[0] = pcapint_xdtoi(s[0]) << 4 | pcapint_xdtoi(s[1]);
-+		addr[1] = pcapint_xdtoi(s[2]) << 4 | pcapint_xdtoi(s[3]);
-+		addr[2] = pcapint_xdtoi(s[4]) << 4 | pcapint_xdtoi(s[5]);
-+		addr[3] = pcapint_xdtoi(s[6]) << 4 | pcapint_xdtoi(s[7]);
-+		addr[4] = pcapint_xdtoi(s[8]) << 4 | pcapint_xdtoi(s[9]);
-+		addr[5] = pcapint_xdtoi(s[10]) << 4 | pcapint_xdtoi(s[11]);
-+		return 1;
-+	}
-+	return 0;
-+}
-+
-+// Man page: "xxxx.xxxx.xxxx", regexp: "^[0-9a-fA-F]{4}(\.[0-9a-fA-F]{4}){2}$".
-+static u_char
-+pcapint_atomac48_xxxx_3_times(const char *s, uint8_t *addr)
-+{
-+	const char sep = '.';
-+	if (strlen(s) == 14 &&
-+	    PCAP_ISXDIGIT(s[0]) &&
-+	    PCAP_ISXDIGIT(s[1]) &&
-+	    PCAP_ISXDIGIT(s[2]) &&
-+	    PCAP_ISXDIGIT(s[3]) &&
-+	    s[4] == sep &&
-+	    PCAP_ISXDIGIT(s[5]) &&
-+	    PCAP_ISXDIGIT(s[6]) &&
-+	    PCAP_ISXDIGIT(s[7]) &&
-+	    PCAP_ISXDIGIT(s[8]) &&
-+	    s[9] == sep &&
-+	    PCAP_ISXDIGIT(s[10]) &&
-+	    PCAP_ISXDIGIT(s[11]) &&
-+	    PCAP_ISXDIGIT(s[12]) &&
-+	    PCAP_ISXDIGIT(s[13])) {
-+		addr[0] = pcapint_xdtoi(s[0]) << 4 | pcapint_xdtoi(s[1]);
-+		addr[1] = pcapint_xdtoi(s[2]) << 4 | pcapint_xdtoi(s[3]);
-+		addr[2] = pcapint_xdtoi(s[5]) << 4 | pcapint_xdtoi(s[6]);
-+		addr[3] = pcapint_xdtoi(s[7]) << 4 | pcapint_xdtoi(s[8]);
-+		addr[4] = pcapint_xdtoi(s[10]) << 4 | pcapint_xdtoi(s[11]);
-+		addr[5] = pcapint_xdtoi(s[12]) << 4 | pcapint_xdtoi(s[13]);
-+		return 1;
-+	}
-+	return 0;
-+}
-+
- /*
-- * Convert 's', which can have the one of the forms:
-+ * Man page: "xx:xx:xx:xx:xx:xx", regexp: "^[0-9a-fA-F]{1,2}(:[0-9a-fA-F]{1,2}){5}$".
-+ * Man page: "xx-xx-xx-xx-xx-xx", regexp: "^[0-9a-fA-F]{1,2}(-[0-9a-fA-F]{1,2}){5}$".
-+ * Man page: "xx.xx.xx.xx.xx.xx", regexp: "^[0-9a-fA-F]{1,2}(\.[0-9a-fA-F]{1,2}){5}$".
-+ * (Any "xx" above can be "x", which is equivalent to "0x".)
-  *
-- *	"xx:xx:xx:xx:xx:xx"
-- *	"xx.xx.xx.xx.xx.xx"
-- *	"xx-xx-xx-xx-xx-xx"
-- *	"xxxx.xxxx.xxxx"
-- *	"xxxxxxxxxxxx"
-+ * An equivalent (and parametrisable for EUI-64) FSM could be implemented using
-+ * a smaller graph, but that graph would be neither acyclic nor planar nor
-+ * trivial to verify.
-  *
-- * (or various mixes of ':', '.', and '-') into a new
-- * ethernet address.  Assumes 's' is well formed.
-+ *                |
-+ *    [.]         v
-+ * +<---------- START
-+ * |              |
-+ * |              | [0-9a-fA-F]
-+ * |  [.]         v
-+ * +<--------- BYTE0_X ----------+
-+ * |              |              |
-+ * |              | [0-9a-fA-F]  |
-+ * |  [.]         v              |
-+ * +<--------- BYTE0_XX          | [:\.-]
-+ * |              |              |
-+ * |              | [:\.-]       |
-+ * |  [.]         v              |
-+ * +<----- BYTE0_SEP_BYTE1 <-----+
-+ * |              |
-+ * |              | [0-9a-fA-F]
-+ * |  [.]         v
-+ * +<--------- BYTE1_X ----------+
-+ * |              |              |
-+ * |              | [0-9a-fA-F]  |
-+ * |  [.]         v              |
-+ * +<--------- BYTE1_XX          | <sep>
-+ * |              |              |
-+ * |              | <sep>        |
-+ * |  [.]         v              |
-+ * +<----- BYTE1_SEP_BYTE2 <-----+
-+ * |              |
-+ * |              | [0-9a-fA-F]
-+ * |  [.]         v
-+ * +<--------- BYTE2_X ----------+
-+ * |              |              |
-+ * |              | [0-9a-fA-F]  |
-+ * |  [.]         v              |
-+ * +<--------- BYTE2_XX          | <sep>
-+ * |              |              |
-+ * |              | <sep>        |
-+ * |  [.]         v              |
-+ * +<----- BYTE2_SEP_BYTE3 <-----+
-+ * |              |
-+ * |              | [0-9a-fA-F]
-+ * |  [.]         v
-+ * +<--------- BYTE3_X ----------+
-+ * |              |              |
-+ * |              | [0-9a-fA-F]  |
-+ * |  [.]         v              |
-+ * +<--------- BYTE3_XX          | <sep>
-+ * |              |              |
-+ * |              | <sep>        |
-+ * |  [.]         v              |
-+ * +<----- BYTE3_SEP_BYTE4 <-----+
-+ * |              |
-+ * |              | [0-9a-fA-F]
-+ * |  [.]         v
-+ * +<--------- BYTE4_X ----------+
-+ * |              |              |
-+ * |              | [0-9a-fA-F]  |
-+ * |  [.]         v              |
-+ * +<--------- BYTE4_XX          | <sep>
-+ * |              |              |
-+ * |              | <sep>        |
-+ * |  [.]         v              |
-+ * +<----- BYTE4_SEP_BYTE5 <-----+
-+ * |              |
-+ * |              | [0-9a-fA-F]
-+ * |  [.]         v
-+ * +<--------- BYTE5_X ----------+
-+ * |              |              |
-+ * |              | [0-9a-fA-F]  |
-+ * |  [.]         v              |
-+ * +<--------- BYTE5_XX          | \0
-+ * |              |              |
-+ * |              | \0           |
-+ * |              |              v
-+ * +--> (reject)  +---------> (accept)
-+ *
-+ */
-+static u_char
-+pcapint_atomac48_x_xx_6_times(const char *s, uint8_t *addr)
-+{
-+	enum {
-+		START,
-+		BYTE0_X,
-+		BYTE0_XX,
-+		BYTE0_SEP_BYTE1,
-+		BYTE1_X,
-+		BYTE1_XX,
-+		BYTE1_SEP_BYTE2,
-+		BYTE2_X,
-+		BYTE2_XX,
-+		BYTE2_SEP_BYTE3,
-+		BYTE3_X,
-+		BYTE3_XX,
-+		BYTE3_SEP_BYTE4,
-+		BYTE4_X,
-+		BYTE4_XX,
-+		BYTE4_SEP_BYTE5,
-+		BYTE5_X,
-+		BYTE5_XX,
-+	} fsm_state = START;
-+	uint8_t buf[6];
-+	const char *seplist = ":.-";
-+	char sep;
-+
-+	while (*s) {
-+		switch (fsm_state) {
-+		case START:
-+			if (PCAP_ISXDIGIT(*s)) {
-+				buf[0] = pcapint_xdtoi(*s);
-+				fsm_state = BYTE0_X;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE0_X:
-+			if (strchr(seplist, *s)) {
-+				sep = *s;
-+				fsm_state = BYTE0_SEP_BYTE1;
-+				break;
-+			}
-+			if (PCAP_ISXDIGIT(*s)) {
-+				buf[0] = buf[0] << 4 | pcapint_xdtoi(*s);
-+				fsm_state = BYTE0_XX;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE0_XX:
-+			if (strchr(seplist, *s)) {
-+				sep = *s;
-+				fsm_state = BYTE0_SEP_BYTE1;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE0_SEP_BYTE1:
-+			if (PCAP_ISXDIGIT(*s)) {
-+				buf[1] = pcapint_xdtoi(*s);
-+				fsm_state = BYTE1_X;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE1_X:
-+			if (*s == sep) {
-+				fsm_state = BYTE1_SEP_BYTE2;
-+				break;
-+			}
-+			if (PCAP_ISXDIGIT(*s)) {
-+				buf[1] = buf[1] << 4 | pcapint_xdtoi(*s);
-+				fsm_state = BYTE1_XX;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE1_XX:
-+			if (*s == sep) {
-+				fsm_state = BYTE1_SEP_BYTE2;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE1_SEP_BYTE2:
-+			if (PCAP_ISXDIGIT(*s)) {
-+				buf[2] = pcapint_xdtoi(*s);
-+				fsm_state = BYTE2_X;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE2_X:
-+			if (*s == sep) {
-+				fsm_state = BYTE2_SEP_BYTE3;
-+				break;
-+			}
-+			if (PCAP_ISXDIGIT(*s)) {
-+				buf[2] = buf[2] << 4 | pcapint_xdtoi(*s);
-+				fsm_state = BYTE2_XX;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE2_XX:
-+			if (*s == sep) {
-+				fsm_state = BYTE2_SEP_BYTE3;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE2_SEP_BYTE3:
-+			if (PCAP_ISXDIGIT(*s)) {
-+				buf[3] = pcapint_xdtoi(*s);
-+				fsm_state = BYTE3_X;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE3_X:
-+			if (*s == sep) {
-+				fsm_state = BYTE3_SEP_BYTE4;
-+				break;
-+			}
-+			if (PCAP_ISXDIGIT(*s)) {
-+				buf[3] = buf[3] << 4 | pcapint_xdtoi(*s);
-+				fsm_state = BYTE3_XX;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE3_XX:
-+			if (*s == sep) {
-+				fsm_state = BYTE3_SEP_BYTE4;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE3_SEP_BYTE4:
-+			if (PCAP_ISXDIGIT(*s)) {
-+				buf[4] = pcapint_xdtoi(*s);
-+				fsm_state = BYTE4_X;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE4_X:
-+			if (*s == sep) {
-+				fsm_state = BYTE4_SEP_BYTE5;
-+				break;
-+			}
-+			if (PCAP_ISXDIGIT(*s)) {
-+				buf[4] = buf[4] << 4 | pcapint_xdtoi(*s);
-+				fsm_state = BYTE4_XX;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE4_XX:
-+			if (*s == sep) {
-+				fsm_state = BYTE4_SEP_BYTE5;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE4_SEP_BYTE5:
-+			if (PCAP_ISXDIGIT(*s)) {
-+				buf[5] = pcapint_xdtoi(*s);
-+				fsm_state = BYTE5_X;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE5_X:
-+			if (PCAP_ISXDIGIT(*s)) {
-+				buf[5] = buf[5] << 4 | pcapint_xdtoi(*s);
-+				fsm_state = BYTE5_XX;
-+				break;
-+			}
-+			goto reject;
-+		case BYTE5_XX:
-+			goto reject;
-+		} // switch
-+		s++;
-+	} // while
-+
-+	if (fsm_state == BYTE5_X || fsm_state == BYTE5_XX) {
-+		// accept
-+		memcpy(addr, buf, sizeof(buf));
-+		return 1;
-+	}
-+
-+reject:
-+	return 0;
-+}
-+
-+// The 'addr' argument must point to an array of at least 6 elements.
-+static int
-+pcapint_atomac48(const char *s, uint8_t *addr)
-+{
-+	return s && (
-+	    pcapint_atomac48_xxxxxxxxxxxx(s, addr) ||
-+	    pcapint_atomac48_xxxx_3_times(s, addr) ||
-+	    pcapint_atomac48_x_xx_6_times(s, addr)
-+	);
-+}
-+
-+/*
-+ * If 's' is a MAC-48 address in one of the forms documented in pcap-filter(7)
-+ * for "ether host", return a pointer to an allocated buffer with the binary
-+ * value of the address.  Return NULL on any error.
-  */
- u_char *
- pcap_ether_aton(const char *s)
- {
--	register u_char *ep, *e;
--	register u_char d;
-+	uint8_t tmp[6];
-+	if (! pcapint_atomac48(s, tmp))
-+		return (NULL);
- 
--	e = ep = (u_char *)malloc(6);
-+	u_char *e = malloc(6);
- 	if (e == NULL)
- 		return (NULL);
--
--	while (*s) {
--		if (*s == ':' || *s == '.' || *s == '-')
--			s += 1;
--		d = pcapint_xdtoi(*s++);
--		if (PCAP_ISXDIGIT(*s)) {
--			d <<= 4;
--			d |= pcapint_xdtoi(*s++);
--		}
--		*ep++ = d;
--	}
--
-+	memcpy(e, tmp, sizeof(tmp));
- 	return (e);
- }
- 
diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch
deleted file mode 100644
index 003d21fb1f..0000000000
--- a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7fabf607f2319a36a0bd78444247180acb838e69 Mon Sep 17 00:00:00 2001
-From: Guy Harris <gharris@sonic.net>
-Date: Sun, 7 Sep 2025 12:51:56 -0700
-Subject: [PATCH] Fix a copy-and-pasteo in utf_16le_to_utf_8_truncated().
-
-For the four octets of UTF-8 case, it was decrementing the remaining
-buffer length by 3, not 4.
-
-Thanks to a team of developers from the Univesity of Waterloo for
-reporting this.
-
-(cherry picked from commit aebfca1aea2fc8c177760a26e8f4de27b51d1b3b)
-
-CVE: CVE-2025-11964
-Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/7fabf607f2319a36a0bd78444247180acb838e69]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- fmtutils.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/fmtutils.c b/fmtutils.c
-index a5a4fe62..78a0f8b7 100644
---- a/fmtutils.c
-+++ b/fmtutils.c
-@@ -235,7 +235,7 @@ utf_16le_to_utf_8_truncated(const wchar_t *utf_16, char *utf_8,
- 			*utf_8++ = ((uc >> 12) & 0x3F) | 0x80;
- 			*utf_8++ = ((uc >> 6) & 0x3F) | 0x80;
- 			*utf_8++ = ((uc >> 0) & 0x3F) | 0x80;
--			utf_8_len -= 3;
-+			utf_8_len -= 4;
- 		}
- 	}
- 
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
similarity index 83%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
index ee7d7540f6..5cba790012 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -11,15 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
-           file://CVE-2023-7256-pre1.patch \
-           file://CVE-2023-7256.patch \
-           file://CVE-2024-8006.patch \
-           file://CVE-2025-11961-01.patch \
-           file://CVE-2025-11961-02.patch \
-           file://CVE-2025-11964.patch \
           "
 
-SRC_URI[sha256sum] = "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f"
+SRC_URI[sha256sum] = "872dd11337fe1ab02ad9d4fee047c9da244d695c6ddf34e2ebb733efd4ed8aa9"
 
 inherit autotools binconfig-disabled pkgconfig
 
-- 
2.34.1


