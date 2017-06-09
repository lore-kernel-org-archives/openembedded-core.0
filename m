Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id E931378299
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:53:41 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id e23so6987280wre.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 06:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AYEQroe0ri0o2OOjR9hLbLNsTfD8ntvFrp5SD9JlYts=;
	b=FvJBbwbFk9YNWTioGNxH6oPubbvv/Nv65ktN8MZXVjKGGKWWlCbf3XX9K4b1zGcB4c
	Myn4zRqrGjU33opaKEVbDXXhgRgdSpY16UHrGAlGMJ4vvqyr/WtmJwiAIDYy0wgznsu0
	BsggboYz230c2IHLudJyMqCe+8pLf7uLMiBqHedbmOg6oymvXLJZohhnVTYZrF82ewF5
	gXyW4UY4aieiX54RROYbpM06fi5vBGFel7cKQKKPMV0qqVsbRNoVaDBnTGpZY5pnmNxM
	R8bB+nuM9yzeQfmXcnHS7K4rDRgFGfnEKRIKOBU0pGqHnZU5YaNHmeB3u1SFHakcyUTz
	FYkw==
X-Gm-Message-State: AODbwcBQ/DsjK0OaR6pnof/XYx1Wr+jdfeoM+mgVM1fJ+pEK9MjsK0zG
	d3XteOw4uBb8uI4hUXM=
X-Received: by 10.223.138.194 with SMTP id z2mr32807086wrz.66.1497016422473;
	Fri, 09 Jun 2017 06:53:42 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	l93sm1736568wrc.46.2017.06.09.06.53.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Jun 2017 06:53:41 -0700 (PDT)
Message-ID: <1497016420.4561.13.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 09 Jun 2017 14:53:40 +0100
In-Reply-To: <20170609070429.17376-1-freesilicon@gmail.com>
References: <20170609070429.17376-1-freesilicon@gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH RESEND 0/3] openssh: Package server configuration
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
X-List-Received-Date: Fri, 09 Jun 2017 13:53:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi.

On Fri, 2017-06-09 at 09:04 +0200, David Vincent wrote:
> This serie of patches provides a way to package OpenSSH sshd
> configuration. This
> way, it should be easier to change the configuration either in distro
> and/or BSP
> layers.
> It also simplifies management for R/O rootfs

Looking at some previous patches and comments, this split seems to have been
done with the intention to better support R/O rootfs.
I have a sent a patch that addresses the R/O rootfs issue in a different
way, which I believe to be a simpler and less intrusive approach. We've been
using this for a while.

http://lists.openembedded.org/pipermail/openembedded-core/2017-June/137848.html

Let me know what you think.


Cheers,
Andre'


> David Vincent (3):
>   openssh: Package server configuration
>   core-image: Set default sshd configuration
>   rootfs-postcommands: Modify ssh-related commands
> 
>  meta/classes/core-image.bbclass                    |  3 +-
>  meta/classes/rootfs-postcommands.bbclass           | 17 +++-----
>  meta/recipes-connectivity/openssh/openssh_7.5p1.bb | 51
> ++++++++++++++++++----
>  3 files changed, 50 insertions(+), 21 deletions(-)
> 
> -- 
> 2.13.0
> 

