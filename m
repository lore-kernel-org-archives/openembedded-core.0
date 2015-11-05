Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 40A0A75D4A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 09:15:42 +0000 (UTC)
Received: by qkas77 with SMTP id s77so26712564qka.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 01:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=SfTgSActbtcEna/6VUEETZ19JobwO9Hm7GDQJhI0auY=;
	b=S9QwAODFh+ZGRLOk9xd5zFIe+65/L91zktLGZH1nwSh2OObFRz75F9eiO/Hwd7+ucO
	be0bSHnAztMvg25qODlNXyaVPQ66SZKxs/z6lgXbyxJEryz5JX+woycpE/0OdQhDFuhK
	qXXAgK00y7fViJbg5cfWSf1ia8JMI/I6e31RghgTS5RqjAjZJ0l/4rMpi62UhoYVWuzK
	dTkzGGiddmyVW9YlgDI4qg/uyoaXR5V7S4V8H+YlhK8vYbTKrt9TAzTWfqQG6SYjIhaK
	UR8qn9Zf9T502YTPCDvvm8ziNJR17/L8gMmDPPeY8kwUMxJDrZR86TYtLzRh7P2AzI/O
	OhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SfTgSActbtcEna/6VUEETZ19JobwO9Hm7GDQJhI0auY=;
	b=IEUpDryWq+vAp/0GBHvgoQNm21MB/3VcVwWeSmS4mzbg6DXu0lMomtAXjUxExrLboO
	Gtf1oTOm8R8VGq0Uz6b/jtBDQmgHEMo6BIywBzZvT7W8+pePsbylVpMuD5HFguaLW8v+
	DL9iQ9dLcdJ1PSvDpvQ03SLr5+N6c60aBK+iw6giCYwgMnbPIIvIFEsPZLxykYc1qwmi
	bDKQXhIRzInM/oS13ZSB5sn+QCpO/lZUU9Rm9v4RUn/mYHc9z3kWFVjShqjZYvu5hEgx
	RApQ0fz3oXdc1chqNL9iLJxkGRMEUcbmjJOTmGD8/eb9rvBUXf7WnTlVgm9WUsw/MK5l
	7tbA==
X-Gm-Message-State: ALoCoQkIdbXIP8PNVm7SsD+DyCi7DIv5S5E0Gw3pB8loA+wx0wpRf9zmubADwDu45vOBC02aygDM
X-Received: by 10.55.79.207 with SMTP id d198mr5940223qkb.49.1446714942257;
	Thu, 05 Nov 2015 01:15:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Thu, 5 Nov 2015 01:15:22 -0800 (PST)
In-Reply-To: <1446712332-17113-6-git-send-email-dv@pseudoterminal.org>
References: <1446712332-17113-1-git-send-email-dv@pseudoterminal.org>
	<1446712332-17113-6-git-send-email-dv@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Nov 2015 09:15:22 +0000
Message-ID: <CAJTo0Lbu2rC=Ucug+-yGGStmZcR5GZkV9kc5w++8OqauM0Q=tg@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] gstreamer1.0-libav: upgrade to version 1.6.1
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
X-List-Received-Date: Thu, 05 Nov 2015 09:15:44 -0000
Content-Type: multipart/alternative; boundary=001a114a9ada398ef70523c79271

--001a114a9ada398ef70523c79271
Content-Type: text/plain; charset=UTF-8

On 5 November 2015 at 08:32, Carlos Rafael Giani <dv@pseudoterminal.org>
wrote:

> +PACKAGECONFIG[gpl]  = "--enable-gpl,,"
>

Can you make this explicit by also having --disable-gpl please.

Ross

--001a114a9ada398ef70523c79271
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 November 2015 at 08:32, Carlos Rafael Giani <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:dv@pseudoterminal.org" target=3D"_blank">dv@pseudoterminal.or=
g</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ip" =
class=3D"a3s" style=3D"overflow:hidden">+PACKAGECONFIG[gpl]=C2=A0 =3D &quot=
;--enable-gpl,,&quot;<br></div></blockquote></div><br>Can you make this exp=
licit by also having --disable-gpl please.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114a9ada398ef70523c79271--
