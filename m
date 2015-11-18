Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 15DEF6072C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 01:44:58 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so26842890pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 17:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=WGmjGBQQjgwYIPDm/Qod1ClDlNJ+g27a6eeylVZTHI4=;
	b=woq+xO0QXiZXmaKImLyOGrxctOov8iFYiQT8w9TeMV0W9skjatTUliHen6VDxOyDzF
	sK1Nsc7KcOnPChTeYpcPuXm9QLdOlvbYIqc8ImRPCc9T0iltIwtYdS0fxqSmXlTLt4r9
	senqwnmaQV4f1ZnNvNXsVt8vcbm/OBYw3j/LZNnzOy8oNQrpi2hUVJMpMFaxlZCRSTRG
	hQ4fuOuD9OK8Vb0xUv/B3VVLLKQOCoYy43UZsE74ibKF2k/XIdOBmXwQjQb/RCJtS05D
	vDc1+bCZvBmNRcgrS6BgTeOSQ09K/HStXqTRTIUaUMAdYXSzljrvsexMVb+1BGeYByx8
	tf1A==
X-Received: by 10.66.156.1 with SMTP id wa1mr68799737pab.84.1447811099172;
	Tue, 17 Nov 2015 17:44:59 -0800 (PST)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	pq1sm249425pbb.91.2015.11.17.17.44.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Nov 2015 17:44:57 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1447744712-18615-1-git-send-email-wenzong.fan@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <564BD815.2090204@gmail.com>
Date: Tue, 17 Nov 2015 17:44:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447744712-18615-1-git-send-email-wenzong.fan@windriver.com>
Subject: Re: [PATCH] rpcbind: Security Advisory - rpcbind - CVE-2015-7236
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
X-List-Received-Date: Wed, 18 Nov 2015 01:44:59 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Li Zhou,

Can we get the CVE mentioned in the patch or rename the the patch to
include the CVE #.

regards,
Armin

On 11/16/2015 11:18 PM, wenzong.fan@windriver.com wrote:
> From: Li Zhou <li.zhou@windriver.com>
> 
> rpcbind: Fix memory corruption in PMAP_CALLIT code
> 
> Use-after-free vulnerability in xprt_set_caller in rpcb_svc_com.c in
> rpcbind 0.2.1 and earlier allows remote attackers to cause a denial of
> service (daemon crash) via crafted packets, involving a PMAP_CALLIT
> code.
> 
> The patch comes from
> <http://www.openwall.com/lists/oss-security/2015/09/18/7>, and it hasn't
> been in rpcbind upstream yet.
> 
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  ...Fix_memory_corruption_in_PMAP_CALLIT_code.patch | 83 ++++++++++++++++++++++
>  meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb     |  1 +
>  2 files changed, 84 insertions(+)
>  create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind_Fix_memory_corruption_in_PMAP_CALLIT_code.patch
> 
> diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_Fix_memory_corruption_in_PMAP_CALLIT_code.patch b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_Fix_memory_corruption_in_PMAP_CALLIT_code.patch
> new file mode 100644
> index 0000000..f156290
> --- /dev/null
> +++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_Fix_memory_corruption_in_PMAP_CALLIT_code.patch
> @@ -0,0 +1,83 @@
> +commit 06f7ebb1dade2f0dbf872ea2bedf17cff4734bdd
> +Author: Olaf Kirch <okir@...e.de>
> +Date:   Thu Aug 6 16:27:20 2015 +0200
> +
> +    Fix memory corruption in PMAP_CALLIT code
> +    
> +     - A PMAP_CALLIT call comes in on IPv4 UDP
> +     - rpcbind duplicates the caller's address to a netbuf and stores it in
> +       FINFO[0].caller_addr. caller_addr->buf now points to a memory region A
> +       with a size of 16 bytes
> +     - rpcbind forwards the call to the local service, receives a reply
> +     - when processing the reply, it does this in xprt_set_caller:
> +         xprt->xp_rtaddr = *FINFO[0].caller_addr
> +       It sends out the reply, and then frees the netbuf caller_addr and
> +       caller_addr.buf.
> +       However, it does not clear xp_rtaddr, so xp_rtaddr.buf now refers
> +       to memory region A, which is free.
> +     - When the next call comes in on the UDP/IPv4 socket, svc_dg_recv will
> +       be called, which will set xp_rtaddr to the client's address.
> +       It will reuse the buffer inside xp_rtaddr, ie it will write a
> +       sockaddr_in to region A
> +    
> +    Some time down the road, an incoming TCP connection is accepted,
> +    allocating a fresh SVCXPRT. The memory region A is inside the
> +    new SVCXPRT
> +    
> +     - While processing the TCP call, another UDP call comes in, again
> +       overwriting region A with the client's address
> +     - TCP client closes connection. In svc_destroy, we now trip over
> +       the garbage left in region A
> +    
> +    We ran into the case where a commercial scanner was triggering
> +    occasional rpcbind segfaults. The core file that was captured showed
> +    a corrupted xprt->xp_netid pointer that was really a sockaddr_in.
> +    
> +    Signed-off-by: Olaf Kirch <okir@...e.de>
> +
> +    Upstream-Status: Backport
> +
> +    Signed-off-by: Li Zhou <li.zhou@windriver.com>
> +---
> + src/rpcb_svc_com.c |   23 ++++++++++++++++++++++-
> + 1 file changed, 22 insertions(+), 1 deletion(-)
> +
> +Index: rpcbind-0.1.6+git20080930/src/rpcb_svc_com.c
> +===================================================================
> +--- rpcbind-0.1.6+git20080930.orig/src/rpcb_svc_com.c
> ++++ rpcbind-0.1.6+git20080930/src/rpcb_svc_com.c
> +@@ -1298,12 +1298,33 @@ check_rmtcalls(struct pollfd *pfds, int
> + 	return (ncallbacks_found);
> + }
> + 
> ++/*
> ++ * This is really a helper function defined in libtirpc, but unfortunately, it hasn't
> ++ * been exported yet.
> ++ */
> ++static struct netbuf *
> ++__rpc_set_netbuf(struct netbuf *nb, const void *ptr, size_t len)
> ++{
> ++	if (nb->len != len) {
> ++		if (nb->len)
> ++			mem_free(nb->buf, nb->len);
> ++		nb->buf = mem_alloc(len);
> ++		if (nb->buf == NULL)
> ++			return NULL;
> ++
> ++		nb->maxlen = nb->len = len;
> ++	}
> ++	memcpy(nb->buf, ptr, len);
> ++	return nb;
> ++}
> ++
> + static void
> + xprt_set_caller(SVCXPRT *xprt, struct finfo *fi)
> + {
> ++	const struct netbuf *caller = fi->caller_addr;
> + 	u_int32_t *xidp;
> + 
> +-	*(svc_getrpccaller(xprt)) = *(fi->caller_addr);
> ++	__rpc_set_netbuf(svc_getrpccaller(xprt), caller->buf, caller->len);
> + 	xidp = __rpcb_get_dg_xidp(xprt);
> + 	*xidp = fi->caller_xid;
> + }
> diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
> index 237018b..9b1c650 100644
> --- a/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
> +++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
> @@ -19,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
>             file://rpcbind.conf \
>             file://rpcbind.socket \
>             file://rpcbind.service \
> +           file://rpcbind_Fix_memory_corruption_in_PMAP_CALLIT_code.patch \
>            "
>  MUSLPATCHES_libc-musl = "file://musl-sunrpc.patch"
>  
> 

