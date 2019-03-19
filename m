Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2386C745D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 13:55:34 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u10so14127528wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 06:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=U3IN0LFXP/NZEL08d0CKVa2MMopygg4Th403oki6ADg=;
	b=BI3DtLfl3QFOktYMSRZHj/xzTt8furAwgeEQKNLngV8jaHrtLWAq9odji8DDZBV2fX
	j73rMYla6IKQbu6Eh7RGFDi2YbVfoyt77jFkl+z7kRAf0rcQy/uM2/h4Wv88SYNk2Ule
	pb+ZH8fNjkE7N1U/g1cJXw4yGzSmHy1WX6l9T8c9iPLh8XDiHgqEFBUHjYe7e8B4FrIV
	AAZL1ydytp8CP40FKqCM8k5/NB9OGXJW8e98iZUXWXl2SW/igcETime5yy+4MUiI9juE
	6MyVRH7uC7gitpCsj+NLDZ4AY/M/IHYcFc6y2LNhslE4JGKeGm+MwX7sa2D03uEbV0qw
	j0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=U3IN0LFXP/NZEL08d0CKVa2MMopygg4Th403oki6ADg=;
	b=YDgraBEsFfyQQPkE/zlZ7vsWsoh8CEiB+vn0t05w+c9SsXS71sccIiiT6YFOdmodij
	g/FzmSX5Pec029ijuwrNCr/a/S9rMNbPZgM6djOI7DPCiX4ScmfxR9iXAuLHVfJRlU6i
	w2MKu5ta/j7+fi/sy/1lEpgOjR3vZ7GxTh8t7mI6Ht+q5fSkB5WWHqRqBGGLqq4ILJX/
	uaNYqPi8cTX3Eu4fVqCT5pSIGkSsZM7r7uf3kSA/n+FCQQjMaZM7JokvgVpPFmLPDYeK
	xb42f19bWBYsk2TfICm8d/fL7YbHnUQ0ymVu+DxSicEkISy9UQrVW6+SlzgLrOXNQsU2
	8QMg==
X-Gm-Message-State: APjAAAUszuotg9/2giovQ2K3zSRp/78WBCFU2MTnAwmd9MqfF0ONiE+r
	GcgQaQu4yieELmaGG2ewKa3r/oA6
X-Google-Smtp-Source: APXvYqyLCD8UtDy0/wJ68oasTgj/fsR+HDOd1mh5ilvdIeMVz48O6BRuGQ8HlA4fB8MtZx7To28XAg==
X-Received: by 2002:a1c:6c08:: with SMTP id h8mr3730719wmc.146.1553003735741; 
	Tue, 19 Mar 2019 06:55:35 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id g2sm33649533wrh.7.2019.03.19.06.55.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Mar 2019 06:55:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Mar 2019 14:55:38 +0100
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190319135538.GH1994@jama>
References: <cover.1552962581.git.akuster808@gmail.com>
	<20190319085532.GF1994@jama>
	<D3413079-663B-47D2-8550-658159790D3B@gmail.com>
	<20190319104001.GG1994@jama>
	<22BB06E0-D9DD-4070-960B-53D03755B65A@gmail.com>
MIME-Version: 1.0
In-Reply-To: <22BB06E0-D9DD-4070-960B-53D03755B65A@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/26] thud patch review
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
X-List-Received-Date: Tue, 19 Mar 2019 13:55:35 -0000
X-Groupsio-MsgNum: 122408
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Enx9fNJ0XV5HaWRu"
Content-Disposition: inline

--Enx9fNJ0XV5HaWRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 19, 2019 at 12:35:59PM +0100, Alexander Kanavin wrote:
> Just to remind once more, all upstream support for OpenSSL 1.0.2 ceases in 9 months, so shipping products with it may not be the best idea.

Just to remind once more, shipping products isn't as easy as building
the few recipes included in oe-core.

For example:
Believe it or not, some projects need to use old Qt 5.6 due to license
change in newer version and 5.6 doesn't support openssl 1.1,
backporting the necessary changes would violate the license as well.
Providing clean room re-implementation is also difficult, because there
aren't many other options how to implement this than how it was done in
newer qt already, see:

https://bugreports.qt.io/browse/QTBUG-71623
https://development.qt-project.narkive.com/RW4wxYXY/openssl-1-1-x-support-on-qt-5-6-5-9

Yes, it's not the best idea, but even backporting security fixes to old
openssl might be cheaper than buying commercial qt license...

Cheeers,

--Enx9fNJ0XV5HaWRu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXJD02QAKCRA3VSO3ZXaA
HEiOAJ9cy8aXIlnp9QnrkKYAp/sHjnMQggCfRBndf9PlYGg8zAA7RvFUo9CbSy4=
=bdr3
-----END PGP SIGNATURE-----

--Enx9fNJ0XV5HaWRu--
