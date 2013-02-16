Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U6gm6-00023G-CS
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 13:22:19 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1GC5iBT031617
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 13:05:45 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1U6gWW-0003Je-8U
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 13:05:44 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1360956550-31119-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LY7zkGkAc4XR_7yp1R-=WZbRA=M7xoo9EiYMpYjGkOaTw@mail.gmail.com>
Date: Sat, 16 Feb 2013 13:05:44 +0100
In-Reply-To: <CAJTo0LY7zkGkAc4XR_7yp1R-=WZbRA=M7xoo9EiYMpYjGkOaTw@mail.gmail.com>
	(Ross Burton's message of "Fri, 15 Feb 2013 20:33:23 +0000")
Message-ID: <lyd2w0mpk7.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: [PATCH] systemd: Fix packaging warnings and spin libnss_myhostname to package of its own
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
X-List-Received-Date: Sat, 16 Feb 2013 12:22:19 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> On 15 February 2013 19:29, Khem Raj <raj.khem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> +                /lib/udev/hwdb.d \
>
> Would this obsolete the patch I posted earlier to add pci/usb IDs?

no; these files are useless without an 'udevadm hwdb --update' in a
script.

I did not looked at the generated database, but the hwdb.d files are
large (4 MiB) so that they should be moved into an own subpackage.


Enrico


