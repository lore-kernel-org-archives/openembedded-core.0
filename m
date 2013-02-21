Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U8Ug1-00005H-RH
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 12:51:06 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1LBYlbQ021070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 12:34:49 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1U8UQJ-000124-Ki
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 12:34:47 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<CAP9ODKq_XBobE5vCOCCSgusT9RQyY3VSbUZmR9yAcQ4eFkKLBg@mail.gmail.com>
	<1361019187.31795.49.camel@ted> <20130217231955.GF3300@jama>
	<lyd2vydizm.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LbAmTuj0dZKq7=wX5uqF9OV7dW7FXd4d2incdKSshXEmQ@mail.gmail.com>
	<lybobe0xbv.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaSGjxG4vZ01jR63UTjoFL3+FNv+mRS3K5X6p5ugodD=Q@mail.gmail.com>
Date: Thu, 21 Feb 2013 12:34:47 +0100
In-Reply-To: <CAJTo0LaSGjxG4vZ01jR63UTjoFL3+FNv+mRS3K5X6p5ugodD=Q@mail.gmail.com>
	(Ross Burton's message of "Thu, 21 Feb 2013 10:40:37 +0000")
Message-ID: <ly7gm12948.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.85
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
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
X-List-Received-Date: Thu, 21 Feb 2013 11:51:08 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> more upstream over time will also integrate systemd unit files
> directly.

When in 5 or 10 years everybody switched to systemd and installs its
service files by itself, we can mark the relevant code in the class as
deprecated and remove it.

But now, the oe-core systemd implementation causes redundant implementations
of non trivial code in several packages.


Enrico


