Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id E2DCF600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 19:40:58 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id f89so64827203ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=lwg3ZyvblM2CH7mOhsLHdWpJmaD1V20paOTgT6yfnxI=;
	b=D57IMRU0UPd4DZx2LHVQm6WkaN94MrNQN2NHtO2ry3VGN85125xIsHRJ+ZvTajiTR+
	74qfhETWokEOPQsDXfseAVrTtYiS1NFRhLOFIoIXahNJCTqkrZ7pIiP6iB0LBhS1T4QK
	AQBcSm/21ncsUhF7tEqJjxxrydeVYHJmU5UiM2qJWc763ugAZaZSLmGUkk1NQJM7x9vS
	7Rq/7q/lK3aloVvUJfCWUXfsZ0/RgUrgocJ54j/hcQn1D2mmmyKpnn+o51L78RnnSbL9
	kT7f/Qb+k38w2gXr5Ni4f6+567HzKN/1J8vSctylYj4pbuu5+DhPXmhTTic/7lpMVwkK
	7B6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=lwg3ZyvblM2CH7mOhsLHdWpJmaD1V20paOTgT6yfnxI=;
	b=LdmAnyEqW9SCRoZRoYRDVOet/WGihrTzjTyYN1VYiagQimuIFA24t5cVOCOc2CnTFi
	3BHxMG6GfaFyzyKKkrTw31+E1F+T4v7zn20TWxu6fTG1bNRBapERW9uiaMxJLSwvcBh4
	EuRQBD/kL9eqoMxnUto3wX1tifhZfVXA1lu8IaBOuYe0iHO+pEhKT29kHVcRx9hv1iYK
	sS06qdNBUc/1Hb8s6d7gWw6TntJqMt1gjqCfs2KaR22gsKHWozWqk+LkchQ+yYcTZd7U
	kwy6TCtGDSfRSIheuFBu6jLlYHRYs2wPF/ZJ4E7/K7X1mI5TwPomAd0qVRJxt8rkyl4J
	zOeA==
X-Gm-Message-State: AOPr4FX/WSwm/GdIKUVQl5amzzakLqLHLuYbJEwpkd9mutv2Bp+gAbX2TMKLK8VbYOTBZO/ZMkCO/7iQ1KPztURn
X-Received: by 10.107.51.213 with SMTP id z204mr11985040ioz.148.1462390859045; 
	Wed, 04 May 2016 12:40:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.142 with HTTP; Wed, 4 May 2016 12:40:39 -0700 (PDT)
In-Reply-To: <1462390102-32254-1-git-send-email-ross.burton@intel.com>
References: <1462390102-32254-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 May 2016 20:40:39 +0100
Message-ID: <CAJTo0Lb=rOr6V-O_CHv16_EXtTU9Ju=HHVoDUiZgRkx8O6BwUQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: fix image/compression dependency collection
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
X-List-Received-Date: Wed, 04 May 2016 19:40:59 -0000
Content-Type: multipart/alternative; boundary=001a11440cd0ad56050532096795

--001a11440cd0ad56050532096795
Content-Type: text/plain; charset=UTF-8

On 4 May 2016 at 20:28, Ross Burton <ross.burton@intel.com> wrote:

> +    bb.warn(str(deps))
>

Removed this in my branch, sorry!

Ross

--001a11440cd0ad56050532096795
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 May 2016 at 20:28, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mailto=
:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":21u" class=3D"a3s =
aXjCH">+=C2=A0 =C2=A0 bb.warn(str(deps))<br></div></blockquote></div><br>Re=
moved this in my branch, sorry!</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--001a11440cd0ad56050532096795--
