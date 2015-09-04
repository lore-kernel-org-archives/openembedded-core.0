Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1A12B77016
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 07:35:02 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so12939415wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 00:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-type:content-transfer-encoding;
	bh=l0BeYAEtt6O1suhXyHyVJ1M67pmOtiROcf4YWH2m0yk=;
	b=KiZG8Y7adwRvbUe6sIEr6+s9D1yy6CHI6D0hvxprRiA1ed6P7IvxOZXBNynsDV6vBL
	amfjwegxjkZmohZA22/XxvAOPSASX1KR5a+LhVhCZTpnftGhg7EveYhJHwmDYmF2GoxW
	9Qb49D4qrNeDCOa1cSM7O8M1WQoaIcO9scII1GEfLelePJpbFTDF16K0BOHxgj4QOrff
	DlNxYFEupEGve5+hjbLjLyNj3nNwrX/82fpZITEF/EhuJBmQgqRiQ+dk0lFGR1HA112i
	aVTC6hDyOEKWascPT65Kl0uazONcwbY2uvxXxQ7mok2vpC07xk8VRQ/2TIa2Zv8w10oh
	Vwog==
X-Gm-Message-State: ALoCoQmYtetJoIRCf+sTjEFWsCryO1yduuIBEkrHAGDKYdm5TGXdhtNL+L+5i8kRHO7+Cbq4wV8/
X-Received: by 10.194.171.129 with SMTP id au1mr4636638wjc.115.1441352102325; 
	Fri, 04 Sep 2015 00:35:02 -0700 (PDT)
Received: from mobil-400-586.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116]) by smtp.googlemail.com with ESMTPSA id
	v6sm2382461wjf.13.2015.09.04.00.35.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Sep 2015 00:35:01 -0700 (PDT)
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <55E949A4.9050805@dresearch-fe.de>
Date: Fri, 4 Sep 2015 09:35:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
Subject: "sub" machine types?
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
X-List-Received-Date: Fri, 04 Sep 2015 07:35:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

We have some products which differ in bootloaders (u-boot) and kernel device trees only. They use the same kernel and root filesystem.

Does OE have concepts for this? Or any suggestions to realize this without building for many machines?

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

