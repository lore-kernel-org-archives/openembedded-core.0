Return-Path: <petter@technux.se>
Received: from bin-vsp-out-04.atm.binero.net (bin-mail-out-05.binero.net
	[195.74.38.228])
	by mail.openembedded.org (Postfix) with ESMTP id 334C0600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 11:23:53 +0000 (UTC)
X-Halon-ID: b6267c6a-6c1c-11e5-bfe4-005056917c0c
Authorized-sender: petter@technux.se
Received: from webmail.binero.se (unknown [195.74.38.9])
	by bin-vsp-out-04.atm.binero.net (Halon Mail Gateway) with ESMTPA;
	Tue,  6 Oct 2015 13:23:47 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 06 Oct 2015 13:23:49 +0200
From: =?UTF-8?Q?Petter_Mab=C3=A4cker?= <petter@technux.se>
To: "Burton, Ross" <ross.burton@intel.com>
Organization: Technux
Mail-Reply-To: <petter@technux.se>
In-Reply-To: <CAJTo0LZjxvCgVLFGVhn0O2PCWTGYFOM46zZ7KG_tqOZgzd9xgQ@mail.gmail.com>
References: <cover.1413452836.git.kai.kang@windriver.com>
	<6958f500cac37c3534a9f58a8bc7b90cc4c94b7f.1413452836.git.kai.kang@windriver.com>
	<b64576e3c49076498b7cfb0cbf9f3963@technux.se>
	<CAJTo0LZjxvCgVLFGVhn0O2PCWTGYFOM46zZ7KG_tqOZgzd9xgQ@mail.gmail.com>
Message-ID: <fb59210fb91a5209c3d3ce6dbce38ff1@technux.se>
X-Sender: petter@technux.se
User-Agent: Binero Webmail/0.8.4
Cc: Openembedded core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] readline: Security Advisory - readline - CVE-2014-2524
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: petter@technux.se
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Oct 2015 11:23:56 -0000
Content-Type: multipart/alternative;
	boundary="=_39cd2bb7a5fc08cba45fa2c98b9a1573"

--=_39cd2bb7a5fc08cba45fa2c98b9a1573
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8

 

Petter Mabäcker

Technux
<petter@technux.se>
www.technux.se

2015-10-06 12:06 skrev Burton, Ross:


> On 6 October 2015 at 09:11, Petter Mabäcker <petter@technux.se>
wrote:
> 
>> I played around with the new meta-security-isafw layer and
the cve-check-tool. In readline the cve CVE-2014-2524 is marked as
'missing' by the framework and I was confused to start with, since I saw
that this commit was included. But after looking at the actual patch I
realized that it only contains a report and not the patch itself. My
question is if that is with purpose and due to some decision that the
CVE isn't really causing any harm or if it's by mistake?
> 
> As can be
seen at
http://lists.gnu.org/archive/html/bug-readline/2014-03/msg00057.html [1]
the CVE patch is simply adding a #if defined (DEBUG), which is in the
patch included in oe-core master as readline-6.3/readline63-003. 
> 
>
The tool is probably reporting it as missing as -- if i recall correctly
-- it identifies CVE patches by filename. 
> 
> Ross

Hi Ross, 

That is
correct that the isafw layer assumes that it's named *cve*.patch in
order to understand that it's patched in a separate step. But what I
really meant was that the file readline63-003 just contains information
about the CVE and how to patch the source. It will never be applied on
the source, it is just copied to the WORKDIR. 

$ pwd

~BUILDDIR/tmp/work/core2-64-poky-linux/readline/6.3-r0 
$ls

build
configure-fix.patch norpath.patch readline63-003
temp
config-dirent-symbols.patch configure.sstate readline-6.3
readline-dispatch-multikey.patch
$ grep DEBUG readline-6.3/util.c
$ echo
$?
1

 The patch must be applied by something/someone.. For example
