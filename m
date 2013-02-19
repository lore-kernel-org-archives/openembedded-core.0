Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U7utX-00089F-Si for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 22:38:36 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1JLSp7x013312; Tue, 19 Feb 2013 21:28:51 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UmSQpnlHIvXi; Tue, 19 Feb 2013 21:28:51 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1JLShCw013307
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 19 Feb 2013 21:28:48 GMT
Message-ID: <1361308921.5927.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ml@communistcode.co.uk
Date: Tue, 19 Feb 2013 13:22:01 -0800
In-Reply-To: <51221586.40901@communistcode.co.uk>
References: <512214FE.3030603@communistcode.co.uk>
	<51221586.40901@communistcode.co.uk>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Relocatable SDK Perl issues
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
X-List-Received-Date: Tue, 19 Feb 2013 21:38:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-02-18 at 11:50 +0000, Jack Mitchell wrote:
> On 18/02/13 11:48, Jack Mitchell wrote:
> > The relocatable SDK seems to have had it's perl issues slipped back in 
> > somewhere.
> >
> > Running autoreconf -i on my autotools application leads to the following:
> >
> > Can't locate strict.pm in @INC (@INC contains: 
> > /mnt/SSD/r0005sdk/130213r0/sysroots/x86_64-oecore-linux/usr/share/autoconf 
> > /opt/dblinux/1.0-20130213/sysroots/x86_64-oecore-linux/usr/lib/perl/site_perl/5.14.3/ 
> > /opt/dblinux/1.0-20130213/sysroots/x86_64-oecore-linux/usr/lib/perl/site_perl/5.14.3 
> > /opt/dblinux/1.0-20130213/sysroots/x86_64-oecore-linux/usr/lib/perl/vendor_perl/5.14.3/ 
> > /opt/dblinux/1.0-20130213/sysroots/x86_64-oecore-linux/usr/lib/perl/vendor_perl/5.14.3 
> > /opt/dblinux/1.0-20130213/sysroots/x86_64-oecore-linux/usr/lib/perl/5.14.3/ 
> > /opt/dblinux/1.0-20130213/sysroots/x86_64-oecore-linux/usr/lib/perl/5.14.3 
> > /opt/dblinux/1.0-20130213/sysroots/x86_64-oecore-linux/usr/lib/perl/5.14.3 
> > .) at 
> > /mnt/SSD/r0005sdk/130213r0/sysroots/x86_64-oecore-linux/usr/share/autoconf/Autom4te/Channels.pm 
> > line 70.
> > BEGIN failed--compilation aborted at 
> > /mnt/SSD/r0005sdk/130213r0/sysroots/x86_64-oecore-linux/usr/share/autoconf/Autom4te/Channels.pm 
> > line 70.
> > Compilation failed in require at 
> > /mnt/SSD/r0005sdk/130213r0/sysroots/x86_64-oecore-linux/usr/share/autoconf/Autom4te/ChannelDefs.pm 
> > line 19.
> > BEGIN failed--compilation aborted at 
> > /mnt/SSD/r0005sdk/130213r0/sysroots/x86_64-oecore-linux/usr/share/autoconf/Autom4te/ChannelDefs.pm 
> > line 19.
> > Compilation failed in require at 
> > /mnt/SSD/r0005sdk/130213r0/sysroots/x86_64-oecore-linux/usr/bin/gnu-configize 
> > line 40.
> > BEGIN failed--compilation aborted at 
> > /mnt/SSD/r0005sdk/130213r0/sysroots/x86_64-oecore-linux/usr/bin/gnu-configize 
> > line 40.
> > autoreconf: gnu-configize failed with exit status: 2
> >
> > Any ideas? This was broken a while ago (~6 months), and then was fixed 
> > (~2 months) and it seems to have regressed again somewhere along the way.
> >
> 
> I see a bug that may be along the same lines here: 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3338
> 
> Could anyone confirm it's the same issue, if so; I'll sit quiet :)

Its probably related, hard to tell for sure. It would be good if we
could get this resolved.

Cheers,

Richard





