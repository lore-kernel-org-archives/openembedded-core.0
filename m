Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 39FAD7E6A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 20:01:58 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id e16so14420321wrn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 13:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=9s9OuZh/tui23u6dprIRHe/ZIFLfQVTkD9lQi1QiUUA=;
	b=MT6QLS7Zyf6ZzJl6nhKNh9BMA5Q55CnIUUxq5UqF+2ssqv73Mq8BM75uldFnGQ41r3
	GYp2mNPlM/NpEhYcMYDy+SHRkpyo3UuRju8XKLdjrP6fvRNaJRkw3KdJ/3F8vp1Y4XYE
	snL5LoMtYHnsItzrHt9XlvzMOVZRxamb+VQTP64mLY3ZRM7MV94YISgLrKitSvbSS1Ti
	bpHtj6ADjQ2cM3to0ZEJQWEDq1VnweA2U0Gc+DymQNBW7EWRwosigJ89hFQl42ZmPSXa
	UyWpCgm7/aVPf5dOjK3f090vsNW1nhvlwcZiyJbPS/xQjafMlWt7TsKLQlc59clwNOxd
	N79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=9s9OuZh/tui23u6dprIRHe/ZIFLfQVTkD9lQi1QiUUA=;
	b=tTznJVcNW+4SV8VCWa5fCmLGygh74zlB/xTQTbAFrbsO0pfpIB2ZFWMy5Be+wr7HM9
	EPSEPGT4qLbHDT+mbm25ZP7LrNebfpgoOCuH4os/9wI+fE7vxoe6p/qcGwUo1MLCciOF
	2x+H6OqFxbc2Dm5DpHAk9kc7aKgToqYyB/d+dPoxPGrLlDmk1TWWZQNxJjHTROWxtiAh
	qDPRKXXS4FzMAFLeC4GYQvaYPxIksRuNeM9uc42GqCTwIMkLQLgxpva3s/WNmtn2CgWl
	HaCwHuGYu+rUMAjPXfbYNMxeDiGhZ5F3M7pf2C1IJyZ/qxi5er5WuwZQNvrreOEzuZ4V
	kmlw==
X-Gm-Message-State: APjAAAU3q3EZmXF6FGASeaWS5/jrQZmvly7F9VnHRA0vL+zFfsPi51Ej
	5gnrH5GY4aXFWB1j3OjbXMk4Xibl
X-Google-Smtp-Source: APXvYqxq9sX6wjwbYj2+CD28KvlRGZne9iV2w6D/I9ZllQPrU0K5yE+nf2eUcb3SUxLyBSmU2sTEGw==
X-Received: by 2002:adf:c506:: with SMTP id q6mr36790341wrf.219.1560283318578; 
	Tue, 11 Jun 2019 13:01:58 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	v15sm16147286wrt.25.2019.06.11.13.01.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 11 Jun 2019 13:01:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 11 Jun 2019 22:01:58 +0200
To: openembedded-core@lists.openembedded.org, hongxu.jia@windriver.com
Message-ID: <20190611200158.GA1858@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.12.0 (2019-05-25)
Subject: meta-openembedded git repo in some of the openembedded-core-contrib branches
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
X-List-Received-Date: Tue, 11 Jun 2019 20:01:58 -0000
X-Groupsio-MsgNum: 125643
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

when accidentally checking for some old meta-oe commit in oe-core
repository I was surprised that it was found in some of the contrib
branches:

~/openembedded-core $ git branch -a --contains 30bbde3d09e
  remotes/contrib/hongxu/add-recipes-20190215
  remotes/contrib/hongxu/dbg-split
  remotes/contrib/hongxu/misc-fixes

These branches are actually from meta-oe repo, not oe-core.

Please remove old irrelevant branches from -contrib repositories:
https://git.openembedded.org/openembedded-core-contrib/
https://git.openembedded.org/meta-openembedded-contrib/

and make sure you're pushing to the right remote :), it unnecessary
almost doubles the repo size.

Cheers,

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXQAItQAKCRA3VSO3ZXaA
HLjmAJ0ZR5i75m7aUquW0QE5PvAng9swLQCfXq9BMF6OCNIjiYxKEZ/tbDLysSo=
=qvlM
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
