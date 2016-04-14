Return-Path: <denis@denix.org>
X-Greylist: delayed 3600 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Apr 2016 21:16:24 UTC
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7859760290
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 21:16:24 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5N00ED94AXCL00@vms173009.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2016 15:16:09 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=0gcC27t9AAAA:8 a=aiIX5UjjAAAA:8
	a=19YkIB3ywtWD6vDjjqoA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 3c898c7a; Thu, 14 Apr 2016 20:16:09 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E6253161FAE; Thu,
	14 Apr 2016 16:16:08 -0400 (EDT)
Date: Thu, 14 Apr 2016 16:16:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20160414201608.GF16135@denix.org>
References: <1458850608-50481-1-git-send-email-kad@kad.name>
	<CAJ86T=Wbu31V7DqS2jcG8Kf+Ltq0vD9TR2k-XzGu89=BaM0QTg@mail.gmail.com>
	<CANFkWpmtVDEPH0Ou9oarxRP=YPMqPdJCAD_bKGTF+90ocCkAmw@mail.gmail.com>
	<CAJ86T=UUaCp8FK9V+oOwg4Cj7Hu_YH27VWvmRJ0MoP03dSS7Tg@mail.gmail.com>
	<20160410184953.GH16135@denix.org>
	<CAJTo0LY-OG4PL20oQA_KLwR+SxwtrUQjnzsPefGDRUUKZ0TJkA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJTo0LY-OG4PL20oQA_KLwR+SxwtrUQjnzsPefGDRUUKZ0TJkA@mail.gmail.com>
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
X-List-Received-Date: Thu, 14 Apr 2016 21:16:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 14, 2016 at 08:53:29PM +0100, Burton, Ross wrote:
> On 10 April 2016 at 19:49, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > BTW, at least for md5sum (not sure about sha*), isn't the de-facto standard
> > extension .md5 and not .md5sum? Can we change it?
> 
> Picking a random upstream (https://download.gnome.org/sources/glib/2.10/)
> shows that GNOME used .md5sum until they migrated over to sha256sum, so I'm
> not sure there's a de-facto standard as two equally reasonable options.

Hmm, ok. I guess with the migration to sha256sum, it's becoming to provide 
multiple checksum files and I see more uses of .md5sum extension now. Never 
mind, I'll update my infrastructure from the old .md5 days... :)

-- 
Denys

