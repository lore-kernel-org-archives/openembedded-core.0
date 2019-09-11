Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 97AE17D41F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 03:39:10 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id e12so12714489oie.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 20:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=4UJp5LtuKxIYBcfrjQXmBFTvP7KpZtt2Eh8Hm8aU338=;
	b=nKdrksg7nYVj9yQrlgL/jOS2x0WI5ZGLay06a9QbzEdzPkx0XYWGOpfk6Z8P3Y/0H5
	FAy7KNmpRealZKyTnGnPIWKAiHj+bteCJGP6ZkGSd/yL45EQN5Di/YMZveckX9rlBwwK
	mFBjC9h5DIy0NyWqXIEeTMFnQZ12hkSK7QlYpozgzf1r14ExO4snh8IKTB2B7Oc0M1iO
	mlr8M7X4bVC5E2L0KeZtNm8A+z6bNQdQMS5Wk64DbliKyQtgtq7grd0ncxh44ZickX/I
	02GYXGpeB5BE6ftOz5zWwucFmmfRY4yz2ctvILgout7YJGL1sbs7HMRWc3gPj3sjCZsi
	aC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=4UJp5LtuKxIYBcfrjQXmBFTvP7KpZtt2Eh8Hm8aU338=;
	b=rcohCKgw6efdookDRRQs4Oo/eOC1XSrs4maqHKNIqMl1m1jPdav5X1e4Eqx4EuVCuD
	sRK9WHmttChxj3Sz7IJ9t6e+GGlHKmGHDcX8zM3mH3XMqt5DWXPCAk8j4/BgsqSXAjCI
	+dfnLF0L4FaSreEDzMDQOPthYuTySuWlrK3wA4tDPrxYwzSDG4OqshxD2Q9fXcugdHRp
	Jk5/Qf6Dze0Qr/MLSGwT+bm1wvT7n2pv1zZkKyWLMZLJKBi0LSW9XAnDN1KDctcixSLN
	DzrnpYdk9Fsojl+kYvpRQZ8d32FZcuwIp6UDR8P83MwK0ZNc8fbbotxf1r41l6Wpavyh
	675g==
X-Gm-Message-State: APjAAAVyUWstgz4iW+PN+bzd6kC5phtTXoFyswx4wlhZvkto/C1Sh9VW
	nI4xKN+QgTBCJERqN0rKz8Pw1yAcY+Z+ZA==
X-Google-Smtp-Source: APXvYqxSnK/mdK8O+ZIntgLMKAXRdzkcE9ZgsUv09lcgxsCi8dYZgu+gjUs/wuW+krMLyykVC/kZbA==
X-Received: by 2002:aca:ab84:: with SMTP id u126mr2211609oie.115.1568173151081;
	Tue, 10 Sep 2019 20:39:11 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com.
	[209.85.210.42])
	by smtp.gmail.com with ESMTPSA id b5sm6464024oia.20.2019.09.10.20.39.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 10 Sep 2019 20:39:10 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f42.google.com with SMTP id c10so21165798otd.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 20:39:09 -0700 (PDT)
X-Received: by 2002:a9d:6a45:: with SMTP id h5mr29783414otn.345.1568173149467; 
	Tue, 10 Sep 2019 20:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190910225622.3106589-1-raj.khem@gmail.com>
In-Reply-To: <20190910225622.3106589-1-raj.khem@gmail.com>
Date: Wed, 11 Sep 2019 00:38:56 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoSJHasc5xqTn7SHRnw4J4E4YgiAmCFPExuOZa_oSkkYA@mail.gmail.com>
Message-ID: <CAP9ODKoSJHasc5xqTn7SHRnw4J4E4YgiAmCFPExuOZa_oSkkYA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] weston-init: Add possibility to run weston as non-root user
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
X-List-Received-Date: Wed, 11 Sep 2019 03:39:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 10, 2019 at 7:57 PM Khem Raj <raj.khem@gmail.com> wrote:
...
> @@ -28,4 +38,10 @@ RDEPENDS_${PN} = "weston kbd"
>  INITSCRIPT_NAME = "weston"
>  INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
>
> -SYSTEMD_SERVICE_${PN} = "weston.service"
> +FILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${systemd_unitdir}/system/weston@.service"

${systemd_system_unitdir}

Except for this minor change, it is good to go :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

