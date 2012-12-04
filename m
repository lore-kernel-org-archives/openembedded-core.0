Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TfqI7-0002tB-Qg for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 12:03:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB4AnWUX006032;
	Tue, 4 Dec 2012 10:49:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04999-04; Tue,  4 Dec 2012 10:49:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB4AnQtn006026
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 4 Dec 2012 10:49:26 GMT
Message-ID: <1354618155.25268.46.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Tue, 04 Dec 2012 10:49:15 +0000
In-Reply-To: <50BDC8E4.1010303@linaro.org>
References: <50B744CC.4050906@linaro.org> <50BDC8E4.1010303@linaro.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Patching eglibc for AArch64
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
X-List-Received-Date: Tue, 04 Dec 2012 11:03:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-12-04 at 10:56 +0100, Marcin Juszkiewicz wrote:
> W dniu 29.11.2012 12:19, Marcin Juszkiewicz pisze:
> > I would like to merge AArch64 eglibc support into OE-Core. As patch is
> > nearly 0.5MB I provide it in hrw/aarch64-support branch:
> > 
> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=hrw/aarch64-support&id=aaa36e3ae6ff39682555ac6f21384b44d6f631e3
> > 
> > Commit adds two patches which add AArch64 support for 2.16 version of
> > eglibc. Both were merged upstream but with some alterations to fit into
> > trunk properly. As such trunk patches depend on other patches which can
> > alter state of other architectures which I prefer to avoid.
> > 
> > At Linaro we do daily builds of minimal, lamp, sdk images with this patch.
> 
> ping?

The main thing worrying me about these now is the size of the patches.
I'd prefer not to add them into the main repository since they then
become part of history and increase the repo size. I'd really therefore
like to host the patches somewhere and then point SRC_URI at them.

Is that something linaro can do or should we find somewhere on the
yoctoproject.org infrastructure?

Cheers,

Richard



