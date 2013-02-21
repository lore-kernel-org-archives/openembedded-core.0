Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1U8V6C-0001Al-CI for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 13:18:09 +0100
Received: from cpc14-cmbg17-2-0-cust423.5-4.cable.virginmedia.com
	([86.14.229.168] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1U8UqW-00056E-Iq; Thu, 21 Feb 2013 13:01:52 +0100
Message-ID: <1361448063.4246.269.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 21 Feb 2013 12:01:03 +0000
In-Reply-To: <CAP9ODKrt4yGaOvnsqtOLT52eDb99G7UBBVBTYZerNn-5MHA-Eg@mail.gmail.com>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<CAP9ODKq_XBobE5vCOCCSgusT9RQyY3VSbUZmR9yAcQ4eFkKLBg@mail.gmail.com>
	<1361019187.31795.49.camel@ted> <20130217231955.GF3300@jama>
	<lyd2vydizm.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LbAmTuj0dZKq7=wX5uqF9OV7dW7FXd4d2incdKSshXEmQ@mail.gmail.com>
	<lybobe0xbv.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaSGjxG4vZ01jR63UTjoFL3+FNv+mRS3K5X6p5ugodD=Q@mail.gmail.com>
	<ly7gm12948.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAP9ODKrt4yGaOvnsqtOLT52eDb99G7UBBVBTYZerNn-5MHA-Eg@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, Patches,
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Thu, 21 Feb 2013 12:18:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-02-21 at 08:50 -0300, Otavio Salvador wrote:
> I fully agree; we have many cases where classes workaround system
> issues/limitations to avoid code duplications so I see no reason why
> this needs to be different with systemd.

If you wanted to propose an addition to the class that purely abstracted
out the duplication (without adding any potential bear-traps) then I
would have thought that should be fine. 

For example, something along the approximate lines of:

install_systemd_collateral_file() {
   if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false')}; then
      sed 's/@bindir@/${bindir}/' < $1 > $2
   fi
}

seems like it would address most of the concerns about code duplication
without introducing any hairy heuristics or unpredictably spontaneous
behaviour in the class.

p.




