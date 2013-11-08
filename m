Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BC0776D59F;
	Fri,  8 Nov 2013 09:48:01 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA89lnIO013275; Fri, 8 Nov 2013 09:47:49 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oRqwlXiuWSal; Fri,  8 Nov 2013 09:47:49 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA89ljlZ013272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 8 Nov 2013 09:47:46 GMT
Message-ID: <1383904061.6271.297.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 08 Nov 2013 09:47:41 +0000
In-Reply-To: <CAAQYJAuMoE6gOMmM2trSN1MY7weCF+07JAJuhQu1K=p5KxO=Yg@mail.gmail.com>
References: <1383866326.6271.286.camel@ted>
	<CAJTo0LYq5PmQtBdwghmDGLs2ccTO6BBwJNGw7s37Yt+zjkWU6Q@mail.gmail.com>
	<CAAQYJAuMoE6gOMmM2trSN1MY7weCF+07JAJuhQu1K=p5KxO=Yg@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Default DISTRO to nodistro
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
X-List-Received-Date: Fri, 08 Nov 2013 09:48:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-08 at 10:33 +0100, Andrea Adami wrote:
> On Fri, Nov 8, 2013 at 10:25 AM, Burton, Ross <ross.burton@intel.com> wrote:
> > On 7 November 2013 23:18, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> +DISTRO ??= "nodistro"
> >
> > Wouldn't "oe-core" be a better name, considering that's what
> > DISTROVERSION becomes if DISTRO is unset?
> >
> > Ross
> 
> 
> Agreed, we already have DISTRO_VERSION = "oe-core.0"
> This sounds also the right name for THE default distro.

I disagree and I feel quite strongly about this. OE-Core is not a
distro. The whole idea was that OE-Core should build with sane defaults
without any distro set. This is a dummy placeholder value and it really
does mean to say that no distro is set.

We did put a value into the DISTRO_VERSION field so you could tell what
was being used but again its a placeholder.

So in my view "nodistro" is clearer about what is meant.

Cheers,

Richard






