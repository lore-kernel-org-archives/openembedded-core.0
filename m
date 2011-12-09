Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RZ5rD-00065B-UD
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:11:44 +0100
Received: from mail-qw0-f45.google.com ([209.85.216.45])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 09 Dec 2011 11:03:47 -0800
Received: by qadz30 with SMTP id z30so1781104qad.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:03:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.237.5 with SMTP id uy5mr4438376igc.50.1323457424332; Fri,
	09 Dec 2011 11:03:44 -0800 (PST)
Received: by 10.50.66.2 with HTTP; Fri, 9 Dec 2011 11:03:44 -0800 (PST)
In-Reply-To: <6586493.ofj4pSsnLf@helios>
References: <4EE1DE55.1040303@emagii.com> <1426848.m8dnn0MDvm@helios>
	<4EE1E350.4010304@emagii.com> <6586493.ofj4pSsnLf@helios>
Date: Fri, 9 Dec 2011 11:03:44 -0800
Message-ID: <CAPhnLPC9x99sO07yMQGJCoC+MLQBvT6WWUn6T88ap+GnNOYhpQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: ulf@emagii.com, openembedded-core@lists.openembedded.org
Subject: Re: Change in "openembedded-core/meta/files/common-licenses/LGPL-2.0" breaks opie-image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Dec 2011 19:11:44 -0000
Content-Type: multipart/alternative; boundary=f46d044787fba7198804b3ad7124

--f46d044787fba7198804b3ad7124
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 9, 2011 at 2:40 AM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> On Friday 09 December 2011 11:30:40 Ulf Samuelsson wrote:
> > I think someone needs to sit down and do this in a structured manner.
> > A number of license files were modified.
> > For each file, the old checksum needs to be searched for in the tree,
> > and the license modified.
>
> In case it wasn't clear I'm actually doing something which is not
> recommended
> in meta-opie since it provides none of the protection of LIC_FILES_CHKSUM
> and
> no small amount of fragility, as we have discovered. Nobody should really
> be
> doing this if they can possibly avoid it, and if they are then they
> shouldn't
> be too surprised when things break.
>

Yes, I would suggest not pointing to the common-license directory as your
LIC_FILES_CHECKSUM for a number of reasons, least of which is if one
license text changes, things break. I would structure those recipes similar
to gettext-native, by having the license in the recipe itself. And while
the way it's structured is legitimate, it's probably not a good idea as
eventually, we should be pulling those licenses at build time from the
upstream provider of base OSI compliant licenses, spdx.org and overlaying
them on top of any non-OSI compliant licenses we maintain (Adobe,
FSF-Unlimited...).

-b


> FWIW, none of the recipes in OE-core itself (nor meta-oe for that matter)
> refer to files in the common license directory - I just checked.
>

>
>
> A grep for "LICENSE =" should reveal offending recipes with "<recipe1>
> > && <recipe2>"
> > or "<recipe1>/<recipe2>" etc.
>
> This is a separate issue.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

-b

-- 
Elizabeth Flanagan
Yocto Project
Build and Release

--f46d044787fba7198804b3ad7124
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Fri, Dec 9, 2011 at 2:40 AM, Paul Egg=
leton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com=
">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid=
 rgb(204, 204, 204); padding-left: 1ex;">
<div class=3D"im">On Friday 09 December 2011 11:30:40 Ulf Samuelsson wrote:=
<br>
&gt; I think someone needs to sit down and do this in a structured manner.<=
br>
&gt; A number of license files were modified.<br>
&gt; For each file, the old checksum needs to be searched for in the tree,<=
br>
&gt; and the license modified.<br>
<br>
</div>In case it wasn&#39;t clear I&#39;m actually doing something which is=
 not recommended<br>
in meta-opie since it provides none of the protection of LIC_FILES_CHKSUM a=
nd<br>
no small amount of fragility, as we have discovered. Nobody should really b=
e<br>
doing this if they can possibly avoid it, and if they are then they shouldn=
&#39;t<br>
be too surprised when things break.<br></blockquote><div><br>Yes, I would s=
uggest not pointing to the common-license directory as your LIC_FILES_CHECK=
SUM for a number of reasons, least of which is if one license text changes,=
 things break. I would structure those recipes similar to gettext-native, b=
y having the license in the recipe itself. And while the way it&#39;s struc=
tured is legitimate, it&#39;s probably not a good idea as eventually, we sh=
ould be pulling those licenses at build time from the upstream provider of =
base OSI compliant licenses, <a href=3D"http://spdx.org">spdx.org</a> and o=
verlaying them on top of any non-OSI compliant licenses we maintain (Adobe,=
 FSF-Unlimited...).<br>
<br>-b<br>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0=
pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;=
">
FWIW, none of the recipes in OE-core itself (nor meta-oe for that matter)<b=
r>
refer to files in the common license directory - I just checked.<br></block=
quote><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex;=
 border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<div><br>=A0</div></blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); paddin=
g-left: 1ex;"><div class=3D"im">
&gt; A grep for &quot;LICENSE =3D&quot; should reveal offending recipes wit=
h &quot;&lt;recipe1&gt;<br>
&gt; &amp;&amp; &lt;recipe2&gt;&quot;<br>
&gt; or &quot;&lt;recipe1&gt;/&lt;recipe2&gt;&quot; etc.<br>
<br>
</div>This is a separate issue.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
Cheers,<br>
Paul<br>
<br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</div></div></blockquote></div><br>-b<br clear=3D"all"><br>-- <br>Elizabeth=
 Flanagan<br>Yocto Project<br>Build and Release<br>

--f46d044787fba7198804b3ad7124--
