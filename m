Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe01.domain01.net (STOEXHUBFE01.domain01.net
	[83.145.59.140])
	by mail.openembedded.org (Postfix) with ESMTP id 5593C65ED7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 06:11:18 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.64.43) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Tue, 24 Jun 2014 08:11:18 +0200
Date: Tue, 24 Jun 2014 08:11:05 +0200
From: Anders Darander <anders@chargestorm.se>
To: Kai Kang <kai.kang@windriver.com>
Message-ID: <20140624061105.GC22071@ad.chargestorm.se>
Mail-Followup-To: Kai Kang <kai.kang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1403490121.git.kai.kang@windriver.com>
	<a55237b35d54e1c135ac51d273317ae3002a4906.1403490121.git.kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <a55237b35d54e1c135ac51d273317ae3002a4906.1403490121.git.kai.kang@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] iptables: update RRECOMMENDS
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
X-List-Received-Date: Tue, 24 Jun 2014 06:11:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Kai Kang <kai.kang@windriver.com> [140623 04:34]:

> @@ -15,7 +15,13 @@ RRECOMMENDS_${PN} = "kernel-module-x-tables \
>                       kernel-module-nf-conntrack \
>                       kernel-module-nf-conntrack-ipv4 \
>                       kernel-module-nf-nat \
> -                     kernel-module-ipt-masquerade"
> +                     kernel-module-ipt-masquerade \
> +                     kernel-module-xt-tcpudp \
> +                     kernel-module-xt-conntrack \
> +                     kernel-module-ipt-reject \
> +                     kernel-module-ip6-tables \
> +                     kernel-module-ip6table-filter \
> +                    "

As it's for RRECOMMENDS_${PN} your patch will likely work for everyong.
Though, you should really only add the ip6* kernel modules if ipv6 is in
DISTRO_FEATURES.

Cheers,
Anders

(And as a completely unrelated side note, I wonder if it isn't time to
start looking at adding an ipv4 DISTRO_FEATURE to make it easier to
build IPv6 only devices...)

-- 
Anders Darander
ChargeStorm AB / eStorm AB

