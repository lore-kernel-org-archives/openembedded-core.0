Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.72])
 by mx.groups.io with SMTP id smtpd.web12.11399.1608138120555754402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 09:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=pWcXtwq6;
 spf=pass (domain: outlook.com, ip: 40.92.73.72, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrZspqXIERNxajC7SuL0Z+ikZP0dNd4SX8ANRH4cc3vwe6rVuWBjLfK52YVkMJKcxWzmUWJOkn1SRYD70eO/aGgX8QrHR65or9bgCQzHpbF+q1JmKorq4tmCougS6J2BtUODrvN3I7rYN5KQR8pWm5JXBJsbbzyFBBBJ8p6tuFNkjA8EPKtoLTb4Mw8wIYB/hBaoG0XzJmrTLepsSZKY0xZFvRl4OxPfhalDk2wtXwojt9jOf5DbUEsSSL3CbWrRBEfey7iU0xowAuxbl1NXmwnU4f+XVlw0jNPemdS0OelHXZ5b1PJ5U/pJ71E08NjzPNtjChFqWDhNyjJJ/MjW+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urW4g6yuuIeQ+aDJmINJBh/rvSKxeiY0UPzBo3MH46c=;
 b=nsDhRDkNMg6QUM9ZngoGvdJI/lErVKztDjrWMgo7L0kJoWYI9figvrGj99FZ7CwYHntprPy0Q+6jV0cwr6HUgVpQyFz0917cYEttNKlNXy40TFh1JQiSGqGkuHQ8q5846jCaDPD+Jw9yPFUL4MOoI1lRWLO653ZHplT43R4Agf52WnsEBidpFD6ddpyUtPAgguNjPTZVjcxFgJ2Th8pa7UHPpirV1O+cPIoyL2hNLSF2p7Ay88B2E1Can1QBQOZ67l99INwAqr2dY0Ik5u7qd4qLJogghf27a3c5342X6lrWWYAk7AOVWjGhAuwjIvKLhk6MYisxldkvMa4vDkIFzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urW4g6yuuIeQ+aDJmINJBh/rvSKxeiY0UPzBo3MH46c=;
 b=pWcXtwq6KKqMOQXDSUdhw5HzB4PhUChwnsVBrh9P+q4sbScHAf9OcDzsAKB7dNcbs+v75BGelvxkrrAoi8qVOr8n+Bg2WIY8UWy9EgAijmAJjcCCON4F2c5koE2Dh96KzMVHklLKFwxM59VCwQfzYHW0qQ/8eZKJcU1ZtHtiDBD+E2aBJFgngwYQkOC1nQEMUhijm0X9oRxMIwHKK1V/sm7EAo+tHWH08rnpFL1COILWM7MVxP1JZF77K8mNBQJx9WNRQDQJoKku8Cc9pbl5rPcwsV2ApCNRPNonzBDkDCIXtujVDtEC9qj+OqDefrElwzT1ng+dveGI1uXWMgMOWg==
Received: from DB3EUR04FT041.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0c::4a) by
 DB3EUR04HT143.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0c::181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Wed, 16 Dec
 2020 17:01:58 +0000
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 (2a01:111:e400:7e0c::48) by DB3EUR04FT041.mail.protection.outlook.com
 (2a01:111:e400:7e0c::288) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Wed, 16 Dec 2020 17:01:58 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:F7EC9F2E2122ABB482BB4A4D290F850B6D882E427E8FB084DB0757785712841E;UpperCasedChecksum:AED8C147949323D1F8FE62E9F2A2EED2CA97DF1482417696DB43B7663C4305FA;SizeAsReceived:8668;Count:48
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772]) by AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772%3]) with mapi id 15.20.3654.026; Wed, 16 Dec 2020
 17:01:58 +0000
Subject: Re: [OE-core] [meta-oe][PATCH v5] sudo: split into smaller tools package
To: openembedded-core@lists.openembedded.org
References: <20201216165609.28794-1-okaya@kernel.org>
Cc: Sinan Kaya <okaya@kernel.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB47392E6E695982CFAFC326B8A8C50@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Wed, 16 Dec 2020 18:01:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201216165609.28794-1-okaya@kernel.org>
X-TMN: [jvc9LqxznKgBKn/GuTZw5C8J1nd4K9dv]
X-ClientProxiedBy: AM6P193CA0135.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::40) To AM9PR09MB4739.eurprd09.prod.outlook.com
 (2603:10a6:20b:282::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <de1e2067-c9fe-b952-6744-8fa6b15e84c8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.82.236) by AM6P193CA0135.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 17:01:57 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 7180bfbe-4c93-4d5d-b2bb-08d8a1e44caa
