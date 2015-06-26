Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5643560132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 15:19:50 +0000 (UTC)
Received: by qgev13 with SMTP id v13so36285220qge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 08:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=N68Y3neCtcMEMxiOCVJjihoLCCQrAtNCZADvPlBCfQ8=;
	b=l4F6lrchFB2MXM9LoCduImtDYm+oC5jixvxNwKl22IdmTuGkVfvIDQDU3lVBmwdX2k
	ITgvfhI9CMBc+nzu76laQRoS3TAZLll9Fl1kSkdGzeaP7Rdt3W3CbfcqLq31oNI0TQhW
	nwmh4K/3Stle/PvVpG8F5ORhPHDkBgF1nP2xLRNp1ZiljTFcGIe1img8wUsBuCLHWQcT
	SgGV48W2EM/Ss8NX1TXJr52IPpqFrjMHM2DAeKJIflLxr0HRvp467h44fz7yaWj1kKlf
	np8CaieHRPgoUceintz6CLzr2N68RdtJfZpvwmn60ToCiQlg4A7G5eFYPB+HFs/37CIg
	cysA==
X-Gm-Message-State: ALoCoQnSei+louk+FVEaPSjBGckhkaeFRU0B/4EuGfbrgll3A9YDwO+ZBujznAYiJ64RNAbHa1Ra
X-Received: by 10.55.27.11 with SMTP id b11mr4904563qkb.105.1435331991755;
	Fri, 26 Jun 2015 08:19:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 26 Jun 2015 08:19:32 -0700 (PDT)
In-Reply-To: <558D07C7.5000203@jp.fujitsu.com>
References: <558D07C7.5000203@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jun 2015 16:19:32 +0100
Message-ID: <CAJTo0LYdeaZMRkEMmd+k4Qy91aMC1fYSRcQGBBfzgqKXt79pqw@mail.gmail.com>
To: "fan.xin" <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wpa-supplicant: Fix CVE-2015-4142
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
X-List-Received-Date: Fri, 26 Jun 2015 15:19:54 -0000
Content-Type: multipart/alternative; boundary=001a1147f32e80ed0b05196d45b3

--001a1147f32e80ed0b05196d45b3
Content-Type: text/plain; charset=UTF-8

On 26 June 2015 at 09:05, fan.xin <fan.xin@jp.fujitsu.com> wrote:

> +From ef566a4d4f74022e1fdb0a2addfe81e6de9f4aae Mon Sep 17 00:00:00 2001
> +From: Jouni Malinen <j@w1.fi>
> +Date: Wed, 29 Apr 2015 02:21:53 +0300
> +Subject: [PATCH] AP WMM: Fix integer underflow in WMM Action frame parser
> +
> +The length of the WMM Action frame was not properly validated and the
> +length of the information elements (int left) could end up being
> +negative. This would result in reading significantly past the stack
> +buffer while parsing the IEs in ieee802_11_parse_elems() and while doing
> +so, resulting in segmentation fault.
> +
> +This can result in an invalid frame being used for a denial of service
> +attack (hostapd process killed) against an AP with a driver that uses
> +hostapd for management frame processing (e.g., all mac80211-based
> +drivers).
> +
> +Thanks to Kostya Kortchinsky of Google security team for discovering and
> +reporting this issue.
> +
> +Signed-off-by: Jouni Malinen <j@w1.fi>
>

This patch needs an Upstream-Status (backport?) and Signed-off-by in the
patch header.

Ross

--001a1147f32e80ed0b05196d45b3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 June 2015 at 09:05, fan.xin <span dir=3D"ltr">&lt;<a href=3D"mailto:f=
an.xin@jp.fujitsu.com" target=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2jd" class=3D"a3s"=
 style=3D"overflow:hidden">+From ef566a4d4f74022e1fdb0a2addfe81e6de9f4aae M=
on Sep 17 00:00:00 2001<br>
+From: Jouni Malinen &lt;<a href=3D"mailto:j@w1.fi">j@w1.fi</a>&gt;<br>
+Date: Wed, 29 Apr 2015 02:21:53 +0300<br>
+Subject: [PATCH] AP WMM: Fix integer underflow in WMM Action frame parser<=
br>
+<br>
+The length of the WMM Action frame was not properly validated and the<br>
+length of the information elements (int left) could end up being<br>
+negative. This would result in reading significantly past the stack<br>
+buffer while parsing the IEs in ieee802_11_parse_elems() and while doing<b=
r>
+so, resulting in segmentation fault.<br>
+<br>
+This can result in an invalid frame being used for a denial of service<br>
+attack (hostapd process killed) against an AP with a driver that uses<br>
+hostapd for management frame processing (e.g., all mac80211-based<br>
+drivers).<br>
+<br>
+Thanks to Kostya Kortchinsky of Google security team for discovering and<b=
r>
+reporting this issue.<br>
+<br>
+Signed-off-by: Jouni Malinen &lt;<a href=3D"mailto:j@w1.fi">j@w1.fi</a>&gt=
;</div></blockquote></div><br>This patch needs an Upstream-Status (backport=
?) and Signed-off-by in the patch header.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147f32e80ed0b05196d45b3--
