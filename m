Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TSrMK-0006vY-Px
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 16:34:36 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q9TFKv67027978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 16:20:58 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1TSr96-0001el-MU
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 16:20:56 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1350130322-3100-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<CABcZANkPym+NSXqx6PrZnkhVqtsHoq-D20Dc14OgQ1Cq3G-bUQ@mail.gmail.com>
	<lyvced8jpv.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1350226731.4470.90.camel@x121e.pbcl.net>
Date: Mon, 29 Oct 2012 16:20:56 +0100
In-Reply-To: <1350226731.4470.90.camel@x121e.pbcl.net> (Phil Blundell's
	message of "Sun, 14 Oct 2012 15:58:51 +0100")
Message-ID: <lyzk35gv8n.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.8
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: [PATCH] package.bbclass: search for dangling links in installation directory
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
X-List-Received-Date: Mon, 29 Oct 2012 15:34:36 -0000
Content-Type: text/plain

Phil Blundell <philb-mXXj517/zsQ@public.gmane.org> writes:

>> >> +                # make path absolute; do not use os.path.join() here
>> >> +                # because target might start with multiple '/'
>> >> +                rtarget = inst_root + target
>> >
>> > I think you can use the join()
> ...
> You somehow chopped off the important part of Chris's text.  What he
> actually wrote was "... the join() which is in the oe python package",
> which is not the same as os.path.join.  
>
> As the comment says, it is...
>
>     """Like os.path.join but doesn't treat absolute RHS specially"""

ah ok... I misread 'oe' and 'os'... It is probably not the best idea, to
use such similar names for functions with a so much different semantik.

But there are no reasons to use one of these functions.  Beside the
design error of handling absolute paths specially, the purpose of
'os.path.join' is to concatenate paths with the correct delimiter ('/'
vs. '\').

But because RHS is guaranteed to be absolute in this case, they can be
joined directly.


Enrico


