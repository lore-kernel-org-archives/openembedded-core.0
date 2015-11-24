Return-Path: <petter@technux.se>
Received: from bin-vsp-out-05.atm.binero.net (vsp-unauthed02.binero.net
	[195.74.38.227])
	by mail.openembedded.org (Postfix) with ESMTP id EA4B160617
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 10:09:00 +0000 (UTC)
X-Halon-ID: 6bbcd686-9293-11e5-8d6c-005056916f53
Authorized-sender: petter@technux.se
Received: from webmail.binero.se (unknown [195.74.38.9])
	by bin-vsp-out-05.atm.binero.net (Halon Mail Gateway) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 11:09:17 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 24 Nov 2015 11:08:59 +0100
From: =?UTF-8?Q?Petter_Mab=C3=A4cker?= <petter@technux.se>
To: <openembedded-core@lists.openembedded.org>
Organization: Technux
Reply-To: <petter@technux.se>
Mail-Reply-To: <petter@technux.se>
In-Reply-To: <e67a765e5459944639f385cf17fb824d@technux.se>
References: <cover.1448358455.git.petter@technux.se>
	<e67a765e5459944639f385cf17fb824d@technux.se>
Message-ID: <c5e237612049e8ef408f97f5fdebceff@technux.se>
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
X-List-Received-Date: Tue, 24 Nov 2015 10:09:03 -0000
Content-Type: multipart/alternative;
	boundary="=_dfa7bd6d628f0b5c1539c67d8a23c631"

--=_dfa7bd6d628f0b5c1539c67d8a23c631
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8

 

Hi again.... 

It seems it was the cc mail send-pull-request sent me
that fooled me (the tag was missing there)... But everyrhing seems to be
in order so plz go ahead and review this serie after all =) 

Sorry for
the confusion.. 

Petter Mabäcker

Technux
<petter@technux.se>
www.technux.se

2015-11-24 11:00 skrev Petter
Mabäcker: 

> Hi all, 
> 
> I can see that I missed the [OE-core] tag in
this patch-serie... Please ignore this patchset and I will send up a
proper one shortly. 
> 
> BR Petter 
> 
> Petter Mabäcker
> 
> Technux
<petter@technux.se>
> www.technux.se
> 
> 2015-11-24 10:50 skrev Petter
Mabäcker: 
> 
>> The following changes since commit
1b25a70991589ed1f123015c16ee4806c46e3199:
>> 
>> yocto-project-qs,
ref-manual, poky.ent: CentOS Package updates (2015-11-18 16:42:22
+0000)
>> 
>> are available in the git repository at:
>> 
>>
git://git.yoctoproject.org/poky-contrib petmab/bug8451
>>
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/bug8451
[1]
>> 
>> Petter Mabäcker (2):
>> readline: prepare for readline6.3
upstream patches
>> readline: apply missing upstream patches
>> 
>>
.../readline/{files => readline-6.3}/norpath.patch | 0
>>
.../readline-6.3/readline-cve-2014-2524.patch | 43
----------------------
>>
.../readline-6.3/readline-dispatch-multikey.patch | 32
----------------
>> meta/recipes-core/readline/readline.inc | 5 +--
>>
meta/recipes-core/readline/readline_6.3.bb | 30 ++++++++++++++-
>> 5
files changed, 29 insertions(+), 81 deletions(-)
>> rename
meta/recipes-core/readline/{files => readline-6.3}/norpath.patch
(100%)
>> delete mode 100644
meta/recipes-core/readline/readline-6.3/readline-cve-2014-2524.patch
>>
delete mode 100644
meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch



Links:
------
[1]
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/bug8451

--=_dfa7bd6d628f0b5c1539c67d8a23c631
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html><body style=3D'font-family: Helvetica,Arial,sans-serif'>
<p>Hi again....</p>
<p>It seems it was the cc mail send-pull-request sent me that fooled me (th=
e tag was missing there)... But everyrhing seems to be in order so plz go a=
head and review this serie after all =3D)</p>
<p>Sorry for the confusion..</p>
<p>&nbsp;</p>
<div>
<pre>Petter Mab&auml;cker

Technux &lt;petter@technux.se&gt;
www.technux.se</pre>
</div>
<p>2015-11-24 11:00 skrev Petter Mab&auml;cker:</p>
<blockquote type=3D"cite" style=3D"padding-left:5px; border-left:#1010ff 2p=
x solid; margin-left:5px; width:100%"><!-- html ignored --><!-- head ignore=
d --><!-- meta ignored -->
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
<blockquote style=3D"padding-left: 5px; border-left: #1010ff  2px  solid; m=
argin-left: 5px; width: 100%;">
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
</blockquote>
</body></html>

--=_dfa7bd6d628f0b5c1539c67d8a23c631--
