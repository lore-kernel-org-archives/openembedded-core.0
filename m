Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Smexg-0005y5-7C
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 07:50:44 +0200
Received: by pbbrq2 with SMTP id rq2so11888147pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2012 22:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=oFsfKMk3afITJftaV/uFVZtKQrP8pJMMuNoXG2G/2as=;
	b=k5YWiM8Jo8+WUbTzI5SK70jMt4GPLMBS4VR5VMcucHe7hudaruzwM4Z1HEBr407Vvu
	5XeohZXDvJp16AQJWHERMANgbKHQTB1A1mwyxcoeKq3nSu3lSfXp+H+Cj/wNd3L9wYZ8
	WhvrpKNBI+Z/QM5XDo8jtOSZtZAeB55hy1WpBKp1iWgB+rzp/i1v7PJu4SJ6yomnr6V0
	qcT0wT5bgzf83Fsc9WFpFgTsOTrcdXOnbYsXQLXBxWJZBx6pXlEiR4uqDozD1dZmraNO
	vjDA7sxLFFjMBo8qkfSF36wrxbOm3MUKynuAQboUpA2JLD7HIpUmf2O7ZrOTvHi/3Sa/
	4Elw==
Received: by 10.68.191.201 with SMTP id ha9mr24713681pbc.75.1341466779277;
	Wed, 04 Jul 2012 22:39:39 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id rd7sm19058230pbc.70.2012.07.04.22.39.37
	(version=SSLv3 cipher=OTHER); Wed, 04 Jul 2012 22:39:38 -0700 (PDT)
Message-ID: <4FF5289C.80107@gmail.com>
Date: Wed, 04 Jul 2012 22:39:40 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <alpine.DEB.2.02.1207032219210.21877@oneiric>
	<CAMKF1sqWn-S=Hc_eMw-JU3ZP6ox-vfNSidiQbF_oLPhg9tO71g@mail.gmail.com>
	<4FF4151A.7050400@opendreambox.org>
	<alpine.DEB.2.02.1207040615500.23821@oneiric>
	<1341401390.3906.12.camel@ted>
In-Reply-To: <1341401390.3906.12.camel@ted>
X-Enigmail-Version: 1.4.2
Subject: Re: why would a recipe have both do_install() and do_install_append()?
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
X-List-Received-Date: Thu, 05 Jul 2012 05:50:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 7/4/2012 4:29 AM, Richard Purdie wrote:
>>>>> AFAICT, you can't override an append. Both appends, the
>>>>> original and the bbappended, would get executed.
>>> 
>>> ok, now i *definitely* want to know whether this would work or
>>> not since there are a few recipes that define both do_install()
>>> and do_install_append().
> Andreas is correct, you can't override a do_install_append (),
> both would just get appended.

yes thats true. I was thinking about having appends which are
recipe-class specific but that case wont apply to a normal _append
like above

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/1KJwACgkQuwUzVZGdMxQ/PgCgj9Vi3iWwvf6qbxyrx942pfYu
A0UAoIvvGdvFeQI8i6oc524N50Sn/ltR
=Iz3L
-----END PGP SIGNATURE-----


