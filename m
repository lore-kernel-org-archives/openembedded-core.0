Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3EEBE60667
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 10:23:07 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id f52so139812689qga.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 03:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=elC3fO9XWDc5WvWlb6/aKovY+ohGyp5xApSL8tQZBq4=;
	b=kAeEJSJ+lRtUoAc89YkrguRwy0/bP4n6U1pH00eeFA3zL96VuaOW2M7kWAZYGwNOeM
	q9rB2TkZ5impzEjaYv9GD1qJzfX0Ob80+DPHvk9OlW/V9kS1ReHZdb8Mwl/DQ+Hjb88b
	kIZqC48WbM4qhnViRu9g55eLxxbUsdzX/YwOHfNa9RdovVTDfqGy3N/DZk+hcMzrtMM5
	XSx9LVvwOkXtF1SN0Yp5pYOGTDMSdkaqOQmBgI2TJpfEQ1bQ6VxqoBcBoOPS1lQhz0LP
	lhgSMdm7MYVq4b96uU7Y9+PNf5JcIKO1bIPe/hY67YzqX9OIp8GDNVUTobE4P778VR0U
	EVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=elC3fO9XWDc5WvWlb6/aKovY+ohGyp5xApSL8tQZBq4=;
	b=ANb7i4+2Z2Ib1/bSLxz9A47LZnUcGX9sqrX2aMnAozE/BPjjkE8jf9W4YRlt0Lc688
	EKzaOtOhT8UfNnBcIuzIn65VKNeUoKxvVTjY8oZlq2CEsrCLUukEO9ZtqxiwKdCRsY7P
	UnnFDPOJ7WizfI8xTG9YXRhT0uE8UUkHbZHgJjbNMh2KBixl+zTJiQt2/K7Eof5w7LUN
	V3UXmXZ6qpxHhhOCdtNJcAoC24C0OtqeuQDwahvq6riaSagMUjF5/IeSM7kgRJntspc9
	ductZ0PIk0G+lLjCDXnraXV/fgej/FqNo4iNHJjoGJt3OKusfoviJQW8I1MhgdajrMYj
	5ELg==
X-Gm-Message-State: AD7BkJJhe5nr5D4I1hqjqLWDffi2WGbupNZ/pv2qBPReLOEY0Xe8US+FmAVJDmeRLox93hFf3uiLOjt2owuobQ==
MIME-Version: 1.0
X-Received: by 10.140.100.184 with SMTP id s53mr26704762qge.19.1460370188015; 
	Mon, 11 Apr 2016 03:23:08 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Mon, 11 Apr 2016 03:23:07 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Mon, 11 Apr 2016 03:23:07 -0700 (PDT)
In-Reply-To: <1459935290-3827-1-git-send-email-javier.viguera@digi.com>
References: <1459935290-3827-1-git-send-email-javier.viguera@digi.com>
Date: Mon, 11 Apr 2016 03:23:07 -0700
Message-ID: <CAMKF1sqQZzo5NT02aHKiM9BnN3_Bc2mM1OF=S6H3gnTmiPg9=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Javier Viguera <javier.viguera@digi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH] eglibc: security fix CVE-2015-7547
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
X-List-Received-Date: Mon, 11 Apr 2016 10:23:09 -0000
Content-Type: multipart/alternative; boundary=001a1134f2084c1d86053032eefe

--001a1134f2084c1d86053032eefe
Content-Type: text/plain; charset=UTF-8

This is an important fix. Looks good to me
On Apr 6, 2016 5:35 AM, "Javier Viguera" <javier.viguera@digi.com> wrote:

