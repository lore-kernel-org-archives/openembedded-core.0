Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SoGaC-0003K7-IP
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:13:08 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1SoGPQ-0001Or-5d; Mon, 09 Jul 2012 18:02:00 +0200
From: Phil Blundell <philb@gnu.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Mon, 09 Jul 2012 17:01:59 +0100
In-Reply-To: <20120705161402.GA2309@windriver.com>
References: <4FF0C930.4000104@linux.intel.com>
	<1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
	<4FF33085.1070703@linux.intel.com>
	<20120704141259.GA1817@windriver.com>
	<20120704150005.GD1817@windriver.com>
	<1341415765.20265.30.camel@phil-desktop>
	<20120705161402.GA2309@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1341849720.20265.64.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 0/3] u-boot recipe updates
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
X-List-Received-Date: Mon, 09 Jul 2012 16:13:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-05 at 12:14 -0400, Paul Gortmaker wrote:
> > On Wed, 2012-07-04 at 11:00 -0400, Paul Gortmaker wrote:
> > > > On a related note, is it possible to fix the mailing list so that it
> > > > does not strip To/Cc information and Message-ID strings?  [I'd have to
> > > > check -- maybe it is (also) inserting a needless Reply-To: header that
> > > > messes things up.]
> 
> Your mail suffers the exact same problem.  My address is nowhere to be
> seen on the To/Cc:  I only happened to see it since I told mutt to
> show me all archived poky/oe mails with u-boot in the subject.
> Otherwise your message would have been lost in the noise, perhaps seen
> next week when I return from OOO.
> 
> And when I hit reply, it won't go to you unless I tell mutt to ignore
> the broken Reply-To line.  It is the line right at the bottom:

Ah, I see.  So, just to be clear, the mailing list isn't stripping
anything: the reason that your address doesn't appear in To/Cc is, as
you suggest, purely because the Reply-to: header which mailman inserts
tends to cause replies to be sent only to the list.

I tend to agree with you that the Reply-to header is a bad idea and it
would be better off disabled, but this is a list policy decision and
Richard, as the administrator, would need to decide whether he wants to
disable it or not.

For what it's worth, you can partially defeat this behaviour by
inserting your own Reply-to header in messages that you send to the
list.  If you tell mutt to add:

Reply-to: Paul Gortmaker <paul.gortmaker@windriver.com>

then mailman will translate this to:

Reply-to: Paul Gortmaker <paul.gortmaker@windriver.com>,
openembedded-core@lists.openembedded.org

which will probably produce more or less the effect that you are looking
for.  I realise that this is still somewhat annoying but you might find
it better than the behaviour you are getting at present.

p.




