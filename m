Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1ECDA78062
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 23:15:28 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w05NFRqf005882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 5 Jan 2018 23:15:29 GMT
Message-ID: <1515194127.29722.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Slater, Joseph" <joe.slater@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 05 Jan 2018 23:15:27 +0000
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84D87A9352@ALA-MBC.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF84D87A9352@ALA-MBC.corp.ad.wrs.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: SSTATEPOSTINSTFUNCS
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
X-List-Received-Date: Fri, 05 Jan 2018 23:15:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-01-05 at 21:08 +0000, Slater, Joseph wrote:
> Neglecting buildhistory, there is only one recipe, I think, that uses
> SSTATEPOSTINSTFUNCS -- php-native, and that does not work.  Since
> there is nothing to compare to, I do not know if sysconfdir is set
> incorrectly, or if the function is supposed to realize it is under
> sysroot-destdir and adjust the path when modifying perf.conf.
>  
> I’d appreciate any advice.

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=9107d6ca144ac1f6169830dee25dae2dad775333

which says:

"Any recipe/class using SSTATEPOSTINSTFUNCS will need that code
rewriting into a postinst".

Perhaps that commit gives some clues about how to do the conversion
which must have been missed for php-native?

Cheers,

Richard


