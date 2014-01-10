Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE2C60CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 11:44:44 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1W1aW4-0006zW-Fu; Fri, 10 Jan 2014 12:44:44 +0100
Message-ID: <1389354283.9182.139.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 10 Jan 2014 11:44:43 +0000
In-Reply-To: <CAP9ODKo1LCoGuUG=0mpRMwctq06RwpaX_B=goEoO55b6YQwXHg@mail.gmail.com>
References: <1389266170.9182.122.camel@phil-desktop.brightsign>
	<CAP9ODKo1LCoGuUG=0mpRMwctq06RwpaX_B=goEoO55b6YQwXHg@mail.gmail.com>
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
	Content preview:  On Thu, 2014-01-09 at 12:10 -0200,
	Otavio Salvador wrote: > On Thu, Jan 9, 2014 at 9:16 AM,
	Phil Blundell <pb@pbcl.net> wrote: > > Although
	libsoup did use to support direct usage of libproxy,
	> it hasn't > done so for some time. Worse,
	if libsoup depends on libproxy > then it > is impossible
	to build libproxy against webkit since webkit > itself > depends on
	libsoup
	in some configurations. Fix this by > removing the > extraneous entry
	from
	DEPENDS. > > Signed-off-by: Phil Blundell <pb@pbcl.net> > > > > Does it
	need a --disable-libproxy or so? [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	0.0 HTML_MESSAGE           BODY: HTML included in message
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsoup: Remove libproxy from DEPENDS
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
X-List-Received-Date: Fri, 10 Jan 2014 11:44:44 -0000
Content-Type: multipart/alternative; boundary="=-i90y8yDgeU5VwXP3buz8"

--=-i90y8yDgeU5VwXP3buz8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-01-09 at 12:10 -0200, Otavio Salvador wrote:

> On Thu, Jan 9, 2014 at 9:16 AM, Phil Blundell <pb@pbcl.net> wrote:
> 
>         Although libsoup did use to support direct usage of libproxy,
>         it hasn't
>         done so for some time.  Worse, if libsoup depends on libproxy
>         then it
>         is impossible to build libproxy against webkit since webkit
>         itself
>         depends on libsoup in some configurations.  Fix this by
>         removing the
>         extraneous entry from DEPENDS.
>         
>         Signed-off-by: Phil Blundell <pb@pbcl.net>
>         
> 
> 
> Does it need a --disable-libproxy or so? 

No.   See the (old) NEWS:


        Changes in libsoup from 2.33.90 to 2.33.92:
        
                * LIBSOUP NO LONGER DEPENDS ON GCONF OR LIBPROXY.
                  (see below).
        
               * Updated SoupProxyResolverGNOME to be based on
                  SoupProxyResolverDefault, but explicitly requesting
        the
                  "gnome" GProxyResolver if it is available [#625898],
        and
                  removed the old code that used GConf and libproxy
        directly.
        

p.



--=-i90y8yDgeU5VwXP3buz8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.6.6">
</HEAD>
<BODY>
On Thu, 2014-01-09 at 12:10 -0200, Otavio Salvador wrote:
<BR>
<BLOCKQUOTE TYPE=CITE>
    On Thu, Jan 9, 2014 at 9:16 AM, Phil Blundell &lt;<A HREF="mailto:pb@pbcl.net">pb@pbcl.net</A>&gt; wrote:<BR>
    <BLOCKQUOTE>
        Although libsoup did use to support direct usage of libproxy, it hasn't<BR>
        done so for some time. &nbsp;Worse, if libsoup depends on libproxy then it<BR>
        is impossible to build libproxy against webkit since webkit itself<BR>
        depends on libsoup in some configurations. &nbsp;Fix this by removing the<BR>
        extraneous entry from DEPENDS.<BR>
        <BR>
        Signed-off-by: Phil Blundell &lt;<A HREF="mailto:pb@pbcl.net">pb@pbcl.net</A>&gt;
    </BLOCKQUOTE>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    <BR>
    <BR>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    Does it need a --disable-libproxy or so?&nbsp;
</BLOCKQUOTE>
<BR>
No.&nbsp;&nbsp; See the (old) NEWS:<BR>
<BR>
<BLOCKQUOTE>
    <TT>Changes in libsoup from 2.33.90 to 2.33.92:</TT><BR>
    <BR>
    <TT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * LIBSOUP NO LONGER DEPENDS ON GCONF OR LIBPROXY.</TT><BR>
    <TT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (see below).</TT><BR>
    <BR>
    <TT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Updated SoupProxyResolverGNOME to be based on</TT><BR>
    <TT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupProxyResolverDefault, but explicitly requesting the</TT><BR>
    <TT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;gnome&quot; GProxyResolver if it is available [#625898], and</TT><BR>
    <TT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; removed the old code that used GConf and libproxy directly.</TT><BR>
    <BR>
</BLOCKQUOTE>
p.<BR>
<BR>
<BR>
</BODY>
</HTML>

--=-i90y8yDgeU5VwXP3buz8--
