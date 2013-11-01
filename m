Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A471A6CE9E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 08:51:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA18p6Zm023662; Fri, 1 Nov 2013 08:51:06 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Tof85ypmYUxj; Fri,  1 Nov 2013 08:51:06 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA18p1QE023658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Nov 2013 08:51:03 GMT
Message-ID: <1383295856.25877.124.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Fri, 01 Nov 2013 08:50:56 +0000
In-Reply-To: <52724411.9050909@windriver.com>
References: <cover.1383214870.git.hongxu.jia@windriver.com>
	<0ab98fd1823d92b6661b60432b3ec30fd9c9a03d.1383214870.git.hongxu.jia@windriver.com>
	<20131031104111.GI32015@jama> <52724411.9050909@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 1/1] qemu: use PACKAGECONFIG to address nss dependencies
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
X-List-Received-Date: Fri, 01 Nov 2013 08:51:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-10-31 at 19:50 +0800, Hongxu Jia wrote:
> On 10/31/2013 06:41 PM, Martin Jansa wrote:
> > On Thu, Oct 31, 2013 at 06:23:01PM +0800, Hongxu Jia wrote:
> >> Use PACKAGECONFIG to explicitly address nss dependencies rather than
> >> tested by configure.
> >>
> >> It avoided potential errors while multiple builds shared a common
> >> state_cache.
> > There are more floating dependencies in qemu.inc, see
> > http://patchwork.openembedded.org/patch/56935/
> >
> > and even this list isn't complete, there is also:
> > WARN: packages/armv5te-oe-linux-gnueabi/qemu/qemu/latest lost dependency on  cairo gdk-pixbuf gnutls gtk+ libvte
> >
> > Can you please improve it to fix them all?
> >
> 
> OK, I will try to fix them as possible as I can.
> 
> Drop this patch, wait for V2.

Part of the problem here is that qemu-native has some "floating"
dependencies by design. If the native system has graphics support, qemu
will have too. If it doesn't it won't have. This works out to be quite
useful for people. Some people have headless build machines they don't
want to install X on, equally some have build machines which do have X
and they do want graphical qemu.

How do we support both?

Cheers,

Richard




