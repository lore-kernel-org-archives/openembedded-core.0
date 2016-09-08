Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id E53036080F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 16:04:46 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id i184so265444604itf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 09:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KDJWoewWlgXQ2RNjhsSe1whfu+Pzh92fR4mCLszkYxY=;
	b=wb9ChUbhNYuaKPOoTTzhkP/x4laqIm4FEA5boGjAfZmXczt0eYvCgGElbGxtBEBd+Y
	qh6UbGzXBWu0zzix0aFYZ9wEsrBTz56bwXpHtfLMobUQyH+59ukusEyUaTQvJCIsmoYo
	q1EWvNljz9Y6a6eFC74+HNkDj1QUmHF91XcbjylnQmhtvz0/NmLRHrzSHfeJgxwSpuPs
	jRQTpfJHwu31k31DC32Ukwc/NlgDt+ATDZbiM8JoRzH3aBOsWlK5t9yDOAB89N8M70xK
	hliiZvnXQZn92WclFijyZylInfsNPR/MlT7IgP0kRPipulVj2sfpjktooQpl/uwnlwDI
	Pb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KDJWoewWlgXQ2RNjhsSe1whfu+Pzh92fR4mCLszkYxY=;
	b=iCROjBXLOQsymFLjKK8u6x3ocgIsfB92Un7nc4AYWcPUNu3Eld2pqAV+WyLNQK/PZO
	xoXhLaysaelr+KVOtnBk5DPy4B69RXMy+YVXWtXQ7HA71LMpJD0Pm1C+9Wdl0DsIQOK9
	iD6YjvK9rDBCbWeoxrwI/ClWVx9RuJEAgpz5kGoJJA0LD2oao7820XHgoGvMqfxE04vC
	NZ+WfTKDpDo5iTCRLe3gsrq6Ncz+xpzAxpQ11eTOYlFnHJF6/lza+wx6kvEbdrcC07bY
	Qk61WC1/nzbL3R8mgqK3d3oNdGMit+8NxfiXO5ExKBXtAJYTQAvSkAY424DRYJ2HCH8+
	efRg==
X-Gm-Message-State: AE9vXwM1HXIGTV9Z8GyE2qnwXYkpxkoOnw46RUub8It2xHpD3DrYkO4JIPyT4qlZJFOeiZsV45+WFURJPO+WS6oR
X-Received: by 10.36.3.76 with SMTP id e73mr17027945ite.42.1473350687205; Thu,
	08 Sep 2016 09:04:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 8 Sep 2016 09:04:26 -0700 (PDT)
In-Reply-To: <1473349614-5497-1-git-send-email-maxin.john@intel.com>
References: <1473349614-5497-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Sep 2016 17:04:26 +0100
Message-ID: <CAJTo0LZOm52gsC7LgcJkdDA6Hsq3V3n29o4n8vqPvwW+DhjUDw@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] gstreamer1.0-omx: provide RECIPE_NO_UPDATE_REASON
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
X-List-Received-Date: Thu, 08 Sep 2016 16:04:47 -0000
Content-Type: multipart/alternative; boundary=001a114199405787c4053c013041

--001a114199405787c4053c013041
Content-Type: text/plain; charset=UTF-8

On 8 September 2016 at 16:46, Maxin B. John <maxin.john@intel.com> wrote:

> +RECIPE_NO_UPDATE_REASON = "Version 1.9.2 requires gstreamer-1.0 >= 1.9.2"
>

Are they adopting the GStreamer versioning style, so we should inherit
upstream-version-is-even instead?

Ross

--001a114199405787c4053c013041
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 September 2016 at 16:46, Maxin B. John <span dir=3D"ltr">&lt;<a href=
=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3vf" class=
=3D"a3s aXjCH m1570a7b7172bec0e">+RECIPE_NO_UPDATE_REASON =3D &quot;Version=
 1.9.2 requires gstreamer-1.0 &gt;=3D 1.9.2&quot;<br></div></blockquote><di=
v><br></div><div>Are they adopting the GStreamer versioning style, so we sh=
ould inherit upstream-version-is-even instead?</div><div><br></div><div>Ros=
s=C2=A0</div></div><br></div></div>

--001a114199405787c4053c013041--
