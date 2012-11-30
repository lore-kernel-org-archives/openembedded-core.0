Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TeROy-0004LV-JF
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 15:17:12 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:49524 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1TeRBA-0007U5-D3; Fri, 30 Nov 2012 09:02:56 -0500
Date: Fri, 30 Nov 2012 09:02:53 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Chris Larson <clarson@kergoth.com>
In-Reply-To: <CABcZANkyWNGTucmeb4Rft0Ko4nT1+-NNUXrahaj+MG_UPp6VxA@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1211300902130.2185@oneiric>
References: <alpine.DEB.2.02.1211300802160.22736@oneiric>
	<CABcZANkyWNGTucmeb4Rft0Ko4nT1+-NNUXrahaj+MG_UPp6VxA@mail.gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Q about terminology: bitbake "fetch" vs "fetchall"
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
X-List-Received-Date: Fri, 30 Nov 2012 14:17:12 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-731116401-1354284176=:2185"

--8323329-731116401-1354284176=:2185
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 30 Nov 2012, Chris Larson wrote:

> On Fri, Nov 30, 2012 at 6:06 AM, Robert P. J. Day <rpjday@crashcourse.ca>=
 wrote:
>       =C2=A0 need some advice about terminology -- for the sake of descri=
bing
>       this accurately, what is a good way to describe the packages
>       downloaded by:
>
>       =C2=A0 $ bitbake -c fetch
>       =C2=A0 $ bitbake -c fetchall
>
>       =C2=A0 for a simple "fetch", i get only this in my downloads/ direc=
tory:
>
>       autoconf-2.69.tar.gz
>       automake-1.12.5.tar.gz
>       gnu-config-20120814.tar.bz2
>       libtool-2.4.2.tar.gz
>       m4-1.4.16.tar.gz
>       pkg-config-0.25.tar.gz
>       pseudo-1.4.1.tar.bz2
>       quilt-0.60.tar.gz
>       sqlite-autoconf-3071401.tar.gz
>
>       while a "fetchall", of course, should fetch everything needed for t=
he
>       build of my selected recipe/image.
>
>       =C2=A0 so what word/phrase can i use to describe what is downloaded=
 by a
>       simple "fetch"? =C2=A0for the sake of docs/tutorial, of course.
>
>
>
> Fetch runs just against the target you request it run against,
> whereas fetchall runs against that and all of its dependencies. The
> reason additional sources end up in downloads when using fetch is
> due to the up front build of pseudo-native which is needed to do
> subsequent builds.

  ok, that works for me, thanks.

rday

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323329-731116401-1354284176=:2185--
