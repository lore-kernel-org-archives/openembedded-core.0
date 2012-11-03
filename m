Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TUloi-0004RG-4A; Sat, 03 Nov 2012 23:03:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qA3Lo1DK003021;
	Sat, 3 Nov 2012 21:50:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27857-10; Sat,  3 Nov 2012 21:49:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qA3Lnnb2003015
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 3 Nov 2012 21:49:51 GMT
Message-ID: <1351979389.8362.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 03 Nov 2012 21:49:49 +0000
In-Reply-To: <20121103195435.GE30165@jama.jama.net>
References: <20121102161855.814CC102E2@opal>
	<20121103195435.GE30165@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Daniel Stone : mesa: Build separate GLU library
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Nov 2012 22:03:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-11-03 at 20:54 +0100, Martin Jansa wrote:
> On Fri, Nov 02, 2012 at 04:18:55PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 4395691a44b198ba0b9a969cbade669e8de07a4f
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D4395691a44b198ba0b9a969cbade669e8de07a4f
> >=20
> > Author: Daniel Stone <daniel@fooishbar.org>
> > Date:   Fri Oct 26 16:00:09 2012 +0100
> >=20
> > mesa: Build separate GLU library
>=20
> This seems to cause incremental qt4-x11-free builds to fail with:
> | arm-oe-linux-gnueabi-g++  -march=3Darmv4t -marm -mthumb-interwork -mtun=
e=3Darm920t --sysroot=3D/var/lib/jenkins/jobs/shr-core-branches/workspace/s=
hr-core/tmp-eglibc/sysroots/om-gta02 -Wl,-rpath-link,/var/lib/jenkins/jobs/=
shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib -=
Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-rpath-link,/var/lib/jenk=
ins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-lin=
ux-gnueabi/qt4-x11-free-4.8.3-r48.0/qt-everywhere-opensource-src-4.8.3/lib =
-Wl,-rpath-link,/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/=
tmp-eglibc/work/armv4t-oe-linux-gnueabi/qt4-x11-free-4.8.3-r48.0/qt-everywh=
ere-opensource-src-4.8.3/lib -shared -o libqglgraphicssystem.so .obj/releas=
e-shared/main.o   -L/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-c=
ore/tmp-eglibc/sysroots/om-gta02/usr/lib -L/var/lib/jenkins/jobs/shr-core-b=
ranches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/qt4-x11-=
free-4.8.3-r48.0/qt-everywhere-opensource-src-4.8.3/lib -lQtOpenGL -L/var/l=
ib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/om=
-gta02/usr/lib -L/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core=
/tmp-eglibc/work/armv4t-oe-linux-gnueabi/qt4-x11-free-4.8.3-r48.0/qt-everyw=
here-opensource-src-4.8.3/lib -lQtGui -lQtCore -lGLU -lGL -lpthread
> | /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/s=
ysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi/gcc/arm-oe-linux-g=
nueabi/4.7.2/ld: cannot find -lGLU
> | collect2: error: ld returned 1 exit status
> | make[3]: *** [../../../../plugins/graphicssystems/libqglgraphicssystem.=
so] Error 1

We need a DEPENDS +=3D "libglu" for qt4?

Cheers,

Richard



