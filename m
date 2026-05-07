Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9857CCD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 16:32:16 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.183.1778171526394835160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 09:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2wfccSa8;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44da2de25f3so821763f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 09:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778171525; x=1778776325; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qP1JQE+xtHx2qXekpauaWZKGv4e/XZVlNflcWqtyET4=;
        b=2wfccSa8ZacpdqF9N3I2A21i5nP/h8whhm0/pT8Xa/p7S78d/vQqe1EEOjrgTS7JV8
         k8Fe6nDAVbqs3hAQZxuMPQ9/QSXaVUdRbN/tDwUG3jFNc/ExS+rbAc6Yfa0I4yZIlglT
         uRrUSafkYfLv6n8CEnCLLMGjszeSRoUAfJb5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778171525; x=1778776325;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qP1JQE+xtHx2qXekpauaWZKGv4e/XZVlNflcWqtyET4=;
        b=hztnvzzWSBCN3ykA3ff15Qz9hYkBsDyr73trSMD7h8jGlQoq7rTIYycT+XifBFr2ip
         907Iod5QECXfw/ApgFxFu3PG8B0C/NkucRkH0AmfIJiXc+79kzYQWleSOFSXEcngZj+V
         9tU/txKxnOnPwszEhSP/pKX2npL6BhLu+c112v0GGq6R3GoAGwsMb0OD5XEv/CpRImIV
         ePlsRwiUE4a8suO4fF+O25sRAMdc6eDVg/Cgc7TMmrK1j8Eh7hPZel61BSVN+lPZVOvD
         GZdNmOR+8Qj5EZbZvSmAEMDtegRNk2eCkdlEOQXx5CnCV3fDK9LlBAdVHKeCPEFgSqGG
         oMPw==
X-Forwarded-Encrypted: i=1; AFNElJ9Lp5glHoDRD1u2Kk9SQwyJ3jLQ1ARE1abdxQyC/uI5ZRbUXNH9fGF/8NImjhp/WAHSrPjs3haK9U6mB9tfZiY1qg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwswydrerdX+rpUO9+AQnUQf1wYsrxPeKlz4UkvhO4bqIZvSAnF
	pj16wmr4Nj6dnaWXVQCshfGcR2kCUlWVRRzkn6Bj540ZOsdxB2FZRWdPaoZOfxvH2gq6JR3v8iI
	1627Y/Ho=
X-Gm-Gg: AeBDievU+/0TJbZUlqcxOOX0BmDZt0dqD42rGXlsp5xKxQYQt2h9Mp6XTX8KQL4oc5v
	B8lClBwRedAXoXxx5fOYgxlpHEO2eafTVK6OquWcT0fMei0+tbuc7swG7+tlQxbJxH5wCPjs9Cn
	H63l2VoCxAO6z+94nmRfwQMvx0Ap8oadR6CcbLaQc4KKS9LmNwj+7MCovPUfNlPuJ89zA16KCjl
	bcsmj0cgrQVlAZQ89XuKpntA3tzyiokyYlV/bPZ3uWsXcCP8DDo4woXUnAU0LictqYZadY+Sa6J
	C/uGQ5Ikqc4HA2gMVsRlzbVFJMSGH8hl0yNy9DuEJ69x5x1OSK7JaJ67ieoYd4A6/Ibj0yl38uR
	RoJuuVUQ+9oooMQT01HAI6467A8QmqoGnTuR4V9P/+OmTHhG/HUfc3oKQa7BWT6bi5Q2J+2FABc
	G8RBQU+nMxHdsymJYPT5lnXUs76pj4KP+9tlHDXt3hLXw5WcXLY6Y7Ss//S2Gx7uHF2SXQkTdkt
	p/chGuii+GHVaQ=
X-Received: by 2002:a05:6000:2511:b0:43d:75a2:44aa with SMTP id ffacd0b85a97d-4515da96541mr14367731f8f.43.1778171524119;
        Thu, 07 May 2026 09:32:04 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45417219d58sm125812f8f.25.2026.05.07.09.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 09:32:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 May 2026 18:32:02 +0200
Message-Id: <DICL74DV14E6.2FGTCEFASNVW1@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 12/12] libpcap: 1.10.4 -> 1.10.6
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Kai" <kai.kang@windriver.com>, <Jinfeng.Wang.CN@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
 <20260409061639.1688205-13-jinfeng.wang.cn@windriver.com>
 <DI18MGLHCOVA.322PMTYWVZE49@smile.fr>
 <150bd5e7-5929-463c-b4eb-8fcaab2fde30@windriver.com>
In-Reply-To: <150bd5e7-5929-463c-b4eb-8fcaab2fde30@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 16:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236604

On Wed May 6, 2026 at 5:05 AM CEST, Kai wrote:
> On 4/24/26 16:21, Yoann Congal via lists.openembedded.org wrote:
>> On Thu Apr 9, 2026 at 8:16 AM CEST, Jinfeng (CN) via lists.openembedded.=
org Wang wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> Upgrade libpcap from 1.10.4 to 1.10.6 which includes fix for CVEs.
>>>
>>> Remove backported patches which have been incorporated in 1.10.6:
>>>
>>> * CVE-2023-7256-pre1.patch
>>> * CVE-2023-7256.patch
>>> * CVE-2024-8006.patch
>>> * CVE-2025-11961-01.patch
>>> * CVE-2025-11961-02.patch
>>> * CVE-2025-11964.patch
>>>
>>> [1]: https://nvd.nist.gov/vuln/detail/CVE-2025-11961
>>> [2]: https://nvd.nist.gov/vuln/detail/CVE-2025-11964
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>>> ---
>> (Same as the zlib patch) Please add the changelog:
>> https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.10.6/CHANGES=
#L1-L271
>>
>> In this release, I see:
>> * a lot of "Add <new link type>" =3D> sounds like new features
>> * Some API changes:
>>      pcap: make the seconds and microseconds/nanoseconds fields unsigned=
.
>> 	Rename helper routines for pcap modules to have names beginning with
>>          pcapint_, to avoid namespace collisions for code linking static=
ally
>>          with libpcap.
>>
>> Sorry, I don't think I can accept this upgrade.
>
> Hi Yoann,
>
> I asked the libpcap community that the upper issues should not block to=
=20
> upgrade, please see
>
> https://github.com/the-tcpdump-group/libpcap/issues/1674

I'm sorry, but our policy is a little bit stronger than
"backward-compatible": We refuse added features on the risk they pose to
stability. Please note that this is not a upstream stable branch, 1.10.x
is the currently developed branch. While upstream seem to care about
backward compatibility, I still think there is too much risk for us.

Regards,

