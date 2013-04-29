Received: from mail-vb0-f54.google.com ([209.85.212.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UWqMk-0002nH-Qt
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 17:51:51 +0200
Received: by mail-vb0-f54.google.com with SMTP id w16so5287866vbf.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2013 08:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=JvGutXBAasZWh6cmb8jB77/7FXvsKHSMdeRW+o62tW0=;
	b=jfgK1ptG4C6CFkur6ofKMOaxmIVbccZcJ41nOQ2ocbcDGNjaXPEFy6n2d7+CbzVZ9/
	AAwz7hMnfZ03Rh+SyT4KPJ0/bv8kjYcm0AOj2P3YQOv0/uS3fS61xDDaD0d2UJOLk3Tq
	3XxfCpYxphWPs9C/t/RU3dvUQds4OXj1uxcWT1oS/7h5Yh71XcewHZfDa2ISJkzLgkek
	lfEVSHT2/Ps24dhDJYR2JP55AW/anNfMLN4WzNvcDyvRJpPQljdzgkKIx2kffSL0pFoD
	12Geb+Nj/sHuvaRnm4UKTtOIKzomFwsCTLJDee8n6GxUFokMo7RWnvlEfUU7aWwEx2dN
	Ge9Q==
X-Received: by 10.52.165.99 with SMTP id yx3mr14768616vdb.34.1367249637145;
	Mon, 29 Apr 2013 08:33:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Mon, 29 Apr 2013 08:33:37 -0700 (PDT)
In-Reply-To: <1367249183-2579-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1367249183-2579-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Apr 2013 16:33:37 +0100
Message-ID: <CAJTo0Laf-d0hz5kkRZZAr7W4yGs+aYaTu51XU2k2q-s0p57q5A@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Gm-Message-State: ALoCoQneWlr/lnmQKOs2JZI37Oiy5lEyEqia8fbwAGGU+C8lLCbtV0UPilb3/91s4tZp1sUG0yZu
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] bitbake.conf: fix definition of ${libexecdir}
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
X-List-Received-Date: Mon, 29 Apr 2013 15:51:56 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I agree with dropping $libdir and hard-coding "lib", but have you done
a world oe-core build with buildhistory to verify that nothing else
moved around?

Ross


