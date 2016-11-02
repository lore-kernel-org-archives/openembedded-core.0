Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id A692971BE5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 12:30:55 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id q130so15712882qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 05:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=odR9OMGicIyqr9OSovQdF5CHc5b0PA+86USql9SFaFs=;
	b=19tm9T6InBSEV5rJ0zMFZvlhfgJ3hzQDiBOHYUscu4lIjRbSjUy8D+WjzcDpyKt6Kz
	ohlfz/+pz7NcgXDlGs7171aRSRrWcqHPsDOlXicChyKC+nr8eU4kRzhQ7RmhFoqQ8v8D
	RPa0FUBtpdnYUp2SskpstAyrhkHJ2V+Kl+yg0hLV6Nfe7C7J5UZtx8+xrUS4nKP8vpbJ
	qSjqNj+CaapwUl0v1pF+T9/gZLSnrFdJ8abvi63fqzYQhLzRCa0S6gsJyB/DzNrdJfkI
	hoJ7vSr+o/oXbABQIMp1DNi+iuy+NIclGf+4QejG30JRWHxYkAeQWFHfzn4Jlj+yiBPG
	8txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=odR9OMGicIyqr9OSovQdF5CHc5b0PA+86USql9SFaFs=;
	b=TQc8QTwREawWPdUyHbO/DFg8N3DsMu9qbj5UkK2dOdq3nM4wEfstjTU85S2e1Mrkj5
	pFUp9VmY8IjhwYnFAneHPLmGlwPLd+iB2OEXaWOZyC1LOZ4W4zbJU2usbTtlndQRI85G
	Mjij/6APLitkHJjypEuqHTXHuJuBhaqAT6J/47Pv1qH+Wd5XiLOGKNEuiWUZD2IYkB60
	tOtBvRgXQsiY5k5lv82/Z7/CIcZV2jlhXnfcEtqlQ6dVP3g6thCuKNsjLtBZVyRAZSsb
	kBadllkG7S7bddKDFaxBj4p1PuLP9GlZIvZe+zKSC0+ch1vbbH93PQgjVfwN/wSsFRl7
	UL+w==
X-Gm-Message-State: ABUngvfS34vS9OzOQpFZk8WP8LKHo/UGM/9pmggiFuIhraUoStnOxpCOf8qixTe6lT6AMv9UCTAkt2/2ijM9fXD5
X-Received: by 10.55.5.145 with SMTP id 139mr2897122qkf.77.1478089856549; Wed,
	02 Nov 2016 05:30:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 2 Nov 2016 05:30:36 -0700 (PDT)
In-Reply-To: <1478030040-20670-8-git-send-email-fabio.berton@ossystems.com.br>
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
	<1478030040-20670-8-git-send-email-fabio.berton@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Nov 2016 12:30:36 +0000
Message-ID: <CAJTo0LZ64bNx4EZodnXohiQo=bDjtgaCfvKt1UytdZFujC3dSA@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] guilt-native: Update to tag v0.36
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
X-List-Received-Date: Wed, 02 Nov 2016 12:30:55 -0000
Content-Type: multipart/alternative; boundary=001a114c8f84d89e290540509cac

--001a114c8f84d89e290540509cac
Content-Type: text/plain; charset=UTF-8

On 1 November 2016 at 19:54, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>

The kernel tooling doesn't use this anymore, so I propose we remove it
instead.

Ross

--001a114c8f84d89e290540509cac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 November 2016 at 19:54, Fabio Berton <span dir=3D"ltr">&lt;<a href=3D"=
mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berton@ossyst=
ems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":281" class=3D"a3s aXjCH m158217aeeacae473">Signed-off-by: Fabio Berton=
 &lt;<a href=3D"mailto:fabio.berton@ossystems.com.br">fabio.berton@ossystem=
s.com.br</a><wbr>&gt;<br></div></blockquote></div><br>The kernel tooling do=
esn&#39;t use this anymore, so I propose we remove it instead.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114c8f84d89e290540509cac--
