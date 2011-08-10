Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QrAKD-0004cc-DE
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 17:04:05 +0200
Received: by iyf13 with SMTP id 13so1486827iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 07:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=XoUPs0awxtN3/Hvaae/n8md048c0WYyglT8zOmOPxBg=;
	b=hcCWOHUACIdm87PzV2Og//qsQ9Wd5OdHoGOPpDQnnbHJrA1CTEYX5osGvF13j65bfI
	ZQB2471+9ppAACt3BqCKGI7nPA2oA0brVqYvsWUWa4lIV9Nl6oZNVcNsjjgfKOsZNtYT
	7heptz4q9gc76TTX890lQ0pf5i2cGAUPQwlNc=
Received: by 10.231.85.12 with SMTP id m12mr9892407ibl.60.1312988373592;
	Wed, 10 Aug 2011 07:59:33 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v16sm777331ibf.42.2011.08.10.07.59.32
	(version=SSLv3 cipher=OTHER); Wed, 10 Aug 2011 07:59:32 -0700 (PDT)
Message-ID: <4E429CD3.8050002@gmail.com>
Date: Wed, 10 Aug 2011 07:59:31 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110801 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1312946123-2982-1-git-send-email-raj.khem@gmail.com>
	<1312975831.6733.43.camel@phil-desktop>
In-Reply-To: <1312975831.6733.43.camel@phil-desktop>
X-Enigmail-Version: 1.2pre
Subject: Re: [PATCH] intltool: Use nativeperl binary for PERL instead of 'perl'
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
X-List-Received-Date: Wed, 10 Aug 2011 15:04:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/10/2011 04:30 AM, Phil Blundell wrote:
> On Tue, 2011-08-09 at 20:15 -0700, Khem Raj wrote:
>> +-AC_PATH_PROG(INTLTOOL_PERL, perl) ++AC_PATH_PROG(INTLTOOL_PERL,
>> nativeperl)
> 
> I don't think you want to do that for the copy of intltool.m4 that's 
> going to be installed on the target, only for the one that goes into
> the sysroot.
> 

ah right. I will resubmit

> p.
> 
> 
> 
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


- --
> 
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5CnNMACgkQuwUzVZGdMxQbOQCeJZRkN32WN9yG6tTOEBiJhTSt
eZgAnRutQ6EPya3rYnOjZvcQoESw1vwx
=zH1y
-----END PGP SIGNATURE-----


