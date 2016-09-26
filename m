Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id EC03E60557
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 10:46:20 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l132so144614780wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 03:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=nRWFDN26DA3xrNInn9PI2VafgD7x+u+hQn14joxGZrQ=;
	b=fOFw43l4VDjeVOn6/Xmbm93at6Wc37KTabtUfAvl4fS1xnlB9H6z2iRnYG2FR99Bgw
	jIvTgxdUgArroT8tL/10zGwO6VUM1AnpC5YFOkGzKMt0aRtOHVglUScOprom7yjXxyiA
	l3aYZM6UjCN/hYvXYZI2y4j/lNSJFM+2T09JZQspSP7VU8flZ9PSEWEBFqMomvjnrxmc
	dFw0v5ED3+R+Ufr6fr8bv4Ehp3f7FlisjRFTfv6KyyA5EaQOtsWdrAU1BVheqqQ3vc9r
	II4meW3trkWTrbRrjoCmZHrajUN2dLAg9AFULFEHntUco02TmW8Vmtr/V4ahClcYLdw3
	z+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=nRWFDN26DA3xrNInn9PI2VafgD7x+u+hQn14joxGZrQ=;
	b=JbgqZoIECeskul2VtXHScF9IrBlEikE0U5fhXI6y9NBidD5iXjqnUasPmEO45ILx68
	0VVuGgqYDbPmIIKnDP1Ch7yEokbWvPKW7Orivhffe6J6jsOJ3vf4G24xQ6Qev0pzfgAu
	XTssCAiPV82UKDD0h6+ddYC6I5QtpHnPXfikhQxeFLr2Z0b+mkw2Gedsp9dfR1odLK0t
	4QmhXjoaAH/dDk2BmRsXgfwgaNOj8x7Ndnyx6jCrOEt7t4gbM/5zR2mXzBr1BqJh+yg0
	gH5gmUovrI3HbaKteLUqHDiGzXYsLHCHsDHR1ggV/rOMk8YV7QFEagXnHEpJNa47CnlW
	W3jA==
X-Gm-Message-State: AE9vXwM+I6AK4Wrzq/ty2WRPiuGWgItSlAAVw2RZfPr1pSYvrsXTs5aPCMmgW2xJDABEYw==
X-Received: by 10.194.192.195 with SMTP id hi3mr17319943wjc.108.1474886781377; 
	Mon, 26 Sep 2016 03:46:21 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	p71sm10599164wmf.9.2016.09.26.03.46.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 03:46:20 -0700 (PDT)
To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <9143dac0-3a7c-59a8-13f4-f97340317f70@dresearch-fe.de>
Date: Mon, 26 Sep 2016 12:46:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
Subject: defining default locale (LANG/LC_ALL)
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
X-List-Received-Date: Mon, 26 Sep 2016 10:46:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

May be this is a FAQ, but I could not find any helpful documentation.

What is the best way to define a system wide default locale setting (LANG and LC_ALL) for OE based Angstrom style images?

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

