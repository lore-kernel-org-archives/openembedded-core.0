Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 77ED7783FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 21:49:51 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id c195so23151234itb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 14:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d9wGrHsObRgWcoivyXB313nVJHRCQXGfinZlf15ZB4E=;
	b=PGNtbOam2XhjfdXjvAh0EAG2cB9y4aFkIRTOzOm6LlFYiMF9sX9XvRrMgBdqn4Ag33
	ujFkw8ZdRpWELQ4vG/kJFgRFbkpGfsAjxW3hH4mdCe04+JfGbX/JuL6Hi5jxIsHnOzN0
	9x8zO7YSQbXviKS9j4nUvSbx4eILDGd5/xxj8r+rQnHbDes288xrBSW4cURNeLE4A11F
	xq0vT/9KdluhekzUehlWduh3aLZKoJ/QS/flVdGKcnCe5f7ZOyRPf/LpfT4VQFU3bKGo
	cR/ve9OYSUhgsXPsm8er/W8Zbua5nJ0XORcXjXS2+41CbySBezRXVWEx+2Vfqdm0jjHj
	AJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d9wGrHsObRgWcoivyXB313nVJHRCQXGfinZlf15ZB4E=;
	b=V+lb3ivMam2TW+6oCzdq4U40gJlAOM0glg+SD4QGrJOBQj7nvfUwikb0dThjxCW3l2
	6Nlu9zzL2wNvE0hsEJSzj9DNiwvjf7IBP/A7vqrvdRCl8IS5Cu/QKA7kBpQn4MQMciwE
	3EW4Z9CiE2RU9IuP7H61SpArJoqeyDzuEJ9FASnLKe41SfgKTmDBmWRYxEgMx8/8fhTu
	iQWXVblpi8kYw9WhfiLGcyHn1LCeL0tWoBfryrBATfD5dF8zpF9Ic+diR3/tJgoFPFED
	SNBlbnfmGeORxHbZdB0kQTXran92Cu1ixb9nWA5vvzR4eKnvGZYArbEae5eY+gTBUOHr
	zRGA==
X-Gm-Message-State: AHPjjUiCnNh1BVCjhoRfk4nw3PydnuzuQ6twNlIsV12KEs3O9Rspc6w8
	zzeqJSuT8jo+Nl688u1lyuey8nvR8VHP
X-Google-Smtp-Source: AOwi7QAEFIBfbW1HcrKJt+rb0Bnb+b/kgRaIriq2pfK5GDPB2RYqYQNa7eHv143g4BYaayqbh6Dr10rcG7gwQp4h4qg=
X-Received: by 10.36.237.204 with SMTP id r195mr15720040ith.48.1505166593359; 
	Mon, 11 Sep 2017 14:49:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 11 Sep 2017 14:49:32 -0700 (PDT)
In-Reply-To: <20170911213326.3480-1-california.l.sullivan@intel.com>
References: <20170911213326.3480-1-california.l.sullivan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Sep 2017 22:49:32 +0100
Message-ID: <CAJTo0LZgBgWL0c9ZaDRFvvKxfULKeDkvGOhAiczGWMXWNrL=Yg@mail.gmail.com>
To: California Sullivan <california.l.sullivan@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: bump PR and fix install-efi and setup-live modules
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
X-List-Received-Date: Mon, 11 Sep 2017 21:49:52 -0000
Content-Type: multipart/alternative; boundary="94eb2c042c162028380558f0e896"

--94eb2c042c162028380558f0e896
Content-Type: text/plain; charset="UTF-8"

On 11 September 2017 at 22:33, California Sullivan <
california.l.sullivan@intel.com> wrote:

> Bump initramfs-framework PR, as it was missed in the previous
> initramfs-framework patch.
>

There's no need to bump PR.  In the ideal world, the PR isn't assigned at
all.

Ross

--94eb2c042c162028380558f0e896
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 11 September 2017 at 22:33, California Sullivan <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:california.l.sullivan@intel.com" target=3D=
"_blank">california.l.sullivan@intel.com</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Bump initramfs-framework PR, as it was missed in the previous<br>
initramfs-framework patch.<br></blockquote><div><br></div><div>There&#39;s =
no need to bump PR.=C2=A0 In the ideal world, the PR isn&#39;t assigned at =
all.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--94eb2c042c162028380558f0e896--
