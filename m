Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 46DAD707A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 12:08:38 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6OC8KLI006139; Thu, 24 Jul 2014 13:08:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5FHZTBCqAFzQ; Thu, 24 Jul 2014 13:08:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6OC8HKK006125
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 24 Jul 2014 13:08:18 +0100
Message-ID: <1406203692.27697.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 24 Jul 2014 13:08:12 +0100
In-Reply-To: <alpine.LFD.2.11.1407240509150.1086@localhost>
References: <alpine.LFD.2.11.1407240509150.1086@localhost>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Mention package_tar packaging in local.conf.sample
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
X-List-Received-Date: Thu, 24 Jul 2014 12:08:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-07-24 at 05:10 -0400, Robert P. J. Day wrote:
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
>   is this the appropriate comment for tarball packaging?
> 
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 555f8db..a200002 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -78,7 +78,8 @@ MACHINE ??= "qemux86"
>  #  - 'package_deb' for debian style deb files
>  #  - 'package_ipk' for ipk files are used by opkg (a debian style embedded package manager)
>  #  - 'package_rpm' for rpm style packages
> -# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
> +#  - 'package_tar' for tarball packages
> +# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk package_tar"
>  # We default to ipk:
>  PACKAGE_CLASSES ?= "package_ipk"
> 

The class is pretty useless, lets leave this one less documented ;-)

I keep thinking we should delete it instead to be honest...

Cheers,

Richard


