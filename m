Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
	[209.85.222.44])
	by mail.openembedded.org (Postfix) with ESMTP id D047D7E71A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 16:10:03 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id k7so7182535uao.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 09:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pem/Jq4vjG+0rAfnBBR0NMHXYJbyo5m2m17plsaj+5c=;
	b=MoB5ahwNhM1zD5AY8wast+mVE2oHgM1QDAIegKcPm7Y4gIQd49rys/rELNK88UC0VA
	/QN9QvbE+M5O7gbCduGQNN4gLVDfjZH8DuV57sWaP6k8Hvcu85QOpmdmTHgHLKO5hXpM
	8iDUadRJ0MdhXBJUlvjmxeLieXf1m5tKrRp6eJQVdeWLvzUmEeFpaU0YikG+ynFxHuqI
	OnBrgMTSkBSd4/hQVzRTRmuRa2I44ZBLNSplLElL+AZYykUgJmXsGG71Unxc8OHgRMK0
	9RCSXh9BX8DK2Lvcd+mQKEfzonMtJYDTci2fmBmWISngyhEYxqiN0Bkvkrrd0yhVOcxJ
	4XJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pem/Jq4vjG+0rAfnBBR0NMHXYJbyo5m2m17plsaj+5c=;
	b=UtwB+tq6jahPIxHIOEEzNzptEEi2mRGihWQs+5GYGNFcakraP5p36usJWLdxObA9pc
	sTf5ooIDzG6I0n73hRLvgEA+u9whucKJWQdMje1fhXleVkwZj0HfnEkD8dE24uvS/0+i
	byevWs0FI+r2bxFP+AmNbcr6aWYlESD0j7tEzfuRS6ARm68qR7Jx1nuk/x4RSbX4pMA+
	QwVZaU/OjELoEXm8bf6FMNz0S9yVgErr41fgk1gfUmNoeh+RuN7xl3XNShhSdPkYZaBP
	sruIUw7uFLmROW8ebv1Qf+XtxMIGpnYj2V1sF3n/I+7J+kPLJecmaN5wg6gck4641RTn
	UfXw==
X-Gm-Message-State: APjAAAWteM5F+eowqIcw1N++n52AzhxUAi185TWzGmBpS+wYgmVmdP/9
	Hzhi8N3bjPi91DK3zEN6IVvG1vs6Un8Rq0q3uZM=
X-Google-Smtp-Source: APXvYqwPfc0SkHAncI5JhKiyf8jUzdzetobH89omXsjRd97lHM7LAH6SKFLQmG9FcAPr6dUZVFQBv55DzpiDoNYv1a8=
X-Received: by 2002:ab0:810:: with SMTP id a16mr11148876uaf.93.1566922204681; 
	Tue, 27 Aug 2019 09:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190827155425.105260-1-alex.kanavin@gmail.com>
	<9c9a1aec-e57b-cd2c-0538-4e65679f5fac@windriver.com>
In-Reply-To: <9c9a1aec-e57b-cd2c-0538-4e65679f5fac@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Aug 2019 18:09:53 +0200
Message-ID: <CANNYZj9kDcwbY2qdjZ-WNP0ALBM-EYToUpE_59AtzRKD5Z++xQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: resolve a host contamination issue for mono packaging
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
X-List-Received-Date: Tue, 27 Aug 2019 16:10:04 -0000
Content-Type: multipart/alternative; boundary="000000000000669a7505911b81c8"

--000000000000669a7505911b81c8
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Aug 2019 at 18:01, Mark Hatle <mark.hatle@windriver.com> wrote:

> Instead of hacking with with different names that (shouldn't or) don't
> exist..
> It would be better to just disable the mono-find-* wouldn't it?
>
> If that is the case..
>
> In the fileattrs/mono.attr directory, just remove mono.attr or comment out
> all
> of the lines.
>

The upcoming rpm 4.15 does exactly that (remove mono.attr and dependent
files altogether), so maybe it's not worth the time to improve this patch.

Alex

--000000000000669a7505911b81c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 27 Aug 2019 at 18:01, Mark Hatle =
&lt;<a href=3D"mailto:mark.hatle@windriver.com">mark.hatle@windriver.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Instead of hacking with with different names that (=
shouldn&#39;t or) don&#39;t exist..<br>
It would be better to just disable the mono-find-* wouldn&#39;t it?<br>
<br>
If that is the case..<br>
<br>
In the fileattrs/mono.attr directory, just remove mono.attr or comment out =
all<br>
of the lines.<br></blockquote><div><br></div><div>The upcoming rpm 4.15 doe=
s exactly that (remove mono.attr and dependent files altogether), so maybe =
it&#39;s not worth the time to improve this patch.</div><div><br></div><div=
>Alex<br></div></div></div>

--000000000000669a7505911b81c8--
