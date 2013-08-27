Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5B21661F47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 12:16:05 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VEIBp-0007UO-87; Tue, 27 Aug 2013 14:16:05 +0200
Message-ID: <1377605761.28077.4.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: ml@communistcode.co.uk
Date: Tue, 27 Aug 2013 13:16:01 +0100
In-Reply-To: <521C969A.30909@communistcode.co.uk>
References: <521C969A.30909@communistcode.co.uk>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: do_root_fs failing on flock command
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
X-List-Received-Date: Tue, 27 Aug 2013 12:16:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-08-27 at 13:07 +0100, Jack Mitchell wrote:
> Does anyone have any insight to why this may be failing. It mentions a 
> bad file descriptor, so I assume it is related to building on an NFS mount.

There's no particular reason that flock() oughtn't to work on NFS.  If
you happened to be mounted with -o nolock then you wouldn't get the
correct semantics versus lockers on other hosts, but you shouldn't be
getting -EBADF under any circumstances that I can think of.

If you run flock by hand against a file on the same mount, does it work?
If it fails, what does the output from strace look like?

p.



