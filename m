Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 94C8660172
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 13:16:55 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>) id 1W33rU-0002Iz-0o
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jan 2014 14:16:56 +0100
Message-ID: <1389705414.19023.12.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jan 2014 13:16:54 +0000
In-Reply-To: <1389703869.19023.8.camel@phil-desktop.brightsign>
References: <1389703869.19023.8.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.8.5-2+b1 
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
	Content preview:  On Tue, 2014-01-14 at 12:51 +0000,
	Phil Blundell wrote: >
	and this causes ${D}${PTEST_PATH} to be created irrespective of the >
	setting
	of PTEST_ENABLED, which is not especially desirable. Can this > be moved
	to some place where it only takes effect for ptest-enabled > builds?
	[...] Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: Re: Extraneous ${libdir}/${PN}/ptest in ptest-using packages
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
X-List-Received-Date: Tue, 14 Jan 2014 13:16:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-14 at 12:51 +0000, Phil Blundell wrote:
> and this causes ${D}${PTEST_PATH} to be created irrespective of the
> setting of PTEST_ENABLED, which is not especially desirable.  Can this
> be moved to some place where it only takes effect for ptest-enabled
> builds?

Oh, I see this was already fixed in
def21f3f0bedae51651f1f0fc58b62b8aaaf37ae which was just merged.  Very
good!

p.



