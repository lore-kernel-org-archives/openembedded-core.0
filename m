Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1683E65C78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 20:38:13 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id x3so2779288qcv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 12:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Zu2ayJY7waA1JAs8oxisrpbxG3qAxbrdEySGyy88D6k=;
	b=fIKQCVPbfAEqHQnyfgJWxalVrpctMdJiyOxqiLzgfNBWPE1WZiAhu4tk7vBwPckg2U
	HZopAV6LaQSGuxKW6+BTUYQLRfRojD3TFN/+6bl0CCAZY003ZpLJNCP134fWLSREEbjY
	UGdNjtlGWxAicZ2QRjKt+bioBpFUOyPkrXwIi/Dp2RCo8+XYxAydUKglRpeDc6Jw4tRZ
	+e+E/MUwKNQaO1oXo0gzQlDv1T37SaWyzUbW3BqZkyCepVZtzFDZTOSYKRsKsneZV+ez
	JF+HoiUYlLF6ia4RFTyOtP7zB6j7WYUgaAbHhUvU9h3CEV42nR/G31+vF7OKuukqs7ob
	LaYQ==
X-Gm-Message-State: ALoCoQmLR9OAEvDZhx8YKFaWaK07ckXOBevphRzjqota1lTb3ClKNqDPTKaoj6icZL+R7CWVpn8J
X-Received: by 10.140.17.67 with SMTP id 61mr359997qgc.59.1416515892978; Thu,
	20 Nov 2014 12:38:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 20 Nov 2014 12:37:52 -0800 (PST)
In-Reply-To: <1415958217-16545-2-git-send-email-jian.liu@windriver.com>
References: <1415958217-16545-1-git-send-email-jian.liu@windriver.com>
	<1415958217-16545-2-git-send-email-jian.liu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Nov 2014 20:37:52 +0000
Message-ID: <CAJTo0LaTqjSJ35Lq4hbTDeF0F0Y2iAbdUU4+1VE11mhKoGZrgg@mail.gmail.com>
To: Jian Liu <jian.liu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] base-files: files will be over written when updating using rpm
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
X-List-Received-Date: Thu, 20 Nov 2014 20:38:14 -0000
Content-Type: multipart/alternative; boundary=001a11c0fa289eae300508504e21

--001a11c0fa289eae300508504e21
Content-Type: text/plain; charset=UTF-8

On 14 November 2014 09:43, Jian Liu <jian.liu@windriver.com> wrote:

> +CONFFILES_${PN} += "${sysconfdir}/motd ${sysconfdir}/nsswitch.conf
> ${sysconfdir}/profile"
>

I do have to wonder why we don't allow globs in CONFFILES and set
CONFFILES_${PN} to ${sysconfdir} by default...

Ross

--001a11c0fa289eae300508504e21
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 November 2014 09:43, Jian Liu <span dir=3D"ltr">&lt;<a href=3D"mailto=
:jian.liu@windriver.com" target=3D"_blank">jian.liu@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":50s" class=3D"a3=
s" style=3D"overflow:hidden">+CONFFILES_${PN} +=3D &quot;${sysconfdir}/motd=
 ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile&quot;</div></blockquote>=
<div><br></div><div>I do have to wonder why we don&#39;t allow globs in CON=
FFILES and set CONFFILES_${PN} to ${sysconfdir} by default...</div><div><br=
></div><div>Ross</div></div><br></div></div>

--001a11c0fa289eae300508504e21--
