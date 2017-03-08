Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9B472F28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:21:26 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id 1so76501456qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 09:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t4TbeausuK2css3N/+pRRldhWX2beqoauudeqWxeI9U=;
	b=0w1+q8z8fYdGCgW0blySar8XOvzb99hMf7soLe9d3aFNqfiwCyOFGNi22LQEyau9r2
	F84kDiVfdDEA+BUiakEQVBMpp5DLJH7MlzI/905/IM/S8FjmEpCDyoFQQrt4fnNm9aj5
	kMOeGFRBvUj61Dn6EydxGbl2Uf9WUQH8/bHNjVgYUjDo+UpQKMPINURYvH3a9QidBR8h
	LdetMFwG1I1HUNQjskyWeYpMzta4Wprnf8jLMaFcX/uCkN7UFsPMlClMrzVSOsJ36Cq3
	OswwpnJ/dTNHRz/y7NQ+g+w0DjSumyhvundDENj8S/Kdq4RmSfFrLInN4stNHWdBE1/i
	55/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t4TbeausuK2css3N/+pRRldhWX2beqoauudeqWxeI9U=;
	b=eRlutwa5JiXgZ280Us1nqBWmO1JAV8YvBMc4Wdhc31D0QDA/Z/qmFsLF2i0c81qXuh
	SElIiBkxKjtkgFuYVZ44FZbdHdosBmis/iu2LkvgM+2UfHuJYSWVDI54U1SalPRFHQ3S
	9Mf8qD8MByZF/jP9gHGn2I/t3xJjJN5NBw3tZK849kMDzWV1YVPka4zxXbwG/42tab/d
	lVV5Vp0BeAPxU19gtfWawHACW8XeorLftyLDlar527WIFmY4rSsnUD0kC7STXIaupWbR
	QGQEIV3A1B/lNlFUtvNi06XJoOJ93qHbF5H8RDXytZNO2x4aguS1JJIum4jyS7hTqdRt
	yF9A==
X-Gm-Message-State: AMke39m4dRV4smSYclumoru9xxq3ICbeI0OKKNH6P98gHDM6Z3PHLApjjmscliWC+Jd0S6etSOM62L000ZkCkF9L
X-Received: by 10.55.47.4 with SMTP id v4mr8544071qkh.77.1488993687834; Wed,
	08 Mar 2017 09:21:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 8 Mar 2017 09:21:07 -0800 (PST)
In-Reply-To: <af3c0da4bce549a5b303d828c9728524@XBOX02.axis.com>
References: <cover.1488539819.git.pkj@axis.com>
	<CAEHkU3XyKbGzTCX9XaG7jYXjde+ZRtA9z_MSecxpgOcu6wLMiQ@mail.gmail.com>
	<aca83849e80a444595764b812d5e3394@XBOX02.axis.com>
	<af3c0da4bce549a5b303d828c9728524@XBOX02.axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Mar 2017 17:21:07 +0000
Message-ID: <CAJTo0Laa_WrQOjCyNBBmpWbKkza9Pg=dAiQEQJBrQoiEWab0Bw@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 0/5] Add dummy tools to help identify needed dependencies
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
X-List-Received-Date: Wed, 08 Mar 2017 17:21:27 -0000
Content-Type: multipart/alternative; boundary=001a114f4108d68567054a3b5bd5

--001a114f4108d68567054a3b5bd5
Content-Type: text/plain; charset=UTF-8

On 8 March 2017 at 09:43, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> since I see that you have integrated/staged the two patches that add
> inherits of pkgconfig, but not the patches that add the dummy commands,
> I assume you have some reservations to these patches. What are your
> take on the subject of blacklisting vs whitelisting the commands from
> the build host? I know that having these dummy commands in place helped
> me a great deal when updating our recipes to build correctly with RSS.
>

FWIW I wasn't entirely keen on how the blacklisting had to be very careful
about how PATH was manipulated, which is why I merged to my staging branch
the fixes but not the dummy commands.

If the majority of people agree that this should be merged I don't have a
strong opinion either way.

Ross

--001a114f4108d68567054a3b5bd5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 March 2017 at 09:43, Peter Kjellerstedt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellersted=
t@axis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D"m_-6222548947402340503:1vm" class=3D"m_-6222548947402340503a3s m_-62225=
48947402340503aXjCH m_-6222548947402340503m15aad4e41ecc7842">since I see th=
at you have integrated/staged the two patches that add<br>
inherits of pkgconfig, but not the patches that add the dummy commands,<br>
I assume you have some reservations to these patches. What are your<br>
take on the subject of blacklisting vs whitelisting the commands from<br>
the build host? I know that having these dummy commands in place helped<br>
me a great deal when updating our recipes to build correctly with RSS.</div=
></blockquote></div><br>FWIW I wasn&#39;t entirely keen on how the blacklis=
ting had to be very careful about how PATH was manipulated, which is why I =
merged to my staging branch the fixes but not the dummy commands.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">If the majority=
 of people agree that this should be merged I don&#39;t have a strong opini=
on either way.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross<br></div></div>

--001a114f4108d68567054a3b5bd5--
