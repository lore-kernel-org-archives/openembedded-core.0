Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1UYgBf-0007g9-TN
	for openembedded-core@lists.openembedded.org;
	Sat, 04 May 2013 19:24:02 +0200
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id B59A920737;
	Sat,  4 May 2013 13:06:00 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute4.internal (MEProxy); Sat, 04 May 2013 13:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=O6OK/IFUZODs+UG1Ht9C2b
	JlR70=; b=UoeOAzYKgR1s8z9JGFJXnn+Cf6Qp+ejxdhvD9kEdN2CgFMzA5SUOrq
	tHtZ/CmpblXhXTy03A7v/uzec/uuawjM41N2TSEy/Eh5RAXSB+DZe2iUBn0tKn/Z
	kPKhJdUuC/72fxlaQftkkeXGLgDffgtg2sFT0fRN8mv+z/0Bt7mpw=
X-Sasl-enc: xAq7JYc6BX27Jj30xNh1wUEA1FwJsF8/PP7HXMEucCgb 1367687160
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 65E332000E4;
	Sat,  4 May 2013 13:06:00 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZdtT=qg2k3eBJ_DQHQzMvqS0vwFSmkgCxxG7KOiPWfzQ@mail.gmail.com>
References: <CAJTo0LZdtT=qg2k3eBJ_DQHQzMvqS0vwFSmkgCxxG7KOiPWfzQ@mail.gmail.com>
Date: Sat, 04 May 2013 13:05:59 -0400
Message-ID: <1367687159.6959.153.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-30.el6) 
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: libexecdir and multilib
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
X-List-Received-Date: Sat, 04 May 2013 17:24:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-02 at 17:10 +0100, Burton, Ross wrote:

> Both of these examples are in mainstream packages where the package
> maintainers in the distro are also upstream developers, and yet these
> kludges exist (note that our gdk-pixbuf is currently broken in this
> respect).

If someone figures out a sensible plan that will work on both
OpenSUSE/Fedora style multilib and Debian multiarch, then
I'd love to get those patches upstreamed.

The downstream multilib patches were one of several reasons my last
attempt at doing continuous integration (automatically mash new versions
from git repos) into the Fedora packages failed.





