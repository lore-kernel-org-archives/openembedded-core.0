Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id BD3D377DCA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 15:32:23 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id c13so39110283qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 08:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u2QkQnbgDNZOK0BkkJo5iJJFfuN3rtxtF1i2b1lPI5s=;
	b=DxgfTYTsmGV/N+OkKaLqo5yWJOJbBcU+BIIU2CLL4DpWJ3WiNxgmvr8zgTRSwD2hEX
	iKMU2wY5wBOev3hEV3ufSDxp+EkGTkSTXL26t7sYkI4b9H5XbpF/T6sJGhkTd3r3dU1M
	mF3qODUstOC4HfbS1aqWj37aZ6CHUziUlfBSSX7eT1hgErIoM9hr8Wo+yA6BXN/616z9
	Nr6ufgNkia6/F5kpDsjzHAKzcigackv3ULUcbOHPzB2RrTRyx+7vrw83ZTzUy0VJbDU9
	kv9AMjECO9NE9IuiINLOIpaMcz4cB9+KxhPLt17+a2Ht54D4YfswKvE7T44hKjqnEx5G
	LFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u2QkQnbgDNZOK0BkkJo5iJJFfuN3rtxtF1i2b1lPI5s=;
	b=ka/OhxNnFbVle1NDDVrgCUG/oCuzmdzsLGKRuCc/qS1y10plHFgaWyhSfG5SKDuJzG
	gYnNN6So3v6nasqkQHvJd1PIHqQNPgPuM4fb1JT7SnhsynG27+8ij9XmKAcC006Om0vS
	4B4GZnUvAFi+Ja/zHEjTO1nYm40RfXRMQYG3HDHyKNtdr9eqFb8MOSa/48Cp1N/rbaHM
	jxbpNyiN5kxKAmebmNDisG9KAARLJsjzRWgp0KHAIY9id1nTcGL9WiA0AsX11NZZ9u2e
	jYZieaLvdXNoabHjPmbWfIJhIuxH3X4F5EHQYN5G5MqtN9/L84G90ZbBAJGKPw1H5BV1
	xZJQ==
X-Gm-Message-State: AODbwcBL0DZgHCuFFoLnt8CPIAlGq9FobBtFLp4unqwSL8181XP0naCo
	m4FwtPKWi5IZKeNUNapL1yd3OVLWz+zT+KE=
X-Received: by 10.200.43.99 with SMTP id 32mr2765614qtv.6.1496331144311; Thu,
	01 Jun 2017 08:32:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 1 Jun 2017 08:32:03 -0700 (PDT)
In-Reply-To: <1494933979-5139-5-git-send-email-dv@pseudoterminal.org>
References: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
	<1494933979-5139-5-git-send-email-dv@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Jun 2017 16:32:03 +0100
Message-ID: <CAJTo0LZRyKSoQPEZDqSHL7qD7viYz6QJq8Vd34rViUdh-dbsMA@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/9] gstreamer1.0-plugins-ugly: upgrade to version 1.12.0
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
X-List-Received-Date: Thu, 01 Jun 2017 15:32:24 -0000
Content-Type: multipart/alternative; boundary="001a1146fb4652e52c0550e7be9f"

--001a1146fb4652e52c0550e7be9f
Content-Type: text/plain; charset="UTF-8"

On 16 May 2017 at 12:26, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:

> * libmad plugin was removed in 1.12.0, since mad is GPLed, unmaintained,
>   and both gst-libav & the mpg123 plugin are fully functional alternatives
>

Something in this series is causing other plugins to change their
dependencies and I'm not sure if it's intentional or not.

For example, this happens when upgrading base/good/bad:

packages/corei7-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi:
RDEPENDS: removed all items "libwayland-egl (['>= 17.1.1']) libgles2-mesa
(['>= 17.1.1'])"

I've not dug into this to see if that is expected or not.

Ross

--001a1146fb4652e52c0550e7be9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 May 2017 at 12:26, Carlos Rafael Giani <span dir=3D"ltr">&lt;<a href=
=3D"mailto:dv@pseudoterminal.org" target=3D"_blank">dv@pseudoterminal.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-=
color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:295" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m15c110378563ba6e">* libmad plugin was removed in=
 1.12.0, since mad is GPLed, unmaintained,<br>
=C2=A0 and both gst-libav &amp; the mpg123 plugin are fully functional alte=
rnatives<br></div></blockquote></div><br>Something in this series is causin=
g other plugins to change their dependencies and I&#39;m not sure if it&#39=
;s intentional or not.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">For example, this happens when upgrading base/good/bad:</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">packages=
/corei7-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: RDEPENDS: remo=
ved all items &quot;libwayland-egl ([&#39;&gt;=3D 17.1.1&#39;]) libgles2-me=
sa ([&#39;&gt;=3D 17.1.1&#39;])&quot;<br></div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">I&#39;ve not dug into this to see if th=
at is expected or not.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a1146fb4652e52c0550e7be9f--
