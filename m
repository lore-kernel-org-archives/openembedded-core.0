Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UO9ZH-0006qq-OD
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 18:32:47 +0200
Received: by mail-pb0-f45.google.com with SMTP id ro12so1799179pbb.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 09:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=MgoBDOWWRHkeMGyyvHMqUKlOAemAfUjJMjpymkp9+m8=;
	b=AAsKuzrzuhfPWAQHGb2plRtBU4QRGRZ47RZSWg+AD6SYtpeixvJSIyXFDDdaqvPHP6
	wuyCrpLL5uBDG7iEpyTQNwUyIxHK7NHmC7ihTrUUGSdZ8zZRF8phE3v9CNjCxf/6uowO
	u2M7T+XlSahBITW45+V1JXB8arASSzK35q9Dp9Kd1dgVp2piM/m5TBDIdkoA7ruMHEyO
	Y05cvK3eTUAZgb8p5vXOw7zpWhOM3vKW+1y/jUjZYFBj6bgjdRPU2AmWW6vLazkFx8Hl
	rpmOzEVvCl7wm88GrvXofNGz96Tl5aLve0Hx7y1wHJ0jfWiMOr9pFXmLCqsAwZ0sWXv1
	btYg==
X-Received: by 10.66.174.143 with SMTP id bs15mr16198236pac.17.1365178532627; 
	Fri, 05 Apr 2013 09:15:32 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id ij15sm16607586pac.4.2013.04.05.09.15.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 09:15:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <515ED999.9040100@communistcode.co.uk>
Date: Fri, 5 Apr 2013 09:15:28 -0700
Message-Id: <D19A794A-8644-4443-9628-2B137F2BC89F@gmail.com>
References: <515ED999.9040100@communistcode.co.uk>
To: ml@communistcode.co.uk
X-Mailer: Apple Mail (2.1503)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc-cross-initial Failure
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
X-List-Received-Date: Fri, 05 Apr 2013 16:32:48 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Apr 5, 2013, at 7:03 AM, Jack Mitchell <ml@communistcode.co.uk> =
wrote:

> Doing my usual git master pull and rebuild today, resulted in =
gcc-cross-initial failing to build.
>=20
> Please find the log attached, does anyone know what could have caused =
it? I recently changed the TUNES, so could something not be being =
re-built when it should be?


it could be gcc is crashing on you. What TUNEs did you change

>=20
> Cheers,
> Jack.
>=20
> --=20
>=20
>  Jack Mitchell (jack@embed.me.uk)
>  Embedded Systems Engineer
>  http://www.embed.me.uk
>=20
> --
>=20
> <log.do_compile.840>_______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



