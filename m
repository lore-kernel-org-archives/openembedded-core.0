Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UIK3V-0003nv-2l for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 15:31:58 +0100
Received: from cpc14-cmbg17-2-0-cust423.5-4.cable.virginmedia.com
	([86.14.229.168] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UIJnE-00041o-34; Wed, 20 Mar 2013 15:15:04 +0100
Message-ID: <1363788804.25692.2.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Wed, 20 Mar 2013 14:13:24 +0000
In-Reply-To: <5149C2FF.4070309@linaro.org>
References: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1586733.G7AaCq5rbs@helios> <51499277.8000400@linaro.org>
	<5149B097.40106@windriver.com> <5149C2FF.4070309@linaro.org>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] Switching from glibc RPC to TI RPC
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
X-List-Received-Date: Wed, 20 Mar 2013 14:32:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-03-20 at 15:09 +0100, Marcin Juszkiewicz wrote:
> W dniu 20.03.2013 13:50, Mark Hatle pisze:
> > On 3/20/13 5:41 AM, Marcin Juszkiewicz wrote:
> 
> >> Good point. YP-tools are not buildable with my changeset due to lack of
> >> YP support in libtirpc.
> 
> > There is definitely a class of user (networking devices) where nis/yp
> > are still being used.  I would love to see NIS support be a distro
> > feature or similar configure time element.
> 
> Good idea.

It's not totally obvious to me that having NIS itself be a
DISTRO_FEATURE would buy much.  Are there any packages whose
configuration actually changes as a result?

Having tirpc vs legacy rpc selectable through DISTRO_FEATURES sounds
like a fine plan though.

p.




