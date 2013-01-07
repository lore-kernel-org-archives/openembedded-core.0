Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TsBP4-0003hI-KE for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:02:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07BktZU004128;
	Mon, 7 Jan 2013 11:46:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32506-10; Mon,  7 Jan 2013 11:46:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07Bkl1R004122
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 7 Jan 2013 11:46:48 GMT
Message-ID: <1357559209.25855.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Mon, 07 Jan 2013 11:46:49 +0000
In-Reply-To: <50EA7D0C.5030804@linaro.org>
References: <1354207309-27534-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<50BDC8C3.6060607@linaro.org> <50EA7D0C.5030804@linaro.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libffi: add AArch64 support
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
X-List-Received-Date: Mon, 07 Jan 2013 12:02:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-07 at 08:45 +0100, Marcin Juszkiewicz wrote:
> W dniu 04.12.2012 10:56, Marcin Juszkiewicz pisze:
> > W dniu 29.11.2012 17:41, Marcin Juszkiewicz pisze:
> >> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> >> ---
> >>  .../libffi/aarch64-adding-build-support.patch      |   63 +
> >>  .../libffi/libffi/add-aarch64-support.patch        | 2672 ++++++++++++++++++++
> >>  meta/recipes-gnome/libffi/libffi_3.0.11.bb         |    7 +-
> >>  3 files changed, 2740 insertions(+), 2 deletions(-)
> >>  create mode 100644 meta/recipes-gnome/libffi/libffi/aarch64-adding-build-support.patch
> >>  create mode 100644 meta/recipes-gnome/libffi/libffi/add-aarch64-support.patch
> > 
> > ping?
> 
> ping again?

I thought we'd merged it. It is now merged to master. 

Cheers,

Richard



