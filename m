Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4F03E609B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EFv8kA021315; Thu, 14 Aug 2014 16:57:08 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dETS-zFlTVEd; Thu, 14 Aug 2014 16:57:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EFv3ua021312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 14 Aug 2014 16:57:04 +0100
Message-ID: <1408031823.22187.118.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Seefeld <stefan_seefeld@mentor.com>
Date: Thu, 14 Aug 2014 16:57:03 +0100
In-Reply-To: <53ECBCBF.4060209@mentor.com>
References: <1408023506.22187.106.camel@ted> <53ECBCBF.4060209@mentor.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] site: Add common-darwin
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
X-List-Received-Date: Thu, 14 Aug 2014 15:57:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-08-14 at 09:42 -0400, Stefan Seefeld wrote:
> On 08/14/2014 09:38 AM, Richard Purdie wrote:
> > We need this to ensure there are some correct values when building with
> > meta-darwin. This matches the addition of a common-mingw site file in
> > the core.
> > 
> > diff --git a/meta/site/common-darwin b/meta/site/common-darwin
> > new file mode 100644
> > index 0000000..604c04b
> > --- /dev/null
> > +++ b/meta/site/common-darwin
> > @@ -0,0 +1,2 @@
> > +ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
> > +ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getgrgid_r=yes}
> 
> This looks like a typo. Shouldn't the second line start with
> "ac_cv_func_posix_getgrgid_r=..." ?

That is a typo, thanks. Fixed in the version queued in master-next.

Cheers,

Richard


