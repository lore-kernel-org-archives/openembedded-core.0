Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TSsDz-0003O2-Ud for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 17:30:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TGGSf0006004;
	Mon, 29 Oct 2012 16:16:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05741-04; Mon, 29 Oct 2012 16:16:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TGGMMC005998
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 29 Oct 2012 16:16:23 GMT
Message-ID: <1351527382.2828.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marko Lindqvist <cazfi74@gmail.com>
Date: Mon, 29 Oct 2012 16:16:22 +0000
In-Reply-To: <CAF6bG8f111en-1a6ppqRVCjgg9Gn7Ywac4tJe+f9KoL4VCdu0Q@mail.gmail.com>
References: <CAF6bG8f111en-1a6ppqRVCjgg9Gn7Ywac4tJe+f9KoL4VCdu0Q@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: shadow-native build failure
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
X-List-Received-Date: Mon, 29 Oct 2012 16:30:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-29 at 18:14 +0200, Marko Lindqvist wrote:
> shadow-native do_configure fails with:
> cp: cannot stat
> '.../tmp-eglibc/sysroots/x86_64-linux/usr/share/gettext/config.rpath':
> No such file or directory

Is this master and did you upgrade recently? 

Does "bitbake gettext-minimal-native -c clean" help?

Cheers,

Richard



