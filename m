Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC39C982CF
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 12:47:43 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38571.1789649253456080151
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 05:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3aRufkej;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso7525975e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 05:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789649252; x=1790254052; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYrhzHwPlLF/48t578KSvaeCjaTzBcQpp44OucqSGqE=;
        b=3aRufkejr8taE9RmyB+YVFjW74HJcNnVoWvNwd5aMbrKJTMgbDoEu2e4t6qyKGvsAm
         CSC9xK1G6gKz9+UjE7ZpqV26c53/Fqp7rU0g6/b+mLJLFLZ0emu+lbaMk0EaexVo4Qyt
         ctqbzqGjuZMIk/JLay8TgQgqbLf9sspmNyV20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649252; x=1790254052;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hYrhzHwPlLF/48t578KSvaeCjaTzBcQpp44OucqSGqE=;
        b=lOr3s9l3fakyidnTewtFVGVbSuZQUIi9aihiX37iJj/CsuhW0Ixkz8i0l4uhr+Rc+a
         VqHZCfIVCeuefdwqpByNISQY43FYVsnpZQ9iXLsdAGOE7DA0Ue8zM2MltBmE3OP0auOk
         5WGmeXufzFg0AfD5GYuZzck5jo2klfzqoQ7C40kEeiqUF2DIccwe45GZMxG00AeV2vdz
         xpyFFq3eh8Tz9z3inDb7YDeM3uPSzy3fPndz6l4VOEAFPKdY6PHLrjYAxxHthogPUbXp
         yvYD0Gb7z6jrWozjzxs5/k476U00qKxmnKxF2D2bMpAZkmS93iNocTZ0LCY32bHqlrZU
         ndFg==
X-Forwarded-Encrypted: i=1; AKwUvBzHlAgBO4jnDDOtFiH7v7bi5W1dj7hY0EXMoRLIInLifrelBnHv1QijNKyqRvNxY2bphb3hGqZsDxFuhoMA51Lyow==@lists.openembedded.org
X-Gm-Message-State: AFuF++mLnQ852LVRP1HzwEYp7s5PxCEUK/uG96AtzP3n2MFWreeJ5wMt
	eGOT0OR0I9bqq62OAmF9TvbZF/2+fYX/5XFZtCgmt7HwXhGD20tZh04BboWaAaNCCec=
X-Gm-Gg: AYBFou2tyairIidlX7h7EA0vUfMbNCHEj+RNSAiZEtiMq6LRXDEm6PPUJwqL3oeZd7s
	OPP2NNY6SBXevwNdmAsZeegWQuo9lwPMUedARUuegnN69g6oX+jNMSIIgDng5wihCfcpjAC1qGx
	JDpvKFgaUer6VcVHmeaxVJEcnKJbtb+YQna8W7/23RDI+KIipd66VjT9AuSUJYepDO1lTnyYF0f
	+fqvlSL+u2kl/p0tKfal7vmSPpolVIKQXQU0E8c8NSleuU13qqWHl3iyY4A2N8K9VawDQ8MneAo
	fbopegyA9RhfUxbX3Y73257RoqmWg0nXR000Pmvoa9ArmpOSB3uUr3zWNT3ttg8iXvfCmpqBEhT
	DGVicy49QKokN8LfCyt3eslxejjrrkLQlqczmnC6vN4m2uMt0qro34K/k6Pk1Lvaer/Q6kWrIUp
	MP/UlkMHjuaB5FxMZGDH5+m8RAamQ6uPDrTL+eXjpCWh7TE17nseO2x/i+h+AUzo/0sXxpzHyQh
	LCTGAZ9cN/eR33rovETjnJdFKlx9JHOvYFDsKn04rAco34CKZJ0Bce3buHCz/V+WILXSDMfqQ==
X-Received: by 2002:a05:600c:34c2:b0:49d:7f5:4cdd with SMTP id 5b1f17b1804b1-49eb732f825mr73795605e9.27.1789649251597;
        Thu, 17 Sep 2026 05:47:31 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2356d1sm93970415e9.6.2026.09.17.05.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:47:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 14:47:30 +0200
Message-Id: <DLHLPNY1MXSH.3FU70J9S1LKQX@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH v2 6/7] libpcap: Fix CVE-2026-18313
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260910051154.30595-2-jaipaul.cheernam@est.tech>
 <20260915191623.42107-1-jaipaul.cheernam@est.tech>
 <20260915191623.42107-7-jaipaul.cheernam@est.tech>
In-Reply-To: <20260915191623.42107-7-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 12:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246063

