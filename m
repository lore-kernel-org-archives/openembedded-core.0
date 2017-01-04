Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id C19D5719AC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 20:39:58 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id a20so23647904qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 12:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G7SVMXWRxaMH4Q6vfaQQX6f6+8H0wEZV/45XIB6pK3M=;
	b=r+t7jhHnDTqSM1DQxYJavi7rVGCow8r3gM38HHkYRBJZj0m8e28gHNI8/nYFeCAV3D
	K6Em6+QY9+O0wFWJ4qN3WgAT2YyA1iWbAjZauCEgiYZBfYscTwtly3/AiZdpMfBzfjPC
	ZtX7A4O+sv3clOL0KA3LZUHb9UsWiLZg5CW5bBXYlH8kfRu76cW8vyJ3aOpLyYiIQ07y
	mF7R/gdjf+InY7ldOi4Uj+di7fRdHAPh5znQx8yS6OJL6yAliJVCKBFZntwpgpfkQcuj
	24AnEPSEUnADLeYuw7YPFQWd8yiVbSDGxyntKI8ZQiRXkMjk+XlzflJoc6JKq+d0B94w
	U5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G7SVMXWRxaMH4Q6vfaQQX6f6+8H0wEZV/45XIB6pK3M=;
	b=kSmCjEqxtXNGbiKmJz1Ocb3PcI7YRgyW6Jkjfpln1P5oR8fSfNE1MWPKmGc8rHhu63
	I/mF41vsjFFObSiiEku85EuB3IiwxwJMtMfUY3baB/QzYK4AuBjlTSgA0vIpIpM1PGTn
	nJpndBsiBBtExCtJC/w8vgKpmrRv5PhPmNUyaoTrDVV95cifIlKUQhEOs3vIi3jICQHQ
	EnYlS0n23/fkY5QcuO+14B2Qf8hkXHlWJ53HzBpIFFZKGGCWW+PQvfdHN4rtv6Ik+QTA
	2aQNdNLDUCmBvVx777ehX6MkBj4p+iQzL11XxM0jsLhAL9YEQNhljVFiswWlw5HfOmQX
	KnOA==
X-Gm-Message-State: AIkVDXL/2+9ilkj+dbRDaUHzlHJf6GEsiDK/9rfF4RK0JKZ9ykMIm8PoGFtH5Lxq/xvEjmMjCNQOEvjhUt709/o4
X-Received: by 10.55.8.20 with SMTP id 20mr75460027qki.3.1483562398370; Wed,
	04 Jan 2017 12:39:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 4 Jan 2017 12:39:37 -0800 (PST)
In-Reply-To: <CAAtXAHe=ob8N-Z6OzVPm_Fbc91Z3Ve+=K4Mubp79PJhik8a+bA@mail.gmail.com>
References: <1483512355-27961-1-git-send-email-moritz.fischer@ettus.com>
	<740a7531-d635-8191-d901-ffaa0deffae4@linux.intel.com>
	<CAAtXAHe=ob8N-Z6OzVPm_Fbc91Z3Ve+=K4Mubp79PJhik8a+bA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Jan 2017 20:39:37 +0000
Message-ID: <CAJTo0Lah1nRgbaVcFokUQZEr1zbDgyACrfvxP50vo9y8dv5DBw@mail.gmail.com>
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] devtools: Add recipe for Chromium Embedded Controller utilities
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
X-List-Received-Date: Wed, 04 Jan 2017 20:39:59 -0000
Content-Type: multipart/alternative; boundary=001a114c9d60c1f9f205454ac9cf

--001a114c9d60c1f9f205454ac9cf
Content-Type: text/plain; charset=UTF-8

On 4 January 2017 at 20:25, Moritz Fischer <moritz.fischer@ettus.com> wrote:

> Good catch, thanks. I submitted it upstream. I'll just wait for that
> to resubmit my v4 here, maybe by then I don't need the patch anymore
> then.
>

Is there a good rationale to put this in oe-core, instead of a BSP layer or
meta-oe?  How widespread are boards that use this tool?

Ross

--001a114c9d60c1f9f205454ac9cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 January 2017 at 20:25, Moritz Fischer <span dir=3D"ltr">&lt;<a href=3D=
"mailto:moritz.fischer@ettus.com" target=3D"_blank">moritz.fischer@ettus.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1kz" =
class=3D"a3s aXjCH m1596b2925d067950">Good catch, thanks. I submitted it up=
stream. I&#39;ll just wait for that<br>
to resubmit my v4 here, maybe by then I don&#39;t need the patch anymore<br=
>
then.<br></div></blockquote><div><br></div><div>Is there a good rationale t=
o put this in oe-core, instead of a BSP layer or meta-oe?=C2=A0 How widespr=
ead are boards that use this tool?</div><div><br></div><div>Ross=C2=A0</div=
></div><br></div></div>

--001a114c9d60c1f9f205454ac9cf--