> CVE-2015-7547: getaddrinfo() stack-based buffer overflow
>
> Backport patch from GLIBC-2.20 to EGLIBC-2.19.
>
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> ---
>  .../eglibc/eglibc-2.19/CVE-2015-7547.patch         | 585
> +++++++++++++++++++++
>  meta/recipes-core/eglibc/eglibc_2.19.bb            |   1 +
>  2 files changed, 586 insertions(+)
>  create mode 100644
> meta/recipes-core/eglibc/eglibc-2.19/CVE-2015-7547.patch
>
> diff --git a/meta/recipes-core/eglibc/eglibc-2.19/CVE-2015-7547.patch
> b/meta/recipes-core/eglibc/eglibc-2.19/CVE-2015-7547.patch
> new file mode 100644
> index 000000000000..2a52e56cb7f4
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.19/CVE-2015-7547.patch
> @@ -0,0 +1,585 @@
> +From: Carlos O'Donell <carlos@systemhalted.org>
> +Date: Tue, 16 Feb 2016 21:26:37 -0500
> +Subject: [PATCH] CVE-2015-7547: getaddrinfo() stack-based buffer overflow
> (Bug
> + 18665).
> +
> +* A stack-based buffer overflow was found in libresolv when invoked from
> +  libnss_dns, allowing specially crafted DNS responses to seize control
> +  of execution flow in the DNS client.  The buffer overflow occurs in
> +  the functions send_dg (send datagram) and send_vc (send TCP) for the
> +  NSS module libnss_dns.so.2 when calling getaddrinfo with AF_UNSPEC
> +  family.  The use of AF_UNSPEC triggers the low-level resolver code to
> +  send out two parallel queries for A and AAAA.  A mismanagement of the
> +  buffers used for those queries could result in the response of a query
> +  writing beyond the alloca allocated buffer created by
> +  _nss_dns_gethostbyname4_r.  Buffer management is simplified to remove
> +  the overflow.  Thanks to the Google Security Team and Red Hat for
> +  reporting the security impact of this issue, and Robert Holiday of
> +  Ciena for reporting the related bug 18665. (CVE-2015-7547)
> +
> +See also:
> +https://sourceware.org/ml/libc-alpha/2016-02/msg00416.html
> +https://sourceware.org/ml/libc-alpha/2016-02/msg00418.html
> +
> +Upstream-Status: Backport
> +CVE: CVE-2015-7547
> +
> +Upstream commit:
> +
> https://sourceware.org/git/?p=glibc.git;a=commit;h=16d0a0ce7613552301786bf05d7eba8784b5732c
> +
> +Tweaks:
> +* Adapted from GLIBC-2.20 to EGLIBC-2.19
> +* Removed changes to ChangeLog and NEWS files
> +
> +Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> +---
> + resolv/nss_dns/dns-host.c | 111 +++++++++++++++++++-
> + resolv/res_query.c        |   3 +
> + resolv/res_send.c         | 257
> +++++++++++++++++++++++++++++++++++-----------
> + 3 files changed, 309 insertions(+), 62 deletions(-)
> +
> +diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
> +index f8f192e5afb5..e7e2c7137a50 100644
> +--- a/resolv/nss_dns/dns-host.c
> ++++ b/resolv/nss_dns/dns-host.c
> +@@ -1049,7 +1049,10 @@ gaih_getanswer_slice (const querybuf *answer, int
> anslen, const char *qname,
> +   int h_namelen = 0;
> +
> +   if (ancount == 0)
> +-    return NSS_STATUS_NOTFOUND;
> ++    {
> ++      *h_errnop = HOST_NOT_FOUND;
> ++      return NSS_STATUS_NOTFOUND;
> ++    }
> +
> +   while (ancount-- > 0 && cp < end_of_message && had_error == 0)
> +     {
> +@@ -1226,7 +1229,14 @@ gaih_getanswer_slice (const querybuf *answer, int
> anslen, const char *qname,
> +   /* Special case here: if the resolver sent a result but it only
> +      contains a CNAME while we are looking for a T_A or T_AAAA record,
> +      we fail with NOTFOUND instead of TRYAGAIN.  */
> +-  return canon == NULL ? NSS_STATUS_TRYAGAIN : NSS_STATUS_NOTFOUND;
> ++  if (canon != NULL)
> ++    {
> ++      *h_errnop = HOST_NOT_FOUND;
> ++      return NSS_STATUS_NOTFOUND;
> ++    }
> ++
> ++  *h_errnop = NETDB_INTERNAL;
> ++  return NSS_STATUS_TRYAGAIN;
> + }
> +
> +
> +@@ -1240,11 +1250,101 @@ gaih_getanswer (const querybuf *answer1, int
> anslen1, const querybuf *answer2,
> +
> +   enum nss_status status = NSS_STATUS_NOTFOUND;
> +
> ++  /* Combining the NSS status of two distinct queries requires some
> ++     compromise and attention to symmetry (A or AAAA queries can be
> ++     returned in any order).  What follows is a breakdown of how this
> ++     code is expected to work and why. We discuss only SUCCESS,
> ++     TRYAGAIN, NOTFOUND and UNAVAIL, since they are the only returns
> ++     that apply (though RETURN and MERGE exist).  We make a distinction
> ++     between TRYAGAIN (recoverable) and TRYAGAIN' (not-recoverable).
> ++     A recoverable TRYAGAIN is almost always due to buffer size issues
> ++     and returns ERANGE in errno and the caller is expected to retry
> ++     with a larger buffer.
> ++
> ++     Lastly, you may be tempted to make significant changes to the
> ++     conditions in this code to bring about symmetry between responses.
> ++     Please don't change anything without due consideration for
> ++     expected application behaviour.  Some of the synthesized responses
> ++     aren't very well thought out and sometimes appear to imply that
> ++     IPv4 responses are always answer 1, and IPv6 responses are always
> ++     answer 2, but that's not true (see the implementation of send_dg
> ++     and send_vc to see response can arrive in any order, particularly
> ++     for UDP). However, we expect it holds roughly enough of the time
> ++     that this code works, but certainly needs to be fixed to make this
> ++     a more robust implementation.
> ++
> ++     ----------------------------------------------
> ++     | Answer 1 Status /   | Synthesized | Reason |
> ++     | Answer 2 Status     | Status      |        |
> ++     |--------------------------------------------|
> ++     | SUCCESS/SUCCESS     | SUCCESS     | [1]    |
> ++     | SUCCESS/TRYAGAIN    | TRYAGAIN    | [5]    |
> ++     | SUCCESS/TRYAGAIN'   | SUCCESS     | [1]    |
> ++     | SUCCESS/NOTFOUND    | SUCCESS     | [1]    |
> ++     | SUCCESS/UNAVAIL     | SUCCESS     | [1]    |
> ++     | TRYAGAIN/SUCCESS    | TRYAGAIN    | [2]    |
> ++     | TRYAGAIN/TRYAGAIN   | TRYAGAIN    | [2]    |
> ++     | TRYAGAIN/TRYAGAIN'  | TRYAGAIN    | [2]    |
> ++     | TRYAGAIN/NOTFOUND   | TRYAGAIN    | [2]    |
> ++     | TRYAGAIN/UNAVAIL    | TRYAGAIN    | [2]    |
> ++     | TRYAGAIN'/SUCCESS   | SUCCESS     | [3]    |
> ++     | TRYAGAIN'/TRYAGAIN  | TRYAGAIN    | [3]    |
> ++     | TRYAGAIN'/TRYAGAIN' | TRYAGAIN'   | [3]    |
> ++     | TRYAGAIN'/NOTFOUND  | TRYAGAIN'   | [3]    |
> ++     | TRYAGAIN'/UNAVAIL   | UNAVAIL     | [3]    |
> ++     | NOTFOUND/SUCCESS    | SUCCESS     | [3]    |
> ++     | NOTFOUND/TRYAGAIN   | TRYAGAIN    | [3]    |
> ++     | NOTFOUND/TRYAGAIN'  | TRYAGAIN'   | [3]    |
> ++     | NOTFOUND/NOTFOUND   | NOTFOUND    | [3]    |
> ++     | NOTFOUND/UNAVAIL    | UNAVAIL     | [3]    |
> ++     | UNAVAIL/SUCCESS     | UNAVAIL     | [4]    |
> ++     | UNAVAIL/TRYAGAIN    | UNAVAIL     | [4]    |
> ++     | UNAVAIL/TRYAGAIN'   | UNAVAIL     | [4]    |
> ++     | UNAVAIL/NOTFOUND    | UNAVAIL     | [4]    |
> ++     | UNAVAIL/UNAVAIL     | UNAVAIL     | [4]    |
> ++     ----------------------------------------------
> ++
> ++     [1] If the first response is a success we return success.
> ++       This ignores the state of the second answer and in fact
> ++       incorrectly sets errno and h_errno to that of the second
> ++       answer.  However because the response is a success we ignore
> ++       *errnop and *h_errnop (though that means you touched errno on
> ++       success).  We are being conservative here and returning the
> ++       likely IPv4 response in the first answer as a success.
> ++
> ++     [2] If the first response is a recoverable TRYAGAIN we return
> ++       that instead of looking at the second response.  The
> ++       expectation here is that we have failed to get an IPv4 response
> ++       and should retry both queries.
> ++
> ++     [3] If the first response was not a SUCCESS and the second
> ++       response is not NOTFOUND (had a SUCCESS, need to TRYAGAIN,
> ++       or failed entirely e.g. TRYAGAIN' and UNAVAIL) then use the
> ++       result from the second response, otherwise the first responses
> ++       status is used.  Again we have some odd side-effects when the
> ++       second response is NOTFOUND because we overwrite *errnop and
> ++       *h_errnop that means that a first answer of NOTFOUND might see
> ++       its *errnop and *h_errnop values altered.  Whether it matters
> ++       in practice that a first response NOTFOUND has the wrong
> ++       *errnop and *h_errnop is undecided.
> ++
> ++     [4] If the first response is UNAVAIL we return that instead of
> ++       looking at the second response.  The expectation here is that
> ++       it will have failed similarly e.g. configuration failure.
> ++
> ++     [5] Testing this code is complicated by the fact that truncated
> ++       second response buffers might be returned as SUCCESS if the
> ++       first answer is a SUCCESS.  To fix this we add symmetry to
> ++       TRYAGAIN with the second response.  If the second response
> ++       is a recoverable error we now return TRYAGIN even if the first
> ++       response was SUCCESS.  */
> ++
> +   if (anslen1 > 0)
> +     status = gaih_getanswer_slice(answer1, anslen1, qname,
> +                                 &pat, &buffer, &buflen,
> +                                 errnop, h_errnop, ttlp,
> +                                 &first);
> ++
> +   if ((status == NSS_STATUS_SUCCESS || status == NSS_STATUS_NOTFOUND
> +        || (status == NSS_STATUS_TRYAGAIN
> +          /* We want to look at the second answer in case of an
> +@@ -1260,8 +1360,15 @@ gaih_getanswer (const querybuf *answer1, int
> anslen1, const querybuf *answer2,
> +                                                    &pat, &buffer,
> &buflen,
> +                                                    errnop, h_errnop,
> ttlp,
> +                                                    &first);
> ++      /* Use the second response status in some cases.  */
> +       if (status != NSS_STATUS_SUCCESS && status2 != NSS_STATUS_NOTFOUND)
> +       status = status2;
> ++      /* Do not return a truncated second response (unless it was
> ++       unavoidable e.g. unrecoverable TRYAGAIN).  */
> ++      if (status == NSS_STATUS_SUCCESS
> ++        && (status2 == NSS_STATUS_TRYAGAIN
> ++            && *errnop == ERANGE && *h_errnop != NO_RECOVERY))
> ++      status = NSS_STATUS_TRYAGAIN;
> +     }
> +
> +   return status;
> +diff --git a/resolv/res_query.c b/resolv/res_query.c
> +index 1325f9772ddc..dd87e097c461 100644
> +--- a/resolv/res_query.c
> ++++ b/resolv/res_query.c
> +@@ -391,6 +391,7 @@ __libc_res_nsearch(res_state statp,
> +                 {
> +                   free (*answerp2);
> +                   *answerp2 = NULL;
> ++                  *nanswerp2 = 0;
> +                 }
> +       }
> +
> +@@ -431,6 +432,7 @@ __libc_res_nsearch(res_state statp,
> +                         {
> +                           free (*answerp2);
> +                           *answerp2 = NULL;
> ++                          *nanswerp2 = 0;
> +                         }
> +
> +                       /*
> +@@ -502,6 +504,7 @@ __libc_res_nsearch(res_state statp,
> +         {
> +           free (*answerp2);
> +           *answerp2 = NULL;
> ++          *nanswerp2 = 0;
> +         }
> +       if (saved_herrno != -1)
> +               RES_SET_H_ERRNO(statp, saved_herrno);
> +diff --git a/resolv/res_send.c b/resolv/res_send.c
> +index 7f2e85f3240e..5940b0c7ebf7 100644
> +--- a/resolv/res_send.c
> ++++ b/resolv/res_send.c
> +@@ -1,3 +1,20 @@
> ++/* Copyright (C) 2016 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> + /*
> +  * Copyright (c) 1985, 1989, 1993
> +  *    The Regents of the University of California.  All rights reserved.
> +@@ -360,6 +377,8 @@ __libc_res_nsend(res_state statp, const u_char *buf,
> int buflen,
> + #ifdef USE_HOOKS
> +       if (__builtin_expect (statp->qhook || statp->rhook, 0)) {
> +               if (anssiz < MAXPACKET && ansp) {
> ++                      /* Always allocate MAXPACKET, callers expect
> ++                         this specific size.  */
> +                       u_char *buf = malloc (MAXPACKET);
> +                       if (buf == NULL)
> +                               return (-1);
> +@@ -652,6 +671,77 @@ libresolv_hidden_def (res_nsend)
> +
> + /* Private */
> +
> ++/* The send_vc function is responsible for sending a DNS query over TCP
> ++   to the nameserver numbered NS from the res_state STATP i.e.
> ++   EXT(statp).nssocks[ns].  The function supports sending both IPv4 and
> ++   IPv6 queries at the same serially on the same socket.
> ++
> ++   Please note that for TCP there is no way to disable sending both
> ++   queries, unlike UDP, which honours RES_SNGLKUP and RES_SNGLKUPREOP
> ++   and sends the queries serially and waits for the result after each
> ++   sent query.  This implemetnation should be corrected to honour these
> ++   options.
> ++
> ++   Please also note that for TCP we send both queries over the same
> ++   socket one after another.  This technically violates best practice
> ++   since the server is allowed to read the first query, respond, and
> ++   then close the socket (to service another client).  If the server
> ++   does this, then the remaining second query in the socket data buffer
> ++   will cause the server to send the client an RST which will arrive
> ++   asynchronously and the client's OS will likely tear down the socket
> ++   receive buffer resulting in a potentially short read and lost
> ++   response data.  This will force the client to retry the query again,
> ++   and this process may repeat until all servers and connection resets
> ++   are exhausted and then the query will fail.  It's not known if this
> ++   happens with any frequency in real DNS server implementations.  This
> ++   implementation should be corrected to use two sockets by default for
> ++   parallel queries.
> ++
> ++   The query stored in BUF of BUFLEN length is sent first followed by
> ++   the query stored in BUF2 of BUFLEN2 length.  Queries are sent
> ++   serially on the same socket.
> ++
> ++   Answers to the query are stored firstly in *ANSP up to a max of
> ++   *ANSSIZP bytes.  If more than *ANSSIZP bytes are needed and ANSCP
> ++   is non-NULL (to indicate that modifying the answer buffer is allowed)
> ++   then malloc is used to allocate a new response buffer and ANSCP and
> ++   ANSP will both point to the new buffer.  If more than *ANSSIZP bytes
> ++   are needed but ANSCP is NULL, then as much of the response as
> ++   possible is read into the buffer, but the results will be truncated.
> ++   When truncation happens because of a small answer buffer the DNS
> ++   packets header field TC will bet set to 1, indicating a truncated
> ++   message and the rest of the socket data will be read and discarded.
> ++
> ++   Answers to the query are stored secondly in *ANSP2 up to a max of
> ++   *ANSSIZP2 bytes, with the actual response length stored in
> ++   *RESPLEN2.  If more than *ANSSIZP bytes are needed and ANSP2
> ++   is non-NULL (required for a second query) then malloc is used to
> ++   allocate a new response buffer, *ANSSIZP2 is set to the new buffer
> ++   size and *ANSP2_MALLOCED is set to 1.
> ++
> ++   The ANSP2_MALLOCED argument will eventually be removed as the
> ++   change in buffer pointer can be used to detect the buffer has
> ++   changed and that the caller should use free on the new buffer.
> ++
> ++   Note that the answers may arrive in any order from the server and
> ++   therefore the first and second answer buffers may not correspond to
> ++   the first and second queries.
> ++
> ++   It is not supported to call this function with a non-NULL ANSP2
> ++   but a NULL ANSCP.  Put another way, you can call send_vc with a
> ++   single unmodifiable buffer or two modifiable buffers, but no other
> ++   combination is supported.
> ++
> ++   It is the caller's responsibility to free the malloc allocated
> ++   buffers by detecting that the pointers have changed from their
> ++   original values i.e. *ANSCP or *ANSP2 has changed.
> ++
> ++   If errors are encountered then *TERRNO is set to an appropriate
> ++   errno value and a zero result is returned for a recoverable error,
> ++   and a less-than zero result is returned for a non-recoverable error.
> ++
> ++   If no errors are encountered then *TERRNO is left unmodified and
> ++   a the length of the first response in bytes is returned.  */
> + static int
> + send_vc(res_state statp,
> +       const u_char *buf, int buflen, const u_char *buf2, int buflen2,
> +@@ -661,11 +751,7 @@ send_vc(res_state statp,
> + {
> +       const HEADER *hp = (HEADER *) buf;
> +       const HEADER *hp2 = (HEADER *) buf2;
> +-      u_char *ans = *ansp;
> +-      int orig_anssizp = *anssizp;
> +-      // XXX REMOVE
> +-      // int anssiz = *anssizp;
> +-      HEADER *anhp = (HEADER *) ans;
> ++      HEADER *anhp = (HEADER *) *ansp;
> +       struct sockaddr_in6 *nsap = EXT(statp).nsaddrs[ns];
> +       int truncating, connreset, resplen, n;
> +       struct iovec iov[4];
> +@@ -741,6 +827,8 @@ send_vc(res_state statp,
> +        * Receive length & response
> +        */
> +       int recvresp1 = 0;
> ++      /* Skip the second response if there is no second query.
> ++         To do that we mark the second response as received.  */
> +       int recvresp2 = buf2 == NULL;
> +       uint16_t rlen16;
> +  read_len:
> +@@ -777,33 +865,14 @@ send_vc(res_state statp,
> +       u_char **thisansp;
> +       int *thisresplenp;
> +       if ((recvresp1 | recvresp2) == 0 || buf2 == NULL) {
> ++              /* We have not received any responses
> ++                 yet or we only have one response to
> ++                 receive.  */
> +               thisanssizp = anssizp;
> +               thisansp = anscp ?: ansp;
> +               assert (anscp != NULL || ansp2 == NULL);
> +               thisresplenp = &resplen;
> +       } else {
> +-              if (*anssizp != MAXPACKET) {
> +-                      /* No buffer allocated for the first
> +-                         reply.  We can try to use the rest
> +-                         of the user-provided buffer.  */
> +-#ifdef _STRING_ARCH_unaligned
> +-                      *anssizp2 = orig_anssizp - resplen;
> +-                      *ansp2 = *ansp + resplen;
> +-#else
> +-                      int aligned_resplen
> +-                        = ((resplen + __alignof__ (HEADER) - 1)
> +-                           & ~(__alignof__ (HEADER) - 1));
> +-                      *anssizp2 = orig_anssizp - aligned_resplen;
> +-                      *ansp2 = *ansp + aligned_resplen;
> +-#endif
> +-              } else {
> +-                      /* The first reply did not fit into the
> +-                         user-provided buffer.  Maybe the second
> +-                         answer will.  */
> +-                      *anssizp2 = orig_anssizp;
> +-                      *ansp2 = *ansp;
> +-              }
> +-
> +               thisanssizp = anssizp2;
> +               thisansp = ansp2;
> +               thisresplenp = resplen2;
> +@@ -811,10 +880,14 @@ send_vc(res_state statp,
> +       anhp = (HEADER *) *thisansp;
> +
> +       *thisresplenp = rlen;
> +-      if (rlen > *thisanssizp) {
> +-              /* Yes, we test ANSCP here.  If we have two buffers
> +-                 both will be allocatable.  */
> +-              if (__builtin_expect (anscp != NULL, 1)) {
> ++      /* Is the answer buffer too small?  */
> ++      if (*thisanssizp < rlen) {
> ++              /* If the current buffer is not the the static
> ++                 user-supplied buffer then we can reallocate
> ++                 it.  */
> ++              if (thisansp != NULL && thisansp != ansp) {
> ++                      /* Always allocate MAXPACKET, callers expect
> ++                         this specific size.  */
> +                       u_char *newp = malloc (MAXPACKET);
> +                       if (newp == NULL) {
> +                               *terrno = ENOMEM;
> +@@ -824,6 +897,9 @@ send_vc(res_state statp,
> +                       *thisanssizp = MAXPACKET;
> +                       *thisansp = newp;
> +                       anhp = (HEADER *) newp;
> ++                      /* A uint16_t can't be larger than MAXPACKET
> ++                         thus it's safe to allocate MAXPACKET but
> ++                         read RLEN bytes instead.  */
> +                       len = rlen;
> +               } else {
> +                       Dprint(statp->options & RES_DEBUG,
> +@@ -987,6 +1063,66 @@ reopen (res_state statp, int *terrno, int ns)
> +       return 1;
> + }
> +
> ++/* The send_dg function is responsible for sending a DNS query over UDP
> ++   to the nameserver numbered NS from the res_state STATP i.e.
> ++   EXT(statp).nssocks[ns].  The function supports IPv4 and IPv6 queries
> ++   along with the ability to send the query in parallel for both stacks
> ++   (default) or serially (RES_SINGLKUP).  It also supports serial lookup
> ++   with a close and reopen of the socket used to talk to the server
> ++   (RES_SNGLKUPREOP) to work around broken name servers.
> ++
> ++   The query stored in BUF of BUFLEN length is sent first followed by
> ++   the query stored in BUF2 of BUFLEN2 length.  Queries are sent
> ++   in parallel (default) or serially (RES_SINGLKUP or RES_SNGLKUPREOP).
> ++
> ++   Answers to the query are stored firstly in *ANSP up to a max of
> ++   *ANSSIZP bytes.  If more than *ANSSIZP bytes are needed and ANSCP
> ++   is non-NULL (to indicate that modifying the answer buffer is allowed)
> ++   then malloc is used to allocate a new response buffer and ANSCP and
> ++   ANSP will both point to the new buffer.  If more than *ANSSIZP bytes
> ++   are needed but ANSCP is NULL, then as much of the response as
> ++   possible is read into the buffer, but the results will be truncated.
> ++   When truncation happens because of a small answer buffer the DNS
> ++   packets header field TC will bet set to 1, indicating a truncated
> ++   message, while the rest of the UDP packet is discarded.
> ++
> ++   Answers to the query are stored secondly in *ANSP2 up to a max of
> ++   *ANSSIZP2 bytes, with the actual response length stored in
> ++   *RESPLEN2.  If more than *ANSSIZP bytes are needed and ANSP2
> ++   is non-NULL (required for a second query) then malloc is used to
> ++   allocate a new response buffer, *ANSSIZP2 is set to the new buffer
> ++   size and *ANSP2_MALLOCED is set to 1.
> ++
> ++   The ANSP2_MALLOCED argument will eventually be removed as the
> ++   change in buffer pointer can be used to detect the buffer has
> ++   changed and that the caller should use free on the new buffer.
> ++
> ++   Note that the answers may arrive in any order from the server and
> ++   therefore the first and second answer buffers may not correspond to
> ++   the first and second queries.
> ++
> ++   It is not supported to call this function with a non-NULL ANSP2
> ++   but a NULL ANSCP.  Put another way, you can call send_vc with a
> ++   single unmodifiable buffer or two modifiable buffers, but no other
> ++   combination is supported.
> ++
> ++   It is the caller's responsibility to free the malloc allocated
> ++   buffers by detecting that the pointers have changed from their
> ++   original values i.e. *ANSCP or *ANSP2 has changed.
> ++
> ++   If an answer is truncated because of UDP datagram DNS limits then
> ++   *V_CIRCUIT is set to 1 and the return value non-zero to indicate to
> ++   the caller to retry with TCP.  The value *GOTSOMEWHERE is set to 1
> ++   if any progress was made reading a response from the nameserver and
> ++   is used by the caller to distinguish between ECONNREFUSED and
> ++   ETIMEDOUT (the latter if *GOTSOMEWHERE is 1).
> ++
> ++   If errors are encountered then *TERRNO is set to an appropriate
> ++   errno value and a zero result is returned for a recoverable error,
> ++   and a less-than zero result is returned for a non-recoverable error.
> ++
> ++   If no errors are encountered then *TERRNO is left unmodified and
> ++   a the length of the first response in bytes is returned.  */
> + static int
> + send_dg(res_state statp,
> +       const u_char *buf, int buflen, const u_char *buf2, int buflen2,
> +@@ -996,8 +1132,6 @@ send_dg(res_state statp,
> + {
> +       const HEADER *hp = (HEADER *) buf;
> +       const HEADER *hp2 = (HEADER *) buf2;
> +-      u_char *ans = *ansp;
> +-      int orig_anssizp = *anssizp;
> +       struct timespec now, timeout, finish;
> +       struct pollfd pfd[1];
> +       int ptimeout;
> +@@ -1030,6 +1164,8 @@ send_dg(res_state statp,
> +       int need_recompute = 0;
> +       int nwritten = 0;
> +       int recvresp1 = 0;
> ++      /* Skip the second response if there is no second query.
> ++         To do that we mark the second response as received.  */
> +       int recvresp2 = buf2 == NULL;
> +       pfd[0].fd = EXT(statp).nssocks[ns];
> +       pfd[0].events = POLLOUT;
> +@@ -1193,53 +1329,54 @@ send_dg(res_state statp,
> +               int *thisresplenp;
> +
> +               if ((recvresp1 | recvresp2) == 0 || buf2 == NULL) {
> ++                      /* We have not received any responses
> ++                         yet or we only have one response to
> ++                         receive.  */
> +                       thisanssizp = anssizp;
> +                       thisansp = anscp ?: ansp;
> +                       assert (anscp != NULL || ansp2 == NULL);
> +                       thisresplenp = &resplen;
> +               } else {
> +-                      if (*anssizp != MAXPACKET) {
> +-                              /* No buffer allocated for the first
> +-                                 reply.  We can try to use the rest
> +-                                 of the user-provided buffer.  */
> +-#ifdef _STRING_ARCH_unaligned
> +-                              *anssizp2 = orig_anssizp - resplen;
> +-                              *ansp2 = *ansp + resplen;
> +-#else
> +-                              int aligned_resplen
> +-                                = ((resplen + __alignof__ (HEADER) - 1)
> +-                                   & ~(__alignof__ (HEADER) - 1));
> +-                              *anssizp2 = orig_anssizp - aligned_resplen;
> +-                              *ansp2 = *ansp + aligned_resplen;
> +-#endif
> +-                      } else {
> +-                              /* The first reply did not fit into the
> +-                                 user-provided buffer.  Maybe the second
> +-                                 answer will.  */
> +-                              *anssizp2 = orig_anssizp;
> +-                              *ansp2 = *ansp;
> +-                      }
> +-
> +                       thisanssizp = anssizp2;
> +                       thisansp = ansp2;
> +                       thisresplenp = resplen2;
> +               }
> +
> +               if (*thisanssizp < MAXPACKET
> +-                  /* Yes, we test ANSCP here.  If we have two buffers
> +-                     both will be allocatable.  */
> +-                  && anscp
> ++                  /* If the current buffer is not the the static
> ++                     user-supplied buffer then we can reallocate
> ++                     it.  */
> ++                  && (thisansp != NULL && thisansp != ansp)
> + #ifdef FIONREAD
> ++                  /* Is the size too small?  */
> +                   && (ioctl (pfd[0].fd, FIONREAD, thisresplenp) < 0
> +                       || *thisanssizp < *thisresplenp)
> + #endif
> +                     ) {
> ++                      /* Always allocate MAXPACKET, callers expect
> ++                         this specific size.  */
> +                       u_char *newp = malloc (MAXPACKET);
> +                       if (newp != NULL) {
> +-                              *anssizp = MAXPACKET;
> +-                              *thisansp = ans = newp;
> ++                              *thisanssizp = MAXPACKET;
> ++                              *thisansp = newp;
> +                       }
> +               }
> ++              /* We could end up with truncation if anscp was NULL
> ++                 (not allowed to change caller's buffer) and the
> ++                 response buffer size is too small.  This isn't a
> ++                 reliable way to detect truncation because the ioctl
> ++                 may be an inaccurate report of the UDP message size.
> ++                 Therefore we use this only to issue debug output.
> ++                 To do truncation accurately with UDP we need
> ++                 MSG_TRUNC which is only available on Linux.  We
> ++                 can abstract out the Linux-specific feature in the
> ++                 future to detect truncation.  */
> ++              if (__glibc_unlikely (*thisanssizp < *thisresplenp)) {
> ++                      Dprint(statp->options & RES_DEBUG,
> ++                             (stdout, ";; response may be truncated
> (UDP)\n")
> ++                      );
> ++              }
> ++
> +               HEADER *anhp = (HEADER *) *thisansp;
> +               socklen_t fromlen = sizeof(struct sockaddr_in6);
> +               assert (sizeof(from) <= fromlen);
> diff --git a/meta/recipes-core/eglibc/eglibc_2.19.bb
> b/meta/recipes-core/eglibc/eglibc_2.19.bb
> index a15573c4d19b..66ccedced2d8 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.19.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.19.bb
> @@ -29,6 +29,7 @@ SRC_URI = "
> http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr25
>             file://CVE-2014-5119.patch \
>             file://CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch \
>             file://CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch
> \
> +           file://CVE-2015-7547.patch \
>            "
>  SRC_URI[md5sum] = "197836c2ba42fb146e971222647198dd"
>  SRC_URI[sha256sum] =
> "baaa030531fc308f7820c46acdf8e1b2f8e3c1f40bcd28b6e440d1c95d170d4c"
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1134f2084c1d86053032eefe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">This is an important fix. Looks good to me</p>
<div class=3D"gmail_quote">On Apr 6, 2016 5:35 AM, &quot;Javier Viguera&quo=
t; &lt;<a href=3D"mailto:javier.viguera@digi.com">javier.viguera@digi.com</=
a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">CVE-20=
15-7547: getaddrinfo() stack-based buffer overflow<br>
<br>
Backport patch from GLIBC-2.20 to EGLIBC-2.19.<br>
<br>
Signed-off-by: Javier Viguera &lt;<a href=3D"mailto:javier.viguera@digi.com=
">javier.viguera@digi.com</a>&gt;<br>
---<br>
=C2=A0.../eglibc/eglibc-2.19/CVE-2015-7547.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 585 +++++++++++++++++++++<br>
=C2=A0meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.19.bb" rel=3D"nor=
eferrer" target=3D"_blank">eglibc_2.19.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 586 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.19/CVE-2015-7547=
.patch<br>
<br>
diff --git a/meta/recipes-core/eglibc/eglibc-2.19/CVE-2015-7547.patch b/met=
a/recipes-core/eglibc/eglibc-2.19/CVE-2015-7547.patch<br>
new file mode 100644<br>
index 000000000000..2a52e56cb7f4<br>
--- /dev/null<br>
+++ b/meta/recipes-core/eglibc/eglibc-2.19/CVE-2015-7547.patch<br>
@@ -0,0 +1,585 @@<br>
+From: Carlos O&#39;Donell &lt;<a href=3D"mailto:carlos@systemhalted.org">c=
arlos@systemhalted.org</a>&gt;<br>
+Date: Tue, 16 Feb 2016 21:26:37 -0500<br>
+Subject: [PATCH] CVE-2015-7547: getaddrinfo() stack-based buffer overflow =
(Bug<br>
+ 18665).<br>
+<br>
+* A stack-based buffer overflow was found in libresolv when invoked from<b=
r>
+=C2=A0 libnss_dns, allowing specially crafted DNS responses to seize contr=
ol<br>
+=C2=A0 of execution flow in the DNS client.=C2=A0 The buffer overflow occu=
rs in<br>
+=C2=A0 the functions send_dg (send datagram) and send_vc (send TCP) for th=
e<br>
+=C2=A0 NSS module libnss_dns.so.2 when calling getaddrinfo with AF_UNSPEC<=
br>
+=C2=A0 family.=C2=A0 The use of AF_UNSPEC triggers the low-level resolver =
code to<br>
+=C2=A0 send out two parallel queries for A and AAAA.=C2=A0 A mismanagement=
 of the<br>
+=C2=A0 buffers used for those queries could result in the response of a qu=
ery<br>
+=C2=A0 writing beyond the alloca allocated buffer created by<br>
+=C2=A0 _nss_dns_gethostbyname4_r.=C2=A0 Buffer management is simplified to=
 remove<br>
+=C2=A0 the overflow.=C2=A0 Thanks to the Google Security Team and Red Hat =
for<br>
+=C2=A0 reporting the security impact of this issue, and Robert Holiday of<=
br>
+=C2=A0 Ciena for reporting the related bug 18665. (CVE-2015-7547)<br>
+<br>
+See also:<br>
+<a href=3D"https://sourceware.org/ml/libc-alpha/2016-02/msg00416.html" rel=
=3D"noreferrer" target=3D"_blank">https://sourceware.org/ml/libc-alpha/2016=
-02/msg00416.html</a><br>
+<a href=3D"https://sourceware.org/ml/libc-alpha/2016-02/msg00418.html" rel=
=3D"noreferrer" target=3D"_blank">https://sourceware.org/ml/libc-alpha/2016=
-02/msg00418.html</a><br>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2015-7547<br>
+<br>
+Upstream commit:<br>
+<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D16d0a0=
ce7613552301786bf05d7eba8784b5732c" rel=3D"noreferrer" target=3D"_blank">ht=
tps://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D16d0a0ce761355230178=
6bf05d7eba8784b5732c</a><br>
+<br>
+Tweaks:<br>
+* Adapted from GLIBC-2.20 to EGLIBC-2.19<br>
+* Removed changes to ChangeLog and NEWS files<br>
+<br>
+Signed-off-by: Javier Viguera &lt;<a href=3D"mailto:javier.viguera@digi.co=
m">javier.viguera@digi.com</a>&gt;<br>
+---<br>
+ resolv/nss_dns/dns-host.c | 111 +++++++++++++++++++-<br>
+ resolv/res_query.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
+ resolv/res_send.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 257 ++++++++++++++++=
+++++++++++++++++++-----------<br>
+ 3 files changed, 309 insertions(+), 62 deletions(-)<br>
+<br>
+diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c<br>
+index f8f192e5afb5..e7e2c7137a50 100644<br>
+--- a/resolv/nss_dns/dns-host.c<br>
++++ b/resolv/nss_dns/dns-host.c<br>
+@@ -1049,7 +1049,10 @@ gaih_getanswer_slice (const querybuf *answer, int a=
nslen, const char *qname,<br>
+=C2=A0 =C2=A0int h_namelen =3D 0;<br>
+<br>
+=C2=A0 =C2=A0if (ancount =3D=3D 0)<br>
+-=C2=A0 =C2=A0 return NSS_STATUS_NOTFOUND;<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 *h_errnop =3D HOST_NOT_FOUND;<br>
++=C2=A0 =C2=A0 =C2=A0 return NSS_STATUS_NOTFOUND;<br>
++=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0while (ancount-- &gt; 0 &amp;&amp; cp &lt; end_of_message &am=
p;&amp; had_error =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+@@ -1226,7 +1229,14 @@ gaih_getanswer_slice (const querybuf *answer, int a=
nslen, const char *qname,<br>
+=C2=A0 =C2=A0/* Special case here: if the resolver sent a result but it on=
ly<br>
+=C2=A0 =C2=A0 =C2=A0 contains a CNAME while we are looking for a T_A or T_=
AAAA record,<br>
+=C2=A0 =C2=A0 =C2=A0 we fail with NOTFOUND instead of TRYAGAIN.=C2=A0 */<b=
r>
+-=C2=A0 return canon =3D=3D NULL ? NSS_STATUS_TRYAGAIN : NSS_STATUS_NOTFOU=
ND;<br>
++=C2=A0 if (canon !=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 *h_errnop =3D HOST_NOT_FOUND;<br>
++=C2=A0 =C2=A0 =C2=A0 return NSS_STATUS_NOTFOUND;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 *h_errnop =3D NETDB_INTERNAL;<br>
++=C2=A0 return NSS_STATUS_TRYAGAIN;<br>
+ }<br>
+<br>
+<br>
+@@ -1240,11 +1250,101 @@ gaih_getanswer (const querybuf *answer1, int ansl=
en1, const querybuf *answer2,<br>
+<br>
+=C2=A0 =C2=A0enum nss_status status =3D NSS_STATUS_NOTFOUND;<br>
+<br>
++=C2=A0 /* Combining the NSS status of two distinct queries requires some<=
br>
++=C2=A0 =C2=A0 =C2=A0compromise and attention to symmetry (A or AAAA queri=
es can be<br>
++=C2=A0 =C2=A0 =C2=A0returned in any order).=C2=A0 What follows is a break=
down of how this<br>
++=C2=A0 =C2=A0 =C2=A0code is expected to work and why. We discuss only SUC=
CESS,<br>
++=C2=A0 =C2=A0 =C2=A0TRYAGAIN, NOTFOUND and UNAVAIL, since they are the on=
ly returns<br>
++=C2=A0 =C2=A0 =C2=A0that apply (though RETURN and MERGE exist).=C2=A0 We =
make a distinction<br>
++=C2=A0 =C2=A0 =C2=A0between TRYAGAIN (recoverable) and TRYAGAIN&#39; (not=
-recoverable).<br>
++=C2=A0 =C2=A0 =C2=A0A recoverable TRYAGAIN is almost always due to buffer=
 size issues<br>
++=C2=A0 =C2=A0 =C2=A0and returns ERANGE in errno and the caller is expecte=
d to retry<br>
++=C2=A0 =C2=A0 =C2=A0with a larger buffer.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0Lastly, you may be tempted to make significant change=
s to the<br>
++=C2=A0 =C2=A0 =C2=A0conditions in this code to bring about symmetry betwe=
en responses.<br>
++=C2=A0 =C2=A0 =C2=A0Please don&#39;t change anything without due consider=
ation for<br>
++=C2=A0 =C2=A0 =C2=A0expected application behaviour.=C2=A0 Some of the syn=
thesized responses<br>
++=C2=A0 =C2=A0 =C2=A0aren&#39;t very well thought out and sometimes appear=
 to imply that<br>
++=C2=A0 =C2=A0 =C2=A0IPv4 responses are always answer 1, and IPv6 response=
s are always<br>
++=C2=A0 =C2=A0 =C2=A0answer 2, but that&#39;s not true (see the implementa=
tion of send_dg<br>
++=C2=A0 =C2=A0 =C2=A0and send_vc to see response can arrive in any order, =
particularly<br>
++=C2=A0 =C2=A0 =C2=A0for UDP). However, we expect it holds roughly enough =
of the time<br>
++=C2=A0 =C2=A0 =C2=A0that this code works, but certainly needs to be fixed=
 to make this<br>
++=C2=A0 =C2=A0 =C2=A0a more robust implementation.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0----------------------------------------------<br>
++=C2=A0 =C2=A0 =C2=A0| Answer 1 Status /=C2=A0 =C2=A0| Synthesized | Reaso=
n |<br>
++=C2=A0 =C2=A0 =C2=A0| Answer 2 Status=C2=A0 =C2=A0 =C2=A0| Status=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0|--------------------------------------------|<br>
++=C2=A0 =C2=A0 =C2=A0| SUCCESS/SUCCESS=C2=A0 =C2=A0 =C2=A0| SUCCESS=C2=A0 =
=C2=A0 =C2=A0| [1]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| SUCCESS/TRYAGAIN=C2=A0 =C2=A0 | TRYAGAIN=C2=A0 =C2=
=A0 | [5]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| SUCCESS/TRYAGAIN&#39;=C2=A0 =C2=A0| SUCCESS=C2=A0 =
=C2=A0 =C2=A0| [1]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| SUCCESS/NOTFOUND=C2=A0 =C2=A0 | SUCCESS=C2=A0 =C2=
=A0 =C2=A0| [1]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| SUCCESS/UNAVAIL=C2=A0 =C2=A0 =C2=A0| SUCCESS=C2=A0 =
=C2=A0 =C2=A0| [1]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| TRYAGAIN/SUCCESS=C2=A0 =C2=A0 | TRYAGAIN=C2=A0 =C2=
=A0 | [2]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| TRYAGAIN/TRYAGAIN=C2=A0 =C2=A0| TRYAGAIN=C2=A0 =C2=
=A0 | [2]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| TRYAGAIN/TRYAGAIN&#39;=C2=A0 | TRYAGAIN=C2=A0 =C2=
=A0 | [2]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| TRYAGAIN/NOTFOUND=C2=A0 =C2=A0| TRYAGAIN=C2=A0 =C2=
=A0 | [2]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| TRYAGAIN/UNAVAIL=C2=A0 =C2=A0 | TRYAGAIN=C2=A0 =C2=
=A0 | [2]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| TRYAGAIN&#39;/SUCCESS=C2=A0 =C2=A0| SUCCESS=C2=A0 =
=C2=A0 =C2=A0| [3]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| TRYAGAIN&#39;/TRYAGAIN=C2=A0 | TRYAGAIN=C2=A0 =C2=
=A0 | [3]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| TRYAGAIN&#39;/TRYAGAIN&#39; | TRYAGAIN&#39;=C2=A0 =
=C2=A0| [3]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| TRYAGAIN&#39;/NOTFOUND=C2=A0 | TRYAGAIN&#39;=C2=A0 =
=C2=A0| [3]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| TRYAGAIN&#39;/UNAVAIL=C2=A0 =C2=A0| UNAVAIL=C2=A0 =
=C2=A0 =C2=A0| [3]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| NOTFOUND/SUCCESS=C2=A0 =C2=A0 | SUCCESS=C2=A0 =C2=
=A0 =C2=A0| [3]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| NOTFOUND/TRYAGAIN=C2=A0 =C2=A0| TRYAGAIN=C2=A0 =C2=
=A0 | [3]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| NOTFOUND/TRYAGAIN&#39;=C2=A0 | TRYAGAIN&#39;=C2=A0 =
=C2=A0| [3]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| NOTFOUND/NOTFOUND=C2=A0 =C2=A0| NOTFOUND=C2=A0 =C2=
=A0 | [3]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| NOTFOUND/UNAVAIL=C2=A0 =C2=A0 | UNAVAIL=C2=A0 =C2=
=A0 =C2=A0| [3]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| UNAVAIL/SUCCESS=C2=A0 =C2=A0 =C2=A0| UNAVAIL=C2=A0 =
=C2=A0 =C2=A0| [4]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| UNAVAIL/TRYAGAIN=C2=A0 =C2=A0 | UNAVAIL=C2=A0 =C2=
=A0 =C2=A0| [4]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| UNAVAIL/TRYAGAIN&#39;=C2=A0 =C2=A0| UNAVAIL=C2=A0 =
=C2=A0 =C2=A0| [4]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| UNAVAIL/NOTFOUND=C2=A0 =C2=A0 | UNAVAIL=C2=A0 =C2=
=A0 =C2=A0| [4]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0| UNAVAIL/UNAVAIL=C2=A0 =C2=A0 =C2=A0| UNAVAIL=C2=A0 =
=C2=A0 =C2=A0| [4]=C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0----------------------------------------------<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0[1] If the first response is a success we return succ=
ess.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0This ignores the state of the second answer an=
d in fact<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0incorrectly sets errno and h_errno to that of =
the second<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0answer.=C2=A0 However because the response is =
a success we ignore<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*errnop and *h_errnop (though that means you t=
ouched errno on<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0success).=C2=A0 We are being conservative here=
 and returning the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0likely IPv4 response in the first answer as a =
success.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0[2] If the first response is a recoverable TRYAGAIN w=
e return<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0that instead of looking at the second response=
.=C2=A0 The<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0expectation here is that we have failed to get=
 an IPv4 response<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0and should retry both queries.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0[3] If the first response was not a SUCCESS and the s=
econd<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0response is not NOTFOUND (had a SUCCESS, need =
to TRYAGAIN,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0or failed entirely e.g. TRYAGAIN&#39; and UNAV=
AIL) then use the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0result from the second response, otherwise the=
 first responses<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0status is used.=C2=A0 Again we have some odd s=
ide-effects when the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0second response is NOTFOUND because we overwri=
te *errnop and<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*h_errnop that means that a first answer of NO=
TFOUND might see<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0its *errnop and *h_errnop values altered.=C2=
=A0 Whether it matters<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0in practice that a first response NOTFOUND has=
 the wrong<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*errnop and *h_errnop is undecided.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0[4] If the first response is UNAVAIL we return that i=
nstead of<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0looking at the second response.=C2=A0 The expe=
ctation here is that<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0it will have failed similarly e.g. configurati=
on failure.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0[5] Testing this code is complicated by the fact that=
 truncated<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0second response buffers might be returned as S=
UCCESS if the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0first answer is a SUCCESS.=C2=A0 To fix this w=
e add symmetry to<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0TRYAGAIN with the second response.=C2=A0 If th=
e second response<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0is a recoverable error we now return TRYAGIN e=
ven if the first<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0response was SUCCESS.=C2=A0 */<br>
++<br>
+=C2=A0 =C2=A0if (anslen1 &gt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0status =3D gaih_getanswer_slice(answer1, anslen1, qnam=
e,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pat, &amp;buffer, &amp;bu=
flen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errnop, h_errnop, ttlp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;first);<br>
++<br>
+=C2=A0 =C2=A0if ((status =3D=3D NSS_STATUS_SUCCESS || status =3D=3D NSS_ST=
ATUS_NOTFOUND<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (status =3D=3D NSS_STATUS_TRYAGAIN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We want to look at the second answer=
 in case of an<br>
+@@ -1260,8 +1360,15 @@ gaih_getanswer (const querybuf *answer1, int anslen=
1, const querybuf *answer2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pat, &amp;buffer, &amp;buflen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errnop, h_errnop, ttlp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;first);<br>
++=C2=A0 =C2=A0 =C2=A0 /* Use the second response status in some cases.=C2=
=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (status !=3D NSS_STATUS_SUCCESS &amp;&amp; s=
tatus2 !=3D NSS_STATUS_NOTFOUND)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D status2;<br>
++=C2=A0 =C2=A0 =C2=A0 /* Do not return a truncated second response (unless=
 it was<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0unavoidable e.g. unrecoverable TRYAGAIN).=C2=
=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 if (status =3D=3D NSS_STATUS_SUCCESS<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (status2 =3D=3D NSS_STATUS_TRYAGAI=
N<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; *errnop =3D=3D ERANG=
E &amp;&amp; *h_errnop !=3D NO_RECOVERY))<br>
++=C2=A0 =C2=A0 =C2=A0 status =3D NSS_STATUS_TRYAGAIN;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0return status;<br>
+diff --git a/resolv/res_query.c b/resolv/res_query.c<br>
+index 1325f9772ddc..dd87e097c461 100644<br>
+--- a/resolv/res_query.c<br>
++++ b/resolv/res_query.c<br>
+@@ -391,6 +391,7 @@ __libc_res_nsearch(res_state statp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free =
(*answerp2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*answ=
erp2 =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *nanswerp2=
 =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+@@ -431,6 +432,7 @@ __libc_res_nsearch(res_state statp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0free (*answerp2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*answerp2 =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 *nanswerp2 =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*<br>
+@@ -502,6 +504,7 @@ __libc_res_nsearch(res_state statp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free (*answerp2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*answerp2 =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *nanswerp2 =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (saved_herrno !=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RES_SET_H_ERRNO(sta=
tp, saved_herrno);<br>
+diff --git a/resolv/res_send.c b/resolv/res_send.c<br>
+index 7f2e85f3240e..5940b0c7ebf7 100644<br>
+--- a/resolv/res_send.c<br>
++++ b/resolv/res_send.c<br>
+@@ -1,3 +1,20 @@<br>
++/* Copyright (C) 2016 Free Software Foundation, Inc.<br>
++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
++<br>
++=C2=A0 =C2=A0The GNU C Library is free software; you can redistribute it =
and/or<br>
++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General Public<b=
r>
++=C2=A0 =C2=A0License as published by the Free Software Foundation; either=
<br>
++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any later ve=
rsion.<br>
++<br>
++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that it will be=
 useful,<br>
++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied warranty =
of<br>
++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 S=
ee the GNU<br>
++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
++<br>
++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser General Pu=
blic<br>
++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<br>
++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D"noreferr=
er" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 */<br>
++<br>
+ /*<br>
+=C2=A0 * Copyright (c) 1985, 1989, 1993<br>
+=C2=A0 *=C2=A0 =C2=A0 The Regents of the University of California.=C2=A0 A=
ll rights reserved.<br>
+@@ -360,6 +377,8 @@ __libc_res_nsend(res_state statp, const u_char *buf, i=
nt buflen,<br>
+ #ifdef USE_HOOKS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (__builtin_expect (statp-&gt;qhook || statp-=
&gt;rhook, 0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (anssiz &lt; MAX=
PACKET &amp;&amp; ansp) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Always allocate MAXPACKET, callers expect<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0this specific size.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0u_char *buf =3D malloc (MAXPACKET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (buf =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (-1);<br>
+@@ -652,6 +671,77 @@ libresolv_hidden_def (res_nsend)<br>
+<br>
+ /* Private */<br>
+<br>
++/* The send_vc function is responsible for sending a DNS query over TCP<b=
r>
++=C2=A0 =C2=A0to the nameserver numbered NS from the res_state STATP i.e.<=
br>
++=C2=A0 =C2=A0EXT(statp).nssocks[ns].=C2=A0 The function supports sending =
both IPv4 and<br>
++=C2=A0 =C2=A0IPv6 queries at the same serially on the same socket.<br>
++<br>
++=C2=A0 =C2=A0Please note that for TCP there is no way to disable sending =
both<br>
++=C2=A0 =C2=A0queries, unlike UDP, which honours RES_SNGLKUP and RES_SNGLK=
UPREOP<br>
++=C2=A0 =C2=A0and sends the queries serially and waits for the result afte=
r each<br>
++=C2=A0 =C2=A0sent query.=C2=A0 This implemetnation should be corrected to=
 honour these<br>
++=C2=A0 =C2=A0options.<br>
++<br>
++=C2=A0 =C2=A0Please also note that for TCP we send both queries over the =
same<br>
++=C2=A0 =C2=A0socket one after another.=C2=A0 This technically violates be=
st practice<br>
++=C2=A0 =C2=A0since the server is allowed to read the first query, respond=
, and<br>
++=C2=A0 =C2=A0then close the socket (to service another client).=C2=A0 If =
the server<br>
++=C2=A0 =C2=A0does this, then the remaining second query in the socket dat=
a buffer<br>
++=C2=A0 =C2=A0will cause the server to send the client an RST which will a=
rrive<br>
++=C2=A0 =C2=A0asynchronously and the client&#39;s OS will likely tear down=
 the socket<br>
++=C2=A0 =C2=A0receive buffer resulting in a potentially short read and los=
t<br>
++=C2=A0 =C2=A0response data.=C2=A0 This will force the client to retry the=
 query again,<br>
++=C2=A0 =C2=A0and this process may repeat until all servers and connection=
 resets<br>
++=C2=A0 =C2=A0are exhausted and then the query will fail.=C2=A0 It&#39;s n=
ot known if this<br>
++=C2=A0 =C2=A0happens with any frequency in real DNS server implementation=
s.=C2=A0 This<br>
++=C2=A0 =C2=A0implementation should be corrected to use two sockets by def=
ault for<br>
++=C2=A0 =C2=A0parallel queries.<br>
++<br>
++=C2=A0 =C2=A0The query stored in BUF of BUFLEN length is sent first follo=
wed by<br>
++=C2=A0 =C2=A0the query stored in BUF2 of BUFLEN2 length.=C2=A0 Queries ar=
e sent<br>
++=C2=A0 =C2=A0serially on the same socket.<br>
++<br>
++=C2=A0 =C2=A0Answers to the query are stored firstly in *ANSP up to a max=
 of<br>
++=C2=A0 =C2=A0*ANSSIZP bytes.=C2=A0 If more than *ANSSIZP bytes are needed=
 and ANSCP<br>
++=C2=A0 =C2=A0is non-NULL (to indicate that modifying the answer buffer is=
 allowed)<br>
++=C2=A0 =C2=A0then malloc is used to allocate a new response buffer and AN=
SCP and<br>
++=C2=A0 =C2=A0ANSP will both point to the new buffer.=C2=A0 If more than *=
ANSSIZP bytes<br>
++=C2=A0 =C2=A0are needed but ANSCP is NULL, then as much of the response a=
s<br>
++=C2=A0 =C2=A0possible is read into the buffer, but the results will be tr=
uncated.<br>
++=C2=A0 =C2=A0When truncation happens because of a small answer buffer the=
 DNS<br>
++=C2=A0 =C2=A0packets header field TC will bet set to 1, indicating a trun=
cated<br>
++=C2=A0 =C2=A0message and the rest of the socket data will be read and dis=
carded.<br>
++<br>
++=C2=A0 =C2=A0Answers to the query are stored secondly in *ANSP2 up to a m=
ax of<br>
++=C2=A0 =C2=A0*ANSSIZP2 bytes, with the actual response length stored in<b=
r>
++=C2=A0 =C2=A0*RESPLEN2.=C2=A0 If more than *ANSSIZP bytes are needed and =
ANSP2<br>
++=C2=A0 =C2=A0is non-NULL (required for a second query) then malloc is use=
d to<br>
++=C2=A0 =C2=A0allocate a new response buffer, *ANSSIZP2 is set to the new =
buffer<br>
++=C2=A0 =C2=A0size and *ANSP2_MALLOCED is set to 1.<br>
++<br>
++=C2=A0 =C2=A0The ANSP2_MALLOCED argument will eventually be removed as th=
e<br>
++=C2=A0 =C2=A0change in buffer pointer can be used to detect the buffer ha=
s<br>
++=C2=A0 =C2=A0changed and that the caller should use free on the new buffe=
r.<br>
++<br>
++=C2=A0 =C2=A0Note that the answers may arrive in any order from the serve=
r and<br>
++=C2=A0 =C2=A0therefore the first and second answer buffers may not corres=
pond to<br>
++=C2=A0 =C2=A0the first and second queries.<br>
++<br>
++=C2=A0 =C2=A0It is not supported to call this function with a non-NULL AN=
SP2<br>
++=C2=A0 =C2=A0but a NULL ANSCP.=C2=A0 Put another way, you can call send_v=
c with a<br>
++=C2=A0 =C2=A0single unmodifiable buffer or two modifiable buffers, but no=
 other<br>
++=C2=A0 =C2=A0combination is supported.<br>
++<br>
++=C2=A0 =C2=A0It is the caller&#39;s responsibility to free the malloc all=
ocated<br>
++=C2=A0 =C2=A0buffers by detecting that the pointers have changed from the=
ir<br>
++=C2=A0 =C2=A0original values i.e. *ANSCP or *ANSP2 has changed.<br>
++<br>
++=C2=A0 =C2=A0If errors are encountered then *TERRNO is set to an appropri=
ate<br>
++=C2=A0 =C2=A0errno value and a zero result is returned for a recoverable =
error,<br>
++=C2=A0 =C2=A0and a less-than zero result is returned for a non-recoverabl=
e error.<br>
++<br>
++=C2=A0 =C2=A0If no errors are encountered then *TERRNO is left unmodified=
 and<br>
++=C2=A0 =C2=A0a the length of the first response in bytes is returned.=C2=
=A0 */<br>
+ static int<br>
+ send_vc(res_state statp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const u_char *buf, int buflen, const u_char *bu=
f2, int buflen2,<br>
+@@ -661,11 +751,7 @@ send_vc(res_state statp,<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const HEADER *hp =3D (HEADER *) buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const HEADER *hp2 =3D (HEADER *) buf2;<br>
+-=C2=A0 =C2=A0 =C2=A0 u_char *ans =3D *ansp;<br>
+-=C2=A0 =C2=A0 =C2=A0 int orig_anssizp =3D *anssizp;<br>
+-=C2=A0 =C2=A0 =C2=A0 // XXX REMOVE<br>
+-=C2=A0 =C2=A0 =C2=A0 // int anssiz =3D *anssizp;<br>
+-=C2=A0 =C2=A0 =C2=A0 HEADER *anhp =3D (HEADER *) ans;<br>
++=C2=A0 =C2=A0 =C2=A0 HEADER *anhp =3D (HEADER *) *ansp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sockaddr_in6 *nsap =3D EXT(statp).nsaddr=
s[ns];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int truncating, connreset, resplen, n;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct iovec iov[4];<br>
+@@ -741,6 +827,8 @@ send_vc(res_state statp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Receive length &amp; response<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int recvresp1 =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 /* Skip the second response if there is no second qu=
ery.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0To do that we mark the second response =
as received.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int recvresp2 =3D buf2 =3D=3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t rlen16;<br>
+=C2=A0 read_len:<br>
+@@ -777,33 +865,14 @@ send_vc(res_state statp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u_char **thisansp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int *thisresplenp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((recvresp1 | recvresp2) =3D=3D 0 || buf2 =
=3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We have not received =
any responses<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yet or we o=
nly have one response to<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0receive.=C2=
=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thisanssizp =3D ans=
sizp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thisansp =3D anscp =
?: ansp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert (anscp !=3D =
NULL || ansp2 =3D=3D NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thisresplenp =3D &a=
mp;resplen;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*anssizp !=3D MAXPAC=
KET) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* No buffer allocated for the first<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0reply.=C2=A0 We can try to use the rest<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0of the user-provided buffer.=C2=A0 */<br>
+-#ifdef _STRING_ARCH_unaligned<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *anssizp2 =3D orig_anssizp - resplen;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *ansp2 =3D *ansp + resplen;<br>
+-#else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int aligned_resplen<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D ((resplen + __alignof__ (HEADER) - 1)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp; ~(__alignof__ (HEADER) - 1));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *anssizp2 =3D orig_anssizp - aligned_resplen;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *ansp2 =3D *ansp + aligned_resplen;<br>
+-#endif<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* The first reply did not fit into the<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0user-provided buffer.=C2=A0 Maybe the second<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0answer will.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *anssizp2 =3D orig_anssizp;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *ansp2 =3D *ansp;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thisanssizp =3D ans=
sizp2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thisansp =3D ansp2;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thisresplenp =3D re=
splen2;<br>
+@@ -811,10 +880,14 @@ send_vc(res_state statp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0anhp =3D (HEADER *) *thisansp;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*thisresplenp =3D rlen;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (rlen &gt; *thisanssizp) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Yes, we test ANSCP he=
re.=C2=A0 If we have two buffers<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0both will b=
e allocatable.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (__builtin_expect (an=
scp !=3D NULL, 1)) {<br>
++=C2=A0 =C2=A0 =C2=A0 /* Is the answer buffer too small?=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 if (*thisanssizp &lt; rlen) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If the current buffer=
 is not the the static<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user-suppli=
ed buffer then we can reallocate<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0it.=C2=A0 *=
/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (thisansp !=3D NULL &=
amp;&amp; thisansp !=3D ansp) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Always allocate MAXPACKET, callers expect<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0this specific size.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0u_char *newp =3D malloc (MAXPACKET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (newp =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*terrno =3D ENOMEM;<br>
+@@ -824,6 +897,9 @@ send_vc(res_state statp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*thisanssizp =3D MAXPACKET;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*thisansp =3D newp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0anhp =3D (HEADER *) newp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* A uint16_t can&#39;t be larger than MAXPACKET<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0thus it&#39;s safe to allocate MAXPACKET but<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0read RLEN bytes instead.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0len =3D rlen;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Dprint(statp-&gt;options &amp; RES_DEBUG,<br>
+@@ -987,6 +1063,66 @@ reopen (res_state statp, int *terrno, int ns)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+ }<br>
+<br>
++/* The send_dg function is responsible for sending a DNS query over UDP<b=
r>
++=C2=A0 =C2=A0to the nameserver numbered NS from the res_state STATP i.e.<=
br>
++=C2=A0 =C2=A0EXT(statp).nssocks[ns].=C2=A0 The function supports IPv4 and=
 IPv6 queries<br>
++=C2=A0 =C2=A0along with the ability to send the query in parallel for bot=
h stacks<br>
++=C2=A0 =C2=A0(default) or serially (RES_SINGLKUP).=C2=A0 It also supports=
 serial lookup<br>
++=C2=A0 =C2=A0with a close and reopen of the socket used to talk to the se=
rver<br>
++=C2=A0 =C2=A0(RES_SNGLKUPREOP) to work around broken name servers.<br>
++<br>
++=C2=A0 =C2=A0The query stored in BUF of BUFLEN length is sent first follo=
wed by<br>
++=C2=A0 =C2=A0the query stored in BUF2 of BUFLEN2 length.=C2=A0 Queries ar=
e sent<br>
++=C2=A0 =C2=A0in parallel (default) or serially (RES_SINGLKUP or RES_SNGLK=
UPREOP).<br>
++<br>
++=C2=A0 =C2=A0Answers to the query are stored firstly in *ANSP up to a max=
 of<br>
++=C2=A0 =C2=A0*ANSSIZP bytes.=C2=A0 If more than *ANSSIZP bytes are needed=
 and ANSCP<br>
++=C2=A0 =C2=A0is non-NULL (to indicate that modifying the answer buffer is=
 allowed)<br>
++=C2=A0 =C2=A0then malloc is used to allocate a new response buffer and AN=
SCP and<br>
++=C2=A0 =C2=A0ANSP will both point to the new buffer.=C2=A0 If more than *=
ANSSIZP bytes<br>
++=C2=A0 =C2=A0are needed but ANSCP is NULL, then as much of the response a=
s<br>
++=C2=A0 =C2=A0possible is read into the buffer, but the results will be tr=
uncated.<br>
++=C2=A0 =C2=A0When truncation happens because of a small answer buffer the=
 DNS<br>
++=C2=A0 =C2=A0packets header field TC will bet set to 1, indicating a trun=
cated<br>
++=C2=A0 =C2=A0message, while the rest of the UDP packet is discarded.<br>
++<br>
++=C2=A0 =C2=A0Answers to the query are stored secondly in *ANSP2 up to a m=
ax of<br>
++=C2=A0 =C2=A0*ANSSIZP2 bytes, with the actual response length stored in<b=
r>
++=C2=A0 =C2=A0*RESPLEN2.=C2=A0 If more than *ANSSIZP bytes are needed and =
ANSP2<br>
++=C2=A0 =C2=A0is non-NULL (required for a second query) then malloc is use=
d to<br>
++=C2=A0 =C2=A0allocate a new response buffer, *ANSSIZP2 is set to the new =
buffer<br>
++=C2=A0 =C2=A0size and *ANSP2_MALLOCED is set to 1.<br>
++<br>
++=C2=A0 =C2=A0The ANSP2_MALLOCED argument will eventually be removed as th=
e<br>
++=C2=A0 =C2=A0change in buffer pointer can be used to detect the buffer ha=
s<br>
++=C2=A0 =C2=A0changed and that the caller should use free on the new buffe=
r.<br>
++<br>
++=C2=A0 =C2=A0Note that the answers may arrive in any order from the serve=
r and<br>
++=C2=A0 =C2=A0therefore the first and second answer buffers may not corres=
pond to<br>
++=C2=A0 =C2=A0the first and second queries.<br>
++<br>
++=C2=A0 =C2=A0It is not supported to call this function with a non-NULL AN=
SP2<br>
++=C2=A0 =C2=A0but a NULL ANSCP.=C2=A0 Put another way, you can call send_v=
c with a<br>
++=C2=A0 =C2=A0single unmodifiable buffer or two modifiable buffers, but no=
 other<br>
++=C2=A0 =C2=A0combination is supported.<br>
++<br>
++=C2=A0 =C2=A0It is the caller&#39;s responsibility to free the malloc all=
ocated<br>
++=C2=A0 =C2=A0buffers by detecting that the pointers have changed from the=
ir<br>
++=C2=A0 =C2=A0original values i.e. *ANSCP or *ANSP2 has changed.<br>
++<br>
++=C2=A0 =C2=A0If an answer is truncated because of UDP datagram DNS limits=
 then<br>
++=C2=A0 =C2=A0*V_CIRCUIT is set to 1 and the return value non-zero to indi=
cate to<br>
++=C2=A0 =C2=A0the caller to retry with TCP.=C2=A0 The value *GOTSOMEWHERE =
is set to 1<br>
++=C2=A0 =C2=A0if any progress was made reading a response from the nameser=
ver and<br>
++=C2=A0 =C2=A0is used by the caller to distinguish between ECONNREFUSED an=
d<br>
++=C2=A0 =C2=A0ETIMEDOUT (the latter if *GOTSOMEWHERE is 1).<br>
++<br>
++=C2=A0 =C2=A0If errors are encountered then *TERRNO is set to an appropri=
ate<br>
++=C2=A0 =C2=A0errno value and a zero result is returned for a recoverable =
error,<br>
++=C2=A0 =C2=A0and a less-than zero result is returned for a non-recoverabl=
e error.<br>
++<br>
++=C2=A0 =C2=A0If no errors are encountered then *TERRNO is left unmodified=
 and<br>
++=C2=A0 =C2=A0a the length of the first response in bytes is returned.=C2=
=A0 */<br>
+ static int<br>
+ send_dg(res_state statp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const u_char *buf, int buflen, const u_char *bu=
f2, int buflen2,<br>
+@@ -996,8 +1132,6 @@ send_dg(res_state statp,<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const HEADER *hp =3D (HEADER *) buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const HEADER *hp2 =3D (HEADER *) buf2;<br>
+-=C2=A0 =C2=A0 =C2=A0 u_char *ans =3D *ansp;<br>
+-=C2=A0 =C2=A0 =C2=A0 int orig_anssizp =3D *anssizp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct timespec now, timeout, finish;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pollfd pfd[1];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ptimeout;<br>
+@@ -1030,6 +1164,8 @@ send_dg(res_state statp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int need_recompute =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int nwritten =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int recvresp1 =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 /* Skip the second response if there is no second qu=
ery.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0To do that we mark the second response =
as received.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int recvresp2 =3D buf2 =3D=3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pfd[0].fd =3D EXT(statp).nssocks[ns];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pfd[0].events =3D POLLOUT;<br>
+@@ -1193,53 +1329,54 @@ send_dg(res_state statp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *thisresplenp;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((recvresp1 | re=
cvresp2) =3D=3D 0 || buf2 =3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* We have not received any responses<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0yet or we only have one response to<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0receive.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0thisanssizp =3D anssizp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0thisansp =3D anscp ?: ansp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0assert (anscp !=3D NULL || ansp2 =3D=3D NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0thisresplenp =3D &amp;resplen;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (*anssizp !=3D MAXPACKET) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No buffer allocated for the first<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reply.=C2=A0 We can try to use=
 the rest<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of the user-provided buffer.=
=C2=A0 */<br>
+-#ifdef _STRING_ARCH_unaligned<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *anssizp2 =3D orig_anssizp - resplen;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ansp2 =3D *ansp + resplen;<br>
+-#else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int aligned_resplen<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D ((resplen + __alignof__ (HEADER)=
 - 1)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp; ~(__alignof__ (HE=
ADER) - 1));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *anssizp2 =3D orig_anssizp - aligned_resple=
n;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ansp2 =3D *ansp + aligned_resplen;<br>
+-#endif<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The first reply did not fit into the<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user-provided buffer.=C2=A0 Ma=
ybe the second<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0answer will.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *anssizp2 =3D orig_anssizp;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ansp2 =3D *ansp;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0thisanssizp =3D anssizp2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0thisansp =3D ansp2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0thisresplenp =3D resplen2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*thisanssizp &l=
t; MAXPACKET<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Yes, we=
 test ANSCP here.=C2=A0 If we have two buffers<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0both will be allocatable.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp;=
 anscp<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If the =
current buffer is not the the static<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0user-supplied buffer then we can reallocate<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0it.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp;=
 (thisansp !=3D NULL &amp;&amp; thisansp !=3D ansp)<br>
+ #ifdef FIONREAD<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Is the =
size too small?=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
&amp; (ioctl (pfd[0].fd, FIONREAD, thisresplenp) &lt; 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|| *thisanssizp &lt; *thisresplenp)<br>
+ #endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Always allocate MAXPACKET, callers expect<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0this specific size.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0u_char *newp =3D malloc (MAXPACKET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (newp !=3D NULL) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *anssizp =3D MAXPACKET;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *thisansp =3D ans =3D newp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *thisanssizp =3D MAXPACKET;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *thisansp =3D newp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We could end up with =
truncation if anscp was NULL<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(not allowe=
d to change caller&#39;s buffer) and the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0response bu=
ffer size is too small.=C2=A0 This isn&#39;t a<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reliable wa=
y to detect truncation because the ioctl<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0may be an i=
naccurate report of the UDP message size.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Therefore w=
e use this only to issue debug output.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0To do trunc=
ation accurately with UDP we need<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MSG_TRUNC w=
hich is only available on Linux.=C2=A0 We<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0can abstrac=
t out the Linux-specific feature in the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0future to d=
etect truncation.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (__glibc_unlikely (*t=
hisanssizp &lt; *thisresplenp)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Dprint(statp-&gt;options &amp; RES_DEBUG,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(stdout, &quot;;; response may be truncated =
(UDP)\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HEADER *anhp =3D (H=
EADER *) *thisansp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0socklen_t fromlen =
=3D sizeof(struct sockaddr_in6);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert (sizeof(from=
) &lt;=3D fromlen);<br>
diff --git a/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.19.bb" rel=
=3D"noreferrer" target=3D"_blank">eglibc_2.19.bb</a> b/meta/recipes-core/eg=
libc/<a href=3D"http://eglibc_2.19.bb" rel=3D"noreferrer" target=3D"_blank"=
>eglibc_2.19.bb</a><br>
index a15573c4d19b..66ccedced2d8 100644<br>
--- a/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.19.bb" rel=3D"nor=
eferrer" target=3D"_blank">eglibc_2.19.bb</a><br>
+++ b/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.19.bb" rel=3D"nor=
eferrer" target=3D"_blank">eglibc_2.19.bb</a><br>
@@ -29,6 +29,7 @@ SRC_URI =3D &quot;<a href=3D"http://downloads.yoctoprojec=
t.org/releases/eglibc/eglibc-${PV}-svnr25" rel=3D"noreferrer" target=3D"_bl=
ank">http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr25<=
/a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2014-5119.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2014-7817-wordexp-fail=
s-to-honour-WRDE_NOCMD.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2012-3406-Stack-overfl=
ow-in-vfprintf-BZ-16617.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2015-7547.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;197836c2ba42fb146e971222647198dd&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;baaa030531fc308f7820c46acdf8e1b2f8e3c1f4=
0bcd28b6e440d1c95d170d4c&quot;<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a1134f2084c1d86053032eefe--