On Tue Sep 15, 2026 at 9:16 PM CEST, Jaipaul Cheernam via lists.openembedde=
d.org wrote:
> NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-18313
> Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/f977=
5af1a0ec76db60c7213241e6b48f1be10ac7
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  .../libpcap/libpcap/06-CVE-2026-18313.patch   | 90 +++++++++++++++++++
>  .../libpcap/libpcap_1.10.6.bb                 |  1 +
>  2 files changed, 91 insertions(+)
>  create mode 100644 meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026=
-18313.patch
>
> diff --git a/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.=
patch b/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
> new file mode 100644
> index 0000000000..eae9aaa989
> --- /dev/null
> +++ b/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
> @@ -0,0 +1,90 @@
> +From b039b8b66616852673c21ec5c7e0bad3190eae59 Mon Sep 17 00:00:00 2001
> +From: Denis Ovsienko <denis@ovsienko.info>
> +Date: Sat, 1 Aug 2026 18:24:48 +0100
> +Subject: [PATCH] CVE-2026-18313: Fix a memory leak in rpcapd.
> +
> +This vulnerability was originally reported publicly, hence no credit is
> +given.
> +
> +daemon_unpackapplyfilter() can allocate a temporary buffer for up to
> +RPCAP_BPF_MAXINSNS (8192) BPF instructions (65536 bytes) per each
> +received RPCAP_MSG_UPDATEFILTER_REQ or RPCAP_MSG_STARTCAP_REQ message.
> +It never frees the memory, so repeated messages from a client will
> +eventually leak enough memory on the server to cause problems.  This
> +holds for all connections that pass the validation and some connections
> +that do not.
> +
> +48 bytes in 1 blocks are definitely lost in loss record 2 of 2
> +   at 0x4844818: malloc (vg_replace_malloc.c:446)
> +   by 0x111AAB: daemon_unpackapplyfilter (daemon.c:2372)
> +   by 0x113279: daemon_msg_startcap_req.constprop.0 (daemon.c:2139)
> +   by 0x114808: daemon_serviceloop (daemon.c:901)
> +   by 0x115BC7: accept_connection (rpcapd.c:1321)
> +   by 0x115BC7: accept_connections (rpcapd.c:1118)
> +   by 0x115BC7: main_startup (rpcapd.c:709)
> +   by 0x1112BD: main (rpcapd.c:567)
> +
> +To fix this, after a successful malloc() return exactly once, after the
> +free() call.
> +
> +(backported from commit 26a1c75702b105ac8788014f35f1b5c57fa6043b)
> +
> +(cherry picked from commit f9775af1a0ec76db60c7213241e6b48f1be10ac7)
> +
> +Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/=
commit/f9775af1a0ec76db60c7213241e6b48f1be10ac7]
> +CVE: CVE-2026-18313
> +
> +Notes on backporting to 1.10.6:
> + - The upstream commit was made after the "bogus instructions" -> "inval=
id
> +   instructions" message change (commit 836d0fd0), which is not backport=
ed.
> +   The 1.10.6 wording ("The filter contains bogus instructions") is ther=
efore
> +   kept; only the memory-leak fix (goto free_and_return_status / free())=
 is
> +   applied.
> + - The upstream CHANGES/changelog hunk is not backported.
> +
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +---
> +diff --git a/rpcapd/daemon.c b/rpcapd/daemon.c
> +index 87274665..b720cc45 100644
> +--- a/rpcapd/daemon.c
> ++++ b/rpcapd/daemon.c
> +@@ -2403,16 +2397,19 @@ daemon_unpackapplyfilter(PCAP_SOCKET sockctrl, S=
SL *ctrl_ssl, struct session *se
> + 	if (bpf_validate(bf_prog.bf_insns, bf_prog.bf_len) =3D=3D 0)
> + 	{
> + 		snprintf(errmsgbuf, PCAP_ERRBUF_SIZE, "The filter contains bogus inst=
ructions");
> +-		return -2;
> ++		status =3D -2;
> ++		goto free_and_return_status;

Hi Jaipaul,

There is no need to detail changes happening in the context of your
patch (unless relevant). In this case "Notes on backporting to 1.10.6:"
on "bogus instructions" is confusing since this is not something you
changed during backporting (and is obvious enough).
The note on "CHANGES/changelog" is appreciated but obvious enough so it
could be omitted as well.

I think you're using a LLM to generate those. Please teach it to be more
precise in the change it describe. Try feeding it the interdiff output,
I think that will help.

No need to send v3s for this, this is more a general improvement kind of
thing.

Thanks!
--=20
Yoann Congal
Smile ECS


