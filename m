Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QJngr-0006GZ-Ut for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:13:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4AEAalA006672;
	Tue, 10 May 2011 15:10:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06348-06; Tue, 10 May 2011 15:10:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4AEAS8t006666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 10 May 2011 15:10:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB69334F4BD8A@shsmsx502.ccr.corp.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
	<eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>
	<1303102414.5518.30.camel@rex>
	<1865303E0DED764181A9D882DEF65FB6900D7D5708@shsmsx502.ccr.corp.intel.com>
	<1303109647.5518.54.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD75@shsmsx502.ccr.corp.intel.com>
	<1304634851.30391.54.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD82@shsmsx502.ccr.corp.intel.com>
	<1304681508.30391.84.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD8A@shsmsx502.ccr.corp.intel.com>
Date: Tue, 10 May 2011 15:10:26 +0100
Message-ID: <1305036626.30391.276.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 37/58] gnu-config-native: add dependency on perl-native
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
X-List-Received-Date: Tue, 10 May 2011 14:13:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 22:02 +0800, Cui, Dexuan wrote:
> > or we hardcode to /usr/bin/perl. Since the perl-native binary won't be
> > in the path for any of these, autodetecting and letting it hardcode is
> > probably fine. It has the advantage that if there are any binary
> > modules ever involved, they'll match the version of perl they were
> > built for regardless of whether perl-native is a dependency or not.
> > If someone adds a perl-native dependency to autoconf-native, it will
> > also still select the "correct" perl.
> > 
> > Whilst doing this we need to keep bug #968 in mind and ensure that if
> > perl-native is used, all of perl-native is in the sysroot. That bug is
> > where the perl binary was installed, the library was not and an error
> > occurred. If it is in its own directory which is only added to the
> > PATH for users with the correct dependency, we avoid this.
> > 
> > As for bug #941, the bottom line is that however autoconf-native
> > selects its perl version, the strings encoded in gnu-config should
> > really match those in the other autoconf-native scripts.
> I saw a commit that was once suspended was pushed into poky
> master yesterday:
> http://git.pokylinux.org/cgit/cgit.cgi/poky/commit/?id=605141a93443df042634b2219a8628a9004be023
> Actually it does fix(or at least workaround) bug #941 and bug #968.
> 
> Looks there are much work to do if we install perl-native to its own sysroot.
> At present we can use the above commit as a workaround.

Its merged as a workaround but I still think we need to clean this up
properly and we need to continue working on it.

Cheers,

Richard



