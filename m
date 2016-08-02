Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id DAF316E630
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 19:32:55 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id q83so223013648iod.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 12:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aeKYgBBj2AGcAH5SBetzQhKAFhF5fMlwZsMtW7wmEOc=;
	b=bwfUR8LB5FJytPbMAb1FtdisY6wJGVKW/mYIb3wSzoFV9sixA6gHs4SrPBtZxUcP0C
	OXqfoWXNMS+yc9s9EACkdMvZ6f+653ZJ+wbJqsXihLZ22vJoyiYF5ljDGKQMrG0KirXT
	XA7dymA7XtGLNwA+roGygf91AXMs2nN3bDAmy5ZALdWk9NK8SI1Y9tcFZejYDjsasaFs
	IsMUOw/OalP44TQTtHojJSvSAz3hYpOhR/pc+hQr0qbKKb4QiaiJbXO2wQzDRkPiDQlw
	aGxizoUr7H5f7Qk9yRjI3Uj63AkBKI6TYEwM0joSw46UUbe2FWDrDthRyZ4qqg9Bolyn
	7pfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aeKYgBBj2AGcAH5SBetzQhKAFhF5fMlwZsMtW7wmEOc=;
	b=cxsRyLYPiDBan32P8HCX3Ccw8Oumt3tPZqn29tFx+W1/u8mHDR3TI3hj4mqBtkzoTG
	+FaQX/0VpUwX0KZNha+CSJcOH/3cmSrUTPFar0oflmCgyG1uGaoMnOuPFkHvtM/6QeOD
	E5mvNY3BHWPI2OdOht3KAcBIdMfmsCxzTcuCWRZfAe31sFkscuClaNKw9SFxn1L6LQgb
	ttVgknjJ1pedwB2+/siKm4Wjp5bOaqHE/aZF1Tyu1JKL97SQ28Ii8rnqj9kGoSbqWopU
	bq9+mdPWoST8psLqSYaFkWuFhjr+5ur24YYZsk/L2k6NLyyixNdR05oyuoPeC6H9r/yF
	7nLQ==
X-Gm-Message-State: AEkoouuP4vXk1VCPT5zppaJwjS0ZvgrfEcm+kRsDlN3ZBWFPjlj21XBijSDKUHK/ROO8jDKgfGbgQpQMMU1Zgt/P
X-Received: by 10.107.154.196 with SMTP id c187mr60464786ioe.99.1470166376101; 
	Tue, 02 Aug 2016 12:32:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 2 Aug 2016 12:32:35 -0700 (PDT)
In-Reply-To: <1468332463-4154-6-git-send-email-maxin.john@intel.com>
References: <1468332463-4154-1-git-send-email-maxin.john@intel.com>
	<1468332463-4154-6-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Aug 2016 20:32:35 +0100
Message-ID: <CAJTo0LZfeU9zAdk2tEF9yxPY-4OZ_3LCH_U7e4ggHh1Q53G+jg@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] tslib: replace pointercal with pointercal-xinput
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
X-List-Received-Date: Tue, 02 Aug 2016 19:32:56 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e9bcc4505391bc804

--001a1140e81e9bcc4505391bc804
Content-Type: text/plain; charset=UTF-8

On 12 July 2016 at 15:07, Maxin B. John <maxin.john@intel.com> wrote:

> -RRECOMMENDS_${PN} = "pointercal"
> +RRECOMMENDS_${PN} = "pointercal-xinput"
>

Does this actually work though?

Ross

--001a1140e81e9bcc4505391bc804
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 July 2016 at 15:07, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2le" class=3D"a3=
s aXjCH m155df71585fa52a1">-RRECOMMENDS_${PN} =3D &quot;pointercal&quot;<br=
>
+RRECOMMENDS_${PN} =3D &quot;pointercal-xinput&quot;</div></blockquote></di=
v><br>Does this actually work though?</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a1140e81e9bcc4505391bc804--
