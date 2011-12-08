Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYa43-0000bh-CE for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 10:14:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB898153025980;
	Thu, 8 Dec 2011 09:08:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25841-01; Thu,  8 Dec 2011 09:07:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB897qKa025974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 8 Dec 2011 09:07:53 GMT
Message-ID: <1323335282.971.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 09:08:02 +0000
In-Reply-To: <CAMKF1spqOpuz-M7e-F5Cwgx_ufQ4m7MTfBv05StCCXE3e5zV4w@mail.gmail.com>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
	<664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
	<7e5d0671426509d061abbe8b320f65f2cfb3a8a0.1323323130.git.nitin.a.kamble@intel.com>
	<CAMKF1spqOpuz-M7e-F5Cwgx_ufQ4m7MTfBv05StCCXE3e5zV4w@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: hjl.tools@gmail.com
Subject: Re: [PATCH 05/11] findutils: Fix compilation for x32 toolchain
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
X-List-Received-Date: Thu, 08 Dec 2011 09:14:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-07 at 23:14 -0800, Khem Raj wrote:
> On Wed, Dec 7, 2011 at 9:48 PM,  <nitin.a.kamble@intel.com> wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > Work around gnulib time_t assumption in findutils for x32
> 
> if its a workaround can it be applied only to x32 with help of overrides please

Its not a workaround, the patch looks like a generic reasonable fix to
correct assumptions made by the program that aren't true?

Cheers,

Richard




