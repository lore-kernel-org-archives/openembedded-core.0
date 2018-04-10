Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3BD9A72EDC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 12:43:37 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id t67so26036512wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vx0PSljEEnUqUiEYGVKKOHoDmSL2UDKqxUdkrt+u0nc=;
	b=gPU87MOBTHLAAidj5cxztseOTblxtHtfNR01SGKZGRun6hEtWVoHFjZF4ROUKyAYd1
	45F2VdT8/Awuw4dBXfxiMZsUvLjtzJlvzwmlCKqAfqEyRAMWSR7cetnPhGluMsNP2va8
	w7CRv/Zcimd+MBmOeLZezfdiAisFe9j3U/c9DkKdw6j/6jEEp7WOkNJXtNNgaRZqs0wv
	vP7dC/9OX7Ypyyy9s1rlwOhe/rOE5dZfz7X+3tZBunBZIxEusGvcjlQuA7O0ss9+lZgk
	k+IbBz7ylYazJ8h9NJ34zqcUFQ0LAuzWvAkuk1RTqGPZ2o3yOIlRHKcgwF2PWb/eY3Sk
	WCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vx0PSljEEnUqUiEYGVKKOHoDmSL2UDKqxUdkrt+u0nc=;
	b=L/z/ineGvNNQpyixHFrs5RejHHLjAEf5Y0mbCLTG0Ez1nraZS6eZB08judzslbtEn9
	XyhHqCngep2N7R0BE1INaA/yJKzg97qMvBRzCN07LEOMQm0aMw/ZhGFIYThSRfbFOIOy
	GRiKdq9+dfjdkQIOkFRBacbTE4OtWbzn3m4znhK9dBCjPSPM34++jBPuXKKG9x7qLUnr
	XAGVGU8GWXiZ3mQx4qk9ZClJX/7gdWShy8wyUNuGHPork0dvpO+jiZNt68eA6zVMxZfv
	A9FLoWXKsHxlMviVXDn9SpQG9bEmwdLJ5zBUQ+lt6gGx7qolgSfUeRejwrdemV8ZuR7p
	tfsg==
X-Gm-Message-State: ALQs6tBpUWQoNf+Nd1BCx13StUsrmaPiFkSe8c2fzT0edeqBDqKDVJ8d
	vhW2SpfnLtV9pZrOSHMyL+o=
X-Google-Smtp-Source: AIpwx48k/WFb8K91oT20d2/WQVywwEO9g2cobzfUqueoCws2aDQ9qE3t+iMVqByhRTr6f45m/5BB5Q==
X-Received: by 10.28.143.132 with SMTP id r126mr1501282wmd.45.1523364218430;
	Tue, 10 Apr 2018 05:43:38 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x22sm2204886wrd.69.2018.04.10.05.43.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Apr 2018 05:43:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Apr 2018 14:43:38 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20180410124338.GA1343@jama>
References: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 1/5] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Tue, 10 Apr 2018 12:43:38 -0000
X-Groupsio-MsgNum: 110426
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 10, 2018 at 03:07:43PM +0300, Alexander Kanavin wrote:
> Openssl 1.0 can still be utilized by depending on 'openssl10' recipe.

Does this really work now?

I think it will fail again when both openssl versions end up in RSS.

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWsyxeQAKCRA3VSO3ZXaA
HBQjAKCJ0PIk8UNzj0ysapG7vgUQsK4iQgCglZcfKe2+052Ct2H0fiLzCmwTqzU=
=geDP
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
