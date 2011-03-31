Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q5OIM-0002Cd-CZ
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 22:16:44 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LIX001ZWS3G6MY3@vms173005.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 14:14:05 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2F42314AF6C; Thu,
	31 Mar 2011 15:14:04 -0400 (EDT)
Date: Thu, 31 Mar 2011 15:14:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20110331191404.GE23178@denix.org>
References: <a5c403f0fc71f38c0669691da7f637303ea09a27.1300978024.git.richard.purdie@linuxfoundation.org>
	<cover.1301544780.git.bengardiner@nanometrics.ca>
MIME-version: 1.0
In-reply-to: <cover.1301544780.git.bengardiner@nanometrics.ca>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Subject: Re: [PATCH 0/3] port oe-dev ,ubifs.img link support
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
X-List-Received-Date: Thu, 31 Mar 2011 20:16:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 31, 2011 at 12:36:35AM -0400, Ben Gardiner wrote:
> I made some changes in oe-dev to normalize the link names used for the 
> ubifs images created when the type is ubifs vs. when the type is UBI. 
> The changes we two-fold: make symlinks to either .rootfs.<type> or 
> <type>.img and use the <type>.img extension for the ubifs images when 
> they are intermediate for UBI image generation as well as the final 
> target.

Ben,

That seems like a good patchset for oe-core at this point. Especially in the 
light of Richard's proposal for image_types.bbclass...

Acked-by: Denys Dmytriyenko <denys@ti.com>


> The changes were accepted by Tom Rini for oe-dev and Denys Dmytriyenko 
> for arago.
> 
> I've only just begun following the oe-core list and I noticed your 
> (Richard's) changes to introduce image_type.bbclass to oe-core. When I 
> looked closer at the changes I could see that there had been no sync-up 
> from oe-dev to oe-core since the changes I mentioned above.
> 
> This changeset should align oe-core with those recent changes in oe-dev; 
> the changes I made were dependent on Bernhard's change to replace the 
> symlink target with 'ln -f' instead of 'rm'ing it first; so I ported his 
> commit also.
> 
> I'm sorry to say that there has been no testing of these changes with 
> oe-core. I would be interested in trying a test build... but I must admit
> I don't know what MACHINE+DISTRO+image to try as a simple test build.
> 
> Ben Gardiner (2):
>   image_types.bbclass: add link to .rootfs.<type> or .<type>.img
>   image_types.bbclass: use .ubifs.img extension in IMAGE_CMD_ubi
> 
> Bernhard Reutner-Fischer (1):
>   image_types.bbclass: rm symlink destination via ln
> 
>  meta/classes/image_types.bbclass | 11 +++++++----
>  1 files changed, 7 insertions(+), 4 deletions(-)
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


