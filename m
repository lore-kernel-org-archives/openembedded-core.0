Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QZ8Fs-0007RZ-FV for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 23:13:04 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QZ8CT-0002qV-2t
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 23:09:33 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E00ED2C.1040708@windriver.com>
References: <4E00CA30.7020302@windriver.com>
	<1308682643.3083.18.camel@lenovo.internal.reciva.com>
	<4E00ED2C.1040708@windriver.com>
Date: Tue, 21 Jun 2011 22:09:26 +0100
Message-ID: <1308690566.3083.75.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Directory permissions and ownership -- RFC
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
X-List-Received-Date: Tue, 21 Jun 2011 21:13:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 14:12 -0500, Mark Hatle wrote:
> fs-perms.txt is the default name.  It was done to work similarly to the
> 'device_table-minimal.txt' file that already exists.
> 
> The logic is:
> 
> Use the variable FILESYSTEM_PERMS_TABLES, the contents of this may be full
> paths, or partial paths within the BBPATH structure.  Multiple files may be
> listed space separated.  (Evaluation is is order it's specified, so the last one
> loaded takes precedence over earlier ones.)
> 
> If the variable FILESYSTEM_PERMS_TABLES is not specified, we then use the
> files/fs-perms.txt, again BBPATH is searched for that.

Okay, I see.  Does it support variable interpolation?  If the
permissions are going to be specified out-of-band then I think at a
minimum there needs to be a way to refer symbolically to things like
${prefix} rather than hardcoding their values.

Also, from what you wrote above about device_table-minimal, it sounds as
though this file is a global manifest rather than being per-recipe.  Is
that right?  If so, it sounds like this is going to be a frequent source
of merge headaches in much the same way as the old checksums.ini was.

p.




