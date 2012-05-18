Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SVIKJ-00020Z-Mk
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 10:14:19 +0200
Received: by wibhm14 with SMTP id hm14so2335240wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 01:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=V2wukitFJ5yLlna2Wc1jlW7rZE7+CGe93RjWi9RJYAQ=;
	b=GzucERvDuKyhEYRbR1IwKFPW158rdyLgOCby98xp0EYDjHouaSzp86xoDzCUgXi65J
	4+meGVZaBqa/jTSR89NL4jQx6CBTyMiNLBKV0B0t6UWtik7QtygPc61o2Xd7FKKnsduU
	damRjBft0KtzpjLhGmjqdkHhPkafPQftPmehExAwmeKuclv9liuSbTRdeYWhW61TDr2l
	A5Q3lvXyVLrRH20rd4yik66JPkplK0NOJ+onEagUj0zqKghtmKmpQRp3Y/xWxuf/7+sM
	K9Vnq7VrGIZHblf4whN7KzxeqTS2W1dRuHZP7zJUn6E4201jU6ULCENfmcSXy1UgfCYT
	LRJg==
Received: by 10.216.135.196 with SMTP id u46mr6582385wei.114.1337328256364;
	Fri, 18 May 2012 01:04:16 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fo7sm62963283wib.9.2012.05.18.01.04.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 May 2012 01:04:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1337238171-27308-1-git-send-email-Martin.Jansa@gmail.com>
Date: Fri, 18 May 2012 10:04:12 +0200
Message-Id: <BE299038-EE6C-4B32-90D1-2380A4673DAA@dominion.thruhere.net>
References: <1337238171-27308-1-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnu1sVOBubKfNkTNFBPymyFcn3V60iJzz1qbLjgGcmdx5w+Cr+2IJsDD8cv/GLvspnODFjq
Subject: Re: [RFCv3] glib-2.0: upgrade to 2.32.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2012 08:14:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 mei 2012, om 09:02 heeft Martin Jansa het volgende geschreven:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Now that I can finally get past udev glib-2.0 is the next breakage and =
this patch fixes it for me, so:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>=


