Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id A13016AE1D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 22:04:45 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z10so7218051ead.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 14:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=resent-from:resent-date:resent-message-id:resent-to:delivered-to
	:message-id:subject:from:to:date:in-reply-to:references:content-type
	:mime-version:content-transfer-encoding;
	bh=xo4bOrsbfSEULS6lo+Vy+eSaULF3CL+935DJNSbi9dU=;
	b=BUBGWoBAq6hmlAYEboMPParNUjy6YxgjPkGLoSuPgHedb2wMgxTOCHIMwsvrOXF+HX
	7q5pGcTMtvxemRSzbyeGntQumxJ5v2KPsEQGpi834tA5JI3KkAsQgLNhm6ZxVhSdJjs8
	FbxPUHBZhghFAwxysGq25Cd7qNQqKtZg528+YJhqFjb3XkQi4be6DCI89wuUyvN5zZKW
	3GqQQBmeB5ZsbyAcwNjoz2M0UOnhqMmUgXnSSiUc2Y7StnMVVnd9V39ew74qMEBNC91v
	WsfVWvnpX1jR05TgMeTMyIk9h/D3YOE1ADZ/Cgea9/7nk/Lh57GN4C+NWH4HSYRGIwjA
	+MYQ==
X-Received: by 10.14.119.1 with SMTP id m1mr11376257eeh.39.1385762684182;
	Fri, 29 Nov 2013 14:04:44 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h3sm19702859eem.15.2013.11.29.14.04.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Nov 2013 14:04:44 -0800 (PST)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Fri, 29 Nov 2013 23:04:47 +0100
Resent-Message-ID: <20131129220447.GC2860@jama>
Resent-To: openembedded-core <openembedded-core@lists.openembedded.org>
Received: by 10.194.179.198 with SMTP id di6csp277424wjc;
	Wed, 27 Nov 2013 00:58:40 -0800 (PST)
X-Received: by 10.180.103.233 with SMTP id fz9mr21846228wib.20.1385542720287; 
	Wed, 27 Nov 2013 00:58:40 -0800 (PST)
Received: from dan.rpsys.net (dan.rpsys.net. [93.97.175.187])
	by mx.google.com with ESMTPS id hk7si20887945wjb.15.2013.11.27.00.58.39
	for <martin.jansa@gmail.com>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 00:58:39 -0800 (PST)
Received-SPF: softfail (google.com: domain of transitioning
	richard.purdie@linuxfoundation.org does not designate
	93.97.175.187 as permitted sender) client-ip=93.97.175.187; 
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAR8wcP6019407
	for <martin.jansa@gmail.com>; Wed, 27 Nov 2013 08:58:38 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aOImzxjCiAmz for <martin.jansa@gmail.com>;
	Wed, 27 Nov 2013 08:58:38 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAR8wZch019404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT)
	for <martin.jansa@gmail.com>; Wed, 27 Nov 2013 08:58:37 GMT
Message-ID: <1385542713.11246.21.camel@ted>
From: Richard Purdie <martin.jansa@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 27 Nov 2013 08:58:33 +0000
In-Reply-To: <20131127011949.GN2870@jama>
References: <20131127011949.GN2870@jama>
X-Mailer: Evolution 3.6.4-0ubuntu1
Mime-Version: 1.0
Subject: Re: PERLVERSION sometimes changing sstate signature
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
X-List-Received-Date: Fri, 29 Nov 2013 22:04:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-11-27 at 02:19 +0100, Martin Jansa wrote:
> Sometimes it's shown in
> bitbake -S perf (or any other perl using recipes)
> 
> NOTE: Reparsing files to collect dependency data
> ERROR: Bitbake's cached basehash does not match the one we just generated
>        (/OE/oe-core/meta/recipes-kernel/perf/perf.bb.do_package)!
> ERROR: The mismatched hashes were 074153b639c930f9f3e06170745e2587 and e5b25a12742221b725812945ccd5abfb
> NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be rerun and all succeeded.
> 
> bitbake-diffsigs between such .sigdata files (not exactly the above) shows:
> basehash changed from 992e4ad775701625d03e5ba8b20a016f to 9b5d76a5e33f2d53c20d89923bc553f7
> Variable PERLVERSION value changed from 'None' to '5.14.3'
> 
> PERLVERSION is from cpan
> meta/classes/cpan-base.bbclass:PERLVERSION := "${@get_perl_version(d)}"
> 
> # Determine the staged version of perl from the perl configuration file
> def get_perl_version(d):
>     import re
>     cfg = d.expand('${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/config.sh')
>     try:
>         f = open(cfg, 'r')
>     except IOError:
>         return None
>     l = f.readlines();
>     f.close();
>     r = re.compile("^version='(\d*\.\d*\.\d*)'")
>     for s in l:
>         m = r.match(s)
>         if m:
>             return m.group(1)
>     return None
> 
> So it looks understandable that bitbake -S executed without populated
> sysroot (only pseudo-native) sees PERLVERSION None, while parsing
> PERLVERSION with sysroot populated returns right version.
> 
> What's the proper fix for this?

Probably to give it a specific value for signature purposes e.g.:

get_perl_version[vardepvalue] = "${STAGING_LIBDIR}${PERL_OWN_DIR}"

Cheers,

Richard




