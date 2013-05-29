Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DB8E46A572
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 09:41:57 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4T9jiPI021897; Wed, 29 May 2013 10:46:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2oQpC4qLHi08; Wed, 29 May 2013 10:46:04 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4T9jwF1021931
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 29 May 2013 10:46:00 +0100
Message-ID: <1369820495.14887.214.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 May 2013 10:41:35 +0100
In-Reply-To: <CAJTo0Laer3rQPAA3mBt9qr6K3QVazfOvafAWHEMQosVT0SXrOA@mail.gmail.com>
References: <1369220223-28298-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1369220302.6695.72.camel@phil-desktop.brightsign>
	<CAJTo0LYC2Xa=31R=eCACZDFJkWT8NBSmHVkQnL+x7jausCkDbw@mail.gmail.com>
	<1369227075.6695.89.camel@phil-desktop.brightsign>
	<CAJTo0Laer3rQPAA3mBt9qr6K3QVazfOvafAWHEMQosVT0SXrOA@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] guile: added runtime dependency on glibc-gconv-iso8859-1
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
X-List-Received-Date: Wed, 29 May 2013 09:41:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-22 at 14:41 +0100, Burton, Ross wrote:
> On 22 May 2013 13:51, Phil Blundell <pb@pbcl.net> wrote:
> > I had thought we had virtual-gconv-ENCODING providers but apparently
> > that's not the case.  So I think the answer at the moment is probably
> > no.  I guess we should add something like that.
> 
> Agreed.  Filed https://bugzilla.yoctoproject.org/show_bug.cgi?id=4530.

I'd really like to at least get the partial fix merged for this. How
about we make this a libc class override? We can use the target override
too, something like:

RDEPENDS_${PN}_append_libc-glibc_class-target = "glibc-gconv-iso8859-1"

should work?

We have the open bug to address the core provider issue.

Cheers,

Richard



