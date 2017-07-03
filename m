Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id EA17278082
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 15:02:48 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id 32so145404326qtv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 08:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wUOymrKc6/NF2w/ljvTOJsiriHsJ0m7oT+xGzZ5k8gg=;
	b=D6PJfGjN+HYIARxhuxJFLAsXbZQL9tAPuKw0WQ6c1sPMWs3CLlHvw2VLInmIQ2E9K9
	O2c3+U5Ls9MDguwJxnzHmEcOtYr8axp1bHSNZwi4YCSWKMX7o9feWRCgmWiao5+zaTTs
	Uj7dmKrrzPRA10x0ggZyTO3XOnAaSxCcKyPTLrMedaQ/2fx3vpktKx5+6ljYNvKbtsEi
	JduOzqtHlLk1woSjfDwLdVplqUF0jwqJ//m9CwAYhWQRp/WYeIFhoNROy8kzV7p/HyUj
	ojWhvjPhdtHDS0mUR4pFUXjYi0ESfrUpTRIQe3tLFVkir7TQS2MfgqQKFqE5kAJgZlEX
	eD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wUOymrKc6/NF2w/ljvTOJsiriHsJ0m7oT+xGzZ5k8gg=;
	b=HY3bdyLTGIM2+M3+h7z7b/fuF23bcHsTxeZ7pEYWoK/wxeQMWJCKVxrdA0GtP9hhmH
	ulbosSZ/qp5fVWJUoLfVrAoM/tgUI3jUC4xOmP7fgNYqYf0dNfdU1dCGh0OE7/Wzxw9k
	McldH0+XUi0u8FzFp0TOMyY8O2QuZf3cWTd8DwniAxdFQ54UdzPMiBH8DOfnNlJpJ1CL
	UqLR+QoDZoypYKdRd3qiRLglwBhWxL2OBu/dzS6YLten1N11JSGRmOxzy3Xn/kNkASDV
	jPyaiYew+57KGE68+Kk70HRUqZqcHebNk7wlYsNydvJp4s7KwZRiW5ZQNkScVFEzbR0K
	WIVQ==
X-Gm-Message-State: AKS2vOyfMsvXzGaYblv6wUD2bpbU47RqRxBllVjL/E9bK2zXDNxVKm15
	MYufKE56z64WDSjrnbUICKv10ySHlSo7
X-Received: by 10.200.45.228 with SMTP id q33mr27677095qta.177.1499094169565; 
	Mon, 03 Jul 2017 08:02:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Mon, 3 Jul 2017 08:02:29 -0700 (PDT)
In-Reply-To: <20170629123022.4580-1-JPEWhacker@gmail.com>
References: <20170629123022.4580-1-JPEWhacker@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Jul 2017 16:02:29 +0100
Message-ID: <CAJTo0LYJcXSKWUNg5gSQ=vvObrcnj2w=CXgWKUa-pA2GKRK8DQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: adraszik@tycoint.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: Fix key generation with systemd
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
X-List-Received-Date: Mon, 03 Jul 2017 15:02:49 -0000
Content-Type: multipart/alternative; boundary="001a114541b27650da05536b0f33"

--001a114541b27650da05536b0f33
Content-Type: text/plain; charset="UTF-8"

On 29 June 2017 at 13:30, Joshua Watt <jpewhacker@gmail.com> wrote:

> +       install -D -m 0755 ${WORKDIR}/sshd_check_keys
> ${D}${libexecdir}/${BPN}/sshd_check_keys
>

packages/corei7-64-poky-linux/openssh/openssh:
  PKGSIZE changed from 0 to 2423 (+100%)
  FILELIST: added "/usr/libexec/openssh/sshd_check_keys"

Can you pthat binary in the openssh-sshd package instead of the previously
empty openssh?

Ross

--001a114541b27650da05536b0f33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 June 2017 at 13:30, Joshua Watt <span dir=3D"ltr">&lt;<a href=3D"mail=
to:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex"><div id=3D"gmail-:22m" class=3D"gmail-a3s gm=
ail-aXjCH gmail-m15cf3d514eb3c9b4">+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -=
m 0755 ${WORKDIR}/sshd_check_keys ${D}${libexecdir}/${BPN}/sshd_<wbr>check_=
keys<br></div></blockquote></div><br><div class=3D"gmail_extra">packages/co=
rei7-64-poky-linux/openssh/openssh:</div><div class=3D"gmail_extra">=C2=A0 =
PKGSIZE changed from 0 to 2423 (+100%)</div><div class=3D"gmail_extra">=C2=
=A0 FILELIST: added &quot;/usr/libexec/openssh/sshd_check_keys&quot;</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Can you ptha=
t binary in the openssh-sshd package instead of the previously empty openss=
h?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div></div>

--001a114541b27650da05536b0f33--
