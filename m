Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
	[209.85.210.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC8D7C10E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:13:30 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id f18so2931682otl.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iMxQFWnMKi1isi3h2QnJ2C40CCCpVStBlRmKQzvSrtI=;
	b=a5HswxC8U94zK195Nmv2l4C4DgOF4/GLA+MWFqImSGIUazQ7++Cinhv9TrFoI6x8sM
	KmJ2rZF6qNY9LanpdDJCbpc6RJX1GNl84hoqVRuPje7NWlPbSFDSQB/1aK0ggFWnglS9
	92sCqxFi6avzdDgS/qepprtUFHHxrAwpzJq5Zt1aRRm9rz+YlxOkt7OWfNVJq0BP7jhn
	KAYbVeczNNJhNhsYuGhx6TwNzMwoVJnYq1aZQ+z8Fem4cmMJgqgRS1W+LyO7RiaOV+uT
	eRyP2KLVGa6gWWqulTqD0GxAX9cuC/wpvN2Xq69ETbWxEUqfy12Y4o6xAuiyXr19JKZU
	TFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iMxQFWnMKi1isi3h2QnJ2C40CCCpVStBlRmKQzvSrtI=;
	b=lDKd6ZFqBF/czdT5hXBdrevj7yzMJGWYZmqyPWcm67IdznPF4mFRhd8cbjKvn4ODvV
	mvWiuNlq/nYojue6ehJoRb2IDv2fyROk8DTvuEUr9GQwuOVS+Mvnlgw6NoKAC0YxYiPx
	COEgZDEv9zP0npt7bCIV4RctWgkgJE8sy16Y1uOjH3Uk5QnuZmxucBT0I0O50pOOxxDO
	NZq71ig1NFuEZKjjFCVVpFct5qRyNlIPwzGXFhkT0A6yuW9nxRm5gqWbvJ2HmuqAtWiQ
	S2VqhQTEOXue7xmlswycuRgUYV3NujaqRaaKI0UVMGBuW643ABVCL8oc/FwOTt2IrHPF
	bs9Q==
X-Gm-Message-State: AJcUukcWXt+yj3qqxYKb1GHsf/otpfOe3npTIUO3axffzHRQtMayQg4s
	u6MEJRzoMtn8zMtiFzMafu92Cun7VeyajLjzGq68F/2Wmss=
X-Google-Smtp-Source: ALg8bN6mZz+ehREQxruk37i0Ww2iMI1WBet7NJlR85s4Pcn1TNk91Xi0t9XngLfJh1HPcZt69ONtFxmTc1fri5nm0NQ=
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr2737727oti.367.1547568811601; 
	Tue, 15 Jan 2019 08:13:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547477793.git.alex.kanavin@gmail.com>
	<7cff741d1306283af05fa88c00ed7f2a084af318.1547477793.git.alex.kanavin@gmail.com>
	<14ddb1b07908b79de700fa528fc608e493fa8dae.camel@linuxfoundation.org>
	<CANNYZj-pWziynefErqiKt9uh-nbBS5XOdr5AYC2-uu1Zb-N=dw@mail.gmail.com>
In-Reply-To: <CANNYZj-pWziynefErqiKt9uh-nbBS5XOdr5AYC2-uu1Zb-N=dw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Jan 2019 17:13:20 +0100
Message-ID: <CANNYZj9M4yjd2hTmNaFnj=aNQygPCzpHjWniyg51SzdT7xrH0Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/23] qemu: add a gettext-native dependency
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
X-List-Received-Date: Tue, 15 Jan 2019 16:13:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Jan 2019 at 16:06, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > gettext is a heavy enough dependency I'm tempted to suggest we do:
> >
> > do_install[depends] += "gettext-native:do_populate_sysroot"
> >
> > given how slow qemu is to compile...
>
> I'm going to look a bit deeper to find out why this isn't a problem in
> master, but is a problem in my patchset. This was just a quick fix to
> get things to build, as I was eager to get to the point where opengl
> works :)

qemu already unconditionally depends on glib-2.0 which has a hard
dependency on gettext-native, so this wouldn't slow down the builds.

However, qemu itself depends on gettext utilities only when gtk+ is enabled:

https://github.com/qemu/qemu/blob/master/Makefile#L743

so I'll move the dependency into gtk+ PACKAGECONFIG.

Alex

Alex

