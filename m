Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDBLF-0003Vw-B4 for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 11:08:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2T8xNQi028899
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 09:59:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28549-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 09:59:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2T8xCIM028893
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 09:59:14 +0100
Message-ID: <1333011551.14983.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2012 09:59:11 +0100
In-Reply-To: <20120329075812.GI4004@jama.jama.net>
References: <27A3051A-BC1D-4937-B936-42760021F584@dominion.thruhere.net>
	<1322240018.24330.37.camel@ted>
	<A23FAF45-E1BD-41B6-B8EA-92BC2C74E429@dominion.thruhere.net>
	<2E5909A2-C9B9-4228-9A16-0FD8F038A8C3@dominion.thruhere.net>
	<20111129114052.GE7441@jama.jama.net>
	<20120329075812.GI4004@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: opkg-make-index cache failing
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
X-List-Received-Date: Thu, 29 Mar 2012 09:08:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-29 at 09:58 +0200, Martin Jansa wrote:
> Today I did some more tests and started using simple bash script to
> reindex all Packages files just once (instead of rebuilding common arch
> many times with bitbake package-index).
> 
> OPKG_MAKE_INDEX=~/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/opkg-make-index
> DEPLOY_IPK=~/shr-core/tmp-eglibc/deploy/ipk/
> for PACKAGE_FILE in `find ${DEPLOY_IPK} -name Packages`; do
>   PACKAGE_DIR=`dirname ${PACKAGE_FILE}`
>   touch ${PACKAGE_FILE}
>   echo "Regenerating ${PACKAGE_FILE}"
>   time flock ${PACKAGE_FILE}.flock -c "${OPKG_MAKE_INDEX} -r ${PACKAGE_FILE} -p ${PACKAGE_FILE} -l ${PACKAGE_FILE}.filelist -m ${PACKAGE_DIR}/"
> done
> 
> And on my machine it takes really long to finish
> real    26m40.108s
> user    23m6.673s
> sys     0m14.464s
> 
> So I'll look into opkg-make-index changes again and to make it easier I would like 
> to move all oe-core local patches:
> http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/opkg-utils/opkg-utils
> to yocto git repo:
> http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/
> should I send pull-request for opkg-utils repo here or somewhere else? e.g. yocto ML?

I've been advising people to do that kind of thing on the Yocto mailing
list since there is already lots of patch traffic on OE-Core...

Cheers,

Richard



