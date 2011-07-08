Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QfBcp-0007x1-91 for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 16:01:47 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QfBZ4-000766-F2
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 15:57:54 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jul 2011 14:57:53 +0100
In-Reply-To: <0a996270e51deae8b1f22299e1e024dcb6c0be88.1310081443.git.sgw@linux.intel.com>
References: <cover.1310081443.git.sgw@linux.intel.com>
	<0a996270e51deae8b1f22299e1e024dcb6c0be88.1310081443.git.sgw@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310133474.6337.116.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 8/8] libx11: enable xcb support
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
X-List-Received-Date: Fri, 08 Jul 2011 14:01:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 16:31 -0700, Saul Wold wrote:
> [YOCTO #1196]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

We seem to be seeing quite a lot of patches recently whose long-form
comment consists of a Yocto bug number, S-O-B line and nothing else.
That might be fine for the most notorious bugs, where even non-Yocto
people would immediately recognise the number, but in general it's a bit
tedious to keep having to go to the Yocto bugzilla to find out what the
patch is trying to do.  Would it be possible to get a slightly more
descriptive commit message for future changes?

See also the fine guidelines from our helpful TSC:

http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines

thanks

p.




