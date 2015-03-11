Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 77A1273994
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 12:31:34 +0000 (UTC)
Received: by qgfh3 with SMTP id h3so9401809qgf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 05:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8hMvi7hvQ+E58bSPvwSJyWX2H3ztR9fw27lyMXX0D0Y=;
	b=E+19mWINR5/poBl6M2t1YHCJQPM/i0OhkMPDd9YqayLw3x086QjBWS6ttp4/GWTeS8
	OBnQ5c3yCAI/Kv69cHLEAIZVfnmtutbrqOzS3c1QvGidYkzLEG2fHU62RbYXCfPEIpYA
	vxu0GrBjYmFIM2Gu4Xqieq9BmmGjNxqfBfWdfKBfcrn/7FQOcOvXjR30WmZhfDcV1Q1W
	b27ETulURWryRFGNEXzGtbjt2iikoy9EYKeScstakZEg7f4sVL3rfBgiLn4QzqKYvAqv
	y7JKD+Q3Oc6YRC9jLZiwkFOwAzoEpzAfTb2jODuQwoO8cykcf9t7y/hy3N8Z62ImrHWA
	WEig==
X-Gm-Message-State: ALoCoQmSnuJmcIjRT+7pSFFOqsWi+8i48tbE2lbQ+r7hqzewLx9S0pN8GjbnLHTZ7owAHB+Sm3f/
X-Received: by 10.140.150.21 with SMTP id 21mr48923649qhw.69.1426077095980;
	Wed, 11 Mar 2015 05:31:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 11 Mar 2015 05:31:15 -0700 (PDT)
In-Reply-To: <1426057202-17789-1-git-send-email-net147@gmail.com>
References: <1426057202-17789-1-git-send-email-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Mar 2015 12:31:15 +0000
Message-ID: <CAJTo0LbQA+cRhkjR07cYLA22=tbqqsukfCFCKbOaA1Janpc+og@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: split libsmartcols into separate sub-package
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
X-List-Received-Date: Wed, 11 Mar 2015 12:31:38 -0000
Content-Type: multipart/alternative; boundary=001a11353fbcba9fa905110272eb

--001a11353fbcba9fa905110272eb
Content-Type: text/plain; charset=UTF-8

On 11 March 2015 at 07:00, Jonathan Liu <net147@gmail.com> wrote:

> This avoids util-linux-fdisk pulling in util-linux and all the
> associated sub-packages.
>

util-linux is splitting so many packages and adding sub-packages so
frequently, could we just do this dynamically?

Ross

--001a11353fbcba9fa905110272eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
1 March 2015 at 07:00, Jonathan Liu <span dir=3D"ltr">&lt;<a href=3D"mailto=
:net147@gmail.com" target=3D"_blank">net147@gmail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">This avoids util-linux-fdisk pulling in =
util-linux and all the<br>
associated sub-packages.<br></blockquote><div><br></div><div>util-linux is =
splitting so many packages and adding sub-packages so frequently, could we =
just do this dynamically?=C2=A0<br></div><div><br></div><div>Ross</div></di=
v></div></div>

--001a11353fbcba9fa905110272eb--
