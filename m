Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SMYpr-00033M-OP
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 08:02:47 +0200
Received: by wgbdr12 with SMTP id dr12so208728wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2012 22:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=+zt7LsLWLpTpojjScM1g3v4GEbTcVyXI1vH52ni3VIo=;
	b=BLH4iA0yBn9TX5w4ftvKg9iP9uWAogV8HMT1RdsVcBQ37IZGl0dfzs0cOu6B2goOaw
	H9iK6X25cCikJOKp7TJk8BbKN52WyQEQc8gICQVXnxvY8g288t5+Q5C8M+ZKMY8Ok7FR
	/s+z+2+7D9rzzCVpF0YQlHtuBLxqpKA5mejjXwMACnQ8oBK4vYAIhVoxSWukIjpqCfew
	/Fgzbphx8GvaD5SBI2pXVqpHpH2r2wDK9+HxRvI4YIXCA+eq27K0R3a32wtZHTfnNGm7
	eLlmEQdgQvqPoXnHRegBWz9NKPOr9E14NRvuenfaaI6P6y9EaJxylyPJD7z6TDodIlKt
	plYQ==
Received: by 10.216.137.232 with SMTP id y82mr10251464wei.82.1335246793466;
	Mon, 23 Apr 2012 22:53:13 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gg2sm43300455wib.7.2012.04.23.22.53.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Apr 2012 22:53:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <fde21e1126e23439ccd9dc7ba8e7cc9e96df3799.1335245655.git.xiaofeng.yan@windriver.com>
Date: Tue, 24 Apr 2012 07:53:11 +0200
Message-Id: <7334A38D-4148-4397-94A0-D721CD0BD924@dominion.thruhere.net>
References: <cover.1335245655.git.xiaofeng.yan@windriver.com>
	<fde21e1126e23439ccd9dc7ba8e7cc9e96df3799.1335245655.git.xiaofeng.yan@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlbRZ/3lzilg9Cxer05Dev5q6hWtpxSKFPp4xua12bAXouQii4416wU9Z8yseDszOJrmtJG
Subject: Re: [PATCH 1/1] gdk-pixbuf: Add --with-x11 when building lsb image
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
X-List-Received-Date: Tue, 24 Apr 2012 06:02:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 24 apr. 2012, om 07:50 heeft Xiaofeng Yan het volgende geschreven:

> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> LSB Test Suite complain "no library libgdk_pixbuf_xlib-2.0.so.0" \
> because of having "--without-x11" for gdk-pixbuf_2.24.1.bb.
> For passing lsb test I add PACKAGECONFIG support to the recipe and \
> have poky-lsb turn on the poky-lsb distro for this recipe.
> 
> [YOCTO #2284]

Shouldn't this be an 'x11' DISTRO_FEATURE instead?



