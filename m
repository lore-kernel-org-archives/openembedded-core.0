Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id AC7056AC1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 15:02:01 +0000 (UTC)
Received: by qkx62 with SMTP id 62so86022378qkx.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 08:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CetTo1B5dY/k4JwnN2vSj+6Z2DcrxnA3+V20FkDaUVg=;
	b=Dac31MCaeCTP883MoHC4SUBdyTpK6K4JpyEXqGL3e6x1JnZnkQ/kEbdPMP35dkriss
	7G3F9CU4R2wFLuUnHzEqVzvjgi+mn5DXAcrKuEhoBXFQZhHkC9g+P6wNDlWS5+cw/iti
	9OIb+0YtJJes1uKkbvDTbZIBNe6fj+e08jZTJHJaou8PuQCZgnJXxjRp5U08uTMsnzLX
	Ni504Imcb+OGrw+GgOrdbz+z9l2Ydota3Ei77tjBQGj/Ck6SdsnONQ7MRO5iwVI0kn0i
	TaQWhs/DSLbXP3N93lNLPjRvqeEWJOAZlAEXb8kx8/mGDMbyqdoQBQfS5avGL/zXMLsw
	LWKA==
X-Gm-Message-State: ALoCoQlZafz+2PhF2PXhyW94o7Yi95Ryqt7wULN2PpvhlQwpJeXGFKiPHhZI7YPYF8/sFiCbDGJJ
X-Received: by 10.55.50.20 with SMTP id y20mr52457892qky.58.1429110101758;
	Wed, 15 Apr 2015 08:01:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 15 Apr 2015 08:01:21 -0700 (PDT)
In-Reply-To: <1427892736.17257.8.camel@bottazzini-ThinkPad-T430>
References: <bruno.bottazzini@intel.com>
	<1427320163-9262-1-git-send-email-bruno.bottazzini@intel.com>
	<1427320163-9262-5-git-send-email-bruno.bottazzini@intel.com>
	<CAHiDW_F8MKf1yWW3y=QOxX02Jjgs1HdZn1PDgL9bFLuMJh+jfA@mail.gmail.com>
	<1427892736.17257.8.camel@bottazzini-ThinkPad-T430>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Apr 2015 16:01:21 +0100
Message-ID: <CAJTo0LbHCBbBWoponKB=HEqGGDTY4bb_XtW011--yBO5LXEmjQ@mail.gmail.com>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] systemd: v219 with stable fixes
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
X-List-Received-Date: Wed, 15 Apr 2015 15:02:01 -0000
Content-Type: multipart/alternative; boundary=001a11471392f5ebb50513c49f13

--001a11471392f5ebb50513c49f13
Content-Type: text/plain; charset=UTF-8

Hi,

On 1 April 2015 at 13:52, Bottazzini, Bruno <bruno.bottazzini@intel.com>
wrote:

> The previous patch was done in the way you said but, Khem Raj suggested
> that we should use it as patches.
>
> Copying and Pasting what he said:
> "Thats good, although we have to be open on stable branch to do SRCREV
>  updates which we hardly do. We only backport fixed via master
>  so I see this as pointless from that angle."
>

At the time - when master was frozen - that was true.  But unfortunately
this didn't get applied in time for Fido, as a non-trivial patch that
doesn't fix existing bugs there's a large barrier to pass.  Now that master
is open the systemd recipe can in fact track the stable git branch instead,
and insert the git hash into the PV so it's obvious that it's taken from
git.

Assuming that patch gets merged and doesn't cause problems, then it would
be up to the Fido maintainer (that's Joshua Lock) to decide whether to
merge a backport, which could well end up being this patch.

Sorry about this, the final stage of the release was quite busy and this
slipped straight through my fingers.

Ross

--001a11471392f5ebb50513c49f13
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi,</div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 1 April 2015 at 13:52, Bottazzini, B=
runo <span dir=3D"ltr">&lt;<a href=3D"mailto:bruno.bottazzini@intel.com" ta=
rget=3D"_blank">bruno.bottazzini@intel.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div id=3D":2k4" class=3D"a3s" style=3D"overflow:hi=
dden">The previous patch was done in the way you said but, <span class=3D"i=
l">Khem</span> Raj suggested<br>
that we should use it as patches.<br>
<br>
Copying and Pasting what he said:<br>
&quot;Thats good, although we have to be open on stable branch to do SRCREV=
<br>
=C2=A0updates which we hardly do. We only backport fixed via master<br>
=C2=A0so I see this as pointless from that angle.&quot;<br></div></blockquo=
te></div><br>At the time - when master was frozen - that was true.=C2=A0 Bu=
t unfortunately this didn&#39;t get applied in time for Fido, as a non-triv=
ial patch that doesn&#39;t fix existing bugs there&#39;s a large barrier to=
 pass.=C2=A0 Now that master is open the systemd recipe can in fact track t=
he stable git branch instead, and insert the git hash into the PV so it&#39=
;s obvious that it&#39;s taken from git.</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Assuming that patch gets merged and does=
n&#39;t cause problems, then it would be up to the Fido maintainer (that&#3=
9;s Joshua Lock) to decide whether to merge a backport, which could well en=
d up being this patch.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Sorry about this, the final stage of the release was quite=
 busy and this slipped straight through my fingers.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11471392f5ebb50513c49f13--
