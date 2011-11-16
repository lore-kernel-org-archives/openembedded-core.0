Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1RQbRH-0004yr-Hc
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 10:05:51 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RQbL8-00079M-AH>; Wed, 16 Nov 2011 09:59:30 +0100
Received: from hydra.imp.fu-berlin.de ([160.45.117.149]
	helo=mail.imp.fu-berlin.de) by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RQbL8-0005nG-4I>; Wed, 16 Nov 2011 09:59:30 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by mail.imp.fu-berlin.de with esmtps (Exim 4.72) id 1RQbKh-0006ya-0s
	(envelope-from <heinold@mi.fu-berlin.de>)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 09:59:14 +0100
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1RQbKb-0003Iu-TR
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 09:58:57 +0100
Date: Wed, 16 Nov 2011 09:58:57 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111116085857.GA11275@mi.fu-berlin.de>
References: <cover.1321421127.git.kai.kang@windriver.com>
	<c7dca7b45c59a9fddbd9551cac5426906a1036c2.1321421127.git.kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <c7dca7b45c59a9fddbd9551cac5426906a1036c2.1321421127.git.kai.kang@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Remote-IP: 160.45.42.84
X-Spam_Score: -4.1
X-exim-Spam_Score_Int: -40
X-exim-Spam_Bar: ----
X-Spam_Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.2 RP_MATCHES_RCVD Envelope sender domain matches handover relay
	domain * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Originating-IP: 160.45.117.149
Subject: Re: [PATCH 1/1] mesa: fix cross compile failure
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
X-List-Received-Date: Wed, 16 Nov 2011 09:05:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 16, 2011 at 02:09:03PM +0800, Kang Kai wrote:
> the bin/mklib file in mesa source code uses commands "ar ranlib" on build
> machine, this causes build failed on some platform.
 

Hi,

you added CC and CXX variables for linking too, shouldn't that mentioned in the
commit msg too?

Bye Henning


