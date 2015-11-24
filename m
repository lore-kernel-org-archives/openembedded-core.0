Return-Path: <petter@technux.se>
Received: from bin-vsp-out-05.atm.binero.net (bin-mail-out-06.binero.net
	[195.74.38.229])
	by mail.openembedded.org (Postfix) with ESMTP id 5C2CF6018D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 10:00:31 +0000 (UTC)
X-Halon-ID: 3a98530b-9292-11e5-8d6c-005056916f53
Authorized-sender: petter@technux.se
Received: from webmail.binero.se (unknown [195.74.38.9])
	by bin-vsp-out-05.atm.binero.net (Halon Mail Gateway) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 11:00:45 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 24 Nov 2015 11:00:27 +0100
From: =?UTF-8?Q?Petter_Mab=C3=A4cker?= <petter@technux.se>
To: Openembedded core <openembedded-core@lists.openembedded.org>
Organization: Technux
Reply-To: <petter@technux.se>
Mail-Reply-To: <petter@technux.se>
In-Reply-To: <cover.1448358455.git.petter@technux.se>
References: <cover.1448358455.git.petter@technux.se>
Message-ID: <e67a765e5459944639f385cf17fb824d@technux.se>
X-Sender: petter@technux.se
User-Agent: Binero Webmail/0.8.4
Subject: Re: [PATCH 0/2]: readline fixes
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
X-List-Received-Date: Tue, 24 Nov 2015 10:00:35 -0000
Content-Type: multipart/alternative;
	boundary="=_88aa66c0816adbf77b553d3594f45fb6"

--=_88aa66c0816adbf77b553d3594f45fb6
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8

 

Hi all, 

I can see that I missed the [OE-core] tag in this
patch-serie... Please ignore this patchset and I will send up a proper
one shortly. 

BR Petter 

Petter Mabäcker

Technux
<petter@technux.se>
www.technux.se

2015-11-24 10:50 skrev Petter
Mabäcker: 

> The following changes since commit
1b25a70991589ed1f123015c16ee4806c46e3199:
> 
> yocto-project-qs,
ref-manual, poky.ent: CentOS Package updates (2015-11-18 16:42:22
+0000)
> 
> are available in the git repository at:
> 
>
git://git.yoctoproject.org/poky-contrib petmab/bug8451
>
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/bug8451
[1]
> 
> Petter Mabäcker (2):
> readline: prepare for readline6.3
upstream patches
> readline: apply missing upstream patches
> 
>
.../readline/{files => readline-6.3}/norpath.patch | 0
>
.../readline-6.3/readline-cve-2014-2524.patch | 43
----------------------
>
.../readline-6.3/readline-dispatch-multikey.patch | 32
----------------
> meta/recipes-core/readline/readline.inc | 5 +--
>
meta/recipes-core/readline/readline_6.3.bb | 30 ++++++++++++++-
> 5
files changed, 29 insertions(+), 81 deletions(-)
> rename
meta/recipes-core/readline/{files => readline-6.3}/norpath.patch
(100%)
> delete mode 100644
meta/recipes-core/readline/readline-6.3/readline-cve-2014-2524.patch
>
delete mode 100644
meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch



Links:
------
[1]
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/bug8451

--=_88aa66c0816adbf77b553d3594f45fb6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html><body style=3D'font-family: Helvetica,Arial,sans-serif'>
<p>Hi all,</p>
<p>I can see that I missed the [OE-core] tag in this patch-serie... Please =
ignore this patchset and I will send up a proper one shortly.</p>
<p>BR Petter</p>
<p>&nbsp;</p>
<div>
<pre>Petter Mab&auml;cker

Technux &lt;petter@technux.se&gt;
www.technux.se</pre>
</div>
<p>2015-11-24 10:50 skrev Petter Mab&auml;cker:</p>
<blockquote type=3D"cite" style=3D"padding-left:5px; border-left:#1010ff 2p=
x solid; margin-left:5px; width:100%"><!-- html ignored --><!-- head ignore=
d --><!-- meta ignored -->
<pre>The following changes since commit 1b25a70991589ed1f123015c16ee4806c46=
e3199:

  yocto-project-qs, ref-manual, poky.ent: CentOS Package updates (2015-11-1=
8 16:42:22 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib petmab/bug8451
  <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dpet=
mab/bug8451">http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dpet=
mab/bug8451</a>

Petter Mab&auml;cker (2):
  readline: prepare for readline6.3 upstream patches
  readline: apply missing upstream patches

 .../readline/{files =3D&gt; readline-6.3}/norpath.patch |  0
 .../readline-6.3/readline-cve-2014-2524.patch      | 43 ------------------=
----
 .../readline-6.3/readline-dispatch-multikey.patch  | 32 ----------------
 meta/recipes-core/readline/readline.inc            |  5 +--
 meta/recipes-core/readline/readline_6.3.bb         | 30 ++++++++++++++-
 5 files changed, 29 insertions(+), 81 deletions(-)
 rename meta/recipes-core/readline/{files =3D&gt; readline-6.3}/norpath.pat=
ch (100%)
 delete mode 100644 meta/recipes-core/readline/readline-6.3/readline-cve-20=
14-2524.patch
 delete mode 100644 meta/recipes-core/readline/readline-6.3/readline-dispat=
ch-multikey.patch
</pre>
</blockquote>
</body></html>

--=_88aa66c0816adbf77b553d3594f45fb6--
