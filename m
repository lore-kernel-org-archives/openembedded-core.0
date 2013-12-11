Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9A16E6AE9E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 14:28:07 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBBERqxF014275; Wed, 11 Dec 2013 14:27:53 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bJRv2FguOlIS; Wed, 11 Dec 2013 14:27:52 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBBERnIi014270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 11 Dec 2013 14:27:50 GMT
Message-ID: <1386772064.4332.77.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 11 Dec 2013 14:27:44 +0000
In-Reply-To: <52A7DD0F.2050308@windriver.com>
References: <cover.1386687474.git.liezhi.yang@windriver.com>
	<5616775.7LhWvOXBE4@helios>
	<CAMKF1spMpasnjJ9z41rt57cfnbze_xHVuK1KoQNcoG+d16aL3w@mail.gmail.com>
	<52A7DD0F.2050308@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 000/124] [dora] fixes for dora (cover leter only)
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
X-List-Received-Date: Wed, 11 Dec 2013 14:28:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-12-11 at 11:33 +0800, Robert Yang wrote:
> 
> On 12/11/2013 08:52 AM, Khem Raj wrote:
> > On Tue, Dec 10, 2013 at 10:03 AM, Paul Eggleton
> > <paul.eggleton@linux.intel.com> wrote:
> >>
> >>> Bruce Ashfield (10):
> >>>    kernel: restore scripts in the sysroot
> >>
> >> Wasn't there a problem with this patch? I can't recall if it was rectified
> >> before or after it was merged to master.
> >>
> >
> > Problem is elsewhere, there was more of documentation issue with
> > Richard fixed in module.bbclass.
> > this is ok.
> >
> 
> Yes, we need the patch, otherwise, perf will fail to build if the kernel
> is mirrored from the sstate IIRC.

You don't recall correctly this patch is broken, was reverted in master
and should not be applied to a stable branch. Please drop it.

Cheers,

Richard


