Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1TSuH0-0006Cp-P2
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 19:41:19 +0100
Received: from [192.168.0.2] (host81-153-113-203.range81-153.btcentralplus.com
	[81.153.113.203]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 1148499A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 18:27:46 +0000 (GMT)
Message-ID: <508ECAA0.4070609@r-finger.com>
Date: Mon, 29 Oct 2012 18:27:44 +0000
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
	<5085800A.4060600@r-finger.com>
	<CAPj87rOXzZ5EwKYCrBnYtYAQo3cUyXtXyyDSh2nKh05Gy=uY9A@mail.gmail.com>
	<50865733.40007@r-finger.com>
	<CAPj87rOZokkPT_a7kbaqmai2bWwV5xLL8oV2UNOfoxkARHfwCg@mail.gmail.com>
	<50866812.10408@r-finger.com>
	<CAJTo0LbCB2K2wfbMF2sb=qosAYheFNc2zncOFfZqoj7c7eBDvw@mail.gmail.com>
In-Reply-To: <CAJTo0LbCB2K2wfbMF2sb=qosAYheFNc2zncOFfZqoj7c7eBDvw@mail.gmail.com>
Subject: Re: [RFC] OpenGL packaging/staging policy
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
X-List-Received-Date: Mon, 29 Oct 2012 18:41:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/10/12 17:26, Burton, Ross wrote:
> Rule 1.  Unambiguous package naming
> 
> I won't repeat this, everyone agreed this was sane.  I've a patch for
> mesa that I'll submit shortly.
> 
> Rule 2.  No whitelisting for GL driver conflicts
> 
> The target GL shall be staged, and situations which result in multiple
> GLs being installed should handle this case and resolve it.
> 
> For atom-pc this means building Mesa.  For Beagle this means staging
> the Beagle binary drivers.  For Tegra as I've discovered this is
> "interesting" as they don't appear to provide any headers in their
> Tegra For Linux tarball...
> 
> For Cedar Trail and EMGD, the easiest solution is a dedicated Mesa
> building just GL.  As Mesa's DRI driver API isn't stable this is
> practically required anyway: the ABI of the libGL we build and the
> libGL that the binary driver was built against need to match.  This
> mesa-just-gl (mesa-solo?) can be in meta-intel unless other machines
> turn out to have a similar (crazy) requirement.
> 
> Rule 3.  No dependencies on specific GL implementations
> 
> Useful so that GL implementations are swappable on systems where that
> can happen, but not essential if there isn't a single blessed GL for
> sysroot.  We'll do this later.
> 
> Some things that will also happen whilst I do this:
> 1) mesa-dri renamed to mesa.  Let's get this done nice and early!
> 2) mesa stops architecture-overriding enabling of EGL and GLES, so all
> architectures that build Mesa get GL/EGL/GLESv1/GLESv2.  If you don't
> want this don't build Mesa, and the namespaced packaging means there
> won't be conflicts.
> 
> Any more comments?

FWIW, I am happy with this proposal :)

Tomas



