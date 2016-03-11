Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 87F1460043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 23:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2BNGpBA026726; Fri, 11 Mar 2016 23:16:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tqbIhptJN3V1; Fri, 11 Mar 2016 23:16:51 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2BNGnlZ026720
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 11 Mar 2016 23:16:50 GMT
Message-ID: <1457738209.2804.259.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Mar 2016 23:16:49 +0000
In-Reply-To: <56E33A51.2020807@gmail.com>
References: <1456761746-419-1-git-send-email-ross.burton@intel.com>
	<56E32888.2000301@gmail.com>
	<CAJTo0LZCxp20cT-Te0mDW+X59Pgrr+MUtO1ArgOJoVzfc-rEmA@mail.gmail.com>
	<56E33A51.2020807@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro][RFC 1/2] libsdl: expand PACKAGECONFIG and enable native builds
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
X-List-Received-Date: Fri, 11 Mar 2016 23:16:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-03-11 at 16:36 -0500, Trevor Woerner wrote:
> Hi Ross,
> 
> On 03/11/16 15:49, Burton, Ross wrote:
> > 
> > On 11 March 2016 at 20:20, Trevor Woerner <twoerner@gmail.com 
> > <mailto:twoerner@gmail.com>> wrote:
> > 
> >     ERROR: Nothing PROVIDES 'virtual/nativesdk-nativesdk-libx11'
> > (but
> >     virtual:nativesdk:/z/dragon410c-repo/dragon410c-tw
> > -jethro/layers/openembedded-core/meta/recipes
> > -graphics/libsdl/libsdl_1.2.15.bb
> >     <http://libsdl_1.2.15.bb> DEPENDS on or otherwise requires it).
> >     Close matches:
> > 
> > 
> > That's an awesome comment.  Clearly my testing wasn't optimal,
> > there's 
> > another patch required.
> > 
> > Can you verify that 
> > cherry-picking 55ca1fb8f0e81ff739b3c46897e43356d1f760c3 solves
> > this?
> 
> Yes, verified. Cherry-picking 55ca1fb8 solves the problem.
> 
> Thanks! :-)

I just merged the fix to the branch, thanks for testing.

Cheers,

Richard

