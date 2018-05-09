Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id EB0C374AD2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 18:07:24 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id w194so26267417wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 11:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/Re7YG0GjhLkjyGRHPjbcG0ruK3A1tyRGxKZbtnpXrY=;
	b=ulqpU/NQKt5ODVUVyQt5rcp9rOpYO8jZHQqgo+ZY3d+SChh5HesYIgeX/RpZKyEiso
	WX80fKtOpXraH9/fs4knnQCFYIsY41oaOMsELPHxWLdmEiSg/M2fRl3OySm7dIwTa6Nb
	CHpl8yEbtc6+NvSzt4ujqYkS0Oa9qalnRqgAp+I96KgRPT26eV3wNcpd2w1IMnvT8NWM
	VXI7+1PV7I2aKrN2teCatKkuMb6XMrIl+tNSJ8/ZGwM6KdNaOIuEarkNB94NzxmicBvH
	IxnnienigUcBMWLw7opD4jS0xu+2C9i9/MJvAXCmG1uo1KQHPqAO9BIIT07jNjdBTOiF
	LBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/Re7YG0GjhLkjyGRHPjbcG0ruK3A1tyRGxKZbtnpXrY=;
	b=iEMkQzvPPVmmZB5sGo2ZhP+hicpUza9fHL7ni307bYzUAsJLBo2H9S4kz9p4kRF/HG
	I++iP3WoQogayytUs6xUs82RKfdEWs9H9uuyN5vmIvw2InuRg4kvnOkvjBAQF42FTcuy
	RYToxhbXU/n9fIH/p6Xel2CUehpakU8CIQloXfOVgFjFSBU4GiNtu4jEaQjjPIx2dkA8
	I7hRN6WlELSh0wQgY73ZiR8P0SCDB5gpQ5ZCq8J00Ux/5f82tm5Qtx+THqpqh62XQ5+R
	PMQ5SO/mPyi9R7K+oVWcKZTZmRajamhXTOzjNSGzYoc0am5F64bUn3vvFlQ6JA1L6x84
	PQXw==
X-Gm-Message-State: ALKqPwcEjSuhsBOvjTZ9bYnA7z9i+N/7qg7QD0CN4nUa6qoBCN2kvIUy
	XgiMG1NEJPTC7kKePt5yI5F8kLM71Zemx6KfJQI=
X-Google-Smtp-Source: AB8JxZpIIVe/nQOlWP10jc01ZehfdZVQB3PCXeTlvHx98hZrFPjzrLY01rFVvvoDggjQgCtfGA2hxOMLVqNtvsPNtXE=
X-Received: by 2002:a1c:4249:: with SMTP id
	p70-v6mr6500660wma.17.1525889245448; 
	Wed, 09 May 2018 11:07:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Wed, 9 May 2018 11:07:24 -0700 (PDT)
In-Reply-To: <CAJTo0LaHtEh3JBQqnsx1v6c31jbTYe2jLUztLtpiqwDi+W3nLg@mail.gmail.com>
References: <1523387170-30191-1-git-send-email-denis@denix.org>
	<20180508211844.GA2573@jama> <3814374.oaZWZoq0et@yow-masselst-lx1>
	<CAJTo0LaHtEh3JBQqnsx1v6c31jbTYe2jLUztLtpiqwDi+W3nLg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 9 May 2018 20:07:24 +0200
Message-ID: <CA+chaQfJb=8o8x0mnOn_eGCeu3AHqym0w33Xq391d3JPt0HVaQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 1/2] wayland: upgrade to 1.15.0
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
X-List-Received-Date: Wed, 09 May 2018 18:07:25 -0000
Content-Type: multipart/alternative; boundary="000000000000710e31056bc9c614"

--000000000000710e31056bc9c614
Content-Type: text/plain; charset="UTF-8"

I have this:
http://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/master&id=3271564498b37cb0faadd2ec7c8de8d853db9f2b

On Wed, May 9, 2018 at 6:03 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 9 May 2018 at 17:00, Mark Asselstine <mark.asselstine@windriver.com>
> wrote:
>
>> I am also seeing build failures due to this conflict:
>>
>> ERROR: libglu-2_9.0.0-0 do_prepare_recipe_sysroot: The file /usr/lib64/
>> libwayland-egl.la is installed by both wayland and mesa, aborting
>> ..
>> ERROR: mesa-2_18.0.2-r0 do_package: QA Issue: mesa: Files/directories
>> were
>> installed but not shipped in any package:
>>   /usr/lib64/libwayland-egl.la
>> Please set FILES such that these items are packaged. Alternatively if
>> they are
>> unneeded, avoid installing them or delete them within do_install.
>> mesa: 1 installed and not shipped files. [installed-vs-shipped]
>>
>> is someone working on a fix or should I take some time to put something
>> together?
>>
>
> As it appears you can test quickly then I think you just drew the short
> straw.  Should be a trivial patch...
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--000000000000710e31056bc9c614
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have this:</div><a href=3D"http://git.openembedded.=
org/openembedded-core-contrib/commit/?h=3Djansa/master&amp;id=3D3271564498b=
37cb0faadd2ec7c8de8d853db9f2b">http://git.openembedded.org/openembedded-cor=
e-contrib/commit/?h=3Djansa/master&amp;id=3D3271564498b37cb0faadd2ec7c8de8d=
853db9f2b</a><br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On Wed, May 9, 2018 at 6:03 PM, Burton, Ross <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
"><span class=3D"">On 9 May 2018 at 17:00, Mark Asselstine <span dir=3D"ltr=
">&lt;<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">ma=
rk.asselstine@windriver.com</a><wbr>&gt;</span> wrote:<br></span><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D""><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div class=3D"m_3218767526090920232HOEnZb"><div class=3D"m=
_3218767526090920232h5"><span style=3D"color:rgb(34,34,34)">I am also seein=
g build failures due to this conflict:</span><br></div></div>
<br>
ERROR: libglu-2_9.0.0-0 do_prepare_recipe_sysroot: The file /usr/lib64/<br>
<a href=3D"http://libwayland-egl.la" rel=3D"noreferrer" target=3D"_blank">l=
ibwayland-egl.la</a> is installed by both wayland and mesa, aborting<br>
..<br>
ERROR: mesa-2_18.0.2-r0 do_package: QA Issue: mesa: Files/directories were =
<br>
installed but not shipped in any package:<br>
=C2=A0 /usr/lib64/<a href=3D"http://libwayland-egl.la" rel=3D"noreferrer" t=
arget=3D"_blank">libwayland-egl.la</a><br>
Please set FILES such that these items are packaged. Alternatively if they =
are <br>
unneeded, avoid installing them or delete them within do_install.<br>
mesa: 1 installed and not shipped files. [installed-vs-shipped]<br>
<br>
is someone working on a fix or should I take some time to put something <br=
>
together?<br></blockquote><div><br></div></span><div>As it appears you can =
test quickly then I think you just drew the short straw.=C2=A0 Should be a =
trivial patch...</div><span class=3D"HOEnZb"><font color=3D"#888888"><div><=
br></div><div>Ross=C2=A0</div></font></span></div></div></div>
<br>-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--000000000000710e31056bc9c614--
