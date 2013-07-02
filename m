Return-Path: <sander@outrightsolutions.nl>
Received: from mail.outrightsolutions.nl (outrightsolutions.nl
	[194.145.201.26])
	by mail.openembedded.org (Postfix) with ESMTP id B020C61086
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 12:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id 90DA05BC4FE;
	Tue,  2 Jul 2013 14:19:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outrightsolutions.nl
Received: from mail.outrightsolutions.nl ([127.0.0.1])
	by localhost (hydrogen.outrightsolutions.nl [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id tFf3wQbU7itL; Tue,  2 Jul 2013 14:19:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id 024245BC373;
	Tue,  2 Jul 2013 14:19:25 +0200 (CEST)
User-Agent: SOGoMail 2.0.5a
X-Forward: 145.72.98.1
MIME-Version: 1.0
from: "Sander van Grieken" <sander@outrightsolutions.nl>
message-id: <3025-51d2c580-99-5d3ab0@25397342>
to: "Yevhen Kyriukha" <kirgene@gmail.com>
date: Tue, 02 Jul 2013 14:19:25 +0200
in-reply-to: <CADV-EXEu9adLK7ArMTZv30gTdppzPwMpNMC1JPpVhSm9jQqTag@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Create btrfs subvolume during image building
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
X-List-Received-Date: Tue, 02 Jul 2013 12:19:27 -0000
content-type: text/plain; charset="utf-8"
content-transfer-encoding: 7bit

On Tuesday, July 2, 2013 14:04 CEST, Yevhen Kyriukha <kirgene@gmail.com> wrote: 
 
> Hi!
> 
> I'd like to create image with btrfs rootfs partition.
> I want to store all files on separate subvolume on btrfs partition.
> For this purpose I'm creating *.bbclass that simply extends IMAGE_CMD.
> 
> The problem is that to create btrfs subvolume I need to mount it first, but
> only root can execute "mount".
> 
> Are there any ways to accomplish this?
> 
> Best regards,
> Yevhen
 
You can mark /dev/loop0 in /etc/fstab as user mountable, and use that in your IMAGE_CMD

Regards,
Sander


