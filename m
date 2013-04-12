Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UQSZq-0004XW-AF
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 03:14:58 +0200
Received: by mail-pb0-f44.google.com with SMTP id wz12so1130272pbc.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 17:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=XfTT5wFnNXVonWUoVKhhEffbI/HknF6SjzpkPhK+ecU=;
	b=A1zveybrEO9iFFJxuvTvbPTOFjAmqzuNPnczLv+giTKHBgVbCACANbzJfZS96C/26J
	9VBQvluaMWuwKwyMrTfoxXeMyLG3IlH5FI/GuZYupfbQgbCM0E0/SCnJ1Qk4J15IQrtC
	gl9Ru+nMtWNychJNn0fHfx3hRTbQH0tiG6EjCUoaTBXXp/1XhwBRjtEMc8Ell3Phg93m
	X3HjYhd5c+TTWLUa9Hc4ysX+cBpiPk/Kcrxgt2RJNU7w35+lvwvi+p8eO+DiUtiOYVhv
	3ruA8eXYc9EgW+5cylbm+1ZMJceOa/5bYbsM1dPuyYwEiG5NAJT5rp/u4KUz7azxeWcm
	sERw==
X-Received: by 10.66.26.44 with SMTP id i12mr12815683pag.151.1365728249661;
	Thu, 11 Apr 2013 17:57:29 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id sf5sm6108357pbb.44.2013.04.11.17.57.27
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 17:57:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51675A40.6080600@intel.com>
Date: Thu, 11 Apr 2013 17:57:29 -0700
Message-Id: <27105F8C-BD23-4A88-81EE-36EF75E55513@gmail.com>
References: <51675A40.6080600@intel.com>
To: Saul Wold <saul.wold@intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: Master under test with gcc-4.8
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
X-List-Received-Date: Fri, 12 Apr 2013 01:15:20 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Apr 11, 2013, at 5:50 PM, Saul Wold <saul.wold@intel.com> wrote:

>=20
> Khem,
>=20
> Just an FYI, I am firing the autobuilder tonight with =
Master_Under_Test (MUT) with your latest GCC-4.8 recipe enabled, so we =
can get an across the board look at what's happening.
>=20
> I have seen a couple of failures with an initial build in xmodmap and =
matchbox-panel (when building a sato image for x86).
>=20
> Just wanted you to keep your eye on the build, I will send you any =
failures.

yay.  Thats good, lets open a bug and track all build failures there.  I =
know one thing that linux-yocto-3.8 segfaults when building with 4.8=20
there is another ICE in gcc which is already reported to gcc ml. Other =
stuff that Martin reported seemed more like code changes in packages
themselves.

but lets track it in one place.
>=20
> Thanks for looking after the toolchain!
>=20
> Sau!



