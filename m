Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 40348731D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 16:20:55 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id b62so628041iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 09:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n9cWtJkYqGJDh5Ybh/1NN1dc494KcGKZUmIZoDwYIks=;
	b=zmU/Fgu+VBf91ujJQc5Oq190+qhqBuTVdabPnTQl4WKqohmkF9/jVgirkgZefah/Or
	ZKDgbRIi/D2q9dE1f9/wM52BdrLYyyatLZC5OpAB7bj+3nJ1gbYAZtxi9TjgqkHgI+6Z
	N/iyU6KGJiAjWgOFmW1V49mZ623J1GMR+rB49aVS7MWwKY+WzaunBabkkPCNQMzZdlD8
	0UYgxgy8/CDp9CIqTN6LWNTIUIabHirX3UcMKv+ddrPXRd4geCknE1Xygr+ev6RjEa7D
	jfQw8eKlzou9mc0beHUCTvxCeDAjle3mrOPWK+M4D4TRGx3LSSZEzJMTig/oQ9nKys75
	LIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n9cWtJkYqGJDh5Ybh/1NN1dc494KcGKZUmIZoDwYIks=;
	b=GjATnEFPu/1rJ1jmdVXL1e5WDXyyUth5XaF9Q3COeHrJEK9FlL8uZsjUtdVSWEJIuw
	L0mbYK7Gbp55O/dOoboUN6vKLI1EW8ZdlYxyEB9p9oOapC4ZsBSVTe3BsGKW5KRTI+XH
	P2+gbNvS8hm7sWSVpz0t04UbfSXsCgWLXU+Dr/1N4UcRwvCfO5WYjBZ34bWk7AxEWGKV
	vmx4Wv3CpEnuoWNkqXTOvI2Lcvk7R1tvg8sxqdBOgW+VxltRYv1JB7duGVpS26R2jbRH
	dmY/u8cpFxnYdXvB7b5P6ExJQo5hpVj6A2InQIc9k5utShqiWAL32eapLRynLtLkRtWH
	+8IA==
X-Gm-Message-State: AEkooutDBGkwdWuBw/npCmjMqsweO05aOxS8QQeGNAblnDLKIEPpD7KhkaJ8eDCNA4K5nKjUTNdd8k1edSOE6bE+
X-Received: by 10.107.138.212 with SMTP id c81mr12290682ioj.148.1470932456218; 
	Thu, 11 Aug 2016 09:20:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 11 Aug 2016 09:20:35 -0700 (PDT)
In-Reply-To: <1470923804-25804-3-git-send-email-maxin.john@intel.com>
References: <1470923804-25804-1-git-send-email-maxin.john@intel.com>
	<1470923804-25804-3-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Aug 2016 17:20:35 +0100
Message-ID: <CAJTo0LbHi3wemcUzxOjfphP63Nd3az5oqCWGK==EepMJ6Q56mA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libpng: update 1.6.23 -> 1.6.24
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
X-List-Received-Date: Thu, 11 Aug 2016 16:20:57 -0000
Content-Type: multipart/alternative; boundary=001a113ed9328abaed0539ce2628

--001a113ed9328abaed0539ce2628
Content-Type: text/plain; charset=UTF-8

On 11 August 2016 at 14:56, Maxin B. John <maxin.john@intel.com> wrote:

> Updates in License files are due to changes in Copyright date
> and Version.
>

Always remember to run buildhistory-diff:

packages/corei7-64-poky-linux/libpng/libpng-dbg: RPROVIDES: removed all
items "libpng-dbg (['= 1.6.23'])"
  * PV changed from "1.6.23" to "1.6.24"
packages/corei7-64-poky-linux/libpng/libpng-dbg: PKG changed from
libpng16-dbg to libpng-dbg [default] - may indicate debian renaming failure
  * PV changed from "1.6.23" to "1.6.24"
packages/corei7-64-poky-linux/libpng/libpng-dev: RPROVIDES: removed all
items "libpng-dev (['= 1.6.23'])"
  * PV changed from "1.6.23" to "1.6.24"
packages/corei7-64-poky-linux/libpng/libpng-dev: PKG changed from
libpng16-dev to libpng-dev [default] - may indicate debian renaming failure
  * PV changed from "1.6.23" to "1.6.24"
packages/corei7-64-poky-linux/libpng/libpng-doc: RPROVIDES: removed all
items "libpng-doc (['= 1.6.23'])"
  * PV changed from "1.6.23" to "1.6.24"
packages/corei7-64-poky-linux/libpng/libpng-doc: PKG changed from
libpng16-doc to libpng-doc [default] - may indicate debian renaming failure
  * PV changed from "1.6.23" to "1.6.24"
