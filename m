Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1URhQ7-0006xt-Ei
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:17:59 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r3FB0SFv009907
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 15 Apr 2013 13:00:29 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1URh9A-0005kW-17; Mon, 15 Apr 2013 13:00:28 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1365697555.git.ross.burton@intel.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 15 Apr 2013 13:00:28 +0200
In-Reply-To: <cover.1365697555.git.ross.burton@intel.com> (Ross Burton's
	message of "Thu, 11 Apr 2013 17:28:24 +0100")
Message-ID: <lyli8k12k3.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.9
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] Move systemd binaries to /sbin/systemd
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
X-List-Received-Date: Mon, 15 Apr 2013 11:18:18 -0000
X-List-Received-Date: Mon, 15 Apr 2013 11:18:18 -0000
Content-Type: text/plain

Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> Following the example set by udev, move the binaries to /sbin/systemd
> and hardcode less paths in general.  Tested on atom-pc with a .hddimg
> so the live boot/initrd paths were tested.

At least the moving of udev breaks a lot of local recipes here which
install e.g. local rules or keymaps in /lib/udev.  This is a silent break
which is detected at device runtime only.  The global 'bitbake.conf' has
not been updated for the new paths neither.


There should be:

1. added some QA checks which detect this broken packaging

2. added some global variables (e.g. 'udev_basedir') which can be used
   in the rules.



Enrico


