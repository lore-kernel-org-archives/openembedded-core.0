Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id A3F49755F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 15:23:45 +0000 (UTC)
Received: by qgez77 with SMTP id z77so124075771qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 08:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jNUCF1XyjL5/XQhBdiARZzVLlCCElEds7fIa6ZC4870=;
	b=UYlbiwBdVsYwFrWswvCgFIC0imYWE2l7sO2CyPEVScXIYxpqVy6d5uQvRJHEp4RajE
	6Jpo6e+Zm4vt0lDfcv7UO1UFzaqlxvKRnqK+oZqGozoMtyjhoCZ4x+rWPHcUU1+ZLvf6
	9jaeJTmgXWMqlEJqQ8IyFhr4PTRfCJLKm5ZDNcHNBKjjlDHN6danwJ4NqpRCoUZybZOD
	pz6olV/9y7aopoc/r2OlxlRHUCR+eTKYgwYlvXjFD3mmPinqGAeDoDntaqj7hofmO/j2
	e+s9M6n+BEVN+Cqkfck8MzW59eVCkM4YskUfK3CoyZzUbaAiC0CqPwcmBSlQE0Lo6z/x
	3u5g==
X-Gm-Message-State: ALoCoQmjiLgDbbCHhtBO9DuoGldj0BKzmvvRvKdxFPSbTcJgCPF9SGSnG5kI2V5lLsgewiKCeJlu
X-Received: by 10.140.93.53 with SMTP id c50mr22860119qge.59.1443453825120;
	Mon, 28 Sep 2015 08:23:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 28 Sep 2015 08:23:25 -0700 (PDT)
In-Reply-To: <30E719D66AEA914CBB7DAB303B1C722D1728B4@BUDURBPA11.e2k.ad.ge.com>
References: <1442819513-20171-1-git-send-email-ian.ray@ge.com>
	<1442819513-20171-2-git-send-email-ian.ray@ge.com>
	<56094576.6070803@enea.com>
	<30E719D66AEA914CBB7DAB303B1C722D1728B4@BUDURBPA11.e2k.ad.ge.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Sep 2015 16:23:25 +0100
Message-ID: <CAJTo0LZzUa1CYaWt=B6Az9nZ54Sf2_FJvX7SN5z876ZEhS133A@mail.gmail.com>
To: "Ray, Ian (GE Healthcare)" <ian.ray@ge.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto][PATCH 1/1] ptest: user-specified run-ptest script location
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
X-List-Received-Date: Mon, 28 Sep 2015 15:23:45 -0000
Content-Type: multipart/alternative; boundary=001a113a63c07f12d30520d048fe

--001a113a63c07f12d30520d048fe
Content-Type: text/plain; charset=UTF-8

On 28 September 2015 at 15:46, Ray, Ian (GE Healthcare) <ian.ray@ge.com>
wrote:

> The main benefit is for packages that are run-ptest /aware/, in which case
> the recipe can be simplified.
>

Surely if an upstream is under your control and is ptest-aware, it can also
install run-ptest into the right place too?

Ross

--001a113a63c07f12d30520d048fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 September 2015 at 15:46, Ray, Ian (GE Healthcare) <span dir=3D"ltr">&=
lt;<a href=3D"mailto:ian.ray@ge.com" target=3D"_blank">ian.ray@ge.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6vo" class=
=3D"a3s" style=3D"overflow:hidden">The main benefit is for packages that ar=
e run-ptest /aware/, in which case<br>
the recipe can be simplified.<br></div></blockquote></div><br>Surely if an =
upstream is under your control and is ptest-aware, it can also install run-=
ptest into the right place too?</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--001a113a63c07f12d30520d048fe--
