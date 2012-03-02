Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1S3ag1-0003PU-SA
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 23:10:13 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 17E171D36195; Fri,  2 Mar 2012 23:01:38 +0100 (CET)
Date: Fri, 2 Mar 2012 23:01:38 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120302220138.GI21882@ibawizard.net>
References: <1330547595-11631-1-git-send-email-ynezz@true.cz>
	<1330617040.31767.25.camel@ted>
	<CALbNGRRKMKQx1ZSzJruX26J2NGYFBYS+Cgp3W2Pk9ETCRtfY+g@mail.gmail.com>
	<1330691892.15224.17.camel@ted>
	<CALbNGRSJMFZ03x25xE+d_Sj6H2g6=gFx5OX15GAO2sRAGKrsSg@mail.gmail.com>
	<1330694440.18076.1.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1330694440.18076.1.camel@ted>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] image_types.bbclass: fix link creation	failure if the target already exists
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 02 Mar 2012 22:10:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Richard Purdie <richard.purdie@linuxfoundation.org> [2012-03-02 13:20:40]:

> Thanks, that helps a lot. I'd tested "tar tar" and "tar.gz tar.bz2" but
> not that :). I think something like:
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 681571d..1bf59a5 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -17,7 +17,8 @@ def get_imagecmds(d):
>                      types.append(basetype)
>                  if basetype not in cimages:
>                      cimages[basetype] = []
> -                cimages[basetype].append(ctype)
> +                if ctype not in cimages[basetype]:
> +                    cimages[basetype].append(ctype)
>                  break
>          if not basetype and type not in types:
>              types.append(type)
> 
> should fix this?

It's ok now. Thanks.

-- ynezz


