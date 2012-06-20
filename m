Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1ShNw6-0002i2-Vy
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 18:39:19 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:42702 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1ShNlj-00026p-DR for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 12:28:35 -0400
Date: Wed, 20 Jun 2012 12:28:34 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAMKF1soec-83D+yqBoy7TGHEN5hD2A=YLKp1rbWY1eKYgnPHfA@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1206201227150.7643@oneiric>
References: <alpine.DEB.2.02.1206200807090.4904@oneiric>
	<1340195059.14857.198.camel@phil-desktop>
	<CAMKF1soec-83D+yqBoy7TGHEN5hD2A=YLKp1rbWY1eKYgnPHfA@mail.gmail.com>
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
Subject: Re: oddities related to "_append" and "_prepend" in oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 20 Jun 2012 16:39:19 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1742136638-1340209715=:7643"

--8323329-1742136638-1340209715=:7643
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 20 Jun 2012, Khem Raj wrote:

> On Wed, Jun 20, 2012 at 5:24 AM, Phil Blundell <philb@gnu.org> wrote:
> >> meta/classes/multilib.bbclass:PACKAGEFUNCS_append =3D "do_package_qa_m=
ultilib"
> >
> > That one is a bit weird. =C2=A0It looks broken but, presumably, it must=
 work
> > otherwise someone would have noticed. =C2=A0I don't know offhand what i=
s
> > making it work.
>
> insane.bbclass:PACKAGEFUNCS +=3D " do_package_qa "
>
> and it gets appended after that so it works, but I think adding a
> space in the append above is a wise thing to do.

  that is *exactly* the kind of thing that makes using oe-core code
examples such a minefield.  nothing personal.  :-)

  perhaps i'll start collecting style guide suggestions.

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

--8323329-1742136638-1340209715=:7643--
