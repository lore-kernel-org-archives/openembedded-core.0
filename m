Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RbCgf-00063x-8V for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 15:53:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFEkZ4r005085
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 14:46:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04434-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 14:46:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFEkQrk005078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 14:46:27 GMT
Message-ID: <1323960387.4568.35.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Dec 2011 14:46:27 +0000
In-Reply-To: <cover.1323911699.git.sgw@linux.intel.com>
References: <cover.1323911699.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/7] SSTATE_SCAN_FILES Fix with non-gplv3 and World fixes
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
X-List-Received-Date: Thu, 15 Dec 2011 14:53:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-14 at 17:50 -0800, Saul Wold wrote:
> Richard,
> 
> This patch contains a couple of fixes for world and non-gplv3 along
> with the sstate fix for ensure we mangle (or "fixmepath") files that
> do not fall into the standard set.
> 
> SSTATE_SCAN_FILES is defaulted to "*.la and *-configs", recipes can
> append to it with SSTATE_SCAN_FILES += "<filename>".
> 
> 
> The following changes since commit b9dfccc018f32a47fc045f35d5f53d7269d791ed:
> 
>   gdk-pixbuf: Ensure the binaries can be relocated (2011-12-13 18:00:18 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/fix
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix
> 
> Saul Wold (7):
>   qt-mobility: Fix QA error for debug files

Missing PR bump

>   ed: Fix EXTRA_OECONF to ensure right compiler is found

This has a question. I think the answer is that it doesn't use real
autoconf and had special issues of its own. I haven't checked yet though
so I've left this patch as queued.

>   sstate: Add SSTATE_SCAN_FILES

I've updated the above patch with some better syntax I came up with.

>   icu: Add Makefile.inc to SSTATE_SCAN_FILES
>   gmp: Add gmp.h to SSTATE_SCAN_FILES
>   libtool-cross: Add libtool & libtoolize to SSTATE_SCAN_FILES
>   perl: add .pl, pm, pod, sh files to SSTATE_SCANE_FILES

These are fine but needed better commit descriptions.

I made the above tweaks and merged these along with some of the other
commits batched up in MUT (already been on the list for a while). The
MUT build on the autobuilder was not in a good state due to the directfb
change. I've therefore selectively pulled in pieces of MUT into master
and restarted a test against master.

Cheers,

Richard



