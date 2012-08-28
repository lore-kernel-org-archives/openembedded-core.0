Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6Fm6-0000sP-H7
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 08:59:47 +0200
Received: by wibhn17 with SMTP id hn17so3512683wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=CGtygbX6i6OLuCID7swY6WUYGUlWcNBSdEtJPCwJHLs=;
	b=FNbSXj53zCuWKbk/AaDX62oCt+5KetTd8AjRhXXGVYvv6DYb1+EXh2a/0kXZcf9Qhf
	cbzECxIyPcCwlovnMUqPYSumNW7uW+/xAJi1ufCFF4PrxwixM+kCM5K1xrFdjfGsJOPn
	rEWT6M7uGGkRJs8SqbTSiajFJjtdsbTQpZIZD5s/Sg92QonY13FDDK86A83o0B4fSvXk
	pU8T0DjIpAu2PM9RBkn6FYgbjutFE1e294Zjc7Glevcmm89s11Yq6FhqiqscL5q9xtWm
	GQ2dLG6gSkPck+wtMGOq46sa9iNMZpu1GaQV+8npYTeiyRoH7I929A6VeiafVsCFBIgh
	Tj3w==
Received: by 10.180.95.193 with SMTP id dm1mr24670489wib.10.1346136454124;
	Mon, 27 Aug 2012 23:47:34 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id n15sm3376469wie.7.2012.08.27.23.47.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:47:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1346081069-4741-1-git-send-email-mark.asselstine@windriver.com>
Date: Tue, 28 Aug 2012 08:47:33 +0200
Message-Id: <7BBED272-9097-4D7D-AA92-F371C06F4F47@dominion.thruhere.net>
References: <1346081069-4741-1-git-send-email-mark.asselstine@windriver.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQmQaCvdwqkVC6J4JKOGnh0GZYWErln16SJwrUM0idTtYa41WPpJzHp6ExxmzUNugj4iFhk8
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base-files: allow for more flexibility related to hostname
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
X-List-Received-Date: Tue, 28 Aug 2012 06:59:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 aug. 2012, om 17:24 heeft Mark Asselstine =
<mark.asselstine@windriver.com> het volgende geschreven:

> Current logic used to create the /etc/hostname file is fairly
> restrictive and doesn't allow for easy customization since the
> variable 'hostname' is local to the base-files recipe.=20

hostname_pn-basefiles_someotheroverride =3D "foo"=


