Return-Path: <petter@technux.se>
X-Greylist: delayed 364 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 04 Mar 2016 15:23:31 UTC
Received: from bin-vsp-out-02.atm.binero.net (bin-mail-out-05.binero.net
	[195.74.38.228])
	by mail.openembedded.org (Postfix) with ESMTP id 761A160762
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 15:23:31 +0000 (UTC)
X-Halon-ID: 31e66cad-e21c-11e5-afed-005056917f90
Authorized-sender: petter@technux.se
Received: from webmail.binero.se (unknown [195.74.38.9])
	by bin-vsp-out-02.atm.binero.net (Halon Mail Gateway) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 16:17:22 +0100 (CET)
MIME-Version: 1.0
Date: Fri, 04 Mar 2016 16:17:22 +0100
From: =?UTF-8?Q?Petter_Mab=C3=A4cker?= <petter@technux.se>
To: <openembedded-core@lists.openembedded.org>
Organization: Technux
Reply-To: <petter@technux.se>
Mail-Reply-To: <petter@technux.se>
In-Reply-To: <1456227383-9212-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1456227383-9212-1-git-send-email-markus.lehtonen@linux.intel.com>
Message-ID: <f27176154319caccabbb6a01ae183f5a@technux.se>
X-Sender: petter@technux.se
User-Agent: Binero Webmail/0.8.4
Subject: Re: [PATCH] Wipe ${S} before unpacking sources
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
X-List-Received-Date: Fri, 04 Mar 2016 15:23:33 -0000
Content-Type: multipart/alternative;
	boundary="=_9944125e1b572c29b7cb26ef2bf3d2c7"

--=_9944125e1b572c29b7cb26ef2bf3d2c7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8

 

2016-02-23 12:36 skrev Markus Lehtonen: 

> It would seem reasonable
that do_unpack() always results in a pristine source
> tree. This patch
causes ${S} to be removed before unpacking sources.
> 
> I didn't quite
understand what kind of "investigation" the following code
> comment in
do_unpack() was referring to:
> # TODO: Investigate if we can remove
> #
the entire ${S} in this case.
> What kind of special cases might we
have? At least qemux86 core-image-sato
> builds fine for me.

The text
isn't referring to any investigation already done. But me and Paul
Eggleton discussed this matter (removing entire ${S}, not just
{$S}/patches) within the scope of another bug. But since this wasn't
really the scope for that bug, the TODO was added instead. And happily
you have done the investigation and it's seems like ${S} might be able
to be removed in this case, after all :)

So please go ahead and you can
remove that TODO comment within the scope of this patch, since if this
change gets merged it's not relevant anymore..

BR Petter 

> [YOCTO
#9064] Markus Lehtonen (1): base.bbclass wipe ${S} before unpacking
source meta/classes/base.bbclass | 8 +++----- 1 file changed, 3
insertions(+), 5 deletions(-) -- 2.6.2

See inline comments. 

Petter
Mabäcker

Technux <petter@technux.se>
www.technux.se
 

--=_9944125e1b572c29b7cb26ef2bf3d2c7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html><body style=3D'font-family: Helvetica,Arial,sans-serif'>
<p>2016-02-23 12:36 skrev Markus Lehtonen:</p>
<blockquote type=3D"cite" style=3D"padding-left:5px; border-left:#1010ff 2p=
x solid; margin-left:5px; width:100%"><!-- html ignored --><!-- head ignore=
d --><!-- meta ignored -->
<pre>It would seem reasonable that do_unpack() always results in a pristine=
 source
tree. This patch causes ${S} to be removed before unpacking sources.

I didn't quite understand what kind of "investigation" the following code
comment in do_unpack() was referring to:
  # TODO: Investigate if we can remove
  # the entire ${S} in this case.
What kind of special cases might we have? At least qemux86 core-image-sato
builds fine for me.<br /><br />

</pre>
</blockquote>
<p>The text isn't referring to any investigation already done. But me and P=
aul Eggleton discussed this matter (removing entire ${S}, not just {$S}/pat=
ches) within the scope of another bug. But since this wasn't really the sco=
pe for that bug, the TODO was added instead. And happily you have done the =
investigation and it's seems like ${S} might be able to be removed in this =
case, after all :)<br /><br />So please go ahead and you can remove that TO=
DO comment within the scope of this patch, since if this change gets merged=
 it's not relevant anymore..<br /><br />BR Petter</p>
<blockquote type=3D"cite" style=3D"padding-left:5px; border-left:#1010ff 2p=
x solid; margin-left:5px; width:100%">[YOCTO #9064] Markus Lehtonen (1): ba=
se.bbclass wipe ${S} before unpacking source meta/classes/base.bbclass | 8 =
+++----- 1 file changed, 3 insertions(+), 5 deletions(-) <span class=3D"sig=
">-- 2.6.2 </span></blockquote>
<p>See inline comments.</p>
<div>
<pre>Petter Mab&auml;cker

Technux &lt;petter@technux.se&gt;
www.technux.se</pre>
</div>
</body></html>

--=_9944125e1b572c29b7cb26ef2bf3d2c7--
