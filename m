Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UX7EH-0007ce-5N for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 11:52:14 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UX6wy-0005a6-IB; Tue, 30 Apr 2013 11:34:16 +0200
Message-ID: <1367314455.14512.147.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 30 Apr 2013 10:34:15 +0100
In-Reply-To: <ly61z5c4j8.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1367249183-2579-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<CAJTo0Laf-d0hz5kkRZZAr7W4yGs+aYaTu51XU2k2q-s0p57q5A@mail.gmail.com>
	<lyip35jpw8.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYGf=QtQ_dEbaUiFWOGjpAjfNXqCPY_XYrt+G-rUhcsOg@mail.gmail.com>
	<lyehdtjmkw.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<517EF523.2060405@linux.intel.com>
	<ly61z5c4j8.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: oe-core layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: [PATCH 1/7] bitbake.conf: fix definition of ${libexecdir}
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
X-List-Received-Date: Tue, 30 Apr 2013 09:52:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-30 at 01:15 +0200, Enrico Scholz wrote:
> 1. ${prefix}/libexec
> 
>    --> clean separation, commonly used, but not FHS compliant (unless
>    somebody interprets "/usr/lib<qual> : Alternate format libraries
>    (optional)" with '<qual>=exec')

Actually, FHS 3.0 draft 1 does appear to admit the possibility of
libexec again:

http://www.linuxbase.org/betaspecs/fhs/fhs.html#usrlibexec

So maybe this option isn't (or won't be) so noncompliant as it might
first have appeared.

p.




