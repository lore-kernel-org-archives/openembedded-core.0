Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 341016F92F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:44:01 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WV2jB-0004ez-SH; Tue, 01 Apr 2014 19:44:02 +0200
Message-ID: <1396374241.5879.50.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
Date: Tue, 01 Apr 2014 18:44:01 +0100
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B575445A7@COSNADEXC13.usr.ingenico.loc>
References: <8672BB614B4CCA40A6B3BDD6FD82050B575445A7@COSNADEXC13.usr.ingenico.loc>
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
	Content preview:  On Wed, 2014-02-26 at 11:11 +0000,
	Matthieu CRAPET wrote:
	> Setting IMAGE_DEVICE_TABLE or IMAGE_DEVICE_TABLES to empty string in
	> an
	image recipe works (makedevs is not called) > > > > Should be we drop
	USE_DEVFS
	variable (meta/classes/image.bbclass) or > (re)add check in
	meta/lib/oe/rootfs.py? [...] 
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
X-List-Received-Date: Tue, 01 Apr 2014 17:44:03 -0000
Content-Type: multipart/alternative; boundary="=-LJVpWtSEyqQx2lOlZzid"

--=-LJVpWtSEyqQx2lOlZzid
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-02-26 at 11:11 +0000, Matthieu CRAPET wrote:
> Setting IMAGE_DEVICE_TABLE or IMAGE_DEVICE_TABLES to empty string in
> an image recipe works (makedevs is not called)
> 
>  
> 
> Should be we drop USE_DEVFS variable (meta/classes/image.bbclass) or
> (re)add check in meta/lib/oe/rootfs.py?


Having just tripped over this myself, I think we should re-add the
check.   I was going to post a reply to the original patch submission
email but for some reason I can't find it in either my inbox or the web
archive.

p.



--=-LJVpWtSEyqQx2lOlZzid
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.6.6">
</HEAD>
<BODY LINK="#0000ff">
On Wed, 2014-02-26 at 11:11 +0000, Matthieu CRAPET wrote:
<BLOCKQUOTE TYPE=CITE>
    Setting IMAGE_DEVICE_TABLE or IMAGE_DEVICE_TABLES to empty string in an image recipe works (makedevs is not called)<BR>
    <BR>
    &nbsp;<BR>
    <BR>
    Should be we drop USE_DEVFS variable (meta/classes/image.bbclass) or (re)add check in meta/lib/oe/rootfs.py?<BR>
</BLOCKQUOTE>
<BR>
Having just tripped over this myself, I think we should re-add the check.&nbsp;&nbsp; I was going to post a reply to the original patch submission email but for some reason I can't find it in either my inbox or the web archive.<BR>
<BR>
p.<BR>
<BR>
<BR>
</BODY>
</HTML>

--=-LJVpWtSEyqQx2lOlZzid--
