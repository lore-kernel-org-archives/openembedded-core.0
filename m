Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id B52E16069D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 08:54:19 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id f193so276634676wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2016 01:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=98K5RhaWs6eAk4i10gG/cVNJKQmLK3Bdzppcw7DxaBg=;
	b=G8dBK0m0bRLriaFofDRQPuRSiaBtE2jmaPiwoOPHMrFMqtfHmSfdQ1+MEYriv6llom
	vr6YYgdWLcsLvjRDDAbSYjcucpKHYW9zFiuoNTAhSQfIfabSAwBoIbVfO+hcYGaU2P7F
	NgUkyQT46WMqVUmC4F1YVbv1UbhKJjmiY+j3zseKC51Jflpc44L/c3UVfmmKS5vLB7Fy
	NsgFYHOv3weC1FQH0mJBSGuOCDxOsKQJANKL05+7LkQpErweA8vTQu9ZgRr4BatVARoZ
	ukPzA35m84iM2D4s53w4OGJOCmcp2JwzHz5VT4wci3Dp2IRHWT3dWzLiKs/Bvs3pn50y
	JoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=98K5RhaWs6eAk4i10gG/cVNJKQmLK3Bdzppcw7DxaBg=;
	b=f09wzQNRjqDpsklh04S8OedX4uTm5GjHsjpVU3qGGlN6Ei/dLrWgDsyDySDpELAgxk
	gvcB0phRBtArnIfDoFnro8teex9+AtnLDJ31cutm/Aokyd3FCBFGSYQpj4p55H790HLF
	EU9jO9yPVhf3cJ+xmL58STpbFRMpCYzox1FlBxW3JgRPQc5xQgsbRD8qpflSZiM5C/AJ
	4E4TO+cqIBGSg33hV4LVxqHNRqgH0mf4hjo4afV6EaJg5bEWHLjncIa9463vbCvgGYLc
	Ez51pbD+WF1OF3UyDA6SinWe1Q3Zi6wc8Ds84UA9QlbARR+LYsV6nD1lo/qDiZVMO+e0
	zXlw==
X-Gm-Message-State: AA6/9RnONAvXBU3do5EfHXmlN6+lDR+6jOmCr+wVhqvmU9BGyctOuE5N6J8U6zGpCWBohQ==
X-Received: by 10.194.104.9 with SMTP id ga9mr11145369wjb.23.1475744060165;
	Thu, 06 Oct 2016 01:54:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	wh3sm13186544wjb.49.2016.10.06.01.54.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 06 Oct 2016 01:54:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 6 Oct 2016 10:54:22 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20161006085422.GA2921@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: linux-yocto and linux-libc-headers are again going backwards
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
X-List-Received-Date: Thu, 06 Oct 2016 08:54:20 -0000
X-Groupsio-MsgNum: 87934
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Either use 4.7.99+4.8-rc4 like most other recipes do or at least "4.8~rc4"
which might sort lower than "4.8" (but needs to be verified for all
packaging backends first).

Ignoring all this completely results with what we can see in oe-core
now:

ERROR: linux-libc-headers-4.8-r0 do_packagedata: QA Issue: Package
version for package linux-libc-headers-dbg went backwards which would
break package feeds from (0:4.8-rc4-r0.0 to 0:4.8-r0.0)
[version-going-backwards]

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlf2ET0ACgkQN1Ujt2V2gBzbTwCfapSLefIamMJ6+l+a7qosseBf
uXQAn3/qL2tjeqSFNyYTvKoIAcSSOFNq
=fhsb
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
