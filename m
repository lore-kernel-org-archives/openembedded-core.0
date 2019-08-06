Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 159FD7F35E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 11:14:17 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id o19so33486852uap.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 04:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=paj91Y6k/jaROaecPA6CFNfKK/hQ0dToQ8n5152ZWgs=;
	b=UFJ1YvS5bFD7D/lo1BPKWl8jgObpnZlB0VZaPD4YG8sVHg3wvYCAYr9AjIqjJnZLni
	nnhHlZEDO9TxO10usbhOqoaDxSnjedKe0BtVVYvtJv2TDSVcAl+FhFkw8cpsbENIBG8i
	XXiZrZBF3NhPjE4+REolTBh9TIvA+gqfgKdJYkoYcpu3pr+ttwEN/0Ius6wzE1fDDafR
	xAbJ5fXkiD9ilD4rLRsHFj/U85G1IKC85VkgOyCRhplCDmtbWbn6EYCscSvtaDIwDSNh
	nQmRpabGY0lKtWIOQeiD15lI7Tp2sVk+1ZKWk4cOq+J5bcFmTA2QTdvf9Ul/oMIAlJm2
	dTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=paj91Y6k/jaROaecPA6CFNfKK/hQ0dToQ8n5152ZWgs=;
	b=keEKW0ZQ1S+R+cpxr1+P+XTvdB0ilGlZVV9X/j6KQrU2g0TTOf5FciITMGFROsQl44
	tz5+I+BQjU11megXwIp8xqEdgPIvPej83Pdsuknr0oxgcaAUa+hfffoLLqIo/Hgximks
	fWjXORNNpCfLtEAUBFkzArGRq/SQYH6BWVtFepemGz0NnzfQMW9APIK7yfsUQcbBQI4i
	nFdBhDHj6jWCuz7TL1Ob7S9r7CPryzIDCcL5HJowaJ8w/DQUGJzLJ+qbI958+Uyv//cm
	UT2Jdf4zi8gpmUytbI88JE1JPfFKQWY4XHWJU4dNxFiNcxIFN/Jq0eS/PWtl1rguNeol
	k2Ew==
X-Gm-Message-State: APjAAAVoAChii/S1mCRh+/FVUaG7KlXMd9sIRVb62oDFw0Rhq6U2GIp2
	zPLTTdapArwDhiXOU38yAP79BS1qeFplR6kka2A=
X-Google-Smtp-Source: APXvYqx11YupEFalNCd2mNnMwkQGWZk1i9ciflb2TThovEYmVukttW/nXblTbgRb/Mw7KnZQU9+GIZbtUYcy0MqqG+g=
X-Received: by 2002:ab0:70b1:: with SMTP id q17mr1850992ual.100.1565090058885; 
	Tue, 06 Aug 2019 04:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565075067.git.liezhi.yang@windriver.com>
	<e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
	<4f3b75ada0eae73855b43347a56ea89042ab6aae.camel@linuxfoundation.org>
	<18287a98-33b5-c788-946e-5b5338c1c204@windriver.com>
In-Reply-To: <18287a98-33b5-c788-946e-5b5338c1c204@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Aug 2019 13:14:07 +0200
Message-ID: <CANNYZj8nk8q7VscomyLkaLYcNy-2gH+nwgsKgAO7x59i7uDgHw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 11:14:18 -0000
Content-Type: multipart/alternative; boundary="000000000000006009058f70eda2"

--000000000000006009058f70eda2
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Aug 2019 at 13:01, Robert Yang <liezhi.yang@windriver.com> wrote:

>
> Yes, exactly, I will send a V2 for it. What mis-leaded me was that
> stress-ng-bash-completion RDEPENDS on bash-completion, and bash-completion
> RDEPENDS on bash, so bash is on the dependencies chain, but stress-ng can't
> find it, and there is no qa issues if we build bash firstly:
>
> $ bitbake bash
> $ bitbake stress-ng
> No qa issues.
>
> So the reproducer is:
> $ bitbake stress-ng bash -ccleansstate && bitbake stress-ng
>
> This might be a bug?
>

Note that bash-completion files are not executable, and we do not observe
this with other recipes. We might have a false positive here - can you look
at the actual contents of the package please and see why _qa thinks it
needs /bin/bash?

Alex

--000000000000006009058f70eda2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 6 Aug 2019 at 13:01, Robert Yang =
&lt;<a href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@windriver.com<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><br>
Yes, exactly, I will send a V2 for it. What mis-leaded me was that<br>
stress-ng-bash-completion RDEPENDS on bash-completion, and bash-completion<=
br>
RDEPENDS on bash, so bash is on the dependencies chain, but stress-ng can&#=
39;t<br>
find it, and there is no qa issues if we build bash firstly:<br>
<br>
$ bitbake bash<br>
$ bitbake stress-ng<br>
No qa issues.<br>
<br>
So the reproducer is:<br>
$ bitbake stress-ng bash -ccleansstate &amp;&amp; bitbake stress-ng<br>
<br>
This might be a bug?<br></blockquote><div><br></div><div>Note that bash-com=
pletion files are not executable, and we do not observe this with other rec=
ipes. We might have a false positive here - can you look at the actual cont=
ents of the package please and see why _qa thinks it needs /bin/bash?</div>=
<div><br></div><div>Alex<br></div></div></div>

--000000000000006009058f70eda2--
