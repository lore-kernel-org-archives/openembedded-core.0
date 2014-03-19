Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 748A86E7D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 21:45:04 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2JLi83D004239; Wed, 19 Mar 2014 21:44:45 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id u-vS0rILRXUQ; Wed, 19 Mar 2014 21:44:45 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2JLignm004248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 19 Mar 2014 21:44:44 GMT
Message-ID: <1395265477.3808.140.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
Date: Wed, 19 Mar 2014 21:44:37 +0000
In-Reply-To: <1395231830.31252.10.camel@firebird.rb.intel.com>
References: <1395189079-18831-1-git-send-email-sgw@linux.intel.com>
	<1395231830.31252.10.camel@firebird.rb.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] testimage: dont use DNS lookup for qemu based testimages
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
X-List-Received-Date: Wed, 19 Mar 2014 21:45:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-03-19 at 12:23 +0000, Stanacar, StefanX wrote:
> 
> 
> On Tue, 2014-03-18 at 17:31 -0700, Saul Wold wrote:
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >  meta/classes/testimage.bbclass | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> > index 691c7f6..ee028e1 100644
> > --- a/meta/classes/testimage.bbclass
> > +++ b/meta/classes/testimage.bbclass
> > @@ -45,6 +45,16 @@ TESTIMAGEDEPENDS_qemuall = "qemu-native:do_populate_sysroot qemu-helper-native:d
> >  TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
> >  TESTIMAGELOCK_qemuall = ""
> >  
> > +IMAGE_POSTPROCESS_COMMAND_qemuall += "fix_dns_lookup_for_qemu"
> > +
> 
> I might be wrong, but this won't have any effect with the default
> (manual) way we use testimage. The testimage class isn't in the global
> inherit, so that  IMAGE_POSTPROCESS_COMMAND won't run as the image isn't
> reconstructed.

Surely it will have run when the rootfs was originally constructed
though?

Koen is right, that override is incorrect.

Cheers,

Richard


