Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 76A5C60053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 16:49:39 +0000 (UTC)
Received: by qkdw123 with SMTP id w123so47329771qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 09:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=US2tHvGq+dCyYv+5r7fypZTMkevRt37t8rj7UTCuXcE=;
	b=LL1cCs/aPQcZXQv9V5poG38mz7HDkjxEzK5s03E7rRMk5W087Eslz8ov0jcGyIJN12
	JWXDWqm5mmQkhWUiQ90nji0qD4SppwFuUjphbyVwPA42SCfIQl7PijaKKiqm4HNiiLlP
	elw+0zPVyGJ7AStY2jJYjq8QcG4n7JXgksVzQv0sCtH5iym6Y1kNyUZ6NIdratB6Mput
	DomZOnzmBX9afCUzMCWEWp3tHtyMWZgevagoi2hOHyOGr7jh9Cl/Kg2G3w9BJWFfBfvB
	YEh1XiWYTIiaxrxEooFrqrG2J75xGoZvJm/wl+76LDLrRsYgvKk6I4jEkgWteEN0WU+o
	bcww==
X-Gm-Message-State: ALoCoQmuAYrrjh13VYOgJP3KDutMeAAu6g8TH3CbZzmUC7mwZPcaYOJCOmWpNVC3W/vryHXrNqDG
X-Received: by 10.55.33.222 with SMTP id f91mr23635375qki.64.1442854179916;
	Mon, 21 Sep 2015 09:49:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 21 Sep 2015 09:49:20 -0700 (PDT)
In-Reply-To: <560029CB.6050006@linux.intel.com>
References: <1442844096-27847-1-git-send-email-Martin.Jansa@gmail.com>
	<560029CB.6050006@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Sep 2015 17:49:20 +0100
Message-ID: <CAJTo0LaJFQozfE1gaXvdEBR=ioCB7GR425_TDJaiVE1E9UnuXA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: add REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 21 Sep 2015 16:49:41 -0000
Content-Type: multipart/alternative; boundary=001a1144d35edb74d0052044aae1

--001a1144d35edb74d0052044aae1
Content-Type: text/plain; charset=UTF-8

On 21 September 2015 at 17:01, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 09/21/2015 05:01 PM, Martin Jansa wrote:
>
>> * original webkit-gtk_1.8.3.bb recipe already had this, I don't know
>>    why it was removed when upgrading to 2.8.5
>>
>
> It was removed because I couldn't figure out why it's actually needed.
> What is the scenario?
>

Remove x11 from DISTRO_FEATURES ("I'm building a product that doesn't need
or use X") and build webkitgtk.  webkitgtk depends on libxt which depends
on libx11 which then refuses to build because you explicitly said you
didn't want X.

We're adding required_distro_feature annotations as required so that world
builds without X11 enabled still work by skipping the recipes instead of
failing to build.

Ross

--001a1144d35edb74d0052044aae1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 September 2015 at 17:01, Alexander Kanavin <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexande=
r.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><span class=3D"">On 09/21/2015 05:01 PM, Martin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
* original <a href=3D"http://webkit-gtk_1.8.3.bb" rel=3D"noreferrer" target=
=3D"_blank">webkit-gtk_1.8.3.bb</a> recipe already had this, I don&#39;t kn=
ow<br>
=C2=A0 =C2=A0why it was removed when upgrading to 2.8.5<br>
</blockquote>
<br></span>
It was removed because I couldn&#39;t figure out why it&#39;s actually need=
ed. What is the scenario?<br></blockquote></div><br>Remove x11 from DISTRO_=
FEATURES (&quot;I&#39;m building a product that doesn&#39;t need or use X&q=
uot;) and build webkitgtk. =C2=A0webkitgtk depends on libxt which depends o=
n libx11 which then refuses to build because you explicitly said you didn&#=
39;t want X.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">We&#39;re adding required_distro_feature annotations as required so =
that world builds without X11 enabled still work by skipping the recipes in=
stead of failing to build.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a1144d35edb74d0052044aae1--
