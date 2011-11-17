Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RQyQB-0006ot-Hf
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 10:38:16 +0100
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Thu, 17 Nov 2011 17:31:35 +0800
Received: from [192.168.0.98] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Thu, 17 Nov 2011
	17:31:34 +0800
Message-ID: <1321522233.1264.46.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 17 Nov 2011 17:30:33 +0800
In-Reply-To: <F8EDE28B-DC2B-4C13-BE90-F45DFABC6E86@dominion.thruhere.net>
References: <1321496999.1264.24.camel@localhost.localdomain>
	<F8EDE28B-DC2B-4C13-BE90-F45DFABC6E86@dominion.thruhere.net>
Organization: Insigma
X-Mailer: Evolution 3.2.1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: how to exclude files when packaging?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 17 Nov 2011 09:38:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Oh, my fault.

I defined another var: opensaflibmiscdir
osaflibsvcdir = "${libdir}/${PN}"
FILES_${PN} = "${osaflibsvcdir}/lib*.so.* ${osaflibsvcdir}/clc-cli/* \
                  ${osaflibsvcdir}/immload ${osaflibsvcdir}/nid_tipc \
                  ${osaflibsvcdir}/osaf* ${osaflibsvcdir}/opensaf* \
                  ${osaflibsvcdir}/smf*"
FILES_${PN}-dev = "${osaflibsvcdir}/lib*.so ${osaflibsvcdir}/*.la"
FILES_${PN}-staticdev = "${osaflibsvcdir}/*.a"

On Thu, 2011-11-17 at 17:10 +0800, Koen Kooi wrote:
> Op 17 nov. 2011, om 03:29 heeft Ni Qingliang het volgende geschreven:
> 
> > Hello, All:
> >       I'm working on opensaf, wrote a bb file for it,
> > and found that the FILES_${PN} has included /usr/lib/${PN}/*.
> > but there are some .a and .so(symlink) in /usr/lib/${PN}, which will
> > result QA issue.
> >       how to exclude some files (e.g. *.a, *.so) in FILES_${PN}?
> >
> >       there are some elf in /usr/lib/${PN} whose prefix is not 'lib', so if
> > no 'exclude' feature, I must redefine FILES_${PN} like this:
> >       FILES_${PN} = "/usr/lib/${PN}/*.so.* \
> >                       /usr/lib/${PN}/saf* \
> >                       /usr/lib/${PN}/open* \
> >                       /usr/lib/${PN}/immload \
> >                       /usr/lib/${PN}/nid_tipc \
> >                       /usr/lib/${PN}/smf* \
> >                       /usr/lib/${PN}/clc-cli/*"
> 
> 
> please replace all occurrences of '/usr/lib' with '${libdir}'
> 
> 
> 

-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



