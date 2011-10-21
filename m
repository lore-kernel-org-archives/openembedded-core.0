Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1RHAnh-00040o-Jn
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 10:50:01 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RHAi2-0003sP-So>; Fri, 21 Oct 2011 10:44:10 +0200
Received: from hydra.imp.fu-berlin.de ([160.45.117.149]
	helo=mail.imp.fu-berlin.de) by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RHAi2-0000Mu-Qo>; Fri, 21 Oct 2011 10:44:10 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by mail.imp.fu-berlin.de with esmtps (Exim 4.72) id 1RHBU7-0000Ge-9x
	(envelope-from <heinold@mi.fu-berlin.de>)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 11:34:03 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1RHAhe-0006ZP-F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 10:43:46 +0200
Date: Fri, 21 Oct 2011 10:43:46 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111021084346.GA20103@mi.fu-berlin.de>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
	<22ed6acc0a44d9bc0d6f7a2e800c039d77d75477.1319184832.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <22ed6acc0a44d9bc0d6f7a2e800c039d77d75477.1319184832.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Remote-IP: 160.45.42.84
X-Spam_Score: -3.4
X-exim-Spam_Score_Int: -33
X-exim-Spam_Bar: ---
X-Spam_Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.5 RP_MATCHES_RCVD Envelope sender domain matches handover relay
	domain * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Originating-IP: 160.45.117.149
Subject: Re: [PATCH 2/8] libatomics-ops: force ARM mode
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
X-List-Received-Date: Fri, 21 Oct 2011 08:50:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

hm we should think of reworking this recipe now. Because since gcc 4.5
pulseaudio for arm can use the gcc internal atomicstuff and in oe-core 
and meta-oe we have 4.5 or 4.6 only. The lib is
only needed for mips and it is still the old release, on cvs
is a much better version, which supports thumb too, if
remember correctly.

Bye Henning