Debian solves it by doing their own .diff patch
(http://http.debian.net/debian/pool/main/r/readline6/readline6_6.3-8.debian.tar.xz).
I can send a suggestion about how to solve this in a proper way. 

BR
Petter 

Links:
------
[1]
http://lists.gnu.org/archive/html/bug-readline/2014-03/msg00057.html

--=_39cd2bb7a5fc08cba45fa2c98b9a1573
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html><body style=3D'font-family: Helvetica,Arial,sans-serif'>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div>
<pre>Petter Mab&auml;cker

Technux &lt;petter@technux.se&gt;
www.technux.se</pre>
</div>
<p>2015-10-06 12:06 skrev Burton, Ross:</p>
<blockquote type=3D"cite" style=3D"padding-left:5px; border-left:#1010ff 2p=
x solid; margin-left:5px; width:100%"><!-- html ignored --><!-- head ignore=
d --><!-- meta ignored -->
<div dir=3D"ltr">
<div class=3D"gmail_extra"><br />
<div class=3D"gmail_quote">On 6 October 2015 at 09:11, Petter Mab&auml;cker=
 <span>&lt;<a href=3D"mailto:petter@technux.se">petter@technux.se</a>&gt;</=
span> wrote:<br />
<blockquote class=3D"gmail_quote" style=3D"margin: 0px  0px  0px  0.8ex; bo=
rder-left-width: 1px; border-left-color: #cccccc; border-left-style: solid;=
 padding-left: 1ex;">
<p>I played around with the new meta-security-isafw layer and the cve-check=
-tool. In readline the cve CVE-2014-2524 is marked as 'missing' by the fram=
ework and I was confused to start with, since I saw that this commit was in=
cluded. But after looking at the actual patch I realized that it only conta=
ins a report and not the patch itself. My question is if that is with purpo=
se and due to some decision that the CVE isn't really causing any harm or i=
f it's by mistake?</p>
<p>&nbsp;</p>
</blockquote>
</div>
<br />As can be seen at <a href=3D"http://lists.gnu.org/archive/html/bug-re=
adline/2014-03/msg00057.html">http://lists.gnu.org/archive/html/bug-readlin=
e/2014-03/msg00057.html</a> the CVE patch is simply adding a #if defined (D=
EBUG), which is in the patch included in oe-core master as&nbsp;readline-6=
=2E3/readline63-003.</div>
<div class=3D"gmail_extra">&nbsp;</div>
<div class=3D"gmail_extra">The tool is probably reporting it as missing as =
-- if i recall correctly -- it identifies CVE patches by filename.</div>
<div class=3D"gmail_extra">&nbsp;</div>
<div class=3D"gmail_extra">Ross</div>
</div>
<div dir=3D"ltr">&nbsp; </div>
</blockquote>
<div dir=3D"ltr">&nbsp;</div>
<div dir=3D"ltr">Hi Ross,</div>
<div dir=3D"ltr">&nbsp;</div>
<div dir=3D"ltr">That is correct that the isafw layer assumes that it's nam=
ed *cve*.patch in order to understand that it's patched in a separate step=
=2E But what I really meant was that the file readline63-003 just contains =
information about the CVE and how to patch the source. It will never be app=
lied on the source, it is just copied to the WORKDIR.</div>
<div dir=3D"ltr">&nbsp;</div>
<div dir=3D"ltr">&nbsp;</div>
<div dir=3D"ltr">$ pwd</div>
<div dir=3D"ltr">~BUILDDIR/tmp/work/core2-64-poky-linux/readline/6.3-r0</di=
v>
<div dir=3D"ltr">$ls<br />
<div class=3D"gmail_extra">build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; configure-fix.patch&nbsp; norpath.patch&nbsp; readline=
63-003&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; temp<br />config-dirent-symbo=
ls.patch&nbsp; configure.sstate&nbsp;&nbsp;&nbsp;&nbsp; readline-6.3&nbsp;&=
nbsp; readline-dispatch-multikey.patch<br />$ grep DEBUG readline-6.3/util=
=2Ec<br />$ echo $?<br />1<br /><br /></div>
<div class=3D"gmail_extra">&nbsp;The patch must be applied by something/som=
eone.. For example Debian solves it by doing their own .diff patch (http://=
http.debian.net/debian/pool/main/r/readline6/readline6_6.3-8.debian.tar.xz)=
=2E I can send a suggestion about how to solve this in a proper way.</div>
<div class=3D"gmail_extra">&nbsp;</div>
<div class=3D"gmail_extra">BR Petter</div>
</div>
</body></html>

--=_39cd2bb7a5fc08cba45fa2c98b9a1573--
