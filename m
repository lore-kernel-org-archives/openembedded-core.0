Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SGPCf-0005Nm-7l
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Apr 2012 08:32:53 +0200
Received: by pbcum15 with SMTP id um15so2669100pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 23:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=MbcflgOIuVarBtwSV2cck63drQGIqiRDxmbt02HKAZI=;
	b=ojdn5fdG5dmhUoSNtwDR12e/9Xvi67w90enm0RmT4+6W+5tWNPWQy/7Qyu9xQYyUew
	4r3KG4LdP0XuFspqJ4JWz1zIrCzl8yamIk7VA0Gy8T4/v4e/VJIOy7VwUNInFf2EnJ/F
	GUj7LN6Okvpxgt0mGkGbqk+gR0+32C2YAi0W0vTMeUEV8Kz3Ys4nw60t3OSBxo35jS6N
	V3kMjjz/4ZS/OcwJMDrIcP8/MsLk6IdXSnZSvMmsQ2pa60ArFLvQcP0s1tXsKHunPAiO
	TOgYFdINyo9j6E4st+8IQ9tEDIbfhkFU9Phpvr4OH1LCK6q8ExEaDwO9/C87QYlqmSaJ
	WSmQ==
Received: by 10.68.203.229 with SMTP id kt5mr1546327pbc.96.1333779818831;
	Fri, 06 Apr 2012 23:23:38 -0700 (PDT)
Received: from [192.168.1.79] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id s7sm8356813pbl.31.2012.04.06.23.23.36
	(version=SSLv3 cipher=OTHER); Fri, 06 Apr 2012 23:23:37 -0700 (PDT)
Message-ID: <4F7FDD66.7000304@gmail.com>
Date: Fri, 06 Apr 2012 23:23:34 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120402 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <3c9f0f3047f80b6290ea2ceb4fcecdb7b286c1d5.1333493785.git.nitin.a.kamble@intel.com>
	<850225ff923b1666bcfd119031eca717a76043f9.1333493785.git.nitin.a.kamble@intel.com>
In-Reply-To: <850225ff923b1666bcfd119031eca717a76043f9.1333493785.git.nitin.a.kamble@intel.com>
X-Enigmail-Version: 1.4
Subject: Re: [PATCH 2/2] eglibc packaging: locale packaging configuration
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
X-List-Received-Date: Sat, 07 Apr 2012 06:32:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/03/2012 03:57 PM, nitin.a.kamble@intel.com wrote:
> + +    distro_features = (d.getVar('DISTRO_FEATURES', True) or 
> '').split() + +    # try to fix disable 
> charsets/locales/locale-code compile fail +    if 'libc-charsets' 
> in distro_features and 'libc-locales' in distro_features and 
> 'libc-locale-code' in distro_features:

can this be implemented using set instead of this long list of if and
and ?

declare a set of libc-charsets libc-locales libc-locale-code
and then check if its disjoint with set constructed from distro_features


> +        d.setVar('PACKAGE_NO_GCONV', '0') +    else: + 
> d.setVar('PACKAGE_NO_GCONV', '1') }

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk9/3WYACgkQuwUzVZGdMxTCCQCfTPWYILOG3TL4zfrKygAl3CTl
DCAAn0B/CtTNVog6FpmRK0MoZpKpBB2b
=vil2
-----END PGP SIGNATURE-----


