Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id C7A087E7BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:08:37 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id u12so276375pls.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=0iLj5v3oOY/QD5zbbSaM6i4eWMTlYxjnA22NK9ZOFCU=;
	b=n0hupDplxeNPqNw3OJOfH1ffVMRU2A3dNPgqG6eG51izp5Yd+ZCwBDNsswZdsPdPpO
	2LB89ih0Hmbma51zKa8pDEPllELzpjnrecjmyge7nn3hnS18/3/DMOnHnw02IfVyILO4
	ahfdCTVdqlBUEwlbwR+9bwXFy7R25WNIB2ksdMKQA/vhzNe9pG75N2Up3jWCPGCM/cM6
	hHNHUrWJiP1NwFoOvVw+RyZxYvi/g5qVmav3Tj2CH+kmNRA2XjwOb14WjNFgMjb91w9k
	fu730QUqpYj0AesPlYTf+Uw4mkcjP1N5UP/5fPaOILlXE/2fYA3LG9h+jCCBgaDQoP6c
	9xbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=0iLj5v3oOY/QD5zbbSaM6i4eWMTlYxjnA22NK9ZOFCU=;
	b=Bbxkb83u3TbWIDu+d0hT9BPfAb0mGwZDWx4Zg5cY9OIjYPcu45PTlKtshh5vm1GQkR
	QJUdEDZirfeHpihT1rAzmVLrSDhMJQNJG2TGFF6NhBiHSHqXBuPNJ7HJOUC0zRoYMCK5
	vAnVuOkP9b5EFfAC/HUnI5aE+34SouQKfJ0CEeQ26YnVVW0tY7YG3nFyfqU7MfBt+c6y
	N3iBHi1BgExTaqS5a0iZOLR4Zk8Omfe5suO/RX/r472kvPJCebv5MnIsTcGt0p4vWxUT
	5sVFE4hNcWOmO/BtY8cORlEoBFK3Sxq1fzcK7xCWDoN2DTFeXMnxqO69kkseqTGLZg6P
	WZaw==
X-Gm-Message-State: APjAAAX1Oq/smDZGXw5ZoUKm+GPKKNCzwFHUfEC4uuUdIm8ZMUGNVGcM
	2v7s17MpJNTLx0lhLwbfqDDwIp+gzu8=
X-Google-Smtp-Source: APXvYqxdgysiETgldGGK+Obkj0ZofJWLJAjYL3H0bhBHBbwsQw/6vUyHJ2vlNGoM4q8UIqcb1UOJ+A==
X-Received: by 2002:a17:902:8d96:: with SMTP id
	v22mr536505plo.189.1569294518463; 
	Mon, 23 Sep 2019 20:08:38 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:ec07:55c0:9c8c:b3de?
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id c1sm175664pfb.135.2019.09.23.20.08.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Sep 2019 20:08:37 -0700 (PDT)
To: msft.dantran@gmail.com, openembedded-core@lists.openembedded.org
References: <20190920184657.74959-1-dantran@microsoft.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <535e814c-17e0-2373-e35b-840a54b1ec30@gmail.com>
Date: Mon, 23 Sep 2019 20:08:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920184657.74959-1-dantran@microsoft.com>
Subject: Re: [thud][PATCH] qemu: Fix 4 CVEs
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
X-List-Received-Date: Tue, 24 Sep 2019 03:08:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/20/19 11:46 AM, msft.dantran@gmail.com wrote:
> From: Dan Tran <dantran@microsoft.com>
>
> Fixes CVE-2018-18954, CVE-2019-3812, CVE-2019-6778, and CVE-2019-8934.
> Also deleted duplicated patch and cleanup.

Some of these CVE's are not fixed in Warrior. I will need Warrior fixed
prior to accepting this patch.

thanks.

