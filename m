Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 68CC96D545
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 21:05:29 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VcLuM-0004bY-NM; Fri, 01 Nov 2013 22:05:30 +0100
Message-ID: <1383339883.8901.42.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Ross Burton <ross.burton@intel.com>
Date: Fri, 01 Nov 2013 21:04:43 +0000
In-Reply-To: <1383335233-12366-1-git-send-email-ross.burton@intel.com>
References: <1383335233-12366-1-git-send-email-ross.burton@intel.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wipe-sysroot: explain what is being deleted and require confirmation
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
X-List-Received-Date: Fri, 01 Nov 2013 21:05:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-01 at 19:47 +0000, Ross Burton wrote:
> Instead of rushing into deleting entire directory trees without any warning,
> print the directories and files that will be deleted and require confirmation
> from the user (via --force) that they want files to be deleted.

"--force" seems like a bit of an odd name for an argument that you have
to supply in order for the script to do anything useful.  Why would the
user be running a script named "wipe-sysroot" if they didn't want the
sysroot to be deleted?

p.



