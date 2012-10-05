Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TK1ZK-0004wh-66
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 08:39:30 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so112738wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 23:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=lLS6Qz3CReVltsxKdhBB6qrIzTawOUeO5OmZTiSrjRs=;
	b=fpfO/H7zhJqZX2KDqT9ZGsrW+yfB74+FjjXLih7m0YWiNdlgY+JUJgTsPtFsCdjfpi
	2kdhuMBHwQlfLZVHneiBC380TO/+W+x0/qrK+llGkjTqYll252y1Pa1alx42YR6obBtk
	BzFE4yWDgGqBWBMOOGOUlv/k9qrUNoWSm0Oi2/IGjgvYcAsy7WCkm6zBDPBCzz6V1Aaa
	QGopPPYPd3X5793HirBq/2MtTjTCtEHtKULMYm+OQaYDzBMpyyVVTjC5k+LIICrbvfBu
	ZLQPrzRAJYb2+ZYY8X1yGmv8k1MDufZc0rov1KGmwBCwM28+q4Trt5YLr1KEkaQqhIXj
	9O9Q==
Received: by 10.180.94.226 with SMTP id df2mr963021wib.11.1349418388258;
	Thu, 04 Oct 2012 23:26:28 -0700 (PDT)
Received: from [172.20.0.22] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id fb20sm808497wid.1.2012.10.04.23.26.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:26:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1349318775-17939-1-git-send-email-fcooper@ti.com>
Date: Fri, 5 Oct 2012 08:26:25 +0200
Message-Id: <0132F9D2-DCF0-4605-9120-F8CD9A2A3B6C@dominion.thruhere.net>
References: <1349318775-17939-1-git-send-email-fcooper@ti.com>
To: Franklin S. Cooper Jr <fcooperjr27@gmail.com>
X-Mailer: Apple Mail (2.1498)
X-Gm-Message-State: ALoCoQl19YWNAQW5aFtBFpjehApb7kpY9iqKUOFNrdc0WyXNGVaGkr6+057gUNTERcxKT2y0UXaV
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-denzil][PATCH] gconf: Disable gtk support
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
X-List-Received-Date: Fri, 05 Oct 2012 06:39:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 okt. 2012, om 04:46 heeft Franklin S. Cooper Jr =
<fcooperjr27@gmail.com> het volgende geschreven:

> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> There are only a couple of helper utilities within gconf that need =
gtk+ as a
> dependency and those are unused and pretty useless. We might as well =
drop
> the dependency on gtk and allow more parallel builds by reducing =
dependency
> bottlenecks.

Except that gnome needs gconf-sanity-check, which is one of those =
"useless" binaries=


