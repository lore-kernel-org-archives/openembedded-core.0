Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 623AB73D99
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 05:46:29 +0000 (UTC)
Received: by wgso17 with SMTP id o17so139384093wgs.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 May 2015 22:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=rWQ7D5DpCyQWO+BijBWlR2zpWOSft2um8XQp9rkM4cA=;
	b=eVz+hdd/55/9rDa4b6cIGpdUjLR2viWLteOeDPylB56Zh1r1hk+J3aMkguWpBDxpme
	VugeApeqew65fROpsgm3RvreMVvuYZII64IGn+EVyGDkPNs+4UtmOS1R/j72oQlUtDe9
	BnMGL4HO7Usce51WlZvZx/kKsTvItMLKd8CKSQUXY+xVpRhL8Fio5fRpBPCPRfXF7glg
	v45RyZDGZR8WGFvuktjOI0tUBNrphet4Cqr7i9sg5dqqndiCim/juUI4MqLyz3oyWFaZ
	nK6MezWvTIVvFM3cM92ONKzWIC9/rkt6ry0DRgYbipiBgL48n23gOpuBIzoHJgeEzbgK
	SzAQ==
X-Gm-Message-State: ALoCoQlusX5z8VS69seekwwrpY0TZvkq7Y0/zoEoDDrSsr+ljT+cMXYd8+dp3EzDc1EnXaPrHQ/T
X-Received: by 10.180.37.101 with SMTP id x5mr16608516wij.74.1430718390382;
	Sun, 03 May 2015 22:46:30 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id go4sm9477095wib.1.2015.05.03.22.46.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 May 2015 22:46:29 -0700 (PDT)
Message-ID: <554707B3.70102@dresearch-fe.de>
Date: Mon, 04 May 2015 07:46:27 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Koen Kooi <koen@openembedded.org>
References: <5541C69D.9040307@dresearch-fe.de>
In-Reply-To: <5541C69D.9040307@dresearch-fe.de>
Subject: Re: [fido] orphaned bbappend in meta-angstrom
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
X-List-Received-Date: Mon, 04 May 2015 05:46:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 30.04.2015 08:07, Steffen Sledz wrote:
> The angstrom-v2015.06-yocto1.8 branch of meta-angstrom contains recipes-tweaks/linux/linux-yocto_3.10.bbappend. But the fido branch of openembedded-core does not have a recipe for linux-yocto_3.10 (just 3.14 and 3.19).
> 
> So the bbappend should be removed or updated.

Ping!

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

