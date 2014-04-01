Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 471456E77A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:48:35 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WV2nc-0004fG-9g; Tue, 01 Apr 2014 19:48:36 +0200
Message-ID: <1396374515.5879.54.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
Date: Tue, 01 Apr 2014 18:48:35 +0100
In-Reply-To: <1396374241.5879.50.camel@phil-desktop.brightsign>
References: <8672BB614B4CCA40A6B3BDD6FD82050B575445A7@COSNADEXC13.usr.ingenico.loc>
	<1396374241.5879.50.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Tue, 2014-04-01 at 18:44 +0100,
	Phil Blundell wrote: > On Wed, 2014-02-26 at 11:11 +0000,
	Matthieu CRAPET wrote: > > > Setting IMAGE_DEVICE_TABLE
	or IMAGE_DEVICE_TABLES to empty string in > > an image recipe works
	(makedevs
	is not called) > > > > > > > > Should be we drop USE_DEVFS variable
	(meta/classes/image.bbclass)
	or > > (re)add check in meta/lib/oe/rootfs.py? > > > Having just
	tripped over this myself,
	I think we should re-add the > check. I was going to post
	a reply to the original patch submission > email but for some reason I
	can't find it in either my inbox or the > web archive. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	0.0 HTML_MESSAGE           BODY: HTML included in message
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: image.bbclass: USE_DEVFS is now useless
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
X-List-Received-Date: Tue, 01 Apr 2014 17:48:38 -0000
Content-Type: multipart/alternative; boundary="=-BdM0Ytch6jI2ewOsD/CI"

--=-BdM0Ytch6jI2ewOsD/CI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-01 at 18:44 +0100, Phil Blundell wrote:

> On Wed, 2014-02-26 at 11:11 +0000, Matthieu CRAPET wrote: 
> 
> > Setting IMAGE_DEVICE_TABLE or IMAGE_DEVICE_TABLES to empty string in
> > an image recipe works (makedevs is not called)
> > 
> >  
> > 
> > Should be we drop USE_DEVFS variable (meta/classes/image.bbclass) or
> > (re)add check in meta/lib/oe/rootfs.py?
> 
> 
> Having just tripped over this myself, I think we should re-add the
> check.   I was going to post a reply to the original patch submission
> email but for some reason I can't find it in either my inbox or the
> web archive.


Also note that the default for USE_DEVFS was (and is) 1, so the lack of
this check is actually causing a difference in the default behaviour.
If there's no appetite for reinstating the USE_DEVFS mechanism per se
then it seems like it would be a good idea to make the default
IMAGE_DEVICE_TABLE be blank in order to restore the previous default of
no /dev in the rootfs.  

At present you get a somewhat arbitrary-seeming smattering of devices
from meta/files/device_table-minimal.txt, including such anachronisms
as /dev/ttySA0 and /dev/apm_bios.  It's hard to imagine that anybody
actually wants this stuff in their rootfs in this day and age.

p.


--=-BdM0Ytch6jI2ewOsD/CI
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.6.6">
</HEAD>
<BODY LINK="#0000ff">
On Tue, 2014-04-01 at 18:44 +0100, Phil Blundell wrote:<BR>
<BLOCKQUOTE TYPE=CITE>
    On Wed, 2014-02-26 at 11:11 +0000, Matthieu CRAPET wrote: <BR>
    <BLOCKQUOTE TYPE=CITE>
        Setting IMAGE_DEVICE_TABLE or IMAGE_DEVICE_TABLES to empty string in an image recipe works (makedevs is not called)<BR>
        <BR>
        &nbsp;<BR>
        <BR>
        Should be we drop USE_DEVFS variable (meta/classes/image.bbclass) or (re)add check in meta/lib/oe/rootfs.py?<BR>
    </BLOCKQUOTE>
    <BR>
    Having just tripped over this myself, I think we should re-add the check.&nbsp;&nbsp; I was going to post a reply to the original patch submission email but for some reason I can't find it in either my inbox or the web archive.<BR>
</BLOCKQUOTE>
<BR>
Also note that the default for USE_DEVFS was (and is) 1, so the lack of this check is actually causing a difference in the default behaviour.&nbsp; If there's no appetite for reinstating the USE_DEVFS mechanism per se then it seems like it would be a good idea to make the default IMAGE_DEVICE_TABLE be blank in order to restore the previous default of no /dev in the rootfs.&nbsp; <BR>
<BR>
At present you get a somewhat arbitrary-seeming smattering of devices from meta/files/device_table-minimal.txt, including such anachronisms as /dev/ttySA0 and /dev/apm_bios.&nbsp; It's hard to imagine that anybody actually wants this stuff in their rootfs in this day and age.<BR>
<BR>
p.<BR>
<BR>
</BODY>
</HTML>

--=-BdM0Ytch6jI2ewOsD/CI--
