Return-Path: <scerveau@connected-labs.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8D5DD606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 11:04:54 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id hi2so25324632wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 03:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:message-id:date:from:user-agent
	:mime-version:to:subject:content-type:content-transfer-encoding;
	bh=tF7izF+3nxaejd+XIOC0qGMJtrbd2yc6pDEV8Q930P8=;
	b=F6O+hT1Lt5Ni4PihMPqCWor++C4c5r8sC+B+ado+bHm9o304RI6wGgf9G4nwDyPUms
	DVNjsu+bjr86otaCpKEXbktB4DOYGDlJjeZrX2EYWrcJB87TGkIAiZQlF0drd7azEK2+
	73cRG8eGBBvLNs4PILobJK47orkEYOI2QXoJHHltxPRHGPW2HNGbvZHQCckm5Se6vtUA
	nz/LSAnim/AOjb9Xbka/Peswy5COdeXzXTc00DfWEE9baYeBrQ6FvDK76ORCj7E6cLUg
	UCRfkpLAL0ICiWAcjRDBPc+iTK2jrkANu1XgPf5ihLcEcTKh5+lHQ7r3qQtChjEsS8bC
	eHVg==
X-Gm-Message-State: ALoCoQnY/Lwd00ARc0yf2NpddRSpnMkDUpOzlq9+F9MlHRIsVOHkop6S4ETUpn59hTGJ95tEIaRh
X-Received: by 10.180.206.41 with SMTP id ll9mr43733259wic.37.1424084695114;
	Mon, 16 Feb 2015 03:04:55 -0800 (PST)
Received: from [172.24.63.26]
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id
	fd10sm19181079wib.4.2015.02.16.03.04.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 03:04:54 -0800 (PST)
Sender: Stephane Cerveau <scerveau@connected-labs.com>
Message-ID: <54E1CED1.6060900@voxtok.com>
Date: Mon, 16 Feb 2015 12:04:49 +0100
From: scerveau <scerveau@voxtok.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: cdra_1.1.3 is not available anymore.
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
X-List-Received-Date: Mon, 16 Feb 2015 11:04:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear all,

It seems that crda_1.1.3 recipe is broken according that the link 
http://wireless.kernel.org/download/crda/crda-1.1.3.tar.bz2 is not 
available anymore.
It can be now downloaded here 
https://www.kernel.org/pub/software/network/crda/crda_1.1.3.tar.bz2

But concerning the binary 
http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2013.01.11-regulatory.bin 
it is not available also but i dont find a server which will allow to 
fetch it.

Does someone modify the recipe already or does someone know where we 
could fetch the binary?
I'll continue my investigation.

Best regards.

Stéphane.

