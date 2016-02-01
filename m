Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 12063771C0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 20:55:12 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id d63so154859287ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 12:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mSVW/miURcM8ZFNprO05Io13tTz11P5qdKLBlAY647k=;
	b=M95PbVYmxgoJ4QoBdIO3xAIG5QbpCd6Cf2X12l0vZ4R6DzNFimqGvDGt2NFRDDQPxO
	aomsJHCDhrqgXQl2PMEcOdYS4Y+n09yCf5HSv92f7vRcGSKrvuTrnYnW7fEiBbTv1ggm
	xSCDMfia2hWiNA7mywaEzxk+xJMdA/yWGJlvRt1muRA2rDfDOrznxqARrq9TEUrdenhp
	hwrVJyfMAXgaoMsFxwKJs0nI1CQNbN780puZRsSosMXjYgCPoGlPerTKPhhywBzfgkfb
	YzKEKhnKK1EOwP7BZdfc1k9M/oo/RHNPOBRTDiNHLFDTiNoOxu3NjkXyBvDp87zdkcWz
	F3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mSVW/miURcM8ZFNprO05Io13tTz11P5qdKLBlAY647k=;
	b=ggVsm4GDeHXjAiRyjXs+UXCu9k6ItzGM+xrXMCVO4SqgksX/tDA12oszIWsC+pokMX
	Sm0WhICAjEM1XGcufOX1fcIq/alxrlu33ruAHN3W4Z0QBQDW5/dtJdWqZbYKHcIlRdr4
	ubjSjeUKJeXRpKBUMfbGmckLSWHKA0EuEj19SU36vyVZvLiixsLIAtb7UuxLQ14TnSa0
	qERLXi9q0fz+2BJmYq2+d9qXwGuYJWxLm1HNOe44i6rhF8yS91rqb+IPVl++0EmYBTAu
	I7j/FYC+88EHWNQqUFhGKcyActc8VN82LEVGLwDyRAG5/pNpigawTKfTH6tmXV1eWHfG
	oBrw==
X-Gm-Message-State: AG10YOQwn6GKV6z+2w2FyN9Y50RVVmLz0orOXgb1aSbPK9LQ1Z2LYbdEv8LkpZzgR5uHLDl9FWzYhF70TqvGdoNa
X-Received: by 10.107.164.15 with SMTP id n15mr8249677ioe.148.1454360113475;
	Mon, 01 Feb 2016 12:55:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 1 Feb 2016 12:54:53 -0800 (PST)
In-Reply-To: <CAMKF1sozknq8vz-K3U0g-0oH+=d+x2T0KdiwKjWR2_3vP0s_vA@mail.gmail.com>
References: <1454080041-28576-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LbQBoWf8krboqY87V4HCQTaPwXeMECo1jHPDu259Y6wHQ@mail.gmail.com>
	<CAJTo0Lb3ZpOqC4Hik_cNh7PZqCF7-=EvosN82HWfpw6TKLNuig@mail.gmail.com>
	<CAJTo0LYmqnOfCQPUd26Jo0qn8MHOy=iDJQzYD0-ZH+NHx+kBQQ@mail.gmail.com>
	<CAMKF1sozknq8vz-K3U0g-0oH+=d+x2T0KdiwKjWR2_3vP0s_vA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Feb 2016 20:54:53 +0000
Message-ID: <CAJTo0LZa6U-2jZnHpdgd9EA_qsScBvbFS=KBAwQogftBDZ3tKg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adam Chappell <adam.chappell@ni.com>,
	Jacob Champion <jacob.champion@ni.com>
Subject: Re: [PATCH v3 1/1] apr-util: add ldap crypto and sqlite3 to PACKAGECONFIG
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
X-List-Received-Date: Mon, 01 Feb 2016 20:55:13 -0000
Content-Type: multipart/alternative; boundary=001a11377682f091d9052abb9997

--001a11377682f091d9052abb9997
Content-Type: text/plain; charset=UTF-8

On 1 February 2016 at 18:50, Khem Raj <raj.khem@gmail.com> wrote:

> I wonder if we should have a QA check to decipher that if .so is a not
> a symlink then provide this
> as an error right away until the recipe takes care of it with
> FILES_SOLIBS or something like that
>

That's exactly what I'm testing now :)

Ross

--001a11377682f091d9052abb9997
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 February 2016 at 18:50, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":9b" class=3D"a3s" styl=
e=3D"overflow:hidden">I wonder if we should have a QA check to decipher tha=
t if .so is a not<br>
a symlink then provide this<br>
as an error right away until the recipe takes care of it with<br>
FILES_SOLIBS or something like that</div></blockquote></div><br>That&#39;s =
exactly what I&#39;m testing now :)</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a11377682f091d9052abb9997--
