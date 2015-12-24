Return-Path: <tanuk@iki.fi>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id 61E136FFC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 05:15:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 03D9A209CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 00:15:52 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute3.internal (MEProxy); Thu, 24 Dec 2015 00:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=ZF+oxxMTPY4a9Rz
	y5fDpMhpQpsQ=; b=j5GbK6w6lsGWhE4/MFoVxypI08fvjRJTeGUAEVpM+yb3Z9l
	j+caGIUwawtz0YP18LoQdcyI08LBHcZ63hJxgAWHuCGFAVNpknMmM7O8prqeHtl3
	sx9Wtb9Y43zRIZfdpk/IrmWfy5rYCyA3chChJrst/fYkB+I5Uhy6QndJ0HVY=
X-Sasl-enc: BQh5SMVQxMNYJZpeUJj/Fwcsg+jCW+4UGbH1ia23zvu2 1450934151
Received: from laptop (91-159-184-69.elisa-laajakaista.fi [91.159.184.69])
	by mail.messagingengine.com (Postfix) with ESMTPA id 314CCC016F2;
	Thu, 24 Dec 2015 00:15:50 -0500 (EST)
Message-ID: <1450934150.14080.23.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: "Maxin B. John" <maxin.john@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Dec 2015 07:15:50 +0200
In-Reply-To: <1450877140-15246-1-git-send-email-maxin.john@intel.com>
References: <1450877140-15246-1-git-send-email-maxin.john@intel.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] packagegroup-core-x11-sato: include pulseaudio-misc
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
X-List-Received-Date: Thu, 24 Dec 2015 05:15:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2015-12-23 at 15:25 +0200, Maxin B. John wrote:
> Add pulseaudio-misc to include "pacmd" in core-image-sato* images.
> This helps in modifying audio setup during runtime.

"pactl" is recommended over "pacmd", and pactl is included in the
pulseaudio-server package, so I disagree with the rationale presented
here. That said, I'm strongly in favour of your change otherwise,
because pulseaudio-misc also includes paplay and friends, which are
very useful for testing audio playback and recording.

-- 
Tanu

