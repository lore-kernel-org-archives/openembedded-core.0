Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 07DC36C72C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 12:46:42 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VleVR-0001sV-FZ; Wed, 27 Nov 2013 13:46:40 +0100
Message-ID: <1385556372.15760.144.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Yue Tao <Yue.Tao@windriver.com>
Date: Wed, 27 Nov 2013 12:46:12 +0000
In-Reply-To: <1385538944-8585-2-git-send-email-Yue.Tao@windriver.com>
References: <1385538944-8585-1-git-send-email-Yue.Tao@windriver.com>
	<1385538944-8585-2-git-send-email-Yue.Tao@windriver.com>
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
	Content preview:  On Wed, 2013-11-27 at 15:55 +0800,
	Yue Tao wrote: > + else
	> + if [ -f ${D}${sysconfdir}/ld.so.conf ];
	then > + echo 'include ld.so.conf.d/*.conf'
	> ${D}${sysconfdir}/ld.so.conf > + mkdir -p
	${D}${sysconfdir}/ld.so.conf.d > + fi [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] eglibc: add support for /etc/ld.so.conf.d/*.conf
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
X-List-Received-Date: Wed, 27 Nov 2013 12:46:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-11-27 at 15:55 +0800, Yue Tao wrote:
> +	else
> +		if [ -f ${D}${sysconfdir}/ld.so.conf ]; then
> +		echo 'include ld.so.conf.d/*.conf' > ${D}${sysconfdir}/ld.so.conf
> +			mkdir -p ${D}${sysconfdir}/ld.so.conf.d
> +		fi

This will cause the existing contents of ld.so.conf to be obliterated if
the file wasn't empty to begin with.  (I know that it is empty in
oe-core, but a distro layer might be overlaying this file with its own.)

Also, it seems as though the choice of whether to use an "ld.so.conf.d"
arrangement or not is one that the distro should be making.  Is there a
strong reason why this needs to be done in oe-core?

p.



