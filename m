Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id F24E06D305
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 10:45:12 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1QAixWL017221; Wed, 26 Feb 2014 10:44:59 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rm405fztSHOx; Wed, 26 Feb 2014 10:44:59 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1QAiqAu017216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 26 Feb 2014 10:44:54 GMT
Message-ID: <1393411485.31769.109.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>
Date: Wed, 26 Feb 2014 10:44:45 +0000
In-Reply-To: <530DC059.5010608@windriver.com>
References: <cover.1393399942.git.Qi.Chen@windriver.com>
	<daee4480b735a557aaa314f9a1f9bf6fbb3f9a12.1393399942.git.Qi.Chen@windriver.com>
	<CAJTo0LaOPBcyt-WfvXqKR4FEpVD3Lf5c04BXemFNC6_Pa-JMkQ@mail.gmail.com>
	<530DC059.5010608@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python-numpy: fix compile error for qemumips
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
X-List-Received-Date: Wed, 26 Feb 2014 10:45:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-02-26 at 18:22 +0800, ChenQi wrote:
> On 02/26/2014 06:02 PM, Burton, Ross wrote:
> > On 26 February 2014 07:33, Chen Qi <Qi.Chen@windriver.com> wrote:
> >> This is because for qemumips, there are no such files in SRC_URI. And
> >> actually we don't need such files. So for qemumips, the `cp' command
> >> is expected to fail.
> > Those files contain the definitions of things like word size and byte
> > ordering, so unless I've misunderstood the build process for numpy
> > what's happening with this patch is that it's using the host
> > environment.
> >
> > Ross
> >
> >
> 
> Those files are there already.
> For archs like x86, we first replace them so that the build process 
> doesn't fail (according to the comments in the recipe); but for 
> mips/ppc, we don't need to do so, the build just succeeds.
> 
> chenqi@pek-hostel-vm07:~/poky/build-qemumips64 [0] $ ls 
> tmp/work/mips64-poky-linux/python-numpy/1.7.0-r1/numpy-1.7.0/build/src.linux-i686-2.7/numpy/core/include/numpy/
> config.h  __multiarray_api.c  __multiarray_api.h multiarray_api.txt  
> _numpyconfig.h  __ufunc_api.c  __ufunc_api.h ufunc_api.txt  
> __umath_generated.c

Ross' point stands, its just using the values from the host (build)
system. If your build system was mips it might stand a chance of
working, I suspect you're building on x86 though and x86 != mips.

Cheers,

Richard


