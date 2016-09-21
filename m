Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7E42C6E630
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 15:18:28 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id m186so55971880ioa.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 08:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tfHSPUJPk82fmD32H+IHOATwpMIUbGKwUH5BkdK0iPk=;
	b=t7sF2XCciYsfqcqclmb1gppO9u9gUYfky0CP0/rQPzm8UnlFWxaREEp7lY8+5ppCyI
	s7mH6wVlf3mWPT9qlgq7mxy7h88FKU3ITKtWx2E29gtZH83LZFUngJZZ3yGmq553w45+
	ycDCsyIWBgKdwHs1ryNM0pJe/37Se4/ev2S0BGwAL6AjsOuhaTvZpL1DGqiWGU8t3EsI
	2NvgVL5lU6878Sg20UxBZKdF+LEJnARN/NHNfIfOOOjuaf+QGAX12xKscbW/ZZ3/mX0c
	C7V+a5EFTCZPQdsdSlei8/4gvSprbkKvThCzQcBY3iYd5iBLm5ZHflWz/xwpD6+cJOMS
	JnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tfHSPUJPk82fmD32H+IHOATwpMIUbGKwUH5BkdK0iPk=;
	b=RYne7us1YFiL1T5+IWdScAh3SCd1WHTB3aEGm+ZoN+xqL+B/g6BWfktTizZ878Qorw
	f+hkbHmaBFhFxgSJAvxHiPSZ+4BcVG1j0N/PvtyvR9lg6cd8qmMVJsDTaa4IN66rq0Wx
	AYTasq+JTlVuvx45SlKpJDleBmLrQHXB6LH2CStKkl7TfwIi3eZ93jkxioQojeQ0CAXn
	bpkTXkiivoq2413JPwHhh8pIrtIoRW1jzGuDojunUzlYDyANqXNMLZ0ZeEMkILsfq+eR
	0sZLALt1CIOAYcJjgtnWlNuoitpZkjFPOkfigxf4Vjbw9Q5eU721CElIEHTkzSAnobdE
	udkQ==
X-Gm-Message-State: AE9vXwMhIg9ETCE7gn9pZiKGZD0VWH0eYi2pqoHAiIhFdRBzmsC7Lox+IoxBD9biZf+ERDn+hw5h+SMRG63zztER
X-Received: by 10.107.47.227 with SMTP id v96mr51653772iov.172.1474471110369; 
	Wed, 21 Sep 2016 08:18:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Wed, 21 Sep 2016 08:18:10 -0700 (PDT)
In-Reply-To: <1474426062-13962-1-git-send-email-Zhixiong.Chi@windriver.com>
References: <1474426062-13962-1-git-send-email-Zhixiong.Chi@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Sep 2016 16:18:10 +0100
Message-ID: <CAJTo0LaHM42OjPzeWe8SDz8-94VPkWsPfU2eVQKK+fza6t-eDw@mail.gmail.com>
To: Zhixiong Chi <Zhixiong.Chi@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wpa_supplicant: Security Advisory-wpa_supplicant-CVE-2016-4476
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
X-List-Received-Date: Wed, 21 Sep 2016 15:18:31 -0000
Content-Type: multipart/alternative; boundary=001a11c168fac40cb7053d060ed1

--001a11c168fac40cb7053d060ed1
Content-Type: text/plain; charset=UTF-8

On 21 September 2016 at 03:47, Zhixiong Chi <Zhixiong.Chi@windriver.com>
wrote:

> +From ecbb0b3dc122b0d290987cf9c84010bbe53e1022 Mon Sep 17 00:00:00 2001
> +From: Jouni Malinen <jouni@qca.qualcomm.com>
> +Date: Fri, 4 Mar 2016 17:20:18 +0200
> +Subject: [PATCH 1/2] WPS: Reject a Credential with invalid passphrase
> +
> +WPA/WPA2-Personal passphrase is not allowed to include control
> +characters. Reject a Credential received from a WPS Registrar both as
> +STA (Credential) and AP (AP Settings) if the credential is for WPAPSK or
> +WPA2PSK authentication type and includes an invalid passphrase.
> +
> +This fixes an issue where hostapd or wpa_supplicant could have updated
> +the configuration file PSK/passphrase parameter with arbitrary data from
> +an external device (Registrar) that may not be fully trusted. Should
> +such data include a newline character, the resulting configuration file
> +could become invalid and fail to be parsed.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
>

Please add your own s-o-b to the patch header, and as it fixes a CVE then a
CVE tag (CVE: CVE-2016-4476) too.

Ross

--001a11c168fac40cb7053d060ed1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 September 2016 at 03:47, Zhixiong Chi <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Zhixiong.Chi@windriver.com" target=3D"_blank">Zhixiong.Chi@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:1pf"=
 class=3D"gmail-a3s gmail-aXjCH gmail-m1574aa4d6e7b1070">+From ecbb0b3dc122=
b0d290987cf9c84010<wbr>bbe53e1022 Mon Sep 17 00:00:00 2001<br>
+From: Jouni Malinen &lt;<a href=3D"mailto:jouni@qca.qualcomm.com">jouni@qc=
a.qualcomm.com</a>&gt;<br>
+Date: Fri, 4 Mar 2016 17:20:18 +0200<br>
+Subject: [PATCH 1/2] WPS: Reject a Credential with invalid passphrase<br>
+<br>
+WPA/WPA2-Personal passphrase is not allowed to include control<br>
+characters. Reject a Credential received from a WPS Registrar both as<br>
+STA (Credential) and AP (AP Settings) if the credential is for WPAPSK or<b=
r>
+WPA2PSK authentication type and includes an invalid passphrase.<br>
+<br>
+This fixes an issue where hostapd or wpa_supplicant could have updated<br>
+the configuration file PSK/passphrase parameter with arbitrary data from<b=
r>
+an external device (Registrar) that may not be fully trusted. Should<br>
+such data include a newline character, the resulting configuration file<br=
>
+could become invalid and fail to be parsed.<br>
+<br>
+Upstream-Status: Backport<br>
+<br>
+Signed-off-by: Jouni Malinen &lt;<a href=3D"mailto:jouni@qca.qualcomm.com"=
>jouni@qca.qualcomm.com</a>&gt;</div></blockquote></div><br>Please add your=
 own s-o-b to the patch header, and as it fixes a CVE then a CVE tag (CVE:=
=C2=A0<span style=3D"font-size:12.800000190734863px">CVE-2016-4476) too.</s=
pan></div><div class=3D"gmail_extra"><span style=3D"font-size:12.8000001907=
34863px"><br></span></div><div class=3D"gmail_extra"><span style=3D"font-si=
ze:12.800000190734863px">Ross</span></div></div>

--001a11c168fac40cb7053d060ed1--
