Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 240C66007B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 16:56:15 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VR3FA-0003Bm-6A; Tue, 01 Oct 2013 18:56:16 +0200
Message-ID: <1380646575.23533.89.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 01 Oct 2013 17:56:15 +0100
In-Reply-To: <1380646260-15245-1-git-send-email-sgw@linux.intel.com>
References: <1380646260-15245-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] makedevs: Do not return error if the fifo exisits
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
X-List-Received-Date: Tue, 01 Oct 2013 16:56:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-10-01 at 09:51 -0700, Saul Wold wrote:
>  static void add_new_fifo(char *name, char *path, unsigned long uid,
>  				  unsigned long gid, unsigned long mode)
>  {
> -	if (mknod(path, mode, 0))
> +	if (mknod(path, mode, 0) && errno != EEXIST)
>  		error_msg_and_die("%s: file can not be created with mknod!", path);

Will this do the right thing if the mode has changed from the old to the
new versions?

p.



