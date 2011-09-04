Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R04Gx-0007XJ-OZ
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Sep 2011 06:25:34 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2011 21:20:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,326,1312182000"; d="scan'208";a="48671974"
Received: from unknown (HELO [10.255.14.13]) ([10.255.14.13])
	by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2011 21:20:30 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <4E62F499.2090709@linux.intel.com>
References: <1315025127.31478.141.camel@elmorro>
	<4E62F499.2090709@linux.intel.com>
Date: Sat, 03 Sep 2011 23:20:12 -0500
Message-ID: <1315110012.31478.153.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] systemtap: upgrade to 1.6
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
X-List-Received-Date: Sun, 04 Sep 2011 04:25:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-09-03 at 20:46 -0700, Saul Wold wrote:
> On 09/02/2011 09:45 PM, Tom Zanussi wrote:
> > Also enable for arm, since systemtap now works on arm and remove the
> > gcc-4.6 compile fix patch since the problems it addresses have been
> > fixed upstream.
> >
[...]
> > +PR = "r5"
> > +PV = "1.6+git${SRCPV}"
> >
> Tom, since you have updated PV to 1.6, you can reset PR to 0.
> 

OK, good point, patches resent, thanks for the input...

Tom

> Sau!
> 
> >   SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git \
> > -	file://fix_for_compilation_with_gcc-4.6.0.patch \
> >             "
> >
> >   EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
> > @@ -23,11 +22,11 @@ EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
> >   SRC_URI[md5sum]    = "cb202866ed704c44a876d041f788bdee"
> >   SRC_URI[sha256sum] = "8ffe35caec0d937bd23fd78a3a8d94b58907cc0de0330b35e38f9f764815c459"
> >
> > -# systemtap doesn't work on arm and doesn't support mips
> > -COMPATIBLE_HOST = '(x86_64.*|i.86.*|powerpc.*)-linux'
> > +# systemtap doesn't support mips
> > +COMPATIBLE_HOST = '(x86_64.*|i.86.*|powerpc.*|arm.*)-linux'
> >
> >   S = "${WORKDIR}/git"
> >
> > -inherit autotools
> > +inherit autotools gettext
> >
> >   FILES_${PN}-dbg += "${libexecdir}/systemtap/.debug"




