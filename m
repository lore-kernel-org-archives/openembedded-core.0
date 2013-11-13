Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5F64C6D803
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 11:38:40 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VgYmP-0008ES-7k; Wed, 13 Nov 2013 12:38:41 +0100
Message-ID: <1384342720.12863.10.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Zhong Hongbo <hongbo.zhong@windriver.com>
Date: Wed, 13 Nov 2013 11:38:40 +0000
In-Reply-To: <1384337335-32231-2-git-send-email-hongbo.zhong@windriver.com>
References: <1384337335-32231-1-git-send-email-hongbo.zhong@windriver.com>
	<1384337335-32231-2-git-send-email-hongbo.zhong@windriver.com>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Wed, 2013-11-13 at 18:08 +0800,
	Zhong Hongbo wrote: > From:
	Zhong Hongbo <hongbo.zhong@windriver.com> > > Signed-off-by: Zhong
	Hongbo <hongbo.zhong@windriver.com> [...] > install -m 0644
	${S}/input/input.conf
	${D}/${sysconfdir}/bluetooth/ > + install -m 0755
	${S}/test/simple-agent ${D}/${bindir}/simple-agent [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] bluez4: Install simple-agent utility for pairing bluetooth devices
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
X-List-Received-Date: Wed, 13 Nov 2013 11:38:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-11-13 at 18:08 +0800, Zhong Hongbo wrote:
> From: Zhong Hongbo <hongbo.zhong@windriver.com>
> 
> Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
[...]
>  	install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
> +	install -m 0755 ${S}/test/simple-agent ${D}/${bindir}/simple-agent

What does simple-agent actually do?  Is it generally enough useful that
it should be installed unconditionally?

p.



