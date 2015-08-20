Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB2473E11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 01:02:43 +0000 (UTC)
Received: by pawq9 with SMTP id q9so14777443paw.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 18:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=E2r5ltTCAAS8tVe1kG3Dsv9mmCNRMoK+9SgC1FSRiwI=;
	b=eZXE+bBGln1dYYHpi4PwObObCSmfc0ovX3sDmp82zw8qSzyuLQBg8gpYTU92F8/MGQ
	bCuqKxpi4lxVjJwdRJTqttLQ9S+MLUhOhRi9TRBALG7tRr1GL+ewopTcoRyazicPOmQK
	WqG4L2Bxi1VcGLvujJ/KNK4glrum+n0MNq2iPgLT0KY0zQ2fmt3OU97+8AxHImIaTiqf
	yRq0AJc+z3ssvzw+tsYYCivUbT/XktUnwCv7eXymbWTYRiT/6ycJ9XT5GDJjn2coyAh6
	dUFJs+wnV46tMzHA+BFFYqDGf4m6oi6pLKe7Fqb6j3tTneHjAAVfxWQ43Aehz5dEtEx2
	YB+Q==
X-Received: by 10.66.237.165 with SMTP id vd5mr857994pac.45.1440032563336;
	Wed, 19 Aug 2015 18:02:43 -0700 (PDT)
Received: from Akusters-laptop-2.local
	([2601:202:4000:1239:30b9:3948:d6b8:54e0])
	by smtp.googlemail.com with ESMTPSA id
	hz5sm2200007pbb.39.2015.08.19.18.02.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Aug 2015 18:02:42 -0700 (PDT)
Message-ID: <55D5272F.3050701@gmail.com>
Date: Wed, 19 Aug 2015 18:02:39 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Sona Sarmadi <sona.sarmadi@enea.com>, 
	openembedded-core@lists.openembedded.org
References: <1438256935-6126-1-git-send-email-sona.sarmadi@enea.com>
In-Reply-To: <1438256935-6126-1-git-send-email-sona.sarmadi@enea.com>
Subject: Re: [dizzy][PATCH] bind9.9.5: CVE-2015-5477
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
X-List-Received-Date: Thu, 20 Aug 2015 01:02:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 7/30/15 4:48 AM, Sona Sarmadi wrote:
> Fixed a flaw in the way BIND handled requests for TKEY
> DNS resource records.
>
> References:
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-5477
> https://kb.isc.org/article/AA-01272
>
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>

Merged to staging.

thanks,
Armin
> ---
>  .../bind/bind/bind9_9_5-CVE-2015-5477.patch        | 45 ++++++++++++++++++++++
>  meta/recipes-connectivity/bind/bind_9.9.5.bb       |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch
>
> diff --git a/meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch b/meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch
> new file mode 100644
> index 0000000..896272a
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch
> @@ -0,0 +1,45 @@
> +From dbb064aa7972ef918d9a235b713108a4846cbb62 Mon Sep 17 00:00:00 2001
> +From: Mark Andrews <marka@isc.org>
> +Date: Tue, 14 Jul 2015 14:48:42 +1000
> +Subject: [PATCH] 4165.   [bug]           An failure to reset a value to NULL
> + in tkey.c could                         result in an assertion failure.
> + (CVE-2015-5477)                         [RT #40046]
> +
> +Upstream-Status: Backport
> +[CHANGES file has been edited manually to add CVE-2015-5477 and
> +an already applied CVE (CVE-2014-8500)].
> +
> +Referenc: https://kb.isc.org/article/AA-01272
> +
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> +
> +diff -ruN a/CHANGES b/CHANGES
> +--- a/CHANGES	2014-01-27 19:58:24.000000000 +0100
> ++++ b/CHANGES	2015-07-30 11:03:18.871670769 +0200
> +@@ -1,4 +1,15 @@
> + 	--- 9.9.5 released ---
> ++4165.   [security]      An failure to reset a value to NULL in tkey.c could
> ++                        result in an assertion failure. (CVE-2015-5477)
> ++                        [RT #40046]
> ++
> ++4006.   [security]      A flaw in delegation handling could be exploited
> ++                        to put named into an infinite loop.  This has
> ++                        been addressed by placing limits on the number
> ++                        of levels of recursion named will allow (default 7),
> ++                        and the number of iterative queries that it will
> ++                        send (default 50) before terminating a recursive
> ++                        query (CVE-2014-8500).
> + 
> + 	--- 9.9.5rc2 released ---
> + 
> +diff -ruN a/lib/dns/tkey.c b/lib/dns/tkey.c
> +--- a/lib/dns/tkey.c	2014-01-27 19:58:24.000000000 +0100
> ++++ b/lib/dns/tkey.c	2015-07-30 10:58:30.647945942 +0200
> +@@ -650,6 +650,7 @@
> + 		 * Try the answer section, since that's where Win2000
> + 		 * puts it.
> + 		 */
> ++		name = NULL;
> + 		if (dns_message_findname(msg, DNS_SECTION_ANSWER, qname,
> + 					 dns_rdatatype_tkey, 0, &name,
> + 					 &tkeyset) != ISC_R_SUCCESS) {
> diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
> index 8e04f8a..e206cc4 100644
> --- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
> @@ -18,6 +18,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>             file://bind9 \
>             file://init.d-add-support-for-read-only-rootfs.patch \
>             file://bind9_9_5-CVE-2014-8500.patch \
> +           file://bind9_9_5-CVE-2015-5477.patch \
>  	   "
>  
>  SRC_URI[md5sum] = "e676c65cad5234617ee22f48e328c24e"


