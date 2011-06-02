Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QS8lo-0000S7-6d for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 16:21:08 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QS8ik-00036p-Nu
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 16:17:58 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306940803.2529.101.camel@phil-desktop>
References: <4DE56B0D.4020209@intel.com>
	<1306940803.2529.101.camel@phil-desktop>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 02 Jun 2011 15:17:57 +0100
Message-ID: <1307024277.2529.205.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Tell me your build error message annoyances!
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
X-List-Received-Date: Thu, 02 Jun 2011 14:21:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 16:06 +0100, Phil Blundell wrote:
> On Tue, 2011-05-31 at 15:26 -0700, Scott Garman wrote:
> > I'd like to collect some feedback on error messages while building that 
> > you find confusing/annoying/unhelpful. I'm going to be working on trying 
> > to improve the situation and would like to hear from you about what 
> > could be more helpful.
> 
> Funnily enough we were just having a discussion about this on irc.  My
> personal top two least favourite diagnostics are:

Another non-favourite: if you fail to specify the right protocol for the
git fetcher then you end up with something like:

ERROR: Function 'Fetcher failure for URL: 'None'. Fetch command export
HOME="/home/pb"; export
GIT_CONFIG="/home/pb/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/etc/gitconfig"; export PATH="..."; git ls-remote rsync://gitolite@cam-git/pb/linux-2.6.35 master failed with signal 128, output:
fatal: Could not make temporary directory: No such file or directory
' failed

Usually the value of $PATH is about half a screenful so this error looks
more monstrous in real life than it probably does above, and it isn't
immediately apparent that the "no such file or directory" thing is a
result of having tried to fetch with the wrong URI scheme. 

This is made slightly more irritating by the fact that there isn't much
consistency between the different fetchers about the URI structure; some
of them want a "proto" attribute whereas others (including git) want
"protocol", so it's harder than perhaps it ought to be to remember what
the correct naming is.

p.




