Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id C47CD6011C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:31:56 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id f1so112967281igr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 02:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RO8FDXE6qwB5vWFGOo/+wf52aLUhkas8+Pf7CvtysYU=;
	b=VKOQcMJYJcCFsEJo+HU3YAGtyV7Axm0xhJgfEmkNNTcd53a60uo2sGJwKqlETqB6MI
	yef+wWaC1A4V5JmBhlHr9Zo3UFVpsxjdTya/T5tW1UB+lTFZ9AY535AGTHGK5irJ8gu9
	b9SNIflgjCuN+EORe2+gkMXsVXbNSfOwzKoMJ/IgMBn6GUBsE8JR1XFirgfjEP020gR6
	Zc1vqW//KRYtc7tNa8aCiWln2lSESLiS9KKb5Uh6Ph0l5ZdEpT4mLrnp4INPo22DN8P3
	ziu75Janf6u8RjHrabADJFcaRa7WaZln5BRfTqnMnjCg4/GoSZE4M5qluL4Qgvq+1BsB
	yukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RO8FDXE6qwB5vWFGOo/+wf52aLUhkas8+Pf7CvtysYU=;
	b=T2dLISJ7ZAesIlVbGonM0nXpWWkgiMxs4hN8xnMwFe8KdaJlLPm4BZAYK3dZHyz60Y
	qHhAkAG3BJ6THXDK7xnhw6PtfD6T8Amd+tTfWNj6VCc9pQk9jzrRNGcqbx8srd2Dj0iE
	Ji4uvh8Jg/3Xtu01lQmO3tYgRg72/2fav1pd/OgId5oRFeuD2HFPFxkitp4soUeLV0YE
	xThPMtERnjatNTarpWs54cQP7cLnWgmP10afzpbTu4bD1GhVWxux1alMkcZKUQzQP+ya
	uqPwh0xuOgCnkI99GOiuqZoGkCsbLltBpH0glEiTA/IIdWr/4quYYWfa2ElGwqBHdxWO
	513Q==
X-Gm-Message-State: AOPr4FVlixq2v+P5EYAUyZpZXn16BgXo5OyWzzGi8VSWlnjZLo6jCqcyqIt3Rrng2GqEal+X3DziykPB0en0n4eR
X-Received: by 10.50.160.39 with SMTP id xh7mr3335440igb.64.1460539916797;
	Wed, 13 Apr 2016 02:31:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Wed, 13 Apr 2016 02:31:37 -0700 (PDT)
In-Reply-To: <1460498887-18624-1-git-send-email-stephano.cetola@linux.intel.com>
References: <1460498887-18624-1-git-send-email-stephano.cetola@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Apr 2016 10:31:37 +0100
Message-ID: <CAJTo0LaBTGWYFv6BpopFf-=+EZBMPzf+gNvfmn4=3VuMda+k0Q@mail.gmail.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devtool: sdk-update fails on remote hosts
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
X-List-Received-Date: Wed, 13 Apr 2016 09:31:56 -0000
Content-Type: multipart/alternative; boundary=001a1135ee9aec0a9e05305a721c

--001a1135ee9aec0a9e05305a721c
Content-Type: text/plain; charset=UTF-8

Hi Stephano,

On 12 April 2016 at 23:08, Stephano Cetola <stephano.cetola@linux.intel.com>
wrote:

> This fixes bug #9426:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=9426
>
> Skip .git folders when copying the build system.
>

The shortlog mentions remote hosts but I don't see how that is relevant.
Also, reference bugzilla entries like [ YOCTO #9426 ] instead.

So something like this:

"""
devtool: don't copy .git when building the eSDK

When creating an eSDK ensure that any .git directories are not included.

[ YOCTO #9426 ]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
"""

Can you revise the commit message and resend?

Cheers,
Ross

--001a1135ee9aec0a9e05305a721c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Stephano,</div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On 12 April 2016 at 23:08, Ste=
phano Cetola <span dir=3D"ltr">&lt;<a href=3D"mailto:stephano.cetola@linux.=
intel.com" target=3D"_blank">stephano.cetola@linux.intel.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div id=3D":1hk" class=3D"" style=3D"overflow:h=
idden">This fixes bug #9426:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9426" rel=3D=
"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D9426</a><br>
<br>
Skip .git folders when copying the build system.</div></blockquote></div><b=
r>The shortlog mentions remote hosts but I don&#39;t see how that is releva=
nt.=C2=A0 Also, reference bugzilla entries like [ YOCTO #9426 ] instead.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">So somet=
hing like this:</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">&quot;&quot;&quot;</div><div class=3D"gmail_extra">devtool: don&#=
39;t copy .git when building the eSDK</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">When creating an eSDK ensure that any .git =
directories are not included.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">[ YOCTO #9426 ]</div><div class=3D"gmail_extra"><br=
></div><span style=3D"font-size:13px">Signed-off-by: Stephano Cetola &lt;</=
span><a href=3D"mailto:stephano.cetola@linux.intel.com" style=3D"font-size:=
13px">stephano.cetola@linux.intel.com</a><span style=3D"font-size:13px">&gt=
;</span><br style=3D"font-size:13px"><div class=3D"gmail_extra">&quot;&quot=
;&quot;<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Can you revise the commit message and resend?</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Cheers,</div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a1135ee9aec0a9e05305a721c--
