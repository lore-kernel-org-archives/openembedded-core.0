Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SUvc1-0004SO-6b
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 09:59:05 +0200
Received: by wibhm14 with SMTP id hm14so5601698wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 00:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=3pf9CQsmDE7rotmxy1zaCpqKi837XVn+cbFTEbsowK4=;
	b=micgLMOeshpONk0gPvHAUaabRpzxGE7IZhu+HxoFzNCe9eyfNVMHfCaMdOjuONVwaT
	5BbaY0ch/fBS3KYPfLRNKdK9IUOPFwFzr1gBSKn9KoEMfzd26uCsxk6xrm1KpyNeznO3
	KbOpev6PZMqb9TOhEpvKz/cg4WyntufhtQDO9G0FMjTKFSW/i5PJ9ihXGUKfEOT9evGv
	I9ScrVBYP+eop1r5DAQIJgl97gEqWhcs5Fvq36VCqO6Lr+miAV50sbHPwJcx3jgVBCqo
	NF/cB1M7jeg1PTg31cf/f7keYzF1+SUOzHZdOZ+gFbfHtHAnxl9gBKMWkBwLhT8Ur1V+
	ApZw==
Received: by 10.216.199.1 with SMTP id w1mr4100602wen.19.1337240942795;
	Thu, 17 May 2012 00:49:02 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id du4sm18383665wib.10.2012.05.17.00.49.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 00:49:01 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1a12675b146fbaf56ff3e9505885c5f9f4ecbd26.1337114347.git.otavio@ossystems.com.br>
Date: Thu, 17 May 2012 09:48:56 +0200
Message-Id: <3971F75E-21A4-4BB6-92BE-888FFC716BD1@dominion.thruhere.net>
References: <cover.1337114347.git.otavio@ossystems.com.br>
	<1a12675b146fbaf56ff3e9505885c5f9f4ecbd26.1337114347.git.otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlOVo/U+u6+FdVl9/Len/dfSaBE5I8PkGik6M6rPl9ZEhzIGzOwxRmVHUJi2fqA9khJqk3D
Subject: Re: [PATCH 1/1] kmod: fix installation path of pkgconfig files
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
X-List-Received-Date: Thu, 17 May 2012 07:59:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 15 mei 2012, om 22:39 heeft Otavio Salvador het volgende geschreven:

> The pkgconfig files need to be installed in ${libdir} instead of
> ${base_libdir}.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

Udev have been broken for a week now, can this please to in ASAP?