- armin
>
> Signed-off-by: Dan Tran <dantran@microsoft.com>
> ---
>  .../qemu/qemu/CVE-2018-10839.patch            |   2 +-
>  .../qemu/qemu/CVE-2018-17958.patch            |  52 -----
>  .../qemu/qemu/CVE-2018-18954.patch            |  50 ++++
>  .../qemu/qemu/CVE-2019-3812.patch             |  39 ++++
>  .../qemu/qemu/CVE-2019-6778.patch             |  41 ++++
>  .../qemu/qemu/CVE-2019-8934.patch             | 215 ++++++++++++++++++
>  meta/recipes-devtools/qemu/qemu_3.0.0.bb      |   6 +-
>  7 files changed, 351 insertions(+), 54 deletions(-)
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-17958.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-18954.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-6778.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-10839.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-10839.patch
> index 7e1e442a41..81607c9505 100644
> --- a/meta/recipes-devtools/qemu/qemu/CVE-2018-10839.patch
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-10839.patch
> @@ -19,7 +19,7 @@ Signed-off-by: Jason Wang <jasowang@redhat.com>
>  Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commitdiff
>  ;h=fdc89e90fac40c5ca2686733df17b6423fb8d8fb#patch1]
>  
> -CVE: CVE-2018-10839
> +CVE: CVE-2018-10839 CVE-2018-17958
>  
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  ---
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-17958.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-17958.patch
> deleted file mode 100644
> index af40ff275a..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/CVE-2018-17958.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 06e88ca78d056ea4de885e3a1496805179dc47bc Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Mon, 15 Oct 2018 16:33:04 +0800
> -Subject: [PATCH] ne2000: fix possible out of bound access in ne2000_receive
> -
> -In ne2000_receive(), we try to assign size_ to size which converts
> -from size_t to integer. This will cause troubles when size_ is greater
> -INT_MAX, this will lead a negative value in size and it can then pass
> -the check of size < MIN_BUF_SIZE which may lead out of bound access of
> -for both buf and buf1.
> -
> -Fixing by converting the type of size to size_t.
> -
> -CC: address@hidden
> -Reported-by: Daniel Shapira <address@hidden>
> -Reviewed-by: Michael S. Tsirkin <address@hidden>
> -Signed-off-by: Jason Wang <address@hidden>
> -
> -Upstream-Status: Backport [https://lists.gnu.org/archive/html/qemu-devel/2018-09/msg03273.html]
> -
> -CVE: CVE-2018-17958
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - hw/net/ne2000.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
> -index 07d79e3..869518e 100644
> ---- a/hw/net/ne2000.c
> -+++ b/hw/net/ne2000.c
> -@@ -174,7 +174,7 @@ static int ne2000_buffer_full(NE2000State *s)
> - ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
> - {
> -     NE2000State *s = qemu_get_nic_opaque(nc);
> --    int size = size_;
> -+    size_t size = size_;
> -     uint8_t *p;
> -     unsigned int total_len, next, avail, len, index, mcast_idx;
> -     uint8_t buf1[60];
> -@@ -182,7 +182,7 @@ ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
> -         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
> - 
> - #if defined(DEBUG_NE2000)
> --    printf("NE2000: received len=%d\n", size);
> -+    printf("NE2000: received len=%zu\n", size);
> - #endif
> - 
> -     if (s->cmd & E8390_STOP || ne2000_buffer_full(s))
> --- 
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-18954.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-18954.patch
> new file mode 100644
> index 0000000000..9fe136455f
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-18954.patch
> @@ -0,0 +1,50 @@
> +From 3c9fd43da473a324f6cc7a0d3db58f651a2d262c Mon Sep 17 00:00:00 2001
> +From: Prasad J Pandit <pjp@fedoraproject.org>
> +Date: Fri, 26 Oct 2018 18:03:58 +0530
> +Subject: [PATCH] ppc/pnv: check size before data buffer access
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +While performing PowerNV memory r/w operations, the access length
> +'sz' could exceed the data[4] buffer size. Add check to avoid OOB
> +access.
> +
> +Reported-by: Moguofang <moguofang@huawei.com>
> +Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> +Reviewed-by: Cédric Le Goater <clg@kaod.org>
> +Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> +
> +CVE: CVE-2018-18954
> +Upstream-Status: Backport
> +[https://git.qemu.org/?p=qemu.git;a=commit;h=d07945e78eb6b593cd17a4640c1fc9eb35e3245d]
> +
> +Signed-off-by: Dan Tran <dantran@microsoft.com>
> +---
> + hw/ppc/pnv_lpc.c | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
> +index d7721320a2..172a915cfc 100644
> +--- a/hw/ppc/pnv_lpc.c
> ++++ b/hw/ppc/pnv_lpc.c
> +@@ -155,9 +155,15 @@ static void pnv_lpc_do_eccb(PnvLpcController *lpc, uint64_t cmd)
> +     /* XXX Check for magic bits at the top, addr size etc... */
> +     unsigned int sz = (cmd & ECCB_CTL_SZ_MASK) >> ECCB_CTL_SZ_LSH;
> +     uint32_t opb_addr = cmd & ECCB_CTL_ADDR_MASK;
> +-    uint8_t data[4];
> ++    uint8_t data[8];
> +     bool success;
> + 
> ++    if (sz > sizeof(data)) {
> ++        qemu_log_mask(LOG_GUEST_ERROR,
> ++            "ECCB: invalid operation at @0x%08x size %d\n", opb_addr, sz);
> ++        return;
> ++    }
> ++
> +     if (cmd & ECCB_CTL_READ) {
> +         success = opb_read(lpc, opb_addr, data, sz);
> +         if (success) {
> +-- 
> +2.22.0.vfs.1.1.57.gbaf16c8
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch
> new file mode 100644
> index 0000000000..0e11ad288c
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch
> @@ -0,0 +1,39 @@
> +From b664d9d003d1a98642dcfb8e6fceef6dbf3d52d8 Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Tue, 8 Jan 2019 11:23:01 +0100
> +Subject: [PATCH] i2c-ddc: fix oob read
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Suggested-by: Michael Hanselmann <public@hansmi.ch>
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +Reviewed-by: Michael Hanselmann <public@hansmi.ch>
> +Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> +Message-id: 20190108102301.1957-1-kraxel@redhat.com
> +
> +CVE: CVE-2019-3812
> +Upstream-Status: Backport
> +[https://git.qemu.org/?p=qemu.git;a=commit;h=b05b267840515730dbf6753495d5b7bd8b04ad1c]
> +
> +Signed-off-by: Dan Tran <dantran@microsoft.com>
> +---
> + hw/i2c/i2c-ddc.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/hw/i2c/i2c-ddc.c b/hw/i2c/i2c-ddc.c
> +index bec0c91e2d..89e659288e 100644
> +--- a/hw/i2c/i2c-ddc.c
> ++++ b/hw/i2c/i2c-ddc.c
> +@@ -247,7 +247,7 @@ static int i2c_ddc_rx(I2CSlave *i2c)
> +     I2CDDCState *s = I2CDDC(i2c);
> + 
> +     int value;
> +-    value = s->edid_blob[s->reg];
> ++    value = s->edid_blob[s->reg % sizeof(s->edid_blob)];
> +     s->reg++;
> +     return value;
> + }
> +-- 
> +2.22.0.vfs.1.1.57.gbaf16c8
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-6778.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-6778.patch
> new file mode 100644
> index 0000000000..5b14596042
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-6778.patch
> @@ -0,0 +1,41 @@
> +From b6c0fa3b435375918714e107b22de2ef13a41c26 Mon Sep 17 00:00:00 2001
> +From: Prasad J Pandit <pjp@fedoraproject.org>
> +Date: Sun, 13 Jan 2019 23:29:48 +0530
> +Subject: [PATCH] slirp: check data length while emulating ident function
> +
> +While emulating identification protocol, tcp_emu() does not check
> +available space in the 'sc_rcv->sb_data' buffer. It could lead to
> +heap buffer overflow issue. Add check to avoid it.
> +
> +Reported-by: Kira <864786842@qq.com>
> +Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> +Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> +
> +CVE: CVE-2019-6778
> +Upstream-Status: Backport
> +[https://git.qemu.org/?p=qemu.git;a=commit;h=a7104eda7dab99d0cdbd3595c211864cba415905]
> +
> +Signed-off-by: Dan Tran <dantran@microsoft.com>
> +---
> + slirp/tcp_subr.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/slirp/tcp_subr.c b/slirp/tcp_subr.c
> +index 8d0f94b75f..7277aadfdf 100644
> +--- a/slirp/tcp_subr.c
> ++++ b/slirp/tcp_subr.c
> +@@ -640,6 +640,11 @@ tcp_emu(struct socket *so, struct mbuf *m)
> + 			socklen_t addrlen = sizeof(struct sockaddr_in);
> + 			struct sbuf *so_rcv = &so->so_rcv;
> + 
> ++			if (m->m_len > so_rcv->sb_datalen
> ++					- (so_rcv->sb_wptr - so_rcv->sb_data)) {
> ++			    return 1;
> ++			}
> ++
> + 			memcpy(so_rcv->sb_wptr, m->m_data, m->m_len);
> + 			so_rcv->sb_wptr += m->m_len;
> + 			so_rcv->sb_rptr += m->m_len;
> +-- 
> +2.22.0.vfs.1.1.57.gbaf16c8
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
> new file mode 100644
> index 0000000000..db3201c505
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
> @@ -0,0 +1,215 @@
> +From 13e153f01b4f2a3e199202b34a247d83c176f21a Mon Sep 17 00:00:00 2001
> +From: Prasad J Pandit <pjp@fedoraproject.org>
> +Date: Mon, 18 Feb 2019 23:43:49 +0530
> +Subject: [PATCH] ppc: add host-serial and host-model machine attributes
> + (CVE-2019-8934)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +On ppc hosts, hypervisor shares following system attributes
> +
> +  - /proc/device-tree/system-id
> +  - /proc/device-tree/model
> +
> +with a guest. This could lead to information leakage and misuse.[*]
> +Add machine attributes to control such system information exposure
> +to a guest.
> +
> +[*] https://wiki.openstack.org/wiki/OSSN/OSSN-0028
> +
> +Reported-by: Daniel P. Berrangé <berrange@redhat.com>
> +Fix-suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> +Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> +Message-Id: <20190218181349.23885-1-ppandit@redhat.com>
> +Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> +Reviewed-by: Greg Kurz <groug@kaod.org>
> +Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> +
> +CVE: CVE-2019-8934
> +Upstream-Status: Backport
> +[https://github.com/qemu/qemu/commit/27461d69a0f108dea756419251acc3ea65198f1b]
> +
> +Signed-off-by: Dan Tran <dantran@microsoft.com>
> +---
> + hw/ppc/spapr.c         | 128 ++++++++++++++++++++++++++++++++++++++---
> + include/hw/ppc/spapr.h |   2 +
> + 2 files changed, 123 insertions(+), 7 deletions(-)
> +
> +diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> +index 421b2dd09b..069d678ee0 100644
> +--- a/hw/ppc/spapr.c
> ++++ b/hw/ppc/spapr.c
> +@@ -1266,13 +1266,30 @@ static void *spapr_build_fdt(sPAPRMachineState *spapr,
> +      * Add info to guest to indentify which host is it being run on
> +      * and what is the uuid of the guest
> +      */
> +-    if (kvmppc_get_host_model(&buf)) {
> +-        _FDT(fdt_setprop_string(fdt, 0, "host-model", buf));
> +-        g_free(buf);
> ++    if (spapr->host_model && !g_str_equal(spapr->host_model, "none")) {
> ++        if (g_str_equal(spapr->host_model, "passthrough")) {
> ++            /* -M host-model=passthrough */
> ++            if (kvmppc_get_host_model(&buf)) {
> ++                _FDT(fdt_setprop_string(fdt, 0, "host-model", buf));
> ++                g_free(buf);
> ++            }
> ++        } else {
> ++            /* -M host-model=<user-string> */
> ++            _FDT(fdt_setprop_string(fdt, 0, "host-model", spapr->host_model));
> ++        }
> +     }
> +-    if (kvmppc_get_host_serial(&buf)) {
> +-        _FDT(fdt_setprop_string(fdt, 0, "host-serial", buf));
> +-        g_free(buf);
> ++
> ++    if (spapr->host_serial && !g_str_equal(spapr->host_serial, "none")) {
> ++        if (g_str_equal(spapr->host_serial, "passthrough")) {
> ++            /* -M host-serial=passthrough */
> ++            if (kvmppc_get_host_serial(&buf)) {
> ++                _FDT(fdt_setprop_string(fdt, 0, "host-serial", buf));
> ++                g_free(buf);
> ++            }
> ++        } else {
> ++            /* -M host-serial=<user-string> */
> ++            _FDT(fdt_setprop_string(fdt, 0, "host-serial", spapr->host_serial));
> ++        }
> +     }
> + 
> +     buf = qemu_uuid_unparse_strdup(&qemu_uuid);
> +@@ -3027,6 +3044,73 @@ static void spapr_set_vsmt(Object *obj, Visitor *v, const char *name,
> +     visit_type_uint32(v, name, (uint32_t *)opaque, errp);
> + }
> + 
> ++static char *spapr_get_ic_mode(Object *obj, Error **errp)
> ++{
> ++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
> ++
> ++    if (spapr->irq == &spapr_irq_xics_legacy) {
> ++        return g_strdup("legacy");
> ++    } else if (spapr->irq == &spapr_irq_xics) {
> ++        return g_strdup("xics");
> ++    } else if (spapr->irq == &spapr_irq_xive) {
> ++        return g_strdup("xive");
> ++    } else if (spapr->irq == &spapr_irq_dual) {
> ++        return g_strdup("dual");
> ++    }
> ++    g_assert_not_reached();
> ++}
> ++
> ++static void spapr_set_ic_mode(Object *obj, const char *value, Error **errp)
> ++{
> ++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
> ++
> ++    if (SPAPR_MACHINE_GET_CLASS(spapr)->legacy_irq_allocation) {
> ++        error_setg(errp, "This machine only uses the legacy XICS backend, don't pass ic-mode");
> ++        return;
> ++    }
> ++
> ++    /* The legacy IRQ backend can not be set */
> ++    if (strcmp(value, "xics") == 0) {
> ++        spapr->irq = &spapr_irq_xics;
> ++    } else if (strcmp(value, "xive") == 0) {
> ++        spapr->irq = &spapr_irq_xive;
> ++    } else if (strcmp(value, "dual") == 0) {
> ++        spapr->irq = &spapr_irq_dual;
> ++    } else {
> ++        error_setg(errp, "Bad value for \"ic-mode\" property");
> ++    }
> ++}
> ++
> ++static char *spapr_get_host_model(Object *obj, Error **errp)
> ++{
> ++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
> ++
> ++    return g_strdup(spapr->host_model);
> ++}
> ++
> ++static void spapr_set_host_model(Object *obj, const char *value, Error **errp)
> ++{
> ++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
> ++
> ++    g_free(spapr->host_model);
> ++    spapr->host_model = g_strdup(value);
> ++}
> ++
> ++static char *spapr_get_host_serial(Object *obj, Error **errp)
> ++{
> ++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
> ++
> ++    return g_strdup(spapr->host_serial);
> ++}
> ++
> ++static void spapr_set_host_serial(Object *obj, const char *value, Error **errp)
> ++{
> ++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
> ++
> ++    g_free(spapr->host_serial);
> ++    spapr->host_serial = g_strdup(value);
> ++}
> ++
> + static void spapr_instance_init(Object *obj)
> + {
> +     sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
> +@@ -3063,6 +3147,25 @@ static void spapr_instance_init(Object *obj)
> +                                     " the host's SMT mode", &error_abort);
> +     object_property_add_bool(obj, "vfio-no-msix-emulation",
> +                              spapr_get_msix_emulation, NULL, NULL);
> ++
> ++    /* The machine class defines the default interrupt controller mode */
> ++    spapr->irq = smc->irq;
> ++    object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,
> ++                            spapr_set_ic_mode, NULL);
> ++    object_property_set_description(obj, "ic-mode",
> ++                 "Specifies the interrupt controller mode (xics, xive, dual)",
> ++                 NULL);
> ++
> ++    object_property_add_str(obj, "host-model",
> ++        spapr_get_host_model, spapr_set_host_model,
> ++        &error_abort);
> ++    object_property_set_description(obj, "host-model",
> ++        "Set host's model-id to use - none|passthrough|string", &error_abort);
> ++    object_property_add_str(obj, "host-serial",
> ++        spapr_get_host_serial, spapr_set_host_serial,
> ++        &error_abort);
> ++    object_property_set_description(obj, "host-serial",
> ++        "Set host's system-id to use - none|passthrough|string", &error_abort);
> + }
> + 
> + static void spapr_machine_finalizefn(Object *obj)
> +@@ -4067,7 +4170,18 @@ static void spapr_machine_3_0_instance_options(MachineState *machine)
> + 
> + static void spapr_machine_3_0_class_options(MachineClass *mc)
> + {
> +-    /* Defaults for the latest behaviour inherited from the base class */
> ++    sPAPRMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
> ++    static GlobalProperty compat[] = {
> ++        { TYPE_SPAPR_MACHINE, "host-model", "passthrough" },
> ++        { TYPE_SPAPR_MACHINE, "host-serial", "passthrough" },
> ++    };
> ++
> ++    spapr_machine_4_0_class_options(mc);
> ++    compat_props_add(mc->compat_props, hw_compat_3_1, hw_compat_3_1_len);
> ++    compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
> ++
> ++    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power8_v2.0");
> ++    smc->update_dt_enabled = false;
> + }
> + 
> + DEFINE_SPAPR_MACHINE(3_0, "3.0", true);
> +diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> +index 7e5de1a6fd..4c69a55374 100644
> +--- a/include/hw/ppc/spapr.h
> ++++ b/include/hw/ppc/spapr.h
> +@@ -165,6 +165,8 @@ struct sPAPRMachineState {
> + 
> +     /*< public >*/
> +     char *kvm_type;
> ++    char *host_model;
> ++    char *host_serial;
> + 
> +     const char *icp_type;
> + 
> +-- 
> +2.22.0.vfs.1.1.57.gbaf16c8
> +
> diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
> index b591cc244b..c7c46367c7 100644
> --- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
> @@ -21,8 +21,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://0009-apic-fixup-fallthrough-to-PIC.patch \
>             file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
>             file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
> +           file://CVE-2018-10839.patch\
>             file://CVE-2018-15746.patch \
> -           file://CVE-2018-17958.patch \
>             file://CVE-2018-17962.patch \
>             file://CVE-2018-17963.patch \
>             file://CVE-2018-16867.patch \
> @@ -35,6 +35,10 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://CVE-2018-20815_p1.patch \
>             file://CVE-2018-20815_p2.patch \
>             file://CVE-2019-9824.patch \
> +           file://CVE-2018-18954.patch \
> +           file://CVE-2019-3812.patch \
> +           file://CVE-2019-6778.patch \
> +           file://CVE-2019-8934.patch \
>             "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  