packages/corei7-64-poky-linux/libpng/libpng-locale: RPROVIDES: removed all
items "libpng-locale (['= 1.6.23'])"
  * PV changed from "1.6.23" to "1.6.24"
packages/corei7-64-poky-linux/libpng/libpng-locale: PKG changed from
libpng16-locale to libpng-locale [default] - may indicate debian renaming
failure
  * PV changed from "1.6.23" to "1.6.24"
packages/corei7-64-poky-linux/libpng/libpng-staticdev: RPROVIDES: removed
all items "libpng-staticdev (['= 1.6.23'])"
  * PV changed from "1.6.23" to "1.6.24"
packages/corei7-64-poky-linux/libpng/libpng-staticdev: PKG changed from
libpng16-staticdev to libpng-staticdev [default] - may indicate debian
renaming failure
  * PV changed from "1.6.23" to "1.6.24"
packages/corei7-64-poky-linux/libpng/libpng-tools: RPROVIDES: removed all
items "libpng-tools (['= 1.6.23'])"
  * PV changed from "1.6.23" to "1.6.24"
packages/corei7-64-poky-linux/libpng/libpng-tools: PKG changed from
libpng16-tools to libpng-tools [default] - may indicate debian renaming
failure
  * PV changed from "1.6.23" to "1.6.24"
packages/corei7-64-poky-linux/libpng/libpng: FILELIST: removed
"/usr/lib/libpng16.so.16.23.0" added "/usr/lib/libpng16.so.16.24.0
/usr/bin/pngcp"
  * PV changed from "1.6.23" to "1.6.24"
packages/corei7-64-poky-linux/libpng/libpng: PKGSIZE changed from 206747 to
241683 (+16%)
  * PV changed from "1.6.23" to "1.6.24"
  * FILELIST: removed "/usr/lib/libpng16.so.16.23.0" added
"/usr/lib/libpng16.so.16.24.0 /usr/bin/pngcp"
packages/corei7-64-poky-linux/libpng/libpng: RPROVIDES: removed all items
"libpng (['= 1.6.23'])"
  * PV changed from "1.6.23" to "1.6.24"
packages/corei7-64-poky-linux/libpng/libpng: PKG changed from libpng16-16
to libpng [default] - may indicate debian renaming failure
  * PV changed from "1.6.23" to "1.6.24"

