Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 20E6265E0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 09:53:12 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so8264883wgh.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 02:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=yqaRMdnrgW6LtaTILcKLxqKAj1DQgsDDpLeRpcfbP3w=;
	b=BrMpa09DnSF8iHx+YnwB76QP/qa/OTgzwFW+8HqyzTFaUyj9TOBrOsmHV+cx0283eO
	t8PJqwX/dBl+VNrvJCVvUv42CjF0J/QTnr8IesSrYAgozWYgvM6g35tTkiKbrJsSm8oo
	EQCFI2Ez1VwgWQd02B/QH5ecDC2/6tlmhlk1iFo0mDLiS9rP8T4aT2hLOw2Y1V3RKF19
	zJYjhUy95Jsf5sUgbnOIoEwLNpAMPkJRcJDkt8azEcXLzl+qhp+W083X66P4Wotwxnli
	aZrOoVwCPn3ZpNw/Ez54PW41NK7BvJdYYem5kaM8Gsx033vNS7mw702XUbFBpJCoqpYy
	xRCA==
X-Gm-Message-State: ALoCoQlkVsEqRFMNw9DtR9WdlfqdTdSk2/5RXClFEe7eusLF0gj02dzMOpkFRESjeZ5JncTUu37Z
X-Received: by 10.180.182.48 with SMTP id eb16mr2778946wic.81.1407750793488;
	Mon, 11 Aug 2014 02:53:13 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id fe5sm301187wjc.12.2014.08.11.02.53.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Aug 2014 02:53:12 -0700 (PDT)
Message-ID: <53E89286.7050303@dresearch-fe.de>
Date: Mon, 11 Aug 2014 11:53:10 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Ralink RT3572/RT5572?
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
X-List-Received-Date: Mon, 11 Aug 2014 09:53:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Are the linux kernel modules for Ralink WiFi-USB devices with RT3572 and/or RT5572 (available from <http://www.mediatek.com/en/downloads/>) still integrated in an OE-Layer?

If not, what would be the right place for them (openembedded-core, meta-networking, or something else)?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

