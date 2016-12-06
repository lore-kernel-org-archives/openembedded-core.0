Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1E9F771A76
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 15:40:13 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id p16so348687228qta.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 07:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=902oJ3MlEWOGqUT2ONk3z/axv3/eoROZuN0AGG2Eo30=;
	b=ITjQezMF1uU+7ZrcIDa7pGyzEQFLobiObaBjWpMxZt6GwoTs/iP/gE3KsnSSB2TeHh
	zfj5GR1VoAc5m7PV4yAQ543094hkUlIEtpjNDxIfhktHJ6IdhGB1jPjdc7+jg6FojV8A
	4CkWV+d/0MDpq97TUBkwYNwZF4vCSofprQ+pWPH/8ZiaeLjVh5rhAQvPJ9kvHVXQhsao
	NaaN9holkZZUDIpyJ6z9I9EYTWZhG71gQAHg1phwByxTkgg8h5SZXIBbhqvOx5i3HVNB
	vfNJGsiPu6kMztqDnE6IaPeuv+txagVAMRNed9TrVWvq90c0nLBkv+LO7R+KH9BQ+gZ3
	hNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=902oJ3MlEWOGqUT2ONk3z/axv3/eoROZuN0AGG2Eo30=;
	b=fvXxzw5J1CTGGtybgdpDzQQxrPpHcC2c+aMkrHf6pOWmDzWeApLHs0xLtlfNgXXGTc
	hOOU3Yk83grytaZDSw61+NFXjpit80XYylEOMPy8P8dXLAdBiwOTPT0nZVfBZhBRM+T2
	gY96hSFjsKwX4k0kcQSzN6sboWMLEWfHW8ZVqSWV3tEggHpLIS4T2Vq2OQkfINwi1OPA
	6G+gLvPyOA9If0Q+Tgj8EYnwIr8DkaXd/zyBr1itcEHp1lm9LmQmKScV9TYkvo40Icok
	NAXt4cf1d7HVOKNUBD8gAjgsstPGUc2APfZyd4CN71wyIYrZpA6vE+QQYGKTAKnqZxve
	biwg==
X-Gm-Message-State: AKaTC02UriwZ0qbhgI3ZcJFOUcSqrU9iKrP8NvZjTFS05Fl+Emxooi3lNEIHBmkppFEqUdV4Y8k8YpSHUVTX9Jlb
X-Received: by 10.237.37.77 with SMTP id w13mr62362595qtc.197.1481038815259;
	Tue, 06 Dec 2016 07:40:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 07:39:54 -0800 (PST)
In-Reply-To: <1481024991-5882-4-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-4-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 15:39:54 +0000
Message-ID: <CAJTo0LbCWZYmnaxDjKNr==nNvyXn0Y3nXnJanoQb5ccgZpWxpg@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/33] dpkg-native: hardcode SYSCONFDIR to /etc in update-alternatives
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
X-List-Received-Date: Tue, 06 Dec 2016 15:40:14 -0000
Content-Type: multipart/alternative; boundary=001a114108ea7b9fe20542ff388e

--001a114108ea7b9fe20542ff388e
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 11:49, Andreas Oberritter <obi@opendreambox.org>
wrote:

> +    sed -i -e 's|SYSCONFDIR|"/etc"|' ${S}/utils/update-alternatives.c
>

Hardcoding /etc is bad, can't you just remove the native sysroot prefix
from $sysconfdir?

Ross

--001a114108ea7b9fe20542ff388e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 11:49, Andreas Oberritter <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3dl" cla=
ss=3D"a3s aXjCH m158d3f8abdc424d7">+=C2=A0 =C2=A0 sed -i -e &#39;s|SYSCONFD=
IR|&quot;/etc&quot;|&#39; ${S}/utils/update-<wbr>alternatives.c<br></div></=
blockquote></div><br>Hardcoding /etc is bad, can&#39;t you just remove the =
native sysroot prefix from $sysconfdir?</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a114108ea7b9fe20542ff388e--
