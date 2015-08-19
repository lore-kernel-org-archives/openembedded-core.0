Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id B9AEB75E81
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 17:53:08 +0000 (UTC)
Received: by iodb91 with SMTP id b91so17966373iod.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=tpgs7/8A9ltiE0cOl5DXvx95oO2EoXKkKv76WkhCIWo=;
	b=NLiPZzpaunXX5OJC19vti0aFaOoWT/qQcqy9ynUXOJzsIJlIRwSQjjQkCyeiWsISHG
	Rx6UzpuDbspFzC3fK9VdJ0Odd13yAE+oSGz446ryPaqs3RK3tZL6XbAADnjclnnwNN74
	JmCamc2IFq/vYKl5/aMXG2ticputyIPCZrJSuc+Q0UuPqOV1tL4SFYfkVFW+jc/CAnAQ
	D6PAbzI8fTO0M1TTUk1mbB7Y5mbKM6EwUTAkovETDmWXlcVIL4c7XSDbK3R+95XpFzfi
	+H6l6LPfxXL8z5nVSGPgBud1ThQtspYlZVA07l08RXogNW0VIj1ME09+DsWJcvy6RT8i
	Yxfg==
X-Received: by 10.107.40.85 with SMTP id o82mr13393814ioo.83.1440006788910;
	Wed, 19 Aug 2015 10:53:08 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.118.150 with HTTP; Wed, 19 Aug 2015 10:52:49 -0700 (PDT)
In-Reply-To: <1439991165-13121-3-git-send-email-brendan.le.foll@intel.com>
References: <1439991165-13121-1-git-send-email-brendan.le.foll@intel.com>
	<1439991165-13121-3-git-send-email-brendan.le.foll@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 19 Aug 2015 10:52:49 -0700
X-Google-Sender-Auth: jGKIbMGrkg-jW_RkSVy1bB8aNfw
Message-ID: <CABcZANnhYzCmt0yZHayQ4TxQMgQ1DPYwZRAXJMH-9sovCHY6mg@mail.gmail.com>
To: brendan.le.foll@intel.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] toolchain-shar-extract.sh: better default install path for extensible SDK
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
X-List-Received-Date: Wed, 19 Aug 2015 17:53:08 -0000
Content-Type: multipart/alternative; boundary=001a1141f3fc20b6a6051dadb5af

--001a1141f3fc20b6a6051dadb5af
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 19, 2015 at 6:32 AM, <brendan.le.foll@intel.com> wrote:

> From: Brendan Le Foll <brendan.le.foll@intel.com>
>
> Extensible SDK cannot be installed as root so by default offer to install
> it in
> user's home directory under distro/distro_version replacing the normal SDK
> version '+' char with a '_' as that's a restricted character for bitbake
>
> Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
>

Why not use a metadata variable for the default, replacing with @@ as with
the other metadata variables, rather than hardcoding the default in the .sh
where it can't be easily overridden by the distro or user?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1141f3fc20b6a6051dadb5af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Aug 19, 2015 at 6:32 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:brend=
an.le.foll@intel.com" target=3D"_blank">brendan.le.foll@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":13e" class=3D"a3=
s" style=3D"overflow:hidden">From: Brendan Le Foll &lt;<a href=3D"mailto:br=
endan.le.foll@intel.com">brendan.le.foll@intel.com</a>&gt;<br>
<br>
Extensible SDK cannot be installed as root so by default offer to install i=
t in<br>
user&#39;s home directory under distro/distro_version replacing the normal =
SDK<br>
version &#39;+&#39; char with a &#39;_&#39; as that&#39;s a restricted char=
acter for <span class=3D"il">bitbake</span><br>
<br>
Signed-off-by: Brendan Le Foll &lt;<a href=3D"mailto:brendan.le.foll@intel.=
com">brendan.le.foll@intel.com</a>&gt;</div></blockquote></div><br>Why not =
use a metadata variable for the default, replacing with @@ as with the othe=
r metadata variables, rather than hardcoding the default in the .sh where i=
t can&#39;t be easily overridden by the distro or user?<br>-- <br><div clas=
s=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>F=
ounder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior =
Software Engineer, Mentor Graphics</div>
</div></div>

--001a1141f3fc20b6a6051dadb5af--
