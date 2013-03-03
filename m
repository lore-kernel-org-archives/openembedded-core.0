Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UCCfF-0008FG-GA for openembedded-core@lists.openembedded.org;
	Sun, 03 Mar 2013 18:25:36 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r23HGE5d006419; Sun, 3 Mar 2013 17:16:28 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BuEfwSXYNyAC; Sun,  3 Mar 2013 17:16:28 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r23HGNNq006448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 3 Mar 2013 17:16:26 GMT
Message-ID: <1362330514.4325.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 03 Mar 2013 17:08:34 +0000
In-Reply-To: <CAMKF1sp7G1S-B5N-HR-2P_PEhkmeJnjDtskRe6EcubxiHah=nQ@mail.gmail.com>
References: <ly628a8z00.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAMKF1sp7G1S-B5N-HR-2P_PEhkmeJnjDtskRe6EcubxiHah=nQ@mail.gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: libgcc_s.so not stripped
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
X-List-Received-Date: Sun, 03 Mar 2013 17:25:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-22 at 13:25 -0700, Khem Raj wrote:
> On Wed, Aug 22, 2012 at 1:15 PM, Enrico Scholz
> <enrico.scholz@sigma-chemnitz.de> wrote:
> >
> > I just noticed that libgcc_s.so.1 is not stripped in the .ipk.  Is
> > there any reason to keep the debug symbols?  Uncompressed, this makes a
> > difference of more than 1 MB.
> 
> I dont see a reason to have debug info there. Symbol table probably
> should be left in.

I noticed this when clearing out old emails and I've just posted a patch
for it.

Worryingly, there are other non-executables in the lib directories which
aren't getting stripped. I've opened a bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3973

Cheers,

Richard



