Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id EAF4760655
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 07:12:53 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so2462174pdi.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 00:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=M2CF0uKW++vB9bHYimH9uV2Iv1KPbBRmzTHBia9AZ0A=;
	b=gKqeiiguGXTkmFRA2O3viWAm29aXabxVId21Z5h4e68q144hW5Kog8Cr1i/6WmTGGi
	9jmaz2PEe5dhWzC8+NyKBsB003UeurQycAHQK6d/eSa4rW40H6R6K3BHo2AdrCPuY2H7
	K/k3JjeVGqryceSeOxPm7J+8K5H7davzPbTvLRP1KU3Fm8CShcmPj+q+YajFQSszv+sP
	JmFu62Fur3K2kAe3TzFpvKzbpAdsn6OYM04oEGJ3XkWchBynq6Fl0I7R1VAbIjMA9CJJ
	g1UZpXTiZDn1fs3OZntP85dTlQYYbYkgPxeilV/ZgP6frL7n1HyiNwdg4Obxl8xgQ/Ql
	TMZg==
X-Received: by 10.68.171.226 with SMTP id ax2mr11887137pbc.201.1371453175191; 
	Mon, 17 Jun 2013 00:12:55 -0700 (PDT)
Received: from laurenf-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	ag4sm12741583pbc.20.2013.06.17.00.12.53 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 00:12:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51BEB682.30702@windriver.com>
Date: Mon, 17 Jun 2013 00:12:52 -0700
Message-Id: <CB3C88CE-02C6-446A-A756-E3E349062023@gmail.com>
References: <1371450622-3850-1-git-send-email-jackie.huang@windriver.com>
	<C5D1E420-8F11-410E-B763-C631248F2113@gmail.com>
	<51BEB682.30702@windriver.com>
To: jhuang0 <jackie.huang@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libproxy_0.4.7 do_unpack failed of qemuppc_world
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
X-List-Received-Date: Mon, 17 Jun 2013 07:12:54 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jun 17, 2013, at 12:10 AM, jhuang0 <jackie.huang@windriver.com> =
wrote:

> I think the base.bbclass have added this:
>=20
>    # unzip-native should already be staged before unpacking ZIP =
recipes
>    if ".zip" in srcuri:
>        d.appendVarFlag('do_unpack', 'depends', ' =
unzip-native:do_populate_sysroot')
>=20

ok nice.=

