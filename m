Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SNmXX-0001Hb-T8
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 16:52:56 +0200
Received: by dakh32 with SMTP id h32so1031672dak.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 07:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=eS7dms+C6vmJ+KkA+eOL8FBrkFXnBOY1XrUq+OK3IoA=;
	b=m5x8bIdHP8cbxwOBT8DR5DpIchaJNRhSnwUMXrbPN/02nfs3Tv0jCSw8HvvoTiH+G0
	ppu+ZhEHvHCd7x+LpqMFlmbUU1TJDlN8Kk/vGjPYm3TzRGhep/0w74jOezGtN4j3qPuj
	mjcISSffpjrvCPt5G1ygxJv2X53vAy0I81DjSexNlmNiNUdqxwphLn2EYzwACIz+p6Wa
	63Xp1uDoNwLGGrGd+eZ2ua47exXFaFWWJNtILAnW6vWKsxE+ps1F8jmAND476AA03tOk
	FvZEiMP18neyrKzdoqWerqCZUQjXImcNbV2VkjELPYwzA+RhABNT0pgIfR6UtEBCugT5
	/d1g==
Received: by 10.68.239.99 with SMTP id vr3mr3571918pbc.10.1335537796699;
	Fri, 27 Apr 2012 07:43:16 -0700 (PDT)
Received: from [192.168.1.103] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id qs6sm6675556pbb.29.2012.04.27.07.43.13
	(version=SSLv3 cipher=OTHER); Fri, 27 Apr 2012 07:43:15 -0700 (PDT)
Message-ID: <4F9AB080.8050106@gmail.com>
Date: Fri, 27 Apr 2012 07:43:12 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120411 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1335524357-16990-1-git-send-email-ken.werner@linaro.org>
	<1335526116.20130.67.camel@ted>
In-Reply-To: <1335526116.20130.67.camel@ted>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH] Qt 4.8 GCC 4.7 fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Apr 2012 14:52:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/27/2012 04:28 AM, Richard Purdie wrote:
> In the future could you put an "Upstream-Status:" header in any
> patches which get added along with an indication of the author?
> This helps a lot when you look at the patch in 12 months and wonder
> who wrote it (you covered why) and also gives us an idea of which
> patches might be worth prioritising to discuss with upstream.

I think its a forward port of this patch

http://git.openembedded.org/openembedded-core/tree/meta/recipes-qt/qt4/qt-4.7.4/gcc47-fix.patch

so you can add that to header
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+asIAACgkQuwUzVZGdMxTGnACdGn8JxrpsgsCIWiQ0NhGdGJag
vKUAn2oECoQqL9e+/GueKqfWbcKmxAnR
=bHqW
-----END PGP SIGNATURE-----


