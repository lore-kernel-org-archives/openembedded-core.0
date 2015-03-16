Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9AAF36AC3E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 16:27:16 +0000 (UTC)
Received: by qcyi15 with SMTP id i15so48598827qcy.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 09:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xZL5ewRdZagWdofY7+EJqjhhShZHRywZfdniayBlHH4=;
	b=mOmnzP4V35h7qeGVgGVpbrzkRq5D8NjiUBjPakKXZrc2BoV1R/upvyQCiLs/Tvk12K
	zMpFBO/9ho8obkzeWIK9xvDcSq1loA9kAyZ0LaGX8fioFJmMJgS3HE9jyd1f+atbKXkm
	dxl3CTg/vQedUiANgdtf5rdzC0vbRhNM5IxLKBDRSaun4VkrzgMa8osi18ltd9q38I9S
	hAK7Na4AG+JeiyVYIfAWm7MGzeMqe+7MG3oBzYz33NqefxxR+h5CwtsX8+H73Gv1ZY+0
	RH5eIg/NMNF3ZepxiXjKnFoJBjaoLsqWcBBcoeTRB4mmBzE816X2lqFz+tPo9+OZVeUv
	tsvw==
X-Gm-Message-State: ALoCoQmt/Tx4t3cqZ23m9awYmxgVVZPJ11RYqFKMKoR6GHbDlClSxGwi39tuTEcqEEBiMIokMKpr
X-Received: by 10.140.150.79 with SMTP id 76mr34262846qhw.66.1426523237913;
	Mon, 16 Mar 2015 09:27:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 16 Mar 2015 09:26:57 -0700 (PDT)
In-Reply-To: <73D5E895-8D8E-445E-B269-68F62A89B413@gmail.com>
References: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
	<73D5E895-8D8E-445E-B269-68F62A89B413@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Mar 2015 18:26:57 +0200
Message-ID: <CAJTo0LZvk3Y7ZuN1pX7ES2iGFThRLE_0w=w904xVVkupmCJULA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libtirpc: respin patches
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
X-List-Received-Date: Mon, 16 Mar 2015 16:27:17 -0000
Content-Type: multipart/alternative; boundary=001a1135487adc4ac405116a522e

--001a1135487adc4ac405116a522e
Content-Type: text/plain; charset=UTF-8

On 16 March 2015 at 18:24, Khem Raj <raj.khem@gmail.com> wrote:

> Patches are fine in this series, however I just want to set the
> expectations right here. While having that libc-independent goal is fine.
> Sometimes we just can not do it, since uclibc or musl
> does not have all the features that glibc has and an app might also be
> using it.
> making glibc users not have those features is unfair
> given that we have a strong mechanism of overrides in OE, it should be
> used to this advantage.
>

But these patches, which add configure options to enable/disable the
relevant functionality and have been sent upstream - represent the ideal
case as once they're merged won't cost us any effort in the future.

Ross

--001a1135487adc4ac405116a522e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 March 2015 at 18:24, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":4bd" class=3D"a3s" style=
=3D"overflow:hidden">Patches are fine in this series, however I just want t=
o set the expectations right here. While having that libc-independent goal =
is fine.<br>
Sometimes we just can not do it, since uclibc or musl<br>
does not have all the features that glibc has and an app might also be usin=
g it.<br>
making glibc users not have those features is unfair<br>
given that we have a strong mechanism of overrides in OE, it should be used=
 to this advantage.</div></blockquote><div><br></div><div>But these patches=
, which add configure options to enable/disable the relevant functionality =
and have been sent upstream - represent the ideal case as once they&#39;re =
merged won&#39;t cost us any effort in the future.</div><div><br></div><div=
>Ross=C2=A0</div></div></div></div>

--001a1135487adc4ac405116a522e--
