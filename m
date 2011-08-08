Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqZHg-0001aj-Ml for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 01:31:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78NQWPk007490
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 00:26:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07364-03 for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2011 00:26:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78NQQLI007484
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 00:26:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF183257@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF183257@MBX20.4emm.local>
Date: Tue, 09 Aug 2011 00:25:55 +0100
Message-ID: <1312845955.14274.284.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: gcc version mismatch in sdk generation
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
X-List-Received-Date: Mon, 08 Aug 2011 23:31:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-08 at 05:02 +0000, James Limbouris wrote:
> Hi,
> 
> In oe-core, with Angstrom 2010.x, generating an sdk with:
> 
> bitbake meta-toolchain-qte
> 
> is giving me a toolchain with gcc-4.6.1 binaries in the i686 sysroot, but
> gcc-4.5.4 runtime libraries in the arm (target) sysroot. The sdk can't
> link until a symlink is installed to trick it into using the 4.5.4 libraries.
> 
> I've checked the preferred versions, but they seem to be set consistently
> in the disto's conf file, at least as far as I can see.
> 
> 'bitbake -s | grep gcc' gives:
> gcc                                     :4.5-r39.1+svnr176640                          
> gcc-cross                               :4.5-r39.2+svnr176640                          
> gcc-cross-canadian-arm                  :4.5-r39.0+svnr176640                          
> gcc-cross-initial                       :4.5-r39.0+svnr176640                          
> gcc-cross-intermediate                  :4.5-r39.0+svnr176640                          
> gcc-crosssdk                            :4.5-r39.0+svnr176640                          
> gcc-crosssdk-initial                    :4.5-r39.0+svnr176640                          
> gcc-crosssdk-intermediate               :4.5-r39.0+svnr176640                          
> gcc-runtime                             :4.5-r39.1+svnr176640                          
> gcc-runtime-nativesdk                    :4.6.1+svnr175454-r5     :4.5-r39.1+svnr176640
> gccmakedep                                         1:1.0.2-r3                          
> libgcc                                  :4.5-r39.1+svnr176640                          
> libgcc-nativesdk                         :4.6.1+svnr175454-r3     :4.5-r39.1+svnr176640

The nativesdk and crosssdk versions need to match at the very least.

Cheers,

Richard







