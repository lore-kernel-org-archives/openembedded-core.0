Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QSItH-0000dF-2R
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 03:09:31 +0200
Received: by pvc30 with SMTP id 30so689066pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 18:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:organization:to:subject:date:user-agent
	:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=4FomxsByTcRRMhMRyIPxpA7jdBsvUmoodtw6ZC0auto=;
	b=cA+AkL5HgNKRRJ9N/wKx1GhuHh7yHEWi+0DZOQcycLuu8moMD95iKkIN8HuRz/Tsm9
	tUQ94HPZQsa8q6+9WrExaXyXykBglcmFBuVcZQ+ygUIoo3B+WoRvcs/TXUUdcXx2aAu0
	oAZHwJjmB77ewHRiI6PlyITkh9ktS8Y9effLk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:organization:to:subject:date:user-agent:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=j4dVT5ki7P6qBUmaHoCkkAQcSmFZ8+bIiEhC4Km9TtxbgjWaTK/BILgqeX97NPDllG
	dlLAzdvRNOr80fiDRmT8as66g4z0ui8+5C2ojFGjGuf4AXqfop5ezMkMDI2KK23oIWtw
	1gNV9iJDMeiuN7wLrVLcHu+aAgIBN5XZ7b13Y=
Received: by 10.68.29.130 with SMTP id k2mr520833pbh.514.1307063177746;
	Thu, 02 Jun 2011 18:06:17 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p5sm986534pbk.84.2011.06.02.18.06.14
	(version=SSLv3 cipher=OTHER); Thu, 02 Jun 2011 18:06:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Organization: Sakrah Inc.
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jun 2011 18:06:13 -0700
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic; KDE/4.6.3; i686; ; )
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<BANLkTi=q-bMwYtjTAqAXeaB4QQ_n85y8Rw@mail.gmail.com>
	<1307032661.27470.581.camel@rex>
In-Reply-To: <1307032661.27470.581.camel@rex>
MIME-Version: 1.0
Message-Id: <201106021806.13486.raj.khem@gmail.com>
Subject: Re: [PATCH 1/3] busybox: enable mdev by default
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
X-List-Received-Date: Fri, 03 Jun 2011 01:09:31 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday, June 02, 2011 09:37:41 AM Richard Purdie wrote:
> On Wed, 2011-06-01 at 20:40 +0000, Otavio Salvador wrote:
> > On Wed, Jun 1, 2011 at 20:37, Phil Blundell <pb@pbcl.net> wrote:
> > > On Wed, 2011-06-01 at 20:09 +0000, Otavio Salvador wrote:
> > >> -# CONFIG_MDEV is not set
> > >> +CONFIG_MDEV=y
> > > 
> > > Per previous discussion, I am still uneasy about this change.  I think
> > > we really need some sort of coherent policy for what exactly the
> > > default busybox configuration in oe-core is meant to be doing, and
> > > then (if necessary) a set of patches to make it match the policy. 
> > > Just flipping random features on and off does not seem like a good way
> > > to proceed.
> > 
> > OE-core has support to mdev as device handling mechanism as such this
> > ought to be enabled by default IMO.
> > 
> > Personally it doesn't matter since I have already overriden it in my
> > internal layer.
> 
> I'm afraid I'm with Phil on this. I don't like the idea of enabling
> something we don't actually use. This really needs to become some kind
> of configure option which would at the same time disable/replace udev so
> the patch in its currently form isn't acceptable.
> 

mdev or udev are image features so probably should be controlled by 
IMAGE_FEATURES or some such
> Cheers,
> 
> Richard
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


