Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 90BF673BB8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 20:41:29 +0000 (UTC)
Received: by qcbdu2 with SMTP id du2so6938731qcb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 May 2015 13:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=p/bzDwljadmP54kzcEtKWy2pfaWQxB2jGtH9ZrH2s1k=;
	b=D0oxXPckaweG/ku1kDE8Dr7l7eVaLeOHMOeWv4gT1/tckgnV3/yUBdSI44TPCfL/Xd
	lg66MlBzswTEYooik4fXWilVrIp0jBS184Kx3VKINgSnTh1T2DNYxpnH34PanW9P7Gxd
	UWn9vm1PIDSMLURnWROJN/4TIPpslPLCiHLmGq0FoUoXDbBSvAjmrAThFjDnsjHP2Oqi
	lRN2ETE9lqdKtTydGZU5Pis+LqKNnZIq3OVrUt8bWtg16BZFvgBP1lZQSAx+l8KTwIIU
	TBGquRLgq846SssJUoqI21gGH2GiAnBnr7MYEPVIfiEgf/J+4ItsxzFgRLFSQhJvv45+
	rhAA==
X-Gm-Message-State: ALoCoQn1WSHvjXqo9b2QFSgl9aMd7rfJKMW+FxRilFlk2Sd5m229jszrPlKmz5BpfV4wPfpSuKK6
X-Received: by 10.140.89.37 with SMTP id u34mr13063581qgd.15.1430512890284;
	Fri, 01 May 2015 13:41:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 1 May 2015 13:41:09 -0700 (PDT)
In-Reply-To: <1429720746-20096-1-git-send-email-thomas.perrot@tupi.fr>
References: <1429720746-20096-1-git-send-email-thomas.perrot@tupi.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 May 2015 21:41:09 +0100
Message-ID: <CAJTo0LZkVGZTVBueVpwFaTvmiK_3vsXRB45abKSs0--fbVWzZw@mail.gmail.com>
To: Thomas Perrot <thomas.perrot@tupi.fr>
Cc: tprrt <tprrt@tupi.fr>, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-systemctl-native: fix checksum error
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
X-List-Received-Date: Fri, 01 May 2015 20:41:29 -0000
Content-Type: multipart/alternative; boundary=001a11c117eeac44b605150b3cc6

--001a11c117eeac44b605150b3cc6
Content-Type: text/plain; charset=UTF-8

On 22 April 2015 at 17:39, Thomas Perrot <thomas.perrot@tupi.fr> wrote:

> ERROR: systemd-systemctl-native: md5 data is not matching for
> file:///home/tprrt/dev/oe-build-easy/combination/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690
> ERROR: systemd-systemctl-native: The new md5 checksum is
> 751419260aa954499f7abaabaa882bbe
>

The LICENSE in oe-core definitely has the md5sum 4d92[...].  Are you using
a tool to create a combined repository that is overriding the LICENSE file?

Ross

--001a11c117eeac44b605150b3cc6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 April 2015 at 17:39, Thomas Perrot <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:thomas.perrot@tupi.fr" target=3D"_blank">thomas.perrot@tupi.fr</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5ie" class=3D=
"a3s" style=3D"overflow:hidden">ERROR: systemd-systemctl-native: md5 data i=
s not matching for file:///home/tprrt/dev/oe-build-easy/combination/LICENSE=
;md5=3D4d92cd373abda3937c2bc47fbc49d690<br>
ERROR: systemd-systemctl-native: The new md5 checksum is 751419260aa954499f=
7abaabaa882bbe<br></div></blockquote></div><br>The LICENSE in oe-core defin=
itely has the md5sum 4d92[...].=C2=A0 Are you using a tool to create a comb=
ined repository that is overriding the LICENSE file?</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c117eeac44b605150b3cc6--