The relevant line is that PN added /usr/bin/pngcp, so the package is no
longer a library package.  This should be in PN-tools (which should use
FILES_PN-tools=${bindir} so this doesn't happen again).

Ross

--001a113ed9328abaed0539ce2628
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 August 2016 at 14:56, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"=
mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><div id=3D":l8" class=3D"">Updates in Li=
cense files are due to changes in Copyright date<br>
and Version.<br></div></blockquote></div><br>Always remember to run buildhi=
story-diff:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra"><div class=3D"gmail_extra">packages/corei7-64-poky-linux/libpng/libpn=
g-dbg: RPROVIDES: removed all items &quot;libpng-dbg ([&#39;=3D 1.6.23&#39;=
])&quot;</div><div class=3D"gmail_extra">=C2=A0 * PV changed from &quot;1.6=
.23&quot; to &quot;1.6.24&quot;</div><div class=3D"gmail_extra">packages/co=
rei7-64-poky-linux/libpng/libpng-dbg: PKG changed from libpng16-dbg to libp=
ng-dbg [default] - may indicate debian renaming failure</div><div class=3D"=
gmail_extra">=C2=A0 * PV changed from &quot;1.6.23&quot; to &quot;1.6.24&qu=
ot;</div><div class=3D"gmail_extra">packages/corei7-64-poky-linux/libpng/li=
bpng-dev: RPROVIDES: removed all items &quot;libpng-dev ([&#39;=3D 1.6.23&#=
39;])&quot;</div><div class=3D"gmail_extra">=C2=A0 * PV changed from &quot;=
1.6.23&quot; to &quot;1.6.24&quot;</div><div class=3D"gmail_extra">packages=
/corei7-64-poky-linux/libpng/libpng-dev: PKG changed from libpng16-dev to l=
ibpng-dev [default] - may indicate debian renaming failure</div><div class=
=3D"gmail_extra">=C2=A0 * PV changed from &quot;1.6.23&quot; to &quot;1.6.2=
4&quot;</div><div class=3D"gmail_extra">packages/corei7-64-poky-linux/libpn=
g/libpng-doc: RPROVIDES: removed all items &quot;libpng-doc ([&#39;=3D 1.6.=
23&#39;])&quot;</div><div class=3D"gmail_extra">=C2=A0 * PV changed from &q=
uot;1.6.23&quot; to &quot;1.6.24&quot;</div><div class=3D"gmail_extra">pack=
ages/corei7-64-poky-linux/libpng/libpng-doc: PKG changed from libpng16-doc =
to libpng-doc [default] - may indicate debian renaming failure</div><div cl=
ass=3D"gmail_extra">=C2=A0 * PV changed from &quot;1.6.23&quot; to &quot;1.=
6.24&quot;</div><div class=3D"gmail_extra">packages/corei7-64-poky-linux/li=
bpng/libpng-locale: RPROVIDES: removed all items &quot;libpng-locale ([&#39=
;=3D 1.6.23&#39;])&quot;</div><div class=3D"gmail_extra">=C2=A0 * PV change=
d from &quot;1.6.23&quot; to &quot;1.6.24&quot;</div><div class=3D"gmail_ex=
tra">packages/corei7-64-poky-linux/libpng/libpng-locale: PKG changed from l=
ibpng16-locale to libpng-locale [default] - may indicate debian renaming fa=
ilure</div><div class=3D"gmail_extra">=C2=A0 * PV changed from &quot;1.6.23=
&quot; to &quot;1.6.24&quot;</div><div class=3D"gmail_extra">packages/corei=
7-64-poky-linux/libpng/libpng-staticdev: RPROVIDES: removed all items &quot=
;libpng-staticdev ([&#39;=3D 1.6.23&#39;])&quot;</div><div class=3D"gmail_e=
xtra">=C2=A0 * PV changed from &quot;1.6.23&quot; to &quot;1.6.24&quot;</di=
v><div class=3D"gmail_extra">packages/corei7-64-poky-linux/libpng/libpng-st=
aticdev: PKG changed from libpng16-staticdev to libpng-staticdev [default] =
- may indicate debian renaming failure</div><div class=3D"gmail_extra">=C2=
=A0 * PV changed from &quot;1.6.23&quot; to &quot;1.6.24&quot;</div><div cl=
ass=3D"gmail_extra">packages/corei7-64-poky-linux/libpng/libpng-tools: RPRO=
VIDES: removed all items &quot;libpng-tools ([&#39;=3D 1.6.23&#39;])&quot;<=
/div><div class=3D"gmail_extra">=C2=A0 * PV changed from &quot;1.6.23&quot;=
 to &quot;1.6.24&quot;</div><div class=3D"gmail_extra">packages/corei7-64-p=
oky-linux/libpng/libpng-tools: PKG changed from libpng16-tools to libpng-to=
ols [default] - may indicate debian renaming failure</div><div class=3D"gma=
il_extra">=C2=A0 * PV changed from &quot;1.6.23&quot; to &quot;1.6.24&quot;=
</div><div class=3D"gmail_extra">packages/corei7-64-poky-linux/libpng/libpn=
g: FILELIST: removed &quot;/usr/lib/libpng16.so.16.23.0&quot; added &quot;/=
usr/lib/libpng16.so.16.24.0 /usr/bin/pngcp&quot;</div><div class=3D"gmail_e=
xtra">=C2=A0 * PV changed from &quot;1.6.23&quot; to &quot;1.6.24&quot;</di=
v><div class=3D"gmail_extra">packages/corei7-64-poky-linux/libpng/libpng: P=
KGSIZE changed from 206747 to 241683 (+16%)</div><div class=3D"gmail_extra"=
>=C2=A0 * PV changed from &quot;1.6.23&quot; to &quot;1.6.24&quot;</div><di=
v class=3D"gmail_extra">=C2=A0 * FILELIST: removed &quot;/usr/lib/libpng16.=
so.16.23.0&quot; added &quot;/usr/lib/libpng16.so.16.24.0 /usr/bin/pngcp&qu=
ot;</div><div class=3D"gmail_extra">packages/corei7-64-poky-linux/libpng/li=
bpng: RPROVIDES: removed all items &quot;libpng ([&#39;=3D 1.6.23&#39;])&qu=
ot;</div><div class=3D"gmail_extra">=C2=A0 * PV changed from &quot;1.6.23&q=
uot; to &quot;1.6.24&quot;</div><div class=3D"gmail_extra">packages/corei7-=
64-poky-linux/libpng/libpng: PKG changed from libpng16-16 to libpng [defaul=
t] - may indicate debian renaming failure</div><div class=3D"gmail_extra">=
=C2=A0 * PV changed from &quot;1.6.23&quot; to &quot;1.6.24&quot;</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">The relevant li=
ne is that PN added /usr/bin/pngcp, so the package is no longer a library p=
ackage.=C2=A0 This should be in PN-tools (which should use FILES_PN-tools=
=3D${bindir} so this doesn&#39;t happen again).</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a113ed9328abaed0539ce2628--