>
> Regards,
> Kai
>
>>
>>>   .../libpcap/libpcap/CVE-2023-7256-pre1.patch  |  37 --
>>>   .../libpcap/libpcap/CVE-2023-7256.patch       | 365 ---------------
>>>   .../libpcap/libpcap/CVE-2024-8006.patch       |  42 --
>>>   .../libpcap/libpcap/CVE-2025-11961-01.patch   |  38 --
>>>   .../libpcap/libpcap/CVE-2025-11961-02.patch   | 433 -----------------=
-
>>>   .../libpcap/libpcap/CVE-2025-11964.patch      |  33 --
>>>   .../{libpcap_1.10.4.bb =3D> libpcap_1.10.6.bb}  |   8 +-
>>>   7 files changed, 1 insertion(+), 955 deletions(-)
>>>   delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023=
-7256-pre1.patch
>>>   delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023=
-7256.patch
>>>   delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2024=
-8006.patch
>>>   delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025=
-11961-01.patch
>>>   delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025=
-11961-02.patch
>>>   delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025=
-11964.patch
>>>   rename meta/recipes-connectivity/libpcap/{libpcap_1.10.4.bb =3D> libp=
cap_1.10.6.bb} (83%)
>>>
>>> diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pr=
e1.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.pat=
ch
>>> deleted file mode 100644
>>> index 64abfb85cd..0000000000
>>> --- a/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patc=
h
>>> +++ /dev/null
>>> @@ -1,37 +0,0 @@
>>> -From 73da0d4d65ef0925772b7b7f82a5fbb3ff2c5e4f Mon Sep 17 00:00:00 2001
>>> -From: Rose <83477269+AtariDreams@users.noreply.github.com>
>>> -Date: Tue, 16 May 2023 12:37:11 -0400
>>> -Subject: [PATCH] Remove unused variable retval in sock_present2network
>>> -
>>> -This quiets the compiler since it is not even returned anyway, and is =
a misleading variable name.
>>> -
>>> -(cherry picked from commit c7b90298984c46d820d3cee79a96d24870b5f200)
>>> -
>>> -Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpca=
p/commit/73da0d4d65ef0925772b7b7f82a5fbb3ff2c5e4f]
>>> -CVE: CVE-2023-7256 #Dependency Patch
>>> -Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>>> ----
>>> - sockutils.c | 3 +--
>>> - 1 file changed, 1 insertion(+), 2 deletions(-)
>>> -
>>> -diff --git a/sockutils.c b/sockutils.c
>>> -index 1c07f76fd1..6752f296af 100644
>>> ---- a/sockutils.c
>>> -+++ b/sockutils.c
>>> -@@ -2082,7 +2082,6 @@ int sock_getascii_addrport(const struct sockaddr=
_storage *sockaddr, char *addres
>>> -  */
>>> - int sock_present2network(const char *address, struct sockaddr_storage=
 *sockaddr, int addr_family, char *errbuf, int errbuflen)
>>> - {
>>> --	int retval;
>>> - 	struct addrinfo *addrinfo;
>>> - 	struct addrinfo hints;
>>> -
>>> -@@ -2090,7 +2089,7 @@ int sock_present2network(const char *address, st=
ruct sockaddr_storage *sockaddr,
>>> -
>>> - 	hints.ai_family =3D addr_family;
>>> -
>>> --	if ((retval =3D sock_initaddress(address, "22222" /* fake port */, &=
hints, &addrinfo, errbuf, errbuflen)) =3D=3D -1)
>>> -+	if (sock_initaddress(address, "22222" /* fake port */, &hints, &addr=
info, errbuf, errbuflen) =3D=3D -1)
>>> - 		return 0;
>>> -
>>> - 	if (addrinfo->ai_family =3D=3D PF_INET)
>>> diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.patch
>>> deleted file mode 100644
>>> index fffcb2704a..0000000000
>>> --- a/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.patch
>>> +++ /dev/null
>>> @@ -1,365 +0,0 @@
>>> -From 2aa69b04d8173b18a0e3492e0c8f2f7fabdf642d Mon Sep 17 00:00:00 2001
>>> -From: Guy Harris <gharris@sonic.net>
>>> -Date: Thu, 28 Sep 2023 00:37:57 -0700
>>> -Subject: [PATCH] Have sock_initaddress() return the list of addrinfo
>>> - structures or NULL.
>>> -
>>> -Its return address is currently 0 for success and -1 for failure, with=
 a
>>> -pointer to the first element of the list of struct addrinfos returned
>>> -through a pointer on success; change it to return that pointer on
>>> -success and NULL on failure.
>>> -
>>> -That way, we don't have to worry about what happens to the pointer
>>> -pointeed to by the argument in question on failure; we know that we go=
t
>>> -NULL back if no struct addrinfos were found because getaddrinfo()
>>> -failed.  Thus, we know that we have something to free iff
>>> -sock_initaddress() returned a pointer to that something rather than
>>> -returning NULL.
>>> -
>>> -This avoids a double-free in some cases.
>>> -
>>> -This is apparently CVE-2023-40400.
>>> -
>>> -(backported from commit 262e4f34979872d822ccedf9f318ed89c4d31c03)
>>> -
>>> -Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpca=
p/commit/2aa69b04d8173b18a0e3492e0c8f2f7fabdf642d]
>>> -CVE: CVE-2023-7256
>>> -Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>>> ----
>>> - pcap-rpcap.c    | 48 ++++++++++++++++++++--------------------
>>> - rpcapd/daemon.c |  8 +++++--
>>> - rpcapd/rpcapd.c |  8 +++++--
>>> - sockutils.c     | 58 ++++++++++++++++++++++++++++--------------------=
-
>>> - sockutils.h     |  5 ++---
>>> - 5 files changed, 72 insertions(+), 55 deletions(-)
>>> -
>>> -diff --git a/pcap-rpcap.c b/pcap-rpcap.c
>>> -index ef0cd6e49c..f1992e4aea 100644
>>> ---- a/pcap-rpcap.c
>>> -+++ b/pcap-rpcap.c
>>> -@@ -1024,7 +1024,6 @@ rpcap_remoteact_getsock(const char *host, int *e=
rror, char *errbuf)
>>> - {
>>> - 	struct activehosts *temp;			/* temp var needed to scan the host list=
 chain */
>>> - 	struct addrinfo hints, *addrinfo, *ai_next;	/* temp var needed to tr=
anslate between hostname to its address */
>>> --	int retval;
>>> -
>>> - 	/* retrieve the network address corresponding to 'host' */
>>> - 	addrinfo =3D NULL;
>>> -@@ -1032,9 +1031,9 @@ rpcap_remoteact_getsock(const char *host, int *e=
rror, char *errbuf)
>>> - 	hints.ai_family =3D PF_UNSPEC;
>>> - 	hints.ai_socktype =3D SOCK_STREAM;
>>> -
>>> --	retval =3D sock_initaddress(host, NULL, &hints, &addrinfo, errbuf,
>>> -+	addrinfo =3D sock_initaddress(host, NULL, &hints, errbuf,
>>> - 	    PCAP_ERRBUF_SIZE);
>>> --	if (retval !=3D 0)
>>> -+	if (addrinfo =3D=3D NULL)
>>> - 	{
>>> - 		*error =3D 1;
>>> - 		return NULL;
>>> -@@ -1186,7 +1185,9 @@ static int pcap_startcapture_remote(pcap_t *fp)
>>> - 		hints.ai_flags =3D AI_PASSIVE;	/* Data connection is opened by the =
server toward the client */
>>> -
>>> - 		/* Let's the server pick up a free network port for us */
>>> --		if (sock_initaddress(NULL, NULL, &hints, &addrinfo, fp->errbuf, PCA=
P_ERRBUF_SIZE) =3D=3D -1)
>>> -+		addrinfo =3D sock_initaddress(NULL, NULL, &hints, fp->errbuf,
>>> -+		    PCAP_ERRBUF_SIZE);
>>> -+		if (addrinfo =3D=3D NULL)
>>> - 			goto error_nodiscard;
>>> -
>>> - 		if ((sockdata =3D sock_open(NULL, addrinfo, SOCKOPEN_SERVER,
>>> -@@ -1311,7 +1312,9 @@ static int pcap_startcapture_remote(pcap_t *fp)
>>> - 			snprintf(portstring, PCAP_BUF_SIZE, "%d", ntohs(startcapreply.port=
data));
>>> -
>>> - 			/* Let's the server pick up a free network port for us */
>>> --			if (sock_initaddress(host, portstring, &hints, &addrinfo, fp->errb=
uf, PCAP_ERRBUF_SIZE) =3D=3D -1)
>>> -+			addrinfo =3D sock_initaddress(host, portstring, &hints,
>>> -+			    fp->errbuf, PCAP_ERRBUF_SIZE);
>>> -+			if (addrinfo =3D=3D NULL)
>>> - 				goto error;
>>> -
>>> - 			if ((sockdata =3D sock_open(host, addrinfo, SOCKOPEN_CLIENT, 0, fp=
->errbuf, PCAP_ERRBUF_SIZE)) =3D=3D INVALID_SOCKET)
>>> -@@ -2340,16 +2343,16 @@ rpcap_setup_session(const char *source, struct=
 pcap_rmtauth *auth,
>>> - 		if (port[0] =3D=3D 0)
>>> - 		{
>>> - 			/* the user chose not to specify the port */
>>> --			if (sock_initaddress(host, RPCAP_DEFAULT_NETPORT,
>>> --			    &hints, &addrinfo, errbuf, PCAP_ERRBUF_SIZE) =3D=3D -1)
>>> --				return -1;
>>> -+			addrinfo =3D sock_initaddress(host, RPCAP_DEFAULT_NETPORT,
>>> -+			    &hints, errbuf, PCAP_ERRBUF_SIZE);
>>> - 		}
>>> - 		else
>>> - 		{
>>> --			if (sock_initaddress(host, port, &hints, &addrinfo,
>>> --			    errbuf, PCAP_ERRBUF_SIZE) =3D=3D -1)
>>> --				return -1;
>>> -+			addrinfo =3D sock_initaddress(host, port, &hints,
>>> -+			    errbuf, PCAP_ERRBUF_SIZE);
>>> - 		}
>>> -+		if (addrinfo =3D=3D NULL)
>>> -+			return -1;
>>> -
>>> - 		if ((*sockctrlp =3D sock_open(host, addrinfo, SOCKOPEN_CLIENT, 0,
>>> - 		    errbuf, PCAP_ERRBUF_SIZE)) =3D=3D INVALID_SOCKET)
>>> -@@ -2950,19 +2953,19 @@ SOCKET pcap_remoteact_accept_ex(const char *ad=
dress, const char *port, const cha
>>> - 	/* Do the work */
>>> - 	if ((port =3D=3D NULL) || (port[0] =3D=3D 0))
>>> - 	{
>>> --		if (sock_initaddress(address, RPCAP_DEFAULT_NETPORT_ACTIVE, &hints,=
 &addrinfo, errbuf, PCAP_ERRBUF_SIZE) =3D=3D -1)
>>> --		{
>>> --			return (SOCKET)-2;
>>> --		}
>>> -+		addrinfo =3D sock_initaddress(address,
>>> -+		    RPCAP_DEFAULT_NETPORT_ACTIVE, &hints, errbuf,
>>> -+		    PCAP_ERRBUF_SIZE);
>>> - 	}
>>> - 	else
>>> - 	{
>>> --		if (sock_initaddress(address, port, &hints, &addrinfo, errbuf, PCAP=
_ERRBUF_SIZE) =3D=3D -1)
>>> --		{
>>> --			return (SOCKET)-2;
>>> --		}
>>> -+		addrinfo =3D sock_initaddress(address, port, &hints, errbuf,
>>> -+		    PCAP_ERRBUF_SIZE);
>>> -+	}
>>> -+	if (addrinfo =3D=3D NULL)
>>> -+	{
>>> -+		return (SOCKET)-2;
>>> - 	}
>>> --
>>> -
>>> - 	if ((sockmain =3D sock_open(NULL, addrinfo, SOCKOPEN_SERVER, 1, errb=
uf, PCAP_ERRBUF_SIZE)) =3D=3D INVALID_SOCKET)
>>> - 	{
>>> -@@ -3122,7 +3125,6 @@ int pcap_remoteact_close(const char *host, char =
*errbuf)
>>> - {
>>> - 	struct activehosts *temp, *prev;	/* temp var needed to scan the host=
 list chain */
>>> - 	struct addrinfo hints, *addrinfo, *ai_next;	/* temp var needed to tr=
anslate between hostname to its address */
>>> --	int retval;
>>> -
>>> - 	temp =3D activeHosts;
>>> - 	prev =3D NULL;
>>> -@@ -3133,9 +3135,9 @@ int pcap_remoteact_close(const char *host, char =
*errbuf)
>>> - 	hints.ai_family =3D PF_UNSPEC;
>>> - 	hints.ai_socktype =3D SOCK_STREAM;
>>> -
>>> --	retval =3D sock_initaddress(host, NULL, &hints, &addrinfo, errbuf,
>>> -+	addrinfo =3D sock_initaddress(host, NULL, &hints, errbuf,
>>> - 	    PCAP_ERRBUF_SIZE);
>>> --	if (retval !=3D 0)
>>> -+	if (addrinfo =3D=3D NULL)
>>> - 	{
>>> - 		return -1;
>>> - 	}
>>> -diff --git a/rpcapd/daemon.c b/rpcapd/daemon.c
>>> -index 8d620dd604..b04b29f107 100644
>>> ---- a/rpcapd/daemon.c
>>> -+++ b/rpcapd/daemon.c
>>> -@@ -2085,7 +2085,9 @@ daemon_msg_startcap_req(uint8 ver, struct daemon=
_slpars *pars, uint32 plen,
>>> - 			goto error;
>>> - 		}
>>> -
>>> --		if (sock_initaddress(peerhost, portdata, &hints, &addrinfo, errmsgb=
uf, PCAP_ERRBUF_SIZE) =3D=3D -1)
>>> -+		addrinfo =3D sock_initaddress(peerhost, portdata, &hints,
>>> -+		    errmsgbuf, PCAP_ERRBUF_SIZE);
>>> -+		if (addrinfo =3D=3D NULL)
>>> - 			goto error;
>>> -
>>> - 		if ((session->sockdata =3D sock_open(peerhost, addrinfo, SOCKOPEN_C=
LIENT, 0, errmsgbuf, PCAP_ERRBUF_SIZE)) =3D=3D INVALID_SOCKET)
>>> -@@ -2096,7 +2098,9 @@ daemon_msg_startcap_req(uint8 ver, struct daemon=
_slpars *pars, uint32 plen,
>>> - 		hints.ai_flags =3D AI_PASSIVE;
>>> -
>>> - 		// Make the server socket pick up a free network port for us
>>> --		if (sock_initaddress(NULL, NULL, &hints, &addrinfo, errmsgbuf, PCAP=
_ERRBUF_SIZE) =3D=3D -1)
>>> -+		addrinfo =3D sock_initaddress(NULL, NULL, &hints, errmsgbuf,
>>> -+		    PCAP_ERRBUF_SIZE);
>>> -+		if (addrinfo =3D=3D NULL)
>>> - 			goto error;
>>> -
>>> - 		if ((session->sockdata =3D sock_open(NULL, addrinfo, SOCKOPEN_SERVE=
R, 1 /* max 1 connection in queue */, errmsgbuf, PCAP_ERRBUF_SIZE)) =3D=3D =
INVALID_SOCKET)
>>> -diff --git a/rpcapd/rpcapd.c b/rpcapd/rpcapd.c
>>> -index e1f3f05299..d166522c9f 100644
>>> ---- a/rpcapd/rpcapd.c
>>> -+++ b/rpcapd/rpcapd.c
>>> -@@ -611,7 +611,9 @@ void main_startup(void)
>>> - 		//
>>> - 		// Get a list of sockets on which to listen.
>>> - 		//
>>> --		if (sock_initaddress((address[0]) ? address : NULL, port, &mainhint=
s, &addrinfo, errbuf, PCAP_ERRBUF_SIZE) =3D=3D -1)
>>> -+		addrinfo =3D sock_initaddress((address[0]) ? address : NULL,
>>> -+		    port, &mainhints, errbuf, PCAP_ERRBUF_SIZE);
>>> -+		if (addrinfo =3D=3D NULL)
>>> - 		{
>>> - 			rpcapd_log(LOGPRIO_DEBUG, "%s", errbuf);
>>> - 			return;
>>> -@@ -1350,7 +1352,9 @@ main_active(void *ptr)
>>> - 	memset(errbuf, 0, sizeof(errbuf));
>>> -
>>> - 	// Do the work
>>> --	if (sock_initaddress(activepars->address, activepars->port, &hints, =
&addrinfo, errbuf, PCAP_ERRBUF_SIZE) =3D=3D -1)
>>> -+	addrinfo =3D sock_initaddress(activepars->address, activepars->port,
>>> -+	    &hints, errbuf, PCAP_ERRBUF_SIZE);
>>> -+	if (addrinfo =3D=3D NULL)
>>> - 	{
>>> - 		rpcapd_log(LOGPRIO_DEBUG, "%s", errbuf);
>>> - 		return 0;
>>> -diff --git a/sockutils.c b/sockutils.c
>>> -index a1bfa1b5e2..823c2363e0 100644
>>> ---- a/sockutils.c
>>> -+++ b/sockutils.c
>>> -@@ -1069,20 +1069,21 @@ get_gai_errstring(char *errbuf, int errbuflen,=
 const char *prefix, int err,
>>> -  * \param errbuflen: length of the buffer that will contains the erro=
r. The error message cannot be
>>> -  * larger than 'errbuflen - 1' because the last char is reserved for =
the string terminator.
>>> -  *
>>> -- * \return '0' if everything is fine, '-1' if some errors occurred. T=
he error message is returned
>>> -- * in the 'errbuf' variable. The addrinfo variable that has to be use=
d in the following sockets calls is
>>> -- * returned into the addrinfo parameter.
>>> -+ * \return a pointer to the first element in a list of addrinfo struc=
tures
>>> -+ * if everything is fine, NULL if some errors occurred. The error mes=
sage
>>> -+ * is returned in the 'errbuf' variable.
>>> -  *
>>> -- * \warning The 'addrinfo' variable has to be deleted by the programm=
er by calling freeaddrinfo() when
>>> -- * it is no longer needed.
>>> -+ * \warning The list of addrinfo structures returned has to be delete=
d by
>>> -+ * the programmer by calling freeaddrinfo() when it is no longer need=
ed.
>>> -  *
>>> -  * \warning This function requires the 'hints' variable as parameter.=
 The semantic of this variable is the same
>>> -  * of the one of the corresponding variable used into the standard ge=
taddrinfo() socket function. We suggest
>>> -  * the programmer to look at that function in order to set the 'hints=
' variable appropriately.
>>> -  */
>>> --int sock_initaddress(const char *host, const char *port,
>>> --    struct addrinfo *hints, struct addrinfo **addrinfo, char *errbuf,=
 int errbuflen)
>>> -+struct addrinfo *sock_initaddress(const char *host, const char *port,
>>> -+    struct addrinfo *hints, char *errbuf, int errbuflen)
>>> - {
>>> -+	struct addrinfo *addrinfo;
>>> - 	int retval;
>>> -
>>> - 	/*
>>> -@@ -1094,9 +1095,13 @@ int sock_initaddress(const char *host, const ch=
ar *port,
>>> - 	 * as those messages won't talk about a problem with the port if
>>> - 	 * no port was specified.
>>> - 	 */
>>> --	retval =3D getaddrinfo(host, port =3D=3D NULL ? "0" : port, hints, a=
ddrinfo);
>>> -+	retval =3D getaddrinfo(host, port =3D=3D NULL ? "0" : port, hints, &=
addrinfo);
>>> - 	if (retval !=3D 0)
>>> - 	{
>>> -+		/*
>>> -+		 * That call failed.
>>> -+		 * Determine whether the problem is that the host is bad.
>>> -+		 */
>>> - 		if (errbuf)
>>> - 		{
>>> - 			if (host !=3D NULL && port !=3D NULL) {
>>> -@@ -1108,7 +1113,7 @@ int sock_initaddress(const char *host, const cha=
r *port,
>>> - 				int try_retval;
>>> -
>>> - 				try_retval =3D getaddrinfo(host, NULL, hints,
>>> --				    addrinfo);
>>> -+				    &addrinfo);
>>> - 				if (try_retval =3D=3D 0) {
>>> - 					/*
>>> - 					 * Worked with just the host,
>>> -@@ -1117,14 +1122,16 @@ int sock_initaddress(const char *host, const c=
har *port,
>>> - 					 *
>>> - 					 * Free up the address info first.
>>> - 					 */
>>> --					freeaddrinfo(*addrinfo);
>>> -+					freeaddrinfo(addrinfo);
>>> - 					get_gai_errstring(errbuf, errbuflen,
>>> - 					    "", retval, NULL, port);
>>> - 				} else {
>>> - 					/*
>>> - 					 * Didn't work with just the host,
>>> - 					 * so assume the problem is
>>> --					 * with the host.
>>> -+					 * with the host; we assume
>>> -+					 * the original error indicates
>>> -+					 * the underlying problem.
>>> - 					 */
>>> - 					get_gai_errstring(errbuf, errbuflen,
>>> - 					    "", retval, host, NULL);
>>> -@@ -1132,13 +1139,14 @@ int sock_initaddress(const char *host, const c=
har *port,
>>> - 			} else {
>>> - 				/*
>>> - 				 * Either the host or port was null, so
>>> --				 * there's nothing to determine.
>>> -+				 * there's nothing to determine; report
>>> -+				 * the error from the original call.
>>> - 				 */
>>> - 				get_gai_errstring(errbuf, errbuflen, "",
>>> - 				    retval, host, port);
>>> - 			}
>>> - 		}
>>> --		return -1;
>>> -+		return NULL;
>>> - 	}
>>> - 	/*
>>> - 	 * \warning SOCKET: I should check all the accept() in order to bind=
 to all addresses in case
>>> -@@ -1153,30 +1161,28 @@ int sock_initaddress(const char *host, const c=
har *port,
>>> - 	 * ignore all addresses that are neither?  (What, no IPX
>>> - 	 * support? :-))
>>> - 	 */
>>> --	if (((*addrinfo)->ai_family !=3D PF_INET) &&
>>> --	    ((*addrinfo)->ai_family !=3D PF_INET6))
>>> -+	if ((addrinfo->ai_family !=3D PF_INET) &&
>>> -+	    (addrinfo->ai_family !=3D PF_INET6))
>>> - 	{
>>> - 		if (errbuf)
>>> - 			snprintf(errbuf, errbuflen, "getaddrinfo(): socket type not suppor=
ted");
>>> --		freeaddrinfo(*addrinfo);
>>> --		*addrinfo =3D NULL;
>>> --		return -1;
>>> -+		freeaddrinfo(addrinfo);
>>> -+		return NULL;
>>> - 	}
>>> -
>>> - 	/*
>>> - 	 * You can't do multicast (or broadcast) TCP.
>>> - 	 */
>>> --	if (((*addrinfo)->ai_socktype =3D=3D SOCK_STREAM) &&
>>> --	    (sock_ismcastaddr((*addrinfo)->ai_addr) =3D=3D 0))
>>> -+	if ((addrinfo->ai_socktype =3D=3D SOCK_STREAM) &&
>>> -+	    (sock_ismcastaddr(addrinfo->ai_addr) =3D=3D 0))
>>> - 	{
>>> - 		if (errbuf)
>>> - 			snprintf(errbuf, errbuflen, "getaddrinfo(): multicast addresses ar=
e not valid when using TCP streams");
>>> --		freeaddrinfo(*addrinfo);
>>> --		*addrinfo =3D NULL;
>>> --		return -1;
>>> -+		freeaddrinfo(addrinfo);
>>> -+		return NULL;
>>> - 	}
>>> -
>>> --	return 0;
>>> -+	return addrinfo;
>>> - }
>>> -
>>> - /*
>>> -@@ -2089,7 +2095,9 @@ int sock_present2network(const char *address, st=
ruct sockaddr_storage *sockaddr,
>>> -
>>> - 	hints.ai_family =3D addr_family;
>>> -
>>> --	if (sock_initaddress(address, "22222" /* fake port */, &hints, &addr=
info, errbuf, errbuflen) =3D=3D -1)
>>> -+	addrinfo =3D sock_initaddress(address, "22222" /* fake port */, &hin=
ts,
>>> -+	    errbuf, errbuflen);
>>> -+	if (addrinfo =3D=3D NULL)
>>> - 		return 0;
>>> -
>>> - 	if (addrinfo->ai_family =3D=3D PF_INET)
>>> -diff --git a/sockutils.h b/sockutils.h
>>> -index a488d8fcb4..30b8cfe0b7 100644
>>> ---- a/sockutils.h
>>> -+++ b/sockutils.h
>>> -@@ -138,9 +138,8 @@ void sock_fmterrmsg(char *errbuf, size_t errbuflen=
, int errcode,
>>> -     PCAP_FORMAT_STRING(const char *fmt), ...) PCAP_PRINTFLIKE(4, 5);
>>> - void sock_geterrmsg(char *errbuf, size_t errbuflen,
>>> -     PCAP_FORMAT_STRING(const char *fmt), ...)  PCAP_PRINTFLIKE(3, 4);
>>> --int sock_initaddress(const char *address, const char *port,
>>> --    struct addrinfo *hints, struct addrinfo **addrinfo,
>>> --    char *errbuf, int errbuflen);
>>> -+struct addrinfo *sock_initaddress(const char *address, const char *po=
rt,
>>> -+    struct addrinfo *hints, char *errbuf, int errbuflen);
>>> - int sock_recv(SOCKET sock, SSL *, void *buffer, size_t size, int rece=
iveall,
>>> -     char *errbuf, int errbuflen);
>>> - int sock_recv_dgram(SOCKET sock, SSL *, void *buffer, size_t size,
>>> diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch
>>> deleted file mode 100644
>>> index 6819aedd20..0000000000
>>> --- a/meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch
>>> +++ /dev/null
>>> @@ -1,42 +0,0 @@
>>> -From 8a633ee5b9ecd9d38a587ac9b204e2380713b0d6 Mon Sep 17 00:00:00 2001
>>> -From: Nicolas Badoux <n.badoux@hotmail.com>
>>> -Date: Mon, 19 Aug 2024 12:31:53 +0200
>>> -Subject: [PATCH] makes pcap_findalldevs_ex errors out if the directory=
 does
>>> - not exist
>>> -
>>> -(backported from commit 0f8a103469ce87d2b8d68c5130a46ddb7fb5eb29)
>>> -
>>> -Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpca=
p/commit/8a633ee5b9ecd9d38a587ac9b204e2380713b0d6]
>>> -CVE: CVE-2024-8006
>>> -Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>>> ----
>>> - pcap-new.c | 9 ++++++++-
>>> - 1 file changed, 8 insertions(+), 1 deletion(-)
>>> -
>>> -diff --git a/pcap-new.c b/pcap-new.c
>>> -index be91b3f8db..d449ee623c 100644
>>> ---- a/pcap-new.c
>>> -+++ b/pcap-new.c
>>> -@@ -230,6 +230,13 @@ int pcap_findalldevs_ex(const char *source, struc=
t pcap_rmtauth *auth, pcap_if_t
>>> - #else
>>> - 		/* opening the folder */
>>> - 		unixdir=3D opendir(path);
>>> -+		if (unixdir =3D=3D NULL) {
>>> -+			DIAG_OFF_FORMAT_TRUNCATION
>>> -+			snprintf(errbuf, PCAP_ERRBUF_SIZE,
>>> -+			    "Error when listing files: does folder '%s' exist?", path);
>>> -+			DIAG_ON_FORMAT_TRUNCATION
>>> -+			return -1;
>>> -+		}
>>> -
>>> - 		/* get the first file into it */
>>> - 		filedata=3D readdir(unixdir);
>>> -@@ -237,7 +244,7 @@ int pcap_findalldevs_ex(const char *source, struct=
 pcap_rmtauth *auth, pcap_if_t
>>> - 		if (filedata =3D=3D NULL)
>>> - 		{
>>> - 			DIAG_OFF_FORMAT_TRUNCATION
>>> --			snprintf(errbuf, PCAP_ERRBUF_SIZE, "Error when listing files: does=
 folder '%s' exist?", path);
>>> -+			snprintf(errbuf, PCAP_ERRBUF_SIZE, "Error when listing files: does=
 folder '%s' contain files?", path);
>>> - 			DIAG_ON_FORMAT_TRUNCATION
>>> - 			closedir(unixdir);
>>> - 			return -1;
>>> diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-0=
1.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch
>>> deleted file mode 100644
>>> index 73c3ab3f5c..0000000000
>>> --- a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch
>>> +++ /dev/null
>>> @@ -1,38 +0,0 @@
>>> -From 7224be0fe2f4beb916b7b69141f478facd0f0634 Mon Sep 17 00:00:00 2001
>>> -From: Denis Ovsienko <denis@ovsienko.info>
>>> -Date: Sat, 27 Dec 2025 21:36:11 +0000
>>> -Subject: [PATCH] Rename one of the xdtoi() copies to simplify backport=
ing.
>>> -
>>> -CVE: CVE-2025-11961
>>> -Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpca=
p/commit/7224be0fe2f4beb916b7b69141f478facd0f0634]
>>> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
>>> ----
>>> - nametoaddr.c | 6 +++---
>>> - 1 file changed, 3 insertions(+), 3 deletions(-)
>>> -
>>> -diff --git a/nametoaddr.c b/nametoaddr.c
>>> -index dc75495c..bdaacbf1 100644
>>> ---- a/nametoaddr.c
>>> -+++ b/nametoaddr.c
>>> -@@ -646,7 +646,7 @@ pcap_nametollc(const char *s)
>>> -
>>> - /* Hex digit to 8-bit unsigned integer. */
>>> - static inline u_char
>>> --xdtoi(u_char c)
>>> -+pcapint_xdtoi(u_char c)
>>> - {
>>> - 	if (c >=3D '0' && c <=3D '9')
>>> - 		return (u_char)(c - '0');
>>> -@@ -728,10 +728,10 @@ pcap_ether_aton(const char *s)
>>> - 	while (*s) {
>>> - 		if (*s =3D=3D ':' || *s =3D=3D '.' || *s =3D=3D '-')
>>> - 			s +=3D 1;
>>> --		d =3D xdtoi(*s++);
>>> -+		d =3D pcapint_xdtoi(*s++);
>>> - 		if (PCAP_ISXDIGIT(*s)) {
>>> - 			d <<=3D 4;
>>> --			d |=3D xdtoi(*s++);
>>> -+			d |=3D pcapint_xdtoi(*s++);
>>> - 		}
>>> - 		*ep++ =3D d;
>>> - 	}
>>> diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-0=
2.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-02.patch
>>> deleted file mode 100644
>>> index 2dca7908ef..0000000000
>>> --- a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-02.patch
>>> +++ /dev/null
>>> @@ -1,433 +0,0 @@
>>> -From b2d2f9a9a0581c40780bde509f7cc715920f1c02 Mon Sep 17 00:00:00 2001
>>> -From: Denis Ovsienko <denis@ovsienko.info>
>>> -Date: Fri, 19 Dec 2025 17:31:13 +0000
>>> -Subject: [PATCH] CVE-2025-11961: Fix OOBR and OOBW in pcap_ether_aton(=
).
>>> -
>>> -pcap_ether_aton() has for a long time required its string argument to =
be
>>> -a well-formed MAC-48 address, which is always the case when the argume=
nt
>>> -comes from other libpcap code, so the function has never validated the
>>> -input and used a simple loop to parse any of the three common MAC-48
>>> -address formats.  However, the function has also been a part of the
>>> -public API, so calling it directly with a malformed address can cause
>>> -the loop to read beyond the end of the input string and/or to write
>>> -beyond the end of the allocated output buffer.
>>> -
>>> -To handle invalid input more appropriately, replace the simple loop wi=
th
>>> -new functions and require the input to match a supported address forma=
t.
>>> -
>>> -This problem was reported by Jin Wei, Kunwei Qian and Ping Chen.
>>> -
>>> -(backported from commit dd08e53e9380e217ae7c7768da9cc3d7bf37bf83)
>>> -
>>> -CVE: CVE-2025-11961
>>> -Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpca=
p/commit/b2d2f9a9a0581c40780bde509f7cc715920f1c02]
>>> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
>>> ----
>>> - gencode.c    |   5 +
>>> - nametoaddr.c | 367 +++++++++++++++++++++++++++++++++++++++++++++++---=
-
>>> - 2 files changed, 349 insertions(+), 23 deletions(-)
>>> -
>>> -diff --git a/gencode.c b/gencode.c
>>> -index 3ddd15f8..76fb2d82 100644
>>> ---- a/gencode.c
>>> -+++ b/gencode.c
>>> -@@ -7228,6 +7228,11 @@ gen_ecode(compiler_state_t *cstate, const char =
*s, struct qual q)
>>> - 		return (NULL);
>>> -
>>> - 	if ((q.addr =3D=3D Q_HOST || q.addr =3D=3D Q_DEFAULT) && q.proto =3D=
=3D Q_LINK) {
>>> -+		/*
>>> -+		 * Because the lexer guards the input string format, in this
>>> -+		 * context the function returns NULL iff the implicit malloc()
>>> -+		 * has failed.
>>> -+		 */
>>> - 		cstate->e =3D pcap_ether_aton(s);
>>> - 		if (cstate->e =3D=3D NULL)
>>> - 			bpf_error(cstate, "malloc");
>>> -diff --git a/nametoaddr.c b/nametoaddr.c
>>> -index f9fcd288..f50d0da5 100644
>>> ---- a/nametoaddr.c
>>> -+++ b/nametoaddr.c
>>> -@@ -703,39 +703,360 @@ __pcap_atodn(const char *s, bpf_u_int32 *addr)
>>> - 	return(32);
>>> - }
>>> -
>>> -+// Man page: "xxxxxxxxxxxx", regexp: "^[0-9a-fA-F]{12}$".
>>> -+static u_char
>>> -+pcapint_atomac48_xxxxxxxxxxxx(const char *s, uint8_t *addr)
>>> -+{
>>> -+	if (strlen(s) =3D=3D 12 &&
>>> -+	    PCAP_ISXDIGIT(s[0]) &&
>>> -+	    PCAP_ISXDIGIT(s[1]) &&
>>> -+	    PCAP_ISXDIGIT(s[2]) &&
>>> -+	    PCAP_ISXDIGIT(s[3]) &&
>>> -+	    PCAP_ISXDIGIT(s[4]) &&
>>> -+	    PCAP_ISXDIGIT(s[5]) &&
>>> -+	    PCAP_ISXDIGIT(s[6]) &&
>>> -+	    PCAP_ISXDIGIT(s[7]) &&
>>> -+	    PCAP_ISXDIGIT(s[8]) &&
>>> -+	    PCAP_ISXDIGIT(s[9]) &&
>>> -+	    PCAP_ISXDIGIT(s[10]) &&
>>> -+	    PCAP_ISXDIGIT(s[11])) {
>>> -+		addr[0] =3D pcapint_xdtoi(s[0]) << 4 | pcapint_xdtoi(s[1]);
>>> -+		addr[1] =3D pcapint_xdtoi(s[2]) << 4 | pcapint_xdtoi(s[3]);
>>> -+		addr[2] =3D pcapint_xdtoi(s[4]) << 4 | pcapint_xdtoi(s[5]);
>>> -+		addr[3] =3D pcapint_xdtoi(s[6]) << 4 | pcapint_xdtoi(s[7]);
>>> -+		addr[4] =3D pcapint_xdtoi(s[8]) << 4 | pcapint_xdtoi(s[9]);
>>> -+		addr[5] =3D pcapint_xdtoi(s[10]) << 4 | pcapint_xdtoi(s[11]);
>>> -+		return 1;
>>> -+	}
>>> -+	return 0;
>>> -+}
>>> -+
>>> -+// Man page: "xxxx.xxxx.xxxx", regexp: "^[0-9a-fA-F]{4}(\.[0-9a-fA-F]=
{4}){2}$".
>>> -+static u_char
>>> -+pcapint_atomac48_xxxx_3_times(const char *s, uint8_t *addr)
>>> -+{
>>> -+	const char sep =3D '.';
>>> -+	if (strlen(s) =3D=3D 14 &&
>>> -+	    PCAP_ISXDIGIT(s[0]) &&
>>> -+	    PCAP_ISXDIGIT(s[1]) &&
>>> -+	    PCAP_ISXDIGIT(s[2]) &&
>>> -+	    PCAP_ISXDIGIT(s[3]) &&
>>> -+	    s[4] =3D=3D sep &&
>>> -+	    PCAP_ISXDIGIT(s[5]) &&
>>> -+	    PCAP_ISXDIGIT(s[6]) &&
>>> -+	    PCAP_ISXDIGIT(s[7]) &&
>>> -+	    PCAP_ISXDIGIT(s[8]) &&
>>> -+	    s[9] =3D=3D sep &&
>>> -+	    PCAP_ISXDIGIT(s[10]) &&
>>> -+	    PCAP_ISXDIGIT(s[11]) &&
>>> -+	    PCAP_ISXDIGIT(s[12]) &&
>>> -+	    PCAP_ISXDIGIT(s[13])) {
>>> -+		addr[0] =3D pcapint_xdtoi(s[0]) << 4 | pcapint_xdtoi(s[1]);
>>> -+		addr[1] =3D pcapint_xdtoi(s[2]) << 4 | pcapint_xdtoi(s[3]);
>>> -+		addr[2] =3D pcapint_xdtoi(s[5]) << 4 | pcapint_xdtoi(s[6]);
>>> -+		addr[3] =3D pcapint_xdtoi(s[7]) << 4 | pcapint_xdtoi(s[8]);
>>> -+		addr[4] =3D pcapint_xdtoi(s[10]) << 4 | pcapint_xdtoi(s[11]);
>>> -+		addr[5] =3D pcapint_xdtoi(s[12]) << 4 | pcapint_xdtoi(s[13]);
>>> -+		return 1;
>>> -+	}
>>> -+	return 0;
>>> -+}
>>> -+
>>> - /*
>>> -- * Convert 's', which can have the one of the forms:
>>> -+ * Man page: "xx:xx:xx:xx:xx:xx", regexp: "^[0-9a-fA-F]{1,2}(:[0-9a-f=
A-F]{1,2}){5}$".
>>> -+ * Man page: "xx-xx-xx-xx-xx-xx", regexp: "^[0-9a-fA-F]{1,2}(-[0-9a-f=
A-F]{1,2}){5}$".
>>> -+ * Man page: "xx.xx.xx.xx.xx.xx", regexp: "^[0-9a-fA-F]{1,2}(\.[0-9a-=
fA-F]{1,2}){5}$".
>>> -+ * (Any "xx" above can be "x", which is equivalent to "0x".)
>>> -  *
>>> -- *	"xx:xx:xx:xx:xx:xx"
>>> -- *	"xx.xx.xx.xx.xx.xx"
>>> -- *	"xx-xx-xx-xx-xx-xx"
>>> -- *	"xxxx.xxxx.xxxx"
>>> -- *	"xxxxxxxxxxxx"
>>> -+ * An equivalent (and parametrisable for EUI-64) FSM could be impleme=
nted using
>>> -+ * a smaller graph, but that graph would be neither acyclic nor plana=
r nor
>>> -+ * trivial to verify.
>>> -  *
>>> -- * (or various mixes of ':', '.', and '-') into a new
>>> -- * ethernet address.  Assumes 's' is well formed.
>>> -+ *                |
>>> -+ *    [.]         v
>>> -+ * +<---------- START
>>> -+ * |              |
>>> -+ * |              | [0-9a-fA-F]
>>> -+ * |  [.]         v
>>> -+ * +<--------- BYTE0_X ----------+
>>> -+ * |              |              |
>>> -+ * |              | [0-9a-fA-F]  |
>>> -+ * |  [.]         v              |
>>> -+ * +<--------- BYTE0_XX          | [:\.-]
>>> -+ * |              |              |
>>> -+ * |              | [:\.-]       |
>>> -+ * |  [.]         v              |
>>> -+ * +<----- BYTE0_SEP_BYTE1 <-----+
>>> -+ * |              |
>>> -+ * |              | [0-9a-fA-F]
>>> -+ * |  [.]         v
>>> -+ * +<--------- BYTE1_X ----------+
>>> -+ * |              |              |
>>> -+ * |              | [0-9a-fA-F]  |
>>> -+ * |  [.]         v              |
>>> -+ * +<--------- BYTE1_XX          | <sep>
>>> -+ * |              |              |
>>> -+ * |              | <sep>        |
>>> -+ * |  [.]         v              |
>>> -+ * +<----- BYTE1_SEP_BYTE2 <-----+
>>> -+ * |              |
>>> -+ * |              | [0-9a-fA-F]
>>> -+ * |  [.]         v
>>> -+ * +<--------- BYTE2_X ----------+
>>> -+ * |              |              |
>>> -+ * |              | [0-9a-fA-F]  |
>>> -+ * |  [.]         v              |
>>> -+ * +<--------- BYTE2_XX          | <sep>
>>> -+ * |              |              |
>>> -+ * |              | <sep>        |
>>> -+ * |  [.]         v              |
>>> -+ * +<----- BYTE2_SEP_BYTE3 <-----+
>>> -+ * |              |
>>> -+ * |              | [0-9a-fA-F]
>>> -+ * |  [.]         v
>>> -+ * +<--------- BYTE3_X ----------+
>>> -+ * |              |              |
>>> -+ * |              | [0-9a-fA-F]  |
>>> -+ * |  [.]         v              |
>>> -+ * +<--------- BYTE3_XX          | <sep>
>>> -+ * |              |              |
>>> -+ * |              | <sep>        |
>>> -+ * |  [.]         v              |
>>> -+ * +<----- BYTE3_SEP_BYTE4 <-----+
>>> -+ * |              |
>>> -+ * |              | [0-9a-fA-F]
>>> -+ * |  [.]         v
>>> -+ * +<--------- BYTE4_X ----------+
>>> -+ * |              |              |
>>> -+ * |              | [0-9a-fA-F]  |
>>> -+ * |  [.]         v              |
>>> -+ * +<--------- BYTE4_XX          | <sep>
>>> -+ * |              |              |
>>> -+ * |              | <sep>        |
>>> -+ * |  [.]         v              |
>>> -+ * +<----- BYTE4_SEP_BYTE5 <-----+
>>> -+ * |              |
>>> -+ * |              | [0-9a-fA-F]
>>> -+ * |  [.]         v
>>> -+ * +<--------- BYTE5_X ----------+
>>> -+ * |              |              |
>>> -+ * |              | [0-9a-fA-F]  |
>>> -+ * |  [.]         v              |
>>> -+ * +<--------- BYTE5_XX          | \0
>>> -+ * |              |              |
>>> -+ * |              | \0           |
>>> -+ * |              |              v
>>> -+ * +--> (reject)  +---------> (accept)
>>> -+ *
>>> -+ */
>>> -+static u_char
>>> -+pcapint_atomac48_x_xx_6_times(const char *s, uint8_t *addr)
>>> -+{
>>> -+	enum {
>>> -+		START,
>>> -+		BYTE0_X,
>>> -+		BYTE0_XX,
>>> -+		BYTE0_SEP_BYTE1,
>>> -+		BYTE1_X,
>>> -+		BYTE1_XX,
>>> -+		BYTE1_SEP_BYTE2,
>>> -+		BYTE2_X,
>>> -+		BYTE2_XX,
>>> -+		BYTE2_SEP_BYTE3,
>>> -+		BYTE3_X,
>>> -+		BYTE3_XX,
>>> -+		BYTE3_SEP_BYTE4,
>>> -+		BYTE4_X,
>>> -+		BYTE4_XX,
>>> -+		BYTE4_SEP_BYTE5,
>>> -+		BYTE5_X,
>>> -+		BYTE5_XX,
>>> -+	} fsm_state =3D START;
>>> -+	uint8_t buf[6];
>>> -+	const char *seplist =3D ":.-";
>>> -+	char sep;
>>> -+
>>> -+	while (*s) {
>>> -+		switch (fsm_state) {
>>> -+		case START:
>>> -+			if (PCAP_ISXDIGIT(*s)) {
>>> -+				buf[0] =3D pcapint_xdtoi(*s);
>>> -+				fsm_state =3D BYTE0_X;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE0_X:
>>> -+			if (strchr(seplist, *s)) {
>>> -+				sep =3D *s;
>>> -+				fsm_state =3D BYTE0_SEP_BYTE1;
>>> -+				break;
>>> -+			}
>>> -+			if (PCAP_ISXDIGIT(*s)) {
>>> -+				buf[0] =3D buf[0] << 4 | pcapint_xdtoi(*s);
>>> -+				fsm_state =3D BYTE0_XX;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE0_XX:
>>> -+			if (strchr(seplist, *s)) {
>>> -+				sep =3D *s;
>>> -+				fsm_state =3D BYTE0_SEP_BYTE1;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE0_SEP_BYTE1:
>>> -+			if (PCAP_ISXDIGIT(*s)) {
>>> -+				buf[1] =3D pcapint_xdtoi(*s);
>>> -+				fsm_state =3D BYTE1_X;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE1_X:
>>> -+			if (*s =3D=3D sep) {
>>> -+				fsm_state =3D BYTE1_SEP_BYTE2;
>>> -+				break;
>>> -+			}
>>> -+			if (PCAP_ISXDIGIT(*s)) {
>>> -+				buf[1] =3D buf[1] << 4 | pcapint_xdtoi(*s);
>>> -+				fsm_state =3D BYTE1_XX;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE1_XX:
>>> -+			if (*s =3D=3D sep) {
>>> -+				fsm_state =3D BYTE1_SEP_BYTE2;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE1_SEP_BYTE2:
>>> -+			if (PCAP_ISXDIGIT(*s)) {
>>> -+				buf[2] =3D pcapint_xdtoi(*s);
>>> -+				fsm_state =3D BYTE2_X;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE2_X:
>>> -+			if (*s =3D=3D sep) {
>>> -+				fsm_state =3D BYTE2_SEP_BYTE3;
>>> -+				break;
>>> -+			}
>>> -+			if (PCAP_ISXDIGIT(*s)) {
>>> -+				buf[2] =3D buf[2] << 4 | pcapint_xdtoi(*s);
>>> -+				fsm_state =3D BYTE2_XX;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE2_XX:
>>> -+			if (*s =3D=3D sep) {
>>> -+				fsm_state =3D BYTE2_SEP_BYTE3;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE2_SEP_BYTE3:
>>> -+			if (PCAP_ISXDIGIT(*s)) {
>>> -+				buf[3] =3D pcapint_xdtoi(*s);
>>> -+				fsm_state =3D BYTE3_X;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE3_X:
>>> -+			if (*s =3D=3D sep) {
>>> -+				fsm_state =3D BYTE3_SEP_BYTE4;
>>> -+				break;
>>> -+			}
>>> -+			if (PCAP_ISXDIGIT(*s)) {
>>> -+				buf[3] =3D buf[3] << 4 | pcapint_xdtoi(*s);
>>> -+				fsm_state =3D BYTE3_XX;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE3_XX:
>>> -+			if (*s =3D=3D sep) {
>>> -+				fsm_state =3D BYTE3_SEP_BYTE4;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE3_SEP_BYTE4:
>>> -+			if (PCAP_ISXDIGIT(*s)) {
>>> -+				buf[4] =3D pcapint_xdtoi(*s);
>>> -+				fsm_state =3D BYTE4_X;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE4_X:
>>> -+			if (*s =3D=3D sep) {
>>> -+				fsm_state =3D BYTE4_SEP_BYTE5;
>>> -+				break;
>>> -+			}
>>> -+			if (PCAP_ISXDIGIT(*s)) {
>>> -+				buf[4] =3D buf[4] << 4 | pcapint_xdtoi(*s);
>>> -+				fsm_state =3D BYTE4_XX;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE4_XX:
>>> -+			if (*s =3D=3D sep) {
>>> -+				fsm_state =3D BYTE4_SEP_BYTE5;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE4_SEP_BYTE5:
>>> -+			if (PCAP_ISXDIGIT(*s)) {
>>> -+				buf[5] =3D pcapint_xdtoi(*s);
>>> -+				fsm_state =3D BYTE5_X;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE5_X:
>>> -+			if (PCAP_ISXDIGIT(*s)) {
>>> -+				buf[5] =3D buf[5] << 4 | pcapint_xdtoi(*s);
>>> -+				fsm_state =3D BYTE5_XX;
>>> -+				break;
>>> -+			}
>>> -+			goto reject;
>>> -+		case BYTE5_XX:
>>> -+			goto reject;
>>> -+		} // switch
>>> -+		s++;
>>> -+	} // while
>>> -+
>>> -+	if (fsm_state =3D=3D BYTE5_X || fsm_state =3D=3D BYTE5_XX) {
>>> -+		// accept
>>> -+		memcpy(addr, buf, sizeof(buf));
>>> -+		return 1;
>>> -+	}
>>> -+
>>> -+reject:
>>> -+	return 0;
>>> -+}
>>> -+
>>> -+// The 'addr' argument must point to an array of at least 6 elements.
>>> -+static int
>>> -+pcapint_atomac48(const char *s, uint8_t *addr)
>>> -+{
>>> -+	return s && (
>>> -+	    pcapint_atomac48_xxxxxxxxxxxx(s, addr) ||
>>> -+	    pcapint_atomac48_xxxx_3_times(s, addr) ||
>>> -+	    pcapint_atomac48_x_xx_6_times(s, addr)
>>> -+	);
>>> -+}
>>> -+
>>> -+/*
>>> -+ * If 's' is a MAC-48 address in one of the forms documented in pcap-=
filter(7)
>>> -+ * for "ether host", return a pointer to an allocated buffer with the=
 binary
>>> -+ * value of the address.  Return NULL on any error.
>>> -  */
>>> - u_char *
>>> - pcap_ether_aton(const char *s)
>>> - {
>>> --	register u_char *ep, *e;
>>> --	register u_char d;
>>> -+	uint8_t tmp[6];
>>> -+	if (! pcapint_atomac48(s, tmp))
>>> -+		return (NULL);
>>> -
>>> --	e =3D ep =3D (u_char *)malloc(6);
>>> -+	u_char *e =3D malloc(6);
>>> - 	if (e =3D=3D NULL)
>>> - 		return (NULL);
>>> --
>>> --	while (*s) {
>>> --		if (*s =3D=3D ':' || *s =3D=3D '.' || *s =3D=3D '-')
>>> --			s +=3D 1;
>>> --		d =3D pcapint_xdtoi(*s++);
>>> --		if (PCAP_ISXDIGIT(*s)) {
>>> --			d <<=3D 4;
>>> --			d |=3D pcapint_xdtoi(*s++);
>>> --		}
>>> --		*ep++ =3D d;
>>> --	}
>>> --
>>> -+	memcpy(e, tmp, sizeof(tmp));
>>> - 	return (e);
>>> - }
>>> -
>>> diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.p=
atch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch
>>> deleted file mode 100644
>>> index 003d21fb1f..0000000000
>>> --- a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch
>>> +++ /dev/null
>>> @@ -1,33 +0,0 @@
>>> -From 7fabf607f2319a36a0bd78444247180acb838e69 Mon Sep 17 00:00:00 2001
>>> -From: Guy Harris <gharris@sonic.net>
>>> -Date: Sun, 7 Sep 2025 12:51:56 -0700
>>> -Subject: [PATCH] Fix a copy-and-pasteo in utf_16le_to_utf_8_truncated(=
).
>>> -
>>> -For the four octets of UTF-8 case, it was decrementing the remaining
>>> -buffer length by 3, not 4.
>>> -
>>> -Thanks to a team of developers from the Univesity of Waterloo for
>>> -reporting this.
>>> -
>>> -(cherry picked from commit aebfca1aea2fc8c177760a26e8f4de27b51d1b3b)
>>> -
>>> -CVE: CVE-2025-11964
>>> -Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpca=
p/commit/7fabf607f2319a36a0bd78444247180acb838e69]
>>> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
>>> ----
>>> - fmtutils.c | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/fmtutils.c b/fmtutils.c
>>> -index a5a4fe62..78a0f8b7 100644
>>> ---- a/fmtutils.c
>>> -+++ b/fmtutils.c
>>> -@@ -235,7 +235,7 @@ utf_16le_to_utf_8_truncated(const wchar_t *utf_16,=
 char *utf_8,
>>> - 			*utf_8++ =3D ((uc >> 12) & 0x3F) | 0x80;
>>> - 			*utf_8++ =3D ((uc >> 6) & 0x3F) | 0x80;
>>> - 			*utf_8++ =3D ((uc >> 0) & 0x3F) | 0x80;
>>> --			utf_8_len -=3D 3;
>>> -+			utf_8_len -=3D 4;
>>> - 		}
>>> - 	}
>>> -
>>> diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta=
/recipes-connectivity/libpcap/libpcap_1.10.6.bb
>>> similarity index 83%
>>> rename from meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
>>> rename to meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
>>> index ee7d7540f6..5cba790012 100644
>>> --- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
>>> +++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
>>> @@ -11,15 +11,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5eb289217=
c160e2920d2e35bddc36453 \
>>>   DEPENDS =3D "flex-native bison-native"
>>>  =20
>>>   SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz \
>>> -           file://CVE-2023-7256-pre1.patch \
>>> -           file://CVE-2023-7256.patch \
>>> -           file://CVE-2024-8006.patch \
>>> -           file://CVE-2025-11961-01.patch \
>>> -           file://CVE-2025-11961-02.patch \
>>> -           file://CVE-2025-11964.patch \
>>>             "
>>>  =20
>>> -SRC_URI[sha256sum] =3D "ed19a0383fad72e3ad435fd239d7cd80d64916b8726955=
0159d20e47160ebe5f"
>>> +SRC_URI[sha256sum] =3D "872dd11337fe1ab02ad9d4fee047c9da244d695c6ddf34=
e2ebb733efd4ed8aa9"
>>>  =20
>>>   inherit autotools binconfig-disabled pkgconfig
>>>  =20
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#235844): https://lists.openembedded.org/g/openembedd=
ed-core/message/235844
>> Mute This Topic: https://lists.openembedded.org/mt/118738405/3616933
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [k=
ai.kang@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
Yoann Congal
Smile ECS


