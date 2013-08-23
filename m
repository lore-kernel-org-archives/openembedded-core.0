Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8CD036AF21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 17:27:57 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id eh20so704353lab.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 10:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=ydaADgv0XJ9JhLFeRaa1yvJN78VuYUnzGCgZHqq+9I8=;
	b=wvBOawFGijBrr0sIfkSbpQclmxl2JQf9I+8RHnsbZddn1cnDKNVL/YmF9v/7rmaTIY
	js/8UCaUu2xsJxbN0uHFr7UDRqqXJfNmCq/lOZ/kqAEhG35fYFxpHWAaclPfLDWJzWSn
	LK267ZIFD0m1xAdRDARY1+QBlsK+Hl6pU3oJeagsJZvFQtCYroDuuoPk1FROdnG7E2Wz
	VM79xw8zPLcKwUghRvaN3kIyja4dMtx/OFSOBrhdBUXr3HpZbEEh4c6DHX3QbbUx7wum
	lFCgvNrjWK+Zz+4pZD6j6BLrenrmfu32AF1BgN7nsL7aElOr0iwuB2vROU9G1muLzJ64
	ouCg==
X-Received: by 10.112.11.20 with SMTP id m20mr29248lbb.56.1377278876424; Fri,
	23 Aug 2013 10:27:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Fri, 23 Aug 2013 10:27:36 -0700 (PDT)
In-Reply-To: <7a4f632ef281997b5fd0609a9adfdfde52f3ed76.1377278314.git.chris_larson@mentor.com>
References: <cover.1377278314.git.chris_larson@mentor.com>
	<7a4f632ef281997b5fd0609a9adfdfde52f3ed76.1377278314.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Fri, 23 Aug 2013 10:27:36 -0700
X-Google-Sender-Auth: l_tgf9CSc4XLYNh36-OnvisTSHY
Message-ID: <CABcZAN=oNBmva0=m=7SYH-eEYo5dCnA4Y+sVxhWO_8iPwWqp2Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/2] ca-certificates: add recipe (version 20130610)
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
X-List-Received-Date: Fri, 23 Aug 2013 17:27:58 -0000
Content-Type: multipart/alternative; boundary=001a1133eb742fa13704e4a0bae0

--001a1133eb742fa13704e4a0bae0
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 23, 2013 at 10:20 AM, Christopher Larson <kergoth@gmail.com>wrote:

> We need this for certain nativesdk recipes, as we can't rely on the
> certificate path or bundle path being the same across distros, and it's
> useful
> in many cases on the target as well.
>
> This is based on the 20130119 recipe from meta-oe, with the following
> changes:
>
> - use the debian git repository to avoid vanishing sources
> - obey our target paths
> - default to a sysroot relative to the script location (make relocatable)
> - define SUMMARY
> - don't inherit autotools, this isn't an autotools package
> - add MPL-2.0 to LICENSE, as that's the license of the certdata
> - install the script man page
> - use a native rather than cross recipe, as it's not bound in any way to
> the
>   target system
> - add nativesdk to bbclassextend, for use in SDKs
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Await v2, forgot the patch upstream status :)

--001a1133eb742fa13704e4a0bae0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Aug 23, 2013 at 10:20 AM, Christopher Larson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a=
>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":io" style=3D"overflow:hidden">We=
 need this for certain nativesdk recipes, as we can&#39;t rely on the<br>
certificate path or bundle path being the same across distros, and it&#39;s=
 useful<br>
in many cases on the target as well.<br>
<br>
This is based on the 20130119 recipe from meta-oe, with the following chang=
es:<br>
<br>
- use the debian git repository to avoid vanishing sources<br>
- obey our target paths<br>
- default to a sysroot relative to the script location (make relocatable)<b=
r>
- define SUMMARY<br>
- don&#39;t inherit autotools, this isn&#39;t an autotools package<br>
- add MPL-2.0 to LICENSE, as that&#39;s the license of the certdata<br>
- install the script man page<br>
- use a native rather than cross recipe, as it&#39;s not bound in any way t=
o the<br>
=C2=A0 target system<br>
- add nativesdk to bbclassextend, for use in SDKs<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;</div></blockquote></div><br>Await v2,=
 forgot the patch upstream status :)</div></div>

--001a1133eb742fa13704e4a0bae0--
