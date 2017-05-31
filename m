Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id EFBBF72F67
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 02:22:47 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id e127so4861079wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 19:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=toieHsXulXbA2oOPg3Dz2rboqqCM2iN1p3oskjpHCqI=;
	b=kfteQNIE0wtGNyKIsIacRf+KpJWFil20Ty+InQh+Pdal3tm/k38x9WXzNp1SJYjgw8
	aFYsBq89GhuILgnQJkbA8ZuPop6ocE2YBzyRY/NPUgrW4MSG52akhosqJ6oA+U4zcbKw
	j80akTW4l7yelcU87e5aY7x0Kaj3umiXHJTCPF5VGqP69ohhr1Amp2wLfdqS0/2qVNHU
	xWK+ofE8l3niNDW73YBwtq1i9Y+ieKrTUqgGi2zDFr4+lR2vTOgP0bUPij8MjtqbiOFZ
	gdG7tTqo4LcMxVjOCYF/tM6lbkvOE47U8Xwqq5xWITP23c5cUD/A+KX17b5PFLuS5h6h
	Wl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=toieHsXulXbA2oOPg3Dz2rboqqCM2iN1p3oskjpHCqI=;
	b=rTIAlMSUgEjK+KFGlABfhhj4Qdbzuh73+kwIZhMSoEfIMG6dRw8dNzbkoRfVQnsoGp
	cEIjnoAs/4ZoIEiH0tlowlN9g/Km0Fo5ZVdsjapKirbrl/clqnjNk90MVfohRZowrUkH
	w5R+pRU9k92zXXu9ZqzlCJgekXL70Zmj40bpfmRchMh7PhkKWxcIOP4QUxSfFjxOraeV
	uOsoAH2XndAgDDRiP1OZdNr39QoSelKT9fmoSqhhJeeARSuXwr1FCIywNnOZF/PPcsRY
	Md/xrrck+3uDwrHcecX5ResfPLk5cqZCfXXTvjIT6UR1q65eSDYTAWRAux42RIBn+7zF
	6ZfA==
X-Gm-Message-State: AODbwcAfzOn7mfHffMrXEwBSmlwCcwqT8erBEEWeeU+40QiAm0JYJvP4
	bO8Kw5fiBt6Rt1wVssI=
X-Received: by 10.28.45.143 with SMTP id t137mr3866755wmt.6.1496197368059;
	Tue, 30 May 2017 19:22:48 -0700 (PDT)
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com.
	[74.125.82.53]) by smtp.gmail.com with ESMTPSA id
	k18sm11063947wre.9.2017.05.30.19.22.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 19:22:46 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f53.google.com with SMTP id e127so4860727wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 19:22:46 -0700 (PDT)
X-Received: by 10.28.113.85 with SMTP id m82mr3809849wmc.21.1496197366369;
	Tue, 30 May 2017 19:22:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.236.75 with HTTP; Tue, 30 May 2017 19:22:45 -0700 (PDT)
In-Reply-To: <20170530153249.7161-1-nicolas.dechesne@linaro.org>
References: <20170530153249.7161-1-nicolas.dechesne@linaro.org>
Date: Tue, 30 May 2017 23:22:45 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrESFUf5_7q1NkAZ_ovU8-KL1tvp8ACfRQ6xRY927x=uw@mail.gmail.com>
Message-ID: <CAP9ODKrESFUf5_7q1NkAZ_ovU8-KL1tvp8ACfRQ6xRY927x=uw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade to 17.1.1
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
X-List-Received-Date: Wed, 31 May 2017 02:22:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 30, 2017 at 12:32 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> * Costmetic changes in license.html file required new MD5 hash
> * Add PACKAGECONFIG option for libunwind support (new feature, disable by default)
> * Rebased 0001-Use-wayland-scanner-in-the-path.patch
> * Added zlib in DEPENDS, otherwise mesa no longer builds.
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

