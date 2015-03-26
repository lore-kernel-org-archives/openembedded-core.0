Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3A32373C0A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 14:40:58 +0000 (UTC)
Received: by qgf60 with SMTP id 60so82999494qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 07:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Xy8483KX29SFu7s1QSI6yVwIYlYPmhnhz9SARZnbxMo=;
	b=TpT3GF/tXP03Q1AJr3mDeGYkplVr8SB0UMpclYB0ZLWA0rtBual8Y+E4A7KzHtIu2p
	WAFFbWAoSviya0QiglDWV6JpRCrYwJ7n5s1vsq85xTKK/q+EscD4ZmqYmw7XUl+MNgYl
	AeEwIQFCVf8WeO5CvpGpX9lfZdSRElWWDb1TcZyczh5oad1/C1psScS7eU+VXEXwl0R4
	oyE89MWrAGbLqHpiwI9wbAL8r5GJLWHlFvFULy/wEx3tym+xBrDZFbqq8aOwJyw6Gp/j
	H+3fHeNi3kp7a+/b96+FFVdcP27A3rQA+NV1mEq3ng5xytoJy0ClPwD2LKeQHEWxduHC
	0c9g==
X-Gm-Message-State: ALoCoQn/ZrIV0Ygp+m6aPPKXOeNz70spH1V51elVFXjuW4IicCZ+EIwUPgJ3QKxruyqpbiWP2krK
X-Received: by 10.55.23.84 with SMTP id i81mr29762241qkh.51.1427380859021;
	Thu, 26 Mar 2015 07:40:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 26 Mar 2015 07:40:38 -0700 (PDT)
In-Reply-To: <551419B7.3080201@linux.intel.com>
References: <1427322405-34441-1-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LbsqWcoddvK+xs=u0QQ7rDsn7=9eh5j+o2=KtP-v2MUDw@mail.gmail.com>
	<551419B7.3080201@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Mar 2015 14:40:38 +0000
Message-ID: <CAJTo0La6sJo56Zr3Fo1pDczg2UOqYWxXkTzZJz-cSZmvie1k_Q@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lzop: Fix build using x32 ABI
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
X-List-Received-Date: Thu, 26 Mar 2015 14:41:00 -0000
Content-Type: multipart/alternative; boundary=001a1146fe620fca340512320147

--001a1146fe620fca340512320147
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26 March 2015 at 14:37, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel=
.com>
wrote:

> I followed the documentation [1], if no increment PR is needed i think we
> need to clarity in the docs.
>

Yes, the docs need updating.  Thanks for pointing out where you were told
to do this!

(AR taken to tell Scott)

Ross

--001a1146fe620fca340512320147
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 March 2015 at 14:37, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a =
href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.limon=
@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":ms" class=3D"a3s" style=3D"overflow:hidden">I followed the docume=
ntation [1], if no increment PR is needed i think we need to clarity in the=
 docs.<br></div></blockquote></div><br>Yes, the docs need updating.=C2=A0 T=
hanks for pointing out where you were told to do this!</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">(AR taken to tell Scott)</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a1146fe620fca340512320147--
