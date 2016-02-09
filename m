Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id C038A607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 17:58:22 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id 5so17412686igt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 09:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gyRD5PzPa2/REgv22QiVcgQOwr1UXVriJO81odycMs8=;
	b=D976AFsZ4XuxZaq3WKKRsZX+kwhzR4GH1uxI8mvAd+aP/a9oiglveHpLP96pH7rIdJ
	CMpzMJUeH2y5CT9XkEj/WtS0tM0knPtToe4BJv54xJ5zYdlAV69MLG/EmOGOJH4JKCcA
	gFS2tcrd+4dSYqk3KcbWexGQ/fYTHN2Vm0rtfPpqs42sAZUJHLuXgSHWnXp+ikKddd3j
	zD7qVrlR5Z9W5nHDjv6m6Wcxzjv7jMHQB3ue1ABJsM32J4YLs+mIbxlYBw4LVcpy0kNQ
	pe5rVzd256lBBgwNnAb+K+Tymiha6TXnyuCxvyUSctYBRJPfvDIdmo3BJc8kZgj6i4E5
	XHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gyRD5PzPa2/REgv22QiVcgQOwr1UXVriJO81odycMs8=;
	b=iVIY9s7hZMnQu2aT56QxyaNAmawL6jciR4WIgfG8x8Qeg0jjFEGKCk4LegvWWYNZO3
	J8G2e10oVvwqBQkK0zpSgYhreGOZBzMz41pG88T/ZrhmTiCkKS90xiAYmVOjiyc0ryE7
	1wyzSKTGllDvL/t7PwqpLUIPdvakxSyf0u+V/N8J2s3cQTo1POv6+d/Je2nb5rGS2tgN
	NmX2vGzKy+uKuqFOVE/k2r8MXzmHEqUjzsPGsnru0IeZac8Eg/KbtaLnCHY9gUu7xq/N
	MS0OB1EBIC5ii5WxMFvcUmbXz3920CFCe0hWJXnsWwQDbqX7pHPk0jlNkldDcVC3E0F8
	nFXw==
X-Gm-Message-State: AG10YOTdWd4J2FU7LTmBYGzE96A8Ga5X01KY6rUoYwXOFTmKr8O6Ql0Yms8aILB/30Z6enFx7NZBXkhmWgIxRtc6
X-Received: by 10.50.43.133 with SMTP id w5mr5441173igl.52.1455040703650; Tue,
	09 Feb 2016 09:58:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 9 Feb 2016 09:58:04 -0800 (PST)
In-Reply-To: <4DE97B9F-591B-4298-9F48-48B09D1B4B79@gmail.com>
References: <cover.1455008560.git.jussi.kukkonen@intel.com>
	<aae55470a8d782e166fc6135ceb03631e1346429.1455008560.git.jussi.kukkonen@intel.com>
	<b4d964e733159d37952d2f1f6f4d9bbdbad24979.1455008560.git.jussi.kukkonen@intel.com>
	<CAP71WjxybQ+N3N-+pOzLo7jQdJ=F0TVwVEoFihAn_96TG-q=7g@mail.gmail.com>
	<4DE97B9F-591B-4298-9F48-48B09D1B4B79@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Feb 2016 17:58:04 +0000
Message-ID: <CAJTo0LaLWz6=kt2D7B4q_9B5atfBEoTt7Og+_HqBoB98ax+RFA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] xserver-xorg: Add PACKAGECONFIG for crypto libraries
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
X-List-Received-Date: Tue, 09 Feb 2016 17:58:24 -0000
Content-Type: multipart/alternative; boundary=089e01175f2b46781e052b5a1099

--089e01175f2b46781e052b5a1099
Content-Type: text/plain; charset=UTF-8

On 9 February 2016 at 17:54, Khem Raj <raj.khem@gmail.com> wrote:

> > Looks good to me. this is the same implementation I used in the mesa
> > patch.. so we need to make sure that any review feedback is applied to
> > both before merging the too,
>
> since its spans multiple recipes would it be better to control it with
> a global knob instead of packageconfig.


Personally I'm not convinced that two recipes currently sharing a small
piece of configure code warrants a global configuration.

Ross

--089e01175f2b46781e052b5a1099
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 February 2016 at 17:54, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; Looks good t=
o me. this is the same implementation I used in the mesa<br>
&gt; patch.. so we need to make sure that any review feedback is applied to=
<br>
&gt; both before merging the too,<br>
<br>
</span>since its spans multiple recipes would it be better to control it wi=
th<br>
a global knob instead of packageconfig.</blockquote></div><br>Personally I&=
#39;m not convinced that two recipes currently sharing a small piece of con=
figure code warrants a global configuration.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e01175f2b46781e052b5a1099--
