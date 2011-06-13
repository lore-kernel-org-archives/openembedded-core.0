Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@intel.com>) id 1QW9dW-0005lE-K5
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 18:05:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Jun 2011 09:00:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,359,1304319600"; d="scan'208";a="13903176"
Received: from unknown (HELO helios.localnet) ([10.255.16.237])
	by orsmga001.jf.intel.com with ESMTP; 13 Jun 2011 09:00:38 -0700
From: Paul Eggleton <paul.eggleton@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 13 Jun 2011 17:00:37 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <33AB447FBD802F4E932063B962385B3554AE4989@shsmsx501.ccr.corp.intel.com>
	<BANLkTikZxd4Gg0b0nanMupmdYBf-3LUp7g@mail.gmail.com>
In-Reply-To: <BANLkTikZxd4Gg0b0nanMupmdYBf-3LUp7g@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201106131700.37382.paul.eggleton@intel.com>
X-Mailman-Approved-At: Mon, 13 Jun 2011 18:22:17 +0200
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] RFC - combo layer repo tool
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
X-List-Received-Date: Mon, 13 Jun 2011 16:05:11 -0000
Content-Type: Text/Plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday 13 June 2011 16:33:47 Otavio Salvador wrote:
> I think it is duplicating many features of git submodule. It seems
> more logical to put a script above git submodule rather then use a
> full repository for it.

You're right in that git submodule provides a lot of these things. However,=20
submodules don't give us the ability to split out and maintain just certain=20
subdirectories / files; this allows us to bring in parts of external layers=20
where the parts of that layer we want are not split out neatly into a=20
subdirectory.

In the case of the Poky repository (where there the need for this tool=20
originated) as a user rather than a maintainer, having a single repository =
to=20
check out from with no other special steps makes things much easier and=20
cleaner. Frankly I'm not terribly impressed with how submodules have been=20
implemented in git - they are not at all easy to use.

Cheers,
Paul
---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.



