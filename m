Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA6960EA8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 20:07:39 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VR6EO-0004D1-Q7; Tue, 01 Oct 2013 22:07:40 +0200
Message-ID: <1380658028.3822.19.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 01 Oct 2013 21:07:08 +0100
In-Reply-To: <524B297C.7090804@linux.intel.com>
References: <1380654945-17787-1-git-send-email-sgw@linux.intel.com>
	<1380656968.3822.12.camel@x121e.pbcl.net>
	<524B297C.7090804@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] makedevs: Do not return error if the fifo exisits
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Oct 2013 20:07:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-10-01 at 12:58 -0700, Saul Wold wrote:
> On 10/01/2013 12:49 PM, Phil Blundell wrote:
> > On Tue, 2013-10-01 at 12:15 -0700, Saul Wold wrote:
> >> +	int status;
> >> +	struct stat sb;
> >> +
> >> +	memset(&sb, 0, sizeof(struct stat));
> >> +	status = stat(path, &sb);
> >
> > Don't you want lstat() there?  Also, I think *stat() is guaranteed to
> > fill in all of sb if it returns anything other than an error, so the
> > memset() may be redundant.
> >
> I was keeping the same code style from the file function in the same code.
> 
> I chose to use stat() to maintain the same failure and error handling we 
> have currently.

I'm not quite sure I understand the last sentence you wrote above.  Can
you expand on why stat() rather than lstat() is the right thing?

>I was attempting to get a point fix for the release, we can worry
>about a more robust handling of the error / upgrade case in 1.5.1 
>or 1.6.

Righto.  I am blissfully ignorant of the criteria for the release so I
am happy to defer to your judgement on that.

p.



