Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1CDC56AC82
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 14:27:40 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id q107so468680qgd.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 06:27:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cJTWcH7CWBrgOA5kEuCLWyKeHBQFGim3ikSNJGMQ5Yg=;
	b=lxXgvjxlfd3yfH0J+jsmdsn5bxZqbhXVG0NMylFO6EmWz6mmW7HRryp/+KWHEIUc1+
	BZsq+Y33gVcK30xcJFuAAAZqo8HIdBL+40VF0US4RZD4kVr93gAYM91shQq8Hjzn5nlP
	f6nvtcN06swzB9WJACKvrI8yCEx6uUO8rGFgVolamR/RPPza/A/YCvZJUGnnwDE7P+Yw
	rwUdmRnAfN2Jvb+A3yCGrB1sPbrxRqPLzTNe5hXi5G5V0rwJi4xyXvDkYO/xuQujL+Ps
	1CE/vNOCUIOVqySH5gEX79YhTQHjidAnTSTudKjADzLLwa3aAGjY79V6lMrsonKe5iXm
	dmew==
X-Gm-Message-State: ALoCoQnXECvkmAyOxD24jktMnKjg4zdp0TnnC0VE1Q0g3XA4A5Msd0B7lORZvqPRhHnUmX3cf6bz
X-Received: by 10.140.109.130 with SMTP id l2mr27737050qgf.80.1416407261199;
	Wed, 19 Nov 2014 06:27:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 19 Nov 2014 06:27:20 -0800 (PST)
In-Reply-To: <1416387750-10669-1-git-send-email-schnitzeltony@googlemail.com>
References: <1416387750-10669-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Nov 2014 14:27:20 +0000
Message-ID: <CAJTo0LY_p2Ee04GRxJz0W7D0iZks07JYBwsCfbME00U8cR2Q2A@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] midori: update to 0.5.8
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
X-List-Received-Date: Wed, 19 Nov 2014 14:27:41 -0000
Content-Type: multipart/alternative; boundary=001a113ba01aa969f0050837033f

--001a113ba01aa969f0050837033f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19 November 2014 09:02, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>
wrote:

> +DEPENDS =3D "webkit-gtk libsoup-2.4 openssl python-native
> python-docutils-native librsvg-native libnotify libunique libxscrnsaver"
>

Buildhistory-diff reports that libunique isn't a runtime dependency anymore
so it looks like libunique isn't used anymore so you can drop that depends.

Does Midori still support GTK+ 2 and 3, and how does it pick? I note that
you don't have a build dependency on either so presumably rely on webkitgtk
pulling in GTK+ 2, but what if GTK+3 is also installed?

Ross

--001a113ba01aa969f0050837033f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 November 2014 09:02, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@g=
ooglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":2wv" class=3D"a3s" style=3D"overflow:hidden">+DEPENDS =3D &quot;webk=
it-gtk libsoup-2.4 openssl python-native python-docutils-native librsvg-nat=
ive libnotify libunique libxscrnsaver&quot;<br></div></blockquote></div><br=
>Buildhistory-diff reports that libunique isn&#39;t a runtime dependency an=
ymore so it looks like libunique isn&#39;t used anymore so you can drop tha=
t depends.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Does Midori still support GTK+ 2 and 3, and how does it pick? I note t=
hat you don&#39;t have a build dependency on either so presumably rely on w=
ebkitgtk pulling in GTK+ 2, but what if GTK+3 is also installed?</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ba01aa969f0050837033f--
