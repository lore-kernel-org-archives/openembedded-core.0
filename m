Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLWCH-0002ao-Sh for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 09:29:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA28NFZH012629
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2011 08:23:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11721-08 for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 08:23:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA28N5aU012623
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2011 08:23:06 GMT
Message-ID: <1320222185.20107.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 02 Nov 2011 08:23:05 +0000
In-Reply-To: <1320219727-9233-1-git-send-email-Martin.Jansa@gmail.com>
References: <4EB08D70.4050602@intel.com>
	<1320219727-9233-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] libxslt: use Copyright in LIC_FILES_CHKSUM instead of COPYING
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
X-List-Received-Date: Wed, 02 Nov 2011 08:29:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-02 at 08:42 +0100, Martin Jansa wrote:
> * COPYING is replaced by symlink to Copyright during do_configure
>   (see configure.in), then we end with link to nonexistent file like this:
> 
> OE om-gta02@shr ~/shr-core $ ll tmp/deploy/licenses/libxslt/
> total 40
> drwxr-xr-x   2 bitbake bitbake  4096 Nov  2 00:27 ./
> drwxr-xr-x 818 bitbake bitbake 32768 Nov  2 00:27 ../
> lrwxrwxrwx   1 bitbake bitbake     9 Nov  2 00:27 COPYING ->  Copyright
> lrwxrwxrwx   1 bitbake bitbake    52 Nov  2 00:27 generic_MIT ->  /OE/shr-core/tmp/deploy/licenses/common-licenses/MIT
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Merged to master, thanks.

Richard



