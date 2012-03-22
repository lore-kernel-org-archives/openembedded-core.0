Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SAjKw-0002Lu-Oq
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 15:49:58 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Mar 2012 07:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121988592"
Received: from unknown (HELO helios.localnet) ([10.252.123.227])
	by azsmga001.ch.intel.com with ESMTP; 22 Mar 2012 07:41:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Thu, 22 Mar 2012 14:41:01 +0000
Message-ID: <1376344.pbiv3OAoml@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <1332414627-6512-2-git-send-email-schnitzeltony@googlemail.com>
References: <1332414627-6512-1-git-send-email-schnitzeltony@googlemail.com>
	<1332414627-6512-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: enable eject
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
X-List-Received-Date: Thu, 22 Mar 2012 14:49:59 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday 22 March 2012 12:10:27 Andreas M=FCller wrote:
> In xfce-environment ejecting USB-memory stick caused:
> Error starting job: Failed to execute child process "eject" (No such =
file or
> directory)

Not to say we shouldn't merge this, but I'm concerned if this continues=
 we=20
could end up with busybox in the default configuration creeping up in s=
ize as=20
more and more features get enabled.

Where do we draw the line?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


