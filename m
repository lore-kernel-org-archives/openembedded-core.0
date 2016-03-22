Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 02AD960125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 23:09:37 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=e130-2.local) by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1aiVQc-0002fv-S4; Wed, 23 Mar 2016 00:09:35 +0100
Message-ID: <1458688168.2038.41.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Mar 2016 23:09:28 +0000
In-Reply-To: <CAJTo0LYKCiNA73zWkvXCHSz8-sWKQ4oAbQnqkyCZubf4BJ-xJA@mail.gmail.com>
References: <1458670391-26915-1-git-send-email-sgw@linux.intel.com>
	<1458670391-26915-5-git-send-email-sgw@linux.intel.com>
	<CAJTo0LYn1aCCqk5=QV1iug+Zqz1s-=c2iF=mhZSaU6EOPAeR4A@mail.gmail.com>
	<1458683790.18406.33.camel@linux.intel.com>
	<CAJTo0LYKCiNA73zWkvXCHSz8-sWKQ4oAbQnqkyCZubf4BJ-xJA@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] linux-firmware: Break out some additional firmware
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
X-List-Received-Date: Tue, 22 Mar 2016 23:09:38 -0000
Content-Type: multipart/alternative; boundary="=-mCpiqDASsd/KElyH3q/2"

--=-mCpiqDASsd/KElyH3q/2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-03-22 at 22:37 +0000, Burton, Ross wrote:
> 
> 
> On 22 March 2016 at 21:56, Saul Wold <sgw@linux.intel.com> wrote:
> 
>         > | linux-firmware-iwlwifi-7265D
>         > | *** Error: Package name  contains illegal characters,
>         (other than
>         > [a-z0-9.+-])
>         >
>         Gah, no CAPS?  Sorry I did not do the full package specturm
>         tests.
>         
> 
> 
> Yeah...  tempting to file a bug against opkg!


That restriction comes from opkg's Debian roots.  See:

https://www.debian.org/doc/debian-policy/ch-controlfields.html#s-f-Source

"Package names (both source and binary, see Package, Section 5.6.7) must
consist only of lower case letters (a-z), digits (0-9), plus (+) and
minus (-) signs, and periods (.). They must be at least two characters
long and must start with an alphanumeric character."

So, I don't think that filing against opkg is likely to produce any
useful result because the opkg maintainer will probably argue
(correctly) that it is operating as designed.  On the other hand,
there's no reason that package_ipk couldn't be taught how to massage
otherwise-illegal package names into a format that opkg-build will
accept, and I think there might even be some precedent for that sort of
thing in OE already.

But on the third hand, we've lived with this restriction for more than a
decade, we don't seem to have exhausted the namespace of lower-case
letters, and I haven't seen any other particularly compelling reason for
wanting to use capitals in package names.  So personally I would leave
it alone.

p.


--=-mCpiqDASsd/KElyH3q/2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.8.5">
</HEAD>
<BODY>
On Tue, 2016-03-22 at 22:37 +0000, Burton, Ross wrote:
<BLOCKQUOTE TYPE=CITE>
    <BR>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    On 22 March 2016 at 21:56, Saul Wold &lt;<A HREF="mailto:sgw@linux.intel.com">sgw@linux.intel.com</A>&gt; wrote:<BR>
    <BLOCKQUOTE>
        &gt; | linux-firmware-iwlwifi-7265D<BR>
        &gt; | *** Error: Package name &nbsp;contains illegal characters, (other than<BR>
        &gt; [a-z0-9.+-])<BR>
        &gt;<BR>
        Gah, no CAPS?&nbsp; Sorry I did not do the full package specturm tests.
    </BLOCKQUOTE>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    <BR>
    <BR>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    Yeah...&nbsp; tempting to file a bug against opkg!<BR>
</BLOCKQUOTE>
<BR>
That restriction comes from opkg's Debian roots.&nbsp; See:<BR>
<BR>
https://www.debian.org/doc/debian-policy/ch-controlfields.html#s-f-Source
<BR>
&quot;Package names (both source and binary, see <A HREF="https://www.debian.org/doc/debian-policy/ch-controlfields.html#s-f-Package">Package</A><A HREF="https://www.debian.org/doc/debian-policy/ch-controlfields.html#s-f-Package">, Section 5.6.7</A>) must consist only of lower case letters (a-z), digits (0-9), plus (+) and minus (-) signs, and periods (.). They must be at least two characters long and must start with an alphanumeric character.&quot;<BR>
<BR>
So, I don't think that filing against opkg is likely to produce any useful result because the opkg maintainer will probably argue (correctly) that it is operating as designed.&nbsp; On the other hand, there's no reason that package_ipk couldn't be taught how to massage otherwise-illegal package names into a format that opkg-build will accept, and I think there might even be some precedent for that sort of thing in OE already.<BR>
<BR>
But on the third hand, we've lived with this restriction for more than a decade, we don't seem to have exhausted the namespace of lower-case letters, and I haven't seen any other particularly compelling reason for wanting to use capitals in package names.&nbsp; So personally I would leave it alone.<BR>
<BR>
p.<BR>
<BR>
</BODY>
</HTML>

--=-mCpiqDASsd/KElyH3q/2--
