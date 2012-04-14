Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SJ1DQ-0000tH-KP
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 13:32:28 +0200
Received: by wibhm17 with SMTP id hm17so6119168wib.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 04:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=e/3w4OJJqbXTPs27++jDlv2euP6op4yoxP9X76pGw7A=;
	b=g4HbyQipTZwI0Lu+ofM7JKjxuQP2d1QtT2tAclIP23QF/5JTc8Ej5Fg3ywJ1bD7evl
	PXSK358iUGTqA96AMqoUJ0IfQTxDbJgbuOQ1NlOvg1XWtvpbM8pKjZWDs81q5yAxYq3N
	lzg8SgkJpNFQVySAUoLjK0Hu6eT4QuLIhfzr3AcXiKreQJt96wck5pdcPPE2gElTjmUo
	2/AmxD1RPuhxsUCOnS2+yABk4tIgn6F9EHS+gRJ5466WbwyDXZXx71bPx4yg6GOoImf6
	Re95R0c2DiionSoeinfZ4OvcwO6jXsvTlrebAwF2SGinjdui+CgNrfjky21maftgRftp
	D4ug==
Received: by 10.180.105.194 with SMTP id go2mr3557520wib.22.1334402586231;
	Sat, 14 Apr 2012 04:23:06 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k6sm3614406wie.9.2012.04.14.04.23.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 Apr 2012 04:23:05 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <7a59efe236b3ebd7472ce95bf75b9b5a27ba656c.1334400035.git.dongxiao.xu@intel.com>
Date: Sat, 14 Apr 2012 13:23:01 +0200
Message-Id: <5007F7A3-3E6D-4DB5-A345-B7FD4322A283@dominion.thruhere.net>
References: <cover.1334400035.git.dongxiao.xu@intel.com>
	<7a59efe236b3ebd7472ce95bf75b9b5a27ba656c.1334400035.git.dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQn7L8/y67iAGvOZeKGoYdfoIuDRGeeoIJ+AnxwSJK7pzljr9MjIkumwfvk+gv5KJRrIXjrc
Subject: Re: [PATCH 1/1] gst-plugins-bad: add curl as build dependency
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
X-List-Received-Date: Sat, 14 Apr 2012 11:32:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 14 apr. 2012, om 12:44 heeft Dongxiao Xu het volgende geschreven:

> gst-plugins-bad needs curl.h to finish its build, so add curl as its
> dependency.

I can't be sure without the exact failure log, but: missing PR bump

regards,

Koen


