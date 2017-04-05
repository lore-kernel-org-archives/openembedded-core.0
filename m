Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC8973124
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 12:13:14 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id r5so1307876qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 05:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7vIV3idnRkEIB9vS47kDPn4qMP13IgX2OPdseNqADj0=;
	b=tozMCjqKujr2Fc27XIuv8faioZkxEhZHZqlr/gbntfr5uu3oY1WXrn5eV+tWSX1g/z
	IetMmOgi1pRe8oWROnsGl0iwcpzU5KJKzHsqGWDzrXvgjuSQhslURBMr/rwEkVWIZP6W
	GG+Dr35hA0cQH5NTWArRA8Oz2mcrNqiMiBluY/3em8r5tPoAnASRcviRZ4oVTa0E1CEW
	V6Os44TTdjA/MwHjy2nlJSADymTMzf7Gs2j1TuQdZ4smKKK4FekEYuzcTECIzSuQtye6
	62SIFneoaBzNe4+VJjksO67s/2uOc5lfFEYpJnV+d0XD/HsX9+g4TTMIf4+WuXS2HbOh
	+VqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7vIV3idnRkEIB9vS47kDPn4qMP13IgX2OPdseNqADj0=;
	b=lL7zzEygkbDKLM/0nVlGwkKn5K8QATWj8KthpNOQeyhV6Zl/W52YYCQVCyTCMmyYUo
	dNEZDrd8IcZBsC74ccjEgusTsUsj0easNfR1SSXwTiBqbgT17N2Xx9egPk/thdqRWbIk
	7AwIm+G6YGN67LCu3xz9hMa5aTafKDk+47VaeoiOc8Yeub2slIZY9C11bt6vP1MYf9nO
	mQC48G5rClVlsNpZPM7JgQS3vPL1Q0BveMohQVq+fNPulosh4xJwN+9tE6hv4C5IjILJ
	GQAF3BjFnGXv7M1m1+upP8J9NkTO5UqaWI2eTg7YNwTOrPUqZR7bUvgM/fngJCv+zFIp
	u7pQ==
X-Gm-Message-State: AFeK/H3I3iGwYC2+7kIrv/QltvmKfzouek8iVxxSrySnHEgeuN6zRBb9LBhUCSg4vTqIyKkGtN4iOOJ3WhNPkA==
X-Received: by 10.237.48.37 with SMTP id 34mr27991373qte.117.1491394395064;
	Wed, 05 Apr 2017 05:13:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Wed, 5 Apr 2017 05:13:14 -0700 (PDT)
In-Reply-To: <CAJTo0LbUrTDOrXU4VzPe=+iiZtFyasL7LhNtpb4YiX6eLTkTWQ@mail.gmail.com>
References: <1d818d62-704e-61f4-1f0c-a3980a09b502@windriver.com>
	<20170404080203.6985-1-Martin.Jansa@gmail.com>
	<CAJTo0LbUrTDOrXU4VzPe=+iiZtFyasL7LhNtpb4YiX6eLTkTWQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Apr 2017 14:13:14 +0200
Message-ID: <CADkTA4MVqLyLbjdfVq-Ze=ZOq73ERzw1qpxHmgbzvOPhM4rBPg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x86-base.inc, qemuarm.conf: prefer 4.10 version of linux-yocto
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
X-List-Received-Date: Wed, 05 Apr 2017 12:13:14 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c9bbe235310054c6a51c6

--94eb2c0c9bbe235310054c6a51c6
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 4, 2017 at 11:48 AM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 4 April 2017 at 09:02, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> -PREFERRED_VERSION_linux-yocto ??= "4.8%"
>> +PREFERRED_VERSION_linux-yocto ??= "4.10%"
>>
>
> The qemuppc and qemumips machines don't have a preferred version, so
> should we be setting it in all the machine configurations, or can we remove
> it from these recipes?
>


I can look into that. But I'm traveling at the moment and won't have time
to spin a patch
and test for a few days.

Bruce


>
> Ross
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c0c9bbe235310054c6a51c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 4, 2017 at 11:48 AM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote"=
>On 4 April 2017 at 09:02, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_38203980350=
65330508:30f" class=3D"m_3820398035065330508a3s m_3820398035065330508aXjCH =
m_3820398035065330508m15b382759fb1831a">-PREFERRED_VERSION_linux-yocto ??=
=3D &quot;4.8%&quot;<br>
+PREFERRED_VERSION_linux-yocto ??=3D &quot;4.10%&quot;<br></div></blockquot=
e></div><div class=3D"gmail_extra"><br></div></span>The qemuppc and qemumip=
s machines don&#39;t have a preferred version, so should we be setting it i=
n all the machine configurations, or can we remove it from these recipes?</=
div></div></blockquote><div><br></div><div><br></div><div>I can look into t=
hat. But I&#39;m traveling at the moment and won&#39;t have time to spin a =
patch</div><div>and test for a few days.</div><div><br></div><div>Bruce</di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_extra"><span class=3D"HOEnZb"><font color=3D"#888888"><br></font>=
</span></div><span class=3D"HOEnZb"><font color=3D"#888888"><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></font></span></=
div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c0c9bbe235310054c6a51c6--
