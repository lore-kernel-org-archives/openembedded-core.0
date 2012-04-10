Received: from belief.htu.tuwien.ac.at ([128.131.95.14])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jin@mediatomb.cc>) id 1SHdQA-000777-L6
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 17:55:54 +0200
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id CFDED83881; Tue, 10 Apr 2012 17:22:44 +0200 (CEST)
Date: Tue, 10 Apr 2012 17:22:44 +0200
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120410152244.GA2852@deadlock.dhs.org>
References: <CAK18fxFb3xkxbiyCDBncgpyvqOVCgOvzViveLa=aw3CyQPKiQA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK18fxFb3xkxbiyCDBncgpyvqOVCgOvzViveLa=aw3CyQPKiQA@mail.gmail.com>
User-Agent: Mutt/1.5.15 (2007-04-06)
Subject: Re: js 185 -> js186_1.0.0
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
X-List-Received-Date: Tue, 10 Apr 2012 15:55:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Apr 10, 2012 at 06:14:58PM +0300, Andrei Gherzan wrote:
> Have a problem while updating js to version 185. This version renames the
> library in libmozjs185. What to do in order to avoid breaking packages which
> need libjs? Another interesting thing is that js is now called js185_1.0.0
> which seems to be actually another package / implementation? I will try to test
> this using symlinks while compiling web package. 

JS 1.8.5 is not backwards compatible! This is the reason why they renamed the
libs, you can not link older software against JS 1.8.5 without adaptions, the
new version has a new API.

Kind regards,
Jin




