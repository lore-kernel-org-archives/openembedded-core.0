Return-Path: <denis@denix.org>
X-Greylist: delayed 3604 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Apr 2016 22:27:02 UTC
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A243606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 22:27:02 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5N007LW7KYC4A0@vms173011.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2016 16:26:58 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=0gcC27t9AAAA:8 a=QyXUC8HyAAAA:8
	a=aiIX5UjjAAAA:8 a=xNf9USuDAAAA:8	a=yWM8z59emEYaNkDQyRQA:9
	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 35f83772; Thu, 14 Apr 2016 21:26:58 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BAF7E161FAE; Thu,
	14 Apr 2016 17:26:57 -0400 (EDT)
Date: Thu, 14 Apr 2016 17:26:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-id: <20160414212657.GG16135@denix.org>
References: <1458850608-50481-1-git-send-email-kad@kad.name>
	<CAJ86T=Wbu31V7DqS2jcG8Kf+Ltq0vD9TR2k-XzGu89=BaM0QTg@mail.gmail.com>
	<CANFkWpmtVDEPH0Ou9oarxRP=YPMqPdJCAD_bKGTF+90ocCkAmw@mail.gmail.com>
	<CAJ86T=UUaCp8FK9V+oOwg4Cj7Hu_YH27VWvmRJ0MoP03dSS7Tg@mail.gmail.com>
	<20160410184953.GH16135@denix.org>
	<CAJTo0LY-OG4PL20oQA_KLwR+SxwtrUQjnzsPefGDRUUKZ0TJkA@mail.gmail.com>
	<CAP9ODKpshEqCEGhOoJfv212xOJj_zHVf1Wja-oBEZhhMc-oq_Q@mail.gmail.com>
	<20160414201217.GE16135@denix.org>
	<CAP9ODKpN5BYcLwvT_jqcFoG6OCsu+6AcuHcL8=a6HgrjF+_VnA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKpN5BYcLwvT_jqcFoG6OCsu+6AcuHcL8=a6HgrjF+_VnA@mail.gmail.com>
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
X-List-Received-Date: Thu, 14 Apr 2016 22:27:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 14, 2016 at 05:31:56PM -0300, Otavio Salvador wrote:
> On Thu, Apr 14, 2016 at 5:12 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Thu, Apr 14, 2016 at 04:59:53PM -0300, Otavio Salvador wrote:
> >> On Thu, Apr 14, 2016 at 4:53 PM, Burton, Ross <ross.burton@intel.com> wrote:
> >> >
> >> > On 10 April 2016 at 19:49, Denys Dmytriyenko <denis@denix.org> wrote:
> >> >>
> >> >> BTW, at least for md5sum (not sure about sha*), isn't the de-facto
> >> >> standard
> >> >> extension .md5 and not .md5sum? Can we change it?
> >> >
> >> >
> >> > Picking a random upstream (https://download.gnome.org/sources/glib/2.10/)
> >> > shows that GNOME used .md5sum until they migrated over to sha256sum, so I'm
> >> > not sure there's a de-facto standard as two equally reasonable options.
> >>
> >> Debian does as well, IIRC.
> >
> > Debian uses .dsc files for that...
> 
> For .iso files, for example, no.
> 
> See:
> 
> http://cdimage.debian.org/debian-cd/current/i386/iso-cd/

Nope, don't see it - all I see are .iso and .sign extensions...

-- 
Denys

