Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 40B4F6FFAB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 10:52:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 08 Feb 2016 02:52:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,415,1449561600"; 
	d="scan'208,217";a="648907443"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Feb 2016 02:52:40 -0800
Message-ID: <1454928759.12961.3.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 08 Feb 2016 12:52:39 +0200
In-Reply-To: <CAJTo0LaHHNGPTTLDnDai4ArYBkSZDQb+1tmQ18vPDpzH4ef_EQ@mail.gmail.com>
References: <1454680824-26075-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1454680824-26075-3-git-send-email-markus.lehtonen@linux.intel.com>
	<CAJTo0LaHHNGPTTLDnDai4ArYBkSZDQb+1tmQ18vPDpzH4ef_EQ@mail.gmail.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] oe/gpg_sign: check for python-pexpect when using local signing
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
X-List-Received-Date: Mon, 08 Feb 2016 10:52:41 -0000
Content-Type: multipart/alternative; boundary="=-HJV92cU88ASCzap4Q7BV"

--=-HJV92cU88ASCzap4Q7BV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-02-05 at 14:31 +0000, Burton, Ross wrote:
> 
> On 5 February 2016 at 14:00, Markus Lehtonen <
> markus.lehtonen@linux.intel.com> wrote:
> > +            msgs.append("Please install python-pexpect that is
> > needed by lcocal gpg signing.")
> > 
> Isn't this only needed if signing RPMs?  Hopefully in the future this
> class will be used for more than RPM signing and detached signing
> doesn't need pexpect.
Yes, that is true. Any suggestions how to change this? Just try
ImportError in sign_rpms() and fail there(?)
> Also, typo in "local".
Typo fixed (and commit message modified) in my contrib repo:
git://git.openembedded.org/openembedded-core-contrib marquiz/rpmsign


Thanks,
  Markus

--=-HJV92cU88ASCzap4Q7BV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Fri, 2016-02-05 at 14:31 +0000, Burton, Ro=
ss wrote:</div><blockquote type=3D"cite"><div dir=3D"ltr"><div><br><div cla=
ss=3D"gmail_quote">On 5 February 2016 at 14:00, Markus Lehtonen <span dir=
=3D"ltr">&lt;<a href=3D"mailto:markus.lehtonen@linux.intel.com" target=3D"_=
blank">markus.lehtonen@linux.intel.com</a>&gt;</span> wrote:<br><blockquote=
 type=3D"cite"><div id=3D":f5s" class=3D"a3s" style=3D"overflow:hidden">+&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; msgs.append("Please install python-=
pexpect that is needed by lcocal gpg signing.")<br></div><br></blockquote><=
/div><br>Isn't this only needed if signing RPMs?&nbsp; Hopefully in the fut=
ure this class will be used for more than RPM signing and detached signing =
doesn't need pexpect.</div></div></blockquote><div><br></div><div>Yes, that=
 is true. Any suggestions how to change this? Just try ImportError in sign_=
rpms() and fail there(?)</div><div><br></div><div><br></div><blockquote typ=
e=3D"cite"><div dir=3D"ltr"><div>Also, typo in "local".</div></div></blockq=
uote><div><br></div><div>Typo fixed (and commit message modified) in my con=
trib repo:</div><div><span style=3D"font-family: monospace;">git://git.open=
embedded.org/openembedded-core-contrib marquiz/rpmsign</span></div><div><sp=
an style=3D"font-family: monospace;"><br></span></div><div><span style=3D"f=
ont-family: monospace;"><br></span></div><div><span style=3D"font-family: m=
onospace;">Thanks,</span></div><div><span style=3D"font-family: monospace;"=
>&nbsp; Markus</span></div><div><br></div></body></html>

--=-HJV92cU88ASCzap4Q7BV--
