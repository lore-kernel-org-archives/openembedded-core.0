Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 31CA86F956
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 10:48:19 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s31AmDI7015760; Tue, 1 Apr 2014 11:48:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YdwGLqXWc31I; Tue,  1 Apr 2014 11:48:13 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s31Am8bi015745
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 1 Apr 2014 11:48:10 +0100
Message-ID: <1396349283.1432.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Tue, 01 Apr 2014 11:48:03 +0100
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B3AA247@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3A7EBE@post.tritech.se>
	, <CAMKF1spy5NzfaLVfnUL_tMS_iqT7EE6NE++SUnb4BvVatgpL+Q@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B3AA247@post.tritech.se>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] Make ppce300c3 tune hard-float by default
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
X-List-Received-Date: Tue, 01 Apr 2014 10:48:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2014-04-01 at 07:54 +0000, Mats Kärrman wrote:
> Hi Khem,
> 
> Thanks for your feedback!
> 
> On Tuesday, April 01, 2014 7:37 AM, Khem Raj wrote:
> > On Fri, Mar 28, 2014 at 9:43 AM, Mats Kärrman <Mats.Karrman@tritech.se> wrote:
> >> +# glibc configure options to make use of 603e specific sqrt/sqrtf routines
> >> +GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3", "--with-cpu=e300c3", "", d)}"
> >
> > looks good, may be the comment above can be more explanatory saying that
> > glibc aliases e300c3 sqrt/sqrtf to 600e versions
> 
> The above statement depends on an added "Implies" file in eglibc and,
> more important on a previous patch adding support for 603e/fpu sqrt.
> 
> How is the new Implies file best added, as a patch to the previous patch
> or as a new patch?

Since this hasn't merge yet please send another patch. If it had merged,
an incremental one would be needed.

Cheers,

Richard


