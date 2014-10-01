Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9AF60809
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 00:55:50 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCQ00EG1QK9P4A0@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 30 Sep 2014 19:55:36 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CF4EE20141; Tue,
	30 Sep 2014 20:55:20 -0400 (EDT)
Date: Tue, 30 Sep 2014 20:55:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-id: <20141001005520.GO2480@denix.org>
References: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
MIME-version: 1.0
In-reply-to: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [daisy][PATCH 1/3] layer.conf: Add in useradd dependencies as ABISAFE dependencies
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
X-List-Received-Date: Wed, 01 Oct 2014 00:55:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Sep 25, 2014 at 02:17:55PM +0200, Steffen Sledz wrote:
> Currently allarch recipes using useradd rebuild each time MACHINE
> changes which is not desireable. Adding the useradd dependencies
> to this list ensures they do not change under these circumstances.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  meta/conf/layer.conf | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 18609dd..a764ee0 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -30,4 +30,8 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>    udev-extraconf \
>    packagegroup-x11-xserver \
>    systemd-serialgetty \
> +  initscripts \                                                                                                                                                                                                                                    

This line above ^^^^ has a very long trail of whitespaces and it got commited 
that way, unfortunately :(


> +  shadow \
> +  shadow-sysroot \
> +  base-passwd \
>  "
> -- 
> 2.1.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

