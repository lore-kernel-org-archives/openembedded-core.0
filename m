Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U29Kz-0001NT-35
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 00:51:08 +0100
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 03 Feb 2013 15:35:05 -0800
Received: by mail-lb0-f197.google.com with SMTP id gg6so6546684lbb.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Feb 2013 15:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:date:from:to:cc:message-id:in-reply-to
	:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=hYmFs9NenPgUbDWAPUnDesY2adRREWXQ1m+kUKOtk1I=;
	b=AOZn09dx6sFy6y+G5PnaLFiTV18Z3rApP4krimwwwaHDjFH6nUmZhnT35ReJmuJKMm
	r6y51pTVoTEJ05+OGY9fopyGRgpmFAvD4iq+xHZyEZQSpi9ed6jLC7/3QyaA/1fHp2HO
	GAlahKkjqdK1T53xYzF1bpofd2o7oyghzVslqPbiRdftM4yieTwb3GcQF+0ikNs2sQB9
	n60A5JHJrfh/731p+mzKatqT9xujQ7mr4/y/8Gw/v6lRsce1QPThvJ8e39yuWMLVRpcY
	HO6WMmAWd4s+6QZVhcYrWPegWWdyDJsgzLTVlz1taHX3EsPCkKLTbkJPkXcysNj6lCPd
	DbVw==
X-Received: by 10.180.82.41 with SMTP id f9mr7262853wiy.25.1359934503837;
	Sun, 03 Feb 2013 15:35:03 -0800 (PST)
X-Received: by 10.180.82.41 with SMTP id f9mr7262847wiy.25.1359934503702;
	Sun, 03 Feb 2013 15:35:03 -0800 (PST)
Received: from [192.168.1.11] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cu7sm710434wib.8.2013.02.03.15.35.01
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 03 Feb 2013 15:35:02 -0800 (PST)
Date: Sun, 3 Feb 2013 23:35:01 +0000
From: Ross Burton <ross.burton@intel.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Message-ID: <F600AD7DF50F4C5793CA585286CEE7B4@intel.com>
In-Reply-To: <510ED7B6.1010201@linaro.org>
References: <B57A220D1EE1644685BA9AD5C790D20526BE045F3A@SOUTHSIDE.devonintlgroup.com>
	<50E181AF64EF4AF9835BF9FD769D9B93@intel.com>
	<B57A220D1EE1644685BA9AD5C790D20526BE045F3B@SOUTHSIDE.devonintlgroup.com>
	<510ED7B6.1010201@linaro.org>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQlcmouofoRhMoVagig9oUYsM1mPwGqyd9EJLtnA7w3qhzWveLVngX9ApHUacfNWElLnUVvyeynnhPBoYjgBqAcmpcrh4yVd/ERK2sB0Z1zgyvsD3YL3XX5HXakN/vQ0XqFk33l+Ihbls4Mqz5fnxxuqbIFa16hxGEx92tW9nsbDUsD4EuwOcOOvAsAsDwXMk/F868HC
Cc: openembedded-core@lists.openembedded.org
Subject: Re: OpenGL as a DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Feb 2013 23:51:10 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday, 3 February 2013 at 21:33, Marcin Juszkiewicz wrote:
> As they are different architectures you can try this:
> 
> DISTRO_FEATURES_wm8950 = "here copy your default DISTRO_FEATURES but
> skip opengl"
> 
> Replace wm8950 with MACHINE name. Ugly solution but should work.
That means that Qt won't be built with GLES support.

The best approach is to probe the hardware/libraries at runtime and adapt - i.e. if only GLES libraries are available use those, but a lot of software doesn't support that or simple probing isn't sufficient (Intel Pine Trail supports both but GL is best, Cedar Trail supports both but GL is terrible).

Ross 




