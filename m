Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 10D09601B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 20:12:33 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5N00GH944I6480@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2016 15:12:18 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=QyXUC8HyAAAA:8 a=0gcC27t9AAAA:8
	a=aiIX5UjjAAAA:8 a=aLNGO-X_LcTMIdfq3YsA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 401d7ff0; Thu, 14 Apr 2016 20:12:18 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DA27D161FAE; Thu,
	14 Apr 2016 16:12:17 -0400 (EDT)
Date: Thu, 14 Apr 2016 16:12:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-id: <20160414201217.GE16135@denix.org>
References: <1458850608-50481-1-git-send-email-kad@kad.name>
	<CAJ86T=Wbu31V7DqS2jcG8Kf+Ltq0vD9TR2k-XzGu89=BaM0QTg@mail.gmail.com>
	<CANFkWpmtVDEPH0Ou9oarxRP=YPMqPdJCAD_bKGTF+90ocCkAmw@mail.gmail.com>
	<CAJ86T=UUaCp8FK9V+oOwg4Cj7Hu_YH27VWvmRJ0MoP03dSS7Tg@mail.gmail.com>
	<20160410184953.GH16135@denix.org>
	<CAJTo0LY-OG4PL20oQA_KLwR+SxwtrUQjnzsPefGDRUUKZ0TJkA@mail.gmail.com>
	<CAP9ODKpshEqCEGhOoJfv212xOJj_zHVf1Wja-oBEZhhMc-oq_Q@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKpshEqCEGhOoJfv212xOJj_zHVf1Wja-oBEZhhMc-oq_Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: use compress framework to produce checksums for images
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
X-List-Received-Date: Thu, 14 Apr 2016 20:12:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 14, 2016 at 04:59:53PM -0300, Otavio Salvador wrote:
> On Thu, Apr 14, 2016 at 4:53 PM, Burton, Ross <ross.burton@intel.com> wrote:
> >
> > On 10 April 2016 at 19:49, Denys Dmytriyenko <denis@denix.org> wrote:
> >>
> >> BTW, at least for md5sum (not sure about sha*), isn't the de-facto
> >> standard
> >> extension .md5 and not .md5sum? Can we change it?
> >
> >
> > Picking a random upstream (https://download.gnome.org/sources/glib/2.10/)
> > shows that GNOME used .md5sum until they migrated over to sha256sum, so I'm
> > not sure there's a de-facto standard as two equally reasonable options.
> 
> Debian does as well, IIRC.

Debian uses .dsc files for that...

-- 
Denys

