Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TjYzw-00062i-7r
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 18:24:44 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:33602 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TjYlj-0000NJ-K1; Fri, 14 Dec 2012 12:09:51 -0500
Date: Fri, 14 Dec 2012 12:09:46 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
In-Reply-To: <CAOHjBZscjW1kKU1TUNmPRL=OwdF0BA89mtuEaD_DVSU1yTx5Rw@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1212141209200.9553@oneiric>
References: <CAOHjBZvW_wovoRDXuk=sbc-sgf64zLjsZYwDv+1UnXgkrLE_Nw@mail.gmail.com>
	<1355503781.9104.27.camel@dromedary>
	<alpine.DEB.2.02.1212141152280.9381@oneiric>
	<CAOHjBZscjW1kKU1TUNmPRL=OwdF0BA89mtuEaD_DVSU1yTx5Rw@mail.gmail.com>
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
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gcc-4.7.inc wrong FILESPATH setting?
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
X-List-Received-Date: Fri, 14 Dec 2012 17:24:46 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1398166997-1355504990=:9553"

--8323329-1398166997-1355504990=:9553
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 14 Dec 2012, Giuseppe Condorelli wrote:

>
>
> 2012/12/14 Robert P. J. Day <rpjday@crashcourse.ca>
>       On Fri, 14 Dec 2012, Marko Katić wrote:
>
>       > On Fri, 2012-12-14 at 17:41 +0100, Giuseppe Condorelli wrote:
>       > > Hi All,
>       > >
>       > > I've seen that, in the given .inc file, the FILESPATH is statically
>       > > set to
>       > >
>       > > FILESPATH = "${FILE_DIRNAME}/gcc-4.7"
>       > >
>       > > This seems to avoid any FILESEXTRAPATHS_prepend usage on append file.
>       > > I need to add further patches for gcc-4.7.2 in my own meta layer but
>       > > if I set the FILESEXTRAPATHS_prepend as usual
>       > > nothing happens, sources are taken only from the directory set by
>       > > FILESPATH.
>       > > Also I saw this setting was different in the past
>       > >
>       > > FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
>
>   i'm fairly sure i posted on this recently.  base.bbclass
> *explicitly* sets FILESPATH to a set of variations thusly:
>
> FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
>
> which works fine with the recipes in the underlying oe-core layer.
>
>   however, when you use FILESEXTRAPATHS_prepend, you get additional
> directories based on *only* the name you specify.  so if you do:
>
> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>
> are you thinking you should also get all variations of "gcc-4.7"?
> because that's not what's going to happen.
>
> I'm sorry, I've not catched your last sentence. I set (as in the
> past) the FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> also updating the SRC_URI inside the .bbappend file to use the
> sources available in the gcc directory available in my own layer.  

  did you also set THISDIR just above that?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323329-1398166997-1355504990=:9553--
