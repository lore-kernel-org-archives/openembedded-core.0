Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DCB8D6E7D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 00:36:19 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0S0a5tv004610; Tue, 28 Jan 2014 00:36:05 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jEWHGNY7xt4S; Tue, 28 Jan 2014 00:36:05 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0S0Zsfp004589
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 28 Jan 2014 00:35:56 GMT
Message-ID: <1390869349.21652.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Tue, 28 Jan 2014 00:35:49 +0000
In-Reply-To: <2100717.4T6aPSkm6s@peggleto-mobl5.ger.corp.intel.com>
References: <1387298031-15180-1-git-send-email-andrei@gherzan.ro>
	<CA+0k_w968Jt7sQktJnH9PLrxnLqs6pF37S6tba8PYn=QksoqNA@mail.gmail.com>
	<CAK18fxFEFSd_zBwCLzgu_0p5U4E0kT2ojHF4j6gagqSnfEpD8A@mail.gmail.com>
	<2100717.4T6aPSkm6s@peggleto-mobl5.ger.corp.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Alexandru Niculita <alexnick87@gmail.com>,
	openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libsdl: Add support for libsdl-native
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
X-List-Received-Date: Tue, 28 Jan 2014 00:36:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-01-27 at 22:50 +0000, Paul Eggleton wrote:
> On Monday 27 January 2014 22:29:09 Andrei Gherzan wrote:
> > On Jan 27, 2014 12:20 PM, "Alexandru Niculita" <alexnick87@gmail.com> wrote:
> > > Hi,
> > > 
> > > I could not find a way to avoid using TexturePacker.
> > > TexturePacker is used by XMBC to compile all images used
> > >  in a skin into a single file.
> > > 
> > > I took the info from here:
> > http://wiki.xbmc.org/index.php?title=TexturePacker
> 
> Without having looked at the source code, they don't give much in the way of 
> detail as to what it actually does. I wonder if it could be replicated with a 
> python script using PIL or similar.
> 
> > Would be great to have this soon so we can have xbmc support.
> 
> Well, if we truly have to have libsdl-native then we have to find a way to 
> mitigate the QEMU problems that building that will trigger, which probably 
> means preventing it from finding that in the sysroot. I'm not sure whether this 
> will be an acceptable solution from an OE-Core perspective but I can't think 
> of any other (other than writing an equivalent to TexturePacker that doesn't 
> use SDL or anything that requires SDL).

We'll probably have to put libsdl-native into a special directory and
teach xmbc's tool to find it in the special path.

Its ugly but we can't break qemu and a world of pain lies in not using
the host system's libsdl...

Cheers,

Richard


