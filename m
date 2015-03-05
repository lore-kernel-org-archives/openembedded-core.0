Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id CBE137385B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 15:53:05 +0000 (UTC)
Received: by qgfh3 with SMTP id h3so5823386qgf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 07:53:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YAu7I8zWW4+r2hapJRBG5N4UdUDnHMypzhDnM+07bnQ=;
	b=KqZ9u4JgfWGtccfwIDLnruDGPcDxRE5qIp+FHI8Zqu0RZsyUXpWKt6KRjZrPqskAts
	KmyX8NPJyXz92Klv2hCW/P5pZbWA2pkviJQsp3gWLyukeQrlZAm0sOCN7DtXJAmrmUMZ
	vapbuZU0KwwIlWeLObwGwKg57vdxJN/z62/yBpYrC9WaM94/kWqeTLhYvdtkeHfZfv/z
	P7CdPSI5KF5GEu6Jzwog+S5B0jWtg76QIfSU/S1qvCySk5w+5j7TFJqwcHLyq/2gKDit
	oJkfX6qZKPVk9HQt4tksq7W8of4/FE1Pc5kgTgmwFoS1Y+kSfHMCE7JFkJo8ZXhmXAOQ
	EDQw==
X-Gm-Message-State: ALoCoQnT33qQ7p8CncjqM02h7XpFUOnkiCM5XxOPLDe9cgSOdQY+fuAVz8wIayCc9EiFxMm7TVTe
X-Received: by 10.55.23.135 with SMTP id 7mr19341808qkx.19.1425570786427; Thu,
	05 Mar 2015 07:53:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 5 Mar 2015 07:52:46 -0800 (PST)
In-Reply-To: <1425570531-9477-1-git-send-email-gary@mlbassoc.com>
References: <1425570531-9477-1-git-send-email-gary@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Mar 2015 15:52:46 +0000
Message-ID: <CAJTo0La0cGM+YSFjj5XmR7eex7m5o7xc0rkmz96z2GGvY-jeEQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] opkg: Fix error when recompiled
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
X-List-Received-Date: Thu, 05 Mar 2015 15:53:06 -0000
Content-Type: multipart/alternative; boundary=001a1147b57653d8b905108c905e

--001a1147b57653d8b905108c905e
Content-Type: text/plain; charset=UTF-8

Hi Gary,

On 5 March 2015 at 15:48, Gary Thomas <gary@mlbassoc.com> wrote:

> v2: Move the update of the opkg.conf file into 'do_install' which
> will prevent any erroneous [multiple] options to be added to 'opkg.conf'
>

Don't put commentary about v2 in the commit message, as when it's merged
the content of v1 isn't relevant.

(I've removed it and merged to mut)

Ross

--001a1147b57653d8b905108c905e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Gary,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 5 March 2015 at 15:48, Gary Tho=
mas <span dir=3D"ltr">&lt;<a href=3D"mailto:gary@mlbassoc.com" target=3D"_b=
lank">gary@mlbassoc.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":2hb" class=3D"a3s" style=3D"overflow:hidden">v2: Move the =
update of the opkg.conf file into &#39;do_install&#39; which<br>
will prevent any erroneous [multiple] options to be added to &#39;opkg.conf=
&#39;</div></blockquote></div><br>Don&#39;t put commentary about v2 in the =
commit message, as when it&#39;s merged the content of v1 isn&#39;t relevan=
t.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(I&=
#39;ve removed it and merged to mut)</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Ross</div></div>

--001a1147b57653d8b905108c905e--
