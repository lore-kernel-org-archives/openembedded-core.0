Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id B7F967F688
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 12:12:55 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id r25so7069326uam.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 05:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5j/k+Ae7ux/IanJAQe3N6sSiPm7wTS4sF4rXmL84byY=;
	b=qWfdxaWm6f3FKR4CwzVnEKzgBrVWd9dxEgYWeuEY872BFCgFw+4TH9Va/O0fmK4KIc
	FY1ZSq4NkSt2CjT8ytaQuXK064kfggvEIDQ1MqwTq/LwzTUP5Xah0tczjQo/9iNmYOEN
	dt8N/7Q6oG+z97ITeQz1gabhqONmEkZVeqTqrgsvXuoLHMLvqmZMhE2d7iM7hV3r0wHC
	rBNvgYD5hJwbyTBMhLE3YaB4wJwnwL2SvQ2CvGHsH1NAzp3m39qvMlDw5iZCI5qU0d2j
	fykiqb/XazayqOwsgiTqLlZKcqv977F1aK4p5o+8BZWI3ZMPWAgTvU/LrYco7tb2dUWS
	BFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5j/k+Ae7ux/IanJAQe3N6sSiPm7wTS4sF4rXmL84byY=;
	b=A02dbIZw9xGGuZYuIntPNu+r29KIQjRPExp5cvCwpdu6mbnFY78Kk4DTzCECrSWf34
	kcVpGbcE+Boe3oRt+M3E3oWNgaChj9atlol47jWwobwnAerswxrygdpGynQWq7JswStq
	WxObXtZ3N+BA0I7kaeMGhCdphZFfUxnHHQVgQNKQEhdXOjTqW6iqqSQBMVMU4usRgZ3R
	Cw/iBREqJdGZM1i3Ivi4gpbRwf7OUPJZNXVv07MgmWEq1VYNYQnIihpFdE3NC/X3aAJv
	M8eTqgCt2pWMqAjLpToXSIkI1u9rTDy5UR/TuX/ZjkVIj8VkxcsjUGGCBQirbmDFxbGL
	/BKg==
X-Gm-Message-State: APjAAAW85c8+BlmM+EIC3r5e4GoZiP3I4Zi+VC8zKmxroWXuH85yPo6V
	yd7h/AqakcOi2VaSbjwaiX7p0K885FcUnjcegA4=
X-Google-Smtp-Source: APXvYqztyzutUj2CFbgQLhH4ShJt2VilYOfONhdL28ZiI++Aw55QvWbV565XROiXx7X7wt+wY7PXj3QJBWNmBopCmbk=
X-Received: by 2002:ab0:1c06:: with SMTP id a6mr6006508uaj.93.1571919176452;
	Thu, 24 Oct 2019 05:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
In-Reply-To: <5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Oct 2019 14:12:43 +0200
Message-ID: <CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: brendan.le.foll@intel.com,
	"Paul Eggleton \(paul.eggleton@linux.intel.com\)"
	<paul.eggleton@linux.intel.com>, rennes@savoirfairelinux.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Thu, 24 Oct 2019 12:12:55 -0000
Content-Type: multipart/alternative; boundary="00000000000020cf280595a6f4e1"

--00000000000020cf280595a6f4e1
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Oct 2019 at 14:02, Stefan Herbrechtsmeier <
stefan@herbrechtsmeier.net> wrote:

>
> @Richard: What is your opinion about the per recipe dependency?
> Typically OE use one recipe per project. The NPM based solution handle a
> project and all dependencies via one recipe.
>

I don't think it's at all realistic to stick to the 'one recipe per
component' in node.js world. A typical 'npm install' can pull down
hundreds, or over a thousand dependencies, it's not feasible to have a
recipe for each.

I very much welcome a solution that uses 'npm install' in a way that
preserves offline builds, and integrity/reproducibility of downloads.
License management should be also handled by npm, and if it isn't, then we
need to work with the upstream to address it.

Alex

--00000000000020cf280595a6f4e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 24 Oct 2019 at 14:02, Stefan Herb=
rechtsmeier &lt;<a href=3D"mailto:stefan@herbrechtsmeier.net">stefan@herbre=
chtsmeier.net</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><br>
@Richard: What is your opinion about the per recipe dependency? <br>
Typically OE use one recipe per project. The NPM based solution handle a <b=
r>
project and all dependencies via one recipe.<br></blockquote><div><br></div=
><div>I don&#39;t think it&#39;s at all realistic to stick to the &#39;one =
recipe per component&#39; in node.js world. A typical &#39;npm install&#39;=
 can pull down hundreds, or over a thousand dependencies, it&#39;s not feas=
ible to have a recipe for each.</div><div><br></div><div>I very much welcom=
e a solution that uses &#39;npm install&#39; in a way that preserves offlin=
e builds, and integrity/reproducibility of downloads. License management sh=
ould be also handled by npm, and if it isn&#39;t, then we need to work with=
 the upstream to address it.<br></div><div></div><div><br></div><div>Alex<b=
r></div></div></div>

--00000000000020cf280595a6f4e1--
