Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id C673865C75
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 15:24:57 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id v8so11203325qal.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Feb 2015 07:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aXJGYMnApwjjkUsnQcveG8e4AkJxTAq7ymEEbVqWKG8=;
	b=cX3XR3vvN2j6R7hClINYLvo8JLHZdeVmH6P0Y/ak54W2Qp++N6xdeZ64cf3DQB3Emk
	DZoArnNmnFHBBMpR6uxnp1GZ3CTEe6RKpLcA6XS12IdYncZfWrqM9bJKXXp3Rwp5qIDm
	ZI9Ig84NppTGqctTDEqyK9GLZennwdYSSVrXPHW+YcEsDA8LPZoJJa2deiJvDeKun8NG
	UGqBOQoMTDKCjUHBVbAxhx/0g62P9YDODUqb+Y98cb1LUABMpds8eaOAiR9pN9vYtzQK
	VtGBGDEQBbP1tzgRZSVPo1oiXLdJzjIXY2Ax0fgixku2pyFQ9/xgLOGuQ7qAJXMsfZoV
	UvSQ==
X-Gm-Message-State: ALoCoQknJFV0SjzgFPR0wj94Vdax3YbnMgXBRdxzUjRk7J7R2Jd2x9PqPbvz8Y/uGxpJIxESAgJU
X-Received: by 10.140.21.48 with SMTP id 45mr8714153qgk.87.1423236298817; Fri,
	06 Feb 2015 07:24:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 6 Feb 2015 07:24:38 -0800 (PST)
In-Reply-To: <1423223906-8568-1-git-send-email-martri@arantia.com>
References: <1423223906-8568-1-git-send-email-martri@arantia.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Feb 2015 15:24:38 +0000
Message-ID: <CAJTo0LYXLMf5g8Pzv5Vp=HiZGZUBJXEWJ_GxfGu+C3GXKAsFGA@mail.gmail.com>
To: Marco Trillo <martri@arantia.com>
Cc: Ruben Morgade <rmorgade@arantia.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] Update gst-fluendo-mpegdemux plugin to latest release from Fluendo.
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
X-List-Received-Date: Fri, 06 Feb 2015 15:25:00 -0000
Content-Type: multipart/alternative; boundary=001a11c1299405d8f6050e6d0690

--001a11c1299405d8f6050e6d0690
Content-Type: text/plain; charset=UTF-8

Hi Marco,

On 6 February 2015 at 13:58, Marco Trillo <martri@arantia.com> wrote:

> Hello all,
>
> The patch below updates the `gst-fluendo-mpegdemux' recipe from version
> 0.10.72 (Oct 31 2013) to the latest version from upstream which is
> 0.10.85 (Nov 28 2014).
>
> The ChangeLog is rather big so I opted for not pasting it here; it can
> be consulted instead at the following URL:
> <
> https://core.fluendo.com/gstreamer/trac/browser/tags/gst-fluendo-mpegdemux-0.10.85/ChangeLog?rev=2667
> >
>
> A second patch follows with cosmetic updates to the recipe description
> and a broken link fixed in included file `gst-fluendo.inc'.
>

Thanks for the upgrade, I've a few comments so can you re-send the patch
please.

The commit shortlog (first line) should be of the form
"gst-fluendo-mpegdemux: upgrade to 0.10.85", with anything relevant
afterwards.  No need to include pleasantries as this text is part of the
commit forever.

Also as the second patch fixes the same recipe, you might as well merge
them into a single commit.

Ross

--001a11c1299405d8f6050e6d0690
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Marco,</div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On 6 February 2015 at 13:58, Marc=
o Trillo <span dir=3D"ltr">&lt;<a href=3D"mailto:martri@arantia.com" target=
=3D"_blank">martri@arantia.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":6n7" class=3D"a3s" style=3D"overflow:hidden">Hell=
o all,<br>
<br>
The patch below updates the `gst-fluendo-mpegdemux&#39; recipe from version=
<br>
0.10.72 (Oct 31 2013) to the latest version from upstream which is<br>
0.10.85 (Nov 28 2014).<br>
<br>
The ChangeLog is rather big so I opted for not pasting it here; it can<br>
be consulted instead at the following URL:<br>
&lt;<a href=3D"https://core.fluendo.com/gstreamer/trac/browser/tags/gst-flu=
endo-mpegdemux-0.10.85/ChangeLog?rev=3D2667" target=3D"_blank">https://core=
.fluendo.com/gstreamer/trac/browser/tags/gst-fluendo-mpegdemux-0.10.85/Chan=
geLog?rev=3D2667</a>&gt;<br>
<br>
A second patch follows with cosmetic updates to the recipe description<br>
and a broken link fixed in included file `gst-fluendo.inc&#39;.<br></div></=
blockquote></div><div class=3D"gmail_extra"><br></div>Thanks for the upgrad=
e, I&#39;ve a few comments so can you re-send the patch please.</div><div c=
lass=3D"gmail_extra"><br>The commit shortlog (first line) should be of the =
form &quot;gst-fluendo-mpegdemux: upgrade to 0.10.85&quot;, with anything r=
elevant afterwards.=C2=A0 No need to include pleasantries as this text is p=
art of the commit forever.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Also as the second patch fixes the same recipe, you mi=
ght as well merge them into a single commit.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c1299405d8f6050e6d0690--
