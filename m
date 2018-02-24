Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id F0DDB605C2;
	Sat, 24 Feb 2018 03:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 98C4020B68;
	Sat, 24 Feb 2018 03:48:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mxqp7UoF46kU; Sat, 24 Feb 2018 03:48:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 60B5220059;
	Sat, 24 Feb 2018 03:48:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C15BD1632C5; Fri, 23 Feb 2018 22:48:07 -0500 (EST)
Date: Fri, 23 Feb 2018 22:48:07 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20180224034807.GF2786@denix.org>
References: <CAAQYJAudtnFaY1S2j6FF_pN9B1OJhN-6fEBY8nWCtM73Kx8tSw@mail.gmail.com>
	<0bb858dc-a43f-ae14-01c9-2a42855e4409@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0bb858dc-a43f-ae14-01c9-2a42855e4409@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Rename meta-openembedded to openembedded-extras
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
X-List-Received-Date: Sat, 24 Feb 2018 03:48:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Feb 22, 2018 at 12:37:44PM -0800, akuster808 wrote:
> On 02/21/2018 11:55 PM, Andrea Adami wrote:
> > All,
> > it seems there is some consensus about reordering/cleaning the
> > "OpenEmbedded layers".
> >
> > I think that before starting any cleaning *inside* we should finally
> > clean up the confusion about meta-oe meta-openembedded
> > openembedded-layers, etc..
> >
> > I think it would be advisable to rename the repository from
> > meta-openembedded to openembedded-extras, matching the
> > openembedded-core naming schema.
> Renaming an existing repo will cause more damage than what benefit one
> thinks it may solve. 

Agree.


> I think openembededd-core is incorrect. it should have been
> meta-openbedded-core or meta-core.

It does have a layer called just "meta" though...


> - armin
> >
> > Regards
> > Andrea
> >
> >
> > P.S.
> > One layer of this repo would be the (in)famous meta-oe.
> > I can't imagine right now a definition for it: it contains old
> > versions of oe-core recipes, expunged recipes, tools and libraries
> > needed by other layers (i.e. tslib), etc. etc.
> > This one will need a separate thread.
> 
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

