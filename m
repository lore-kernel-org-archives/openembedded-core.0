Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 78C05719E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 13:50:21 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:f899:4db9:ee7f:f338] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1bw8J2-0007ms-DH; Mon, 17 Oct 2016 15:50:21 +0200
Message-ID: <1476712219.31169.2.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Mon, 17 Oct 2016 14:50:19 +0100
In-Reply-To: <alpine.LFD.2.20.1610170751190.7117@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610170751190.7117@ca624034.mitel.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Subject: Re: SERIAL_CONSOLE versus SERIAL_CONSOLES?
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
X-List-Received-Date: Mon, 17 Oct 2016 13:50:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-10-17 at 07:57 -0400, Robert P. J. Day wrote:
> 
  so is it a fair statement that, pedantically, i might as well just
> define everything in terms of SERIAL_CONSOLES and think that way?
> 

Yes.  SERIAL_CONSOLE predates SERIAL_CONSOLES and remains supported in
the configuration for backwards compatibility.  New configurations and
recipes should probably use SERIAL_CONSOLES and ignore SERIAL_CONSOLE
entirely.

p.