X-MS-TrafficTypeDiagnostic: DB3EUR04HT143:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o9e9jPvlYoL//sSnDSZntbRFyztoNCMgKNVTRthQ6zJLG9oGjKpiLdi2BTmXQtkLkdWJCHiwq5+Gn++DKuG1uS+YGmm0Zg1tzipPijSXH4eIK1w5VkjvhpXSSEsnLzZfMO/TRXhOcnkKQzww8UzvpRiPwxHwtUjtlpprryDPyUakjQWz4ZWR29l/gP/gSi6rEijd8Oa6sEJBhvu90GvOe5KO1Ad/oGOidddepjRDq0UlliRvRhhJepKvMWu5UnJ25xLyg6+JpERTUK+AOX6JN7IYYLnsfe7nPesQWR9+AyU=
X-MS-Exchange-AntiSpam-MessageData: 
	MJzXKfzblxxTsc3dFR3GgL6Evoch3WnmxCwq5quzdF+nU10O4c7le4i+4NxO+H8lKRt/Nk6AGnMnyzIhmYDH174lnuWfM3hVow9RNdAvv0N0kX//vCum9Ee9VpUgBGtyRE732yEHX3Vjdh+OJBE7nA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 17:01:58.2800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 7180bfbe-4c93-4d5d-b2bb-08d8a1e44caa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3EUR04FT041.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3EUR04HT143
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.12.20 17:56, Sinan Kaya wrote:
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>   meta/recipes-extended/sudo/sudo_1.9.3p1.bb | 30 +++++++++++++++++++++-
>   1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
> index ba61a7f2472..2d185d88e4b 100644
> --- a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
> @@ -44,6 +44,34 @@ do_install_append () {
>   	rmdir -p --ignore-fail-on-non-empty ${D}/run/sudo
>   }
>   
> -FILES_${PN} += "${nonarch_libdir}/tmpfiles.d"
>   FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*.la \
>                       ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la"
> +
> +SUDO_PACKAGES = "${PN}-cvtsudoers"
> +SUDO_PACKAGES += "${PN}-sudoreplay"
> +SUDO_PACKAGES += "${PN}-logsrvd"
> +SUDO_PACKAGES += "${PN}-sendlog"
> +SUDO_PACKAGES += "${PN}-visudo"
> +SUDO_PACKAGES += "${PN}-sudo"
> +SUDO_PACKAGES += "${PN}-lib"
> +PACKAGES += "${SUDO_PACKAGES}"

I think needs to be PACKAGE_BEFORE_PN = "${SUDO_PACKAGES}"
otherwise everything will end up in ${PN} as the list is appended here

> +
> +RDEPENDS_${PN}-cvtsudoers = "${PN}-lib"
> +RDEPENDS_${PN}-sudo = "${PN}-lib"
> +RDEPENDS_${PN}-sudoreplay = "${PN}-lib"
> +RDEPENDS_${PN}-logsrvd = "${PN}-lib"
> +RDEPENDS_${PN}-sendlog = "${PN}-lib"
> +RDEPENDS_${PN}-visudo = "${PN}-lib"
> +
> +RDEPENDS_${PN} += "${SUDO_PACKAGES}"
> +
> +ALLOW_EMPTY_${PN} = "1"
> +
> +FILES_${PN} = ""
> +FILES_${PN}-cvtsudoers = "${bindir}/cvtsudoers"
> +FILES_${PN}-sudoreplay = "${bindir}/sudoreplay"
> +FILES_${PN}-logsrvd = "${sbindir}/sudo_logsrvd"
> +FILES_${PN}-sendlog = "${sbindir}/sudo_sendlog"
> +FILES_${PN}-sudo = "${bindir}/sudo ${bindir}/sudoedit"
> +FILES_${PN}-visudo = "${sbindir}/visudo"
> +FILES_${PN}-lib = "${localstatedir} ${libexecdir} ${sysconfdir} ${libdir} ${nonarch_libdir}"
> 
> 
> 
> 
> 
