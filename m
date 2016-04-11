Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id E91906018C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 13:12:26 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.148])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5H001P90OB1U80@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 11 Apr 2016 08:12:12 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=Q4-j1AaZAAAA:8 a=HihYlcsHAAAA:8
	a=V7-QPi8DYQzvr882_fgA:9	a=CjuIK1q_8ugA:10 a=okya7ekcPOEA:10
Received: by 100.15.86.14 with SMTP id 1954cb1b; Mon, 11 Apr 2016 13:12:12 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9F0AB161F8C; Mon,
	11 Apr 2016 09:12:11 -0400 (EDT)
Date: Mon, 11 Apr 2016 09:12:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20160411131210.GN16135@denix.org>
References: <cover.1460297667.git.liezhi.yang@windriver.com>
	<86645b1cea4e8cd70156e0fd5f4fb2480933b81d.1460297667.git.liezhi.yang@windriver.com>
	<20160410190630.GI16135@denix.org> <570AFB23.9070507@windriver.com>
	<CABcZANk80jGAHW4uUFqoF2DkMqh7wL2TpOVvQbo4-w+XXmMQwQ@mail.gmail.com>
	<570B07DD.3080309@windriver.com> <20160411022925.GM16135@denix.org>
MIME-version: 1.0
In-reply-to: <20160411022925.GM16135@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/1] base.bbclass: fix COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 11 Apr 2016 13:12:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

> > Since introduced ? I did a grep in oe-core and meta-openembedded, it seems
> > that no ?
> 
> Not really sure what you are trying to say here... Are you arguing that it was 
> never used as a regular expression? I beg to differ and I can provide multiple 
> examples for that:
> 
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devtools/nodejs/nodejs_4.4.1.bb#n8
> http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-core/images/arago-console-image.bb;hb=HEAD#l6
> 
> It was like that for 15+ years, since OpenEmbedded Classic days...

Oops, that does sound more impressive, but I meant 10+ years - my math failed 
me that late at night... :)

-- 
Denys

