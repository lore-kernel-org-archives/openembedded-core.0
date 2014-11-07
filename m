Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 536A865C7C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 12:16:38 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id q107so2273147qgd.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 04:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lbTYBaiXLa8Dt7rvCsnxS/gOg2TGkuyByoX15IIXAjw=;
	b=SZ4vNajZKzWoNpCvmiQ22XR7mhxUd0ysGy7+7qqV+JrwZWmWpVnDWMfYXMrrAKFthI
	3trPveoMr2gMF43PdX3bdUtYCm8MIZ3Efr0bYvuP32eC3+TVPnbiauSSuQdBRKCMDG3z
	2Xpvxo4NSa8ky8TrukowpxVS3ubxLnebdsdQQjWJdubbOYJUd1u6/Cu94g8NLcj9nbUz
	YEhOHVmARtzt0uTdaW1cf9A//JE732UKjlrws+3Z2yJb9XKSi3P4GRs2DvK7+MQ89Ql8
	BP1jew56VyDw2xQ3nrNQ+t65Yl//qs130/RsisNSCo/zocuUSvUZ1zfHKHC4i3HRQqQp
	2Ylg==
X-Gm-Message-State: ALoCoQlp1fX3EduYf0T39WE+YEClAoX7z5N+sUSPX9N/N0iMy/PD2VXTVKe2dlGl4oiT2Q3TPchF
X-Received: by 10.229.224.201 with SMTP id ip9mr16735656qcb.5.1415362599096;
	Fri, 07 Nov 2014 04:16:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 7 Nov 2014 04:16:18 -0800 (PST)
In-Reply-To: <1415346729-16760-3-git-send-email-schnitzeltony@googlemail.com>
References: <1415346729-16760-1-git-send-email-schnitzeltony@googlemail.com>
	<1415346729-16760-3-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 12:16:18 +0000
Message-ID: <CAJTo0Lbe3s-9T4CP4YGdpKfeCEbEnQF3SDWJt4CNie9B8mr_DA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] xserver-xorg: update to 1.16.1
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
X-List-Received-Date: Fri, 07 Nov 2014 12:16:41 -0000
Content-Type: multipart/alternative; boundary=001a1135ef1ef2a1db050743c8e4

--001a1135ef1ef2a1db050743c8e4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On 7 November 2014 07:52, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
>
wrote:

> * first version supporting rootless X (not tested yet)
> * modesetting working for non PCI gpus (tested on gumstix overo)
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>

When removing patches, please give a rationale.  I've looked and will
update the log to reflect this, but please do this in the future.

Ross

--001a1135ef1ef2a1db050743c8e4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Andreas,</div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On 7 November 2014 07:52, Andre=
as M=C3=BCller <span dir=3D"ltr">&lt;<a href=3D"mailto:schnitzeltony@google=
mail.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":ue" class=3D"a3s" style=
=3D"overflow:hidden">* first version supporting rootless X (not tested yet)=
<br>
* modesetting working for non PCI gpus (tested on gumstix overo)<br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goog=
lemail.com">schnitzeltony@googlemail.com</a>&gt;</div></blockquote></div><b=
r>When removing patches, please give a rationale.=C2=A0 I&#39;ve looked and=
 will update the log to reflect this, but please do this in the future.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a1135ef1ef2a1db050743c8e4--
