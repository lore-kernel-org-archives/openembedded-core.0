Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2319B6C348
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 11:25:36 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id r12-v6so23308216ita.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 03:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cjkcpmgNUe+3/zdfsc7aFBu2A9b9j4paeNYy2wjjPmM=;
	b=nnUFVh4qWB8hY5+Z+dCyuYLNF358BzCqoIWhWbJ8/j9b5ld8ggTCm1qwQTZtV3C0Hx
	Narpz9DgmpoP/HnklDPxPPBVvM0mGwqri9dA83QlNGj+69k7E9Gvwjq68VUlE87fchFy
	6bVxUOxW9GMgBHHyizaCH+M4VMf+OE2JHgnxAirOXtg/fkJKJObaE+7gGn8v9wtFlk+v
	8rXVengD8iX0nA9c6O/VxMnU9IfH2xV4aeKOY9ONcGE8D4lvj9BrmojfpyqxO8Nh3tq+
	avWU5B9hQ/DPs1HfWLywmyE3HnM94GYjAYGG6+XG1BWskcPuJ8auYGaAXZcj1ulgEps+
	LcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cjkcpmgNUe+3/zdfsc7aFBu2A9b9j4paeNYy2wjjPmM=;
	b=jg4Gd6pwWLgCg5GlXq3hSAgovTVKi5bIQCo9SoKOz+ZYEDd9XGSo4pS6eASxtFMDsq
	50Yin+tX9uNkJEaClEPcD/f/Fbqv6x/XRFQqtyMkVOd7NregnA5/dpZyADfwR7jd4xvo
	Llkdulv5FU8roSbP6W/OMVSUREXM6QkHijMBGTyeIrKNKieqtEwNT/E6Zw2UGppeE+ES
	a5mdrKAGdXrC+y++gWZb7W/fOeJ5VOw7BAwG9LdslD4ZYG0Bz5gCqCGkL/8flTryy17J
	+6BN1yYd7Ykv3BhKb2aWfZ3LqnfaxAzsuVD2zV2vye42p8Hb4pEWWxD8tItIUzMsbyn6
	CSug==
X-Gm-Message-State: AGRZ1gIQ6v8yFouheqIoYownt6eYCZzAkrpE0KNpm+GBi9Os41ggLgm0
	sydkhz2upoOexEchEDoGwDO8GPeDgsrJanPH2rZNNg==
X-Google-Smtp-Source: AJdET5dqGqtpuCeiQySo3dalqGSU++cMHzfOXFWoZTae2iKWW2gsuDlyan9ycbRkkPA+NNGt74e2hg6LA0RXxsHPUwQ=
X-Received: by 2002:a24:ce45:: with SMTP id
	v66-v6mr1496411itg.26.1542194738045; 
	Wed, 14 Nov 2018 03:25:38 -0800 (PST)
MIME-Version: 1.0
References: <CAD9sEJu_CbZYAGCiytx1GuM+HEQ+ar8mRG+aWG55dRe_okpK8Q@mail.gmail.com>
In-Reply-To: <CAD9sEJu_CbZYAGCiytx1GuM+HEQ+ar8mRG+aWG55dRe_okpK8Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Nov 2018 11:25:26 +0000
Message-ID: <CAJTo0LY4jYkwWH0LEjzoAmjPWpm3W7P0m45YSWC7CfTW11P_CQ@mail.gmail.com>
To: theknoppix@gmail.com
Cc: Yocto-mailing-list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gnome: what are dependencies for gnome-full-desktop (gnome interface)
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
X-List-Received-Date: Wed, 14 Nov 2018 11:25:37 -0000
Content-Type: multipart/alternative; boundary="000000000000898467057a9e3194"

--000000000000898467057a9e3194
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Nov 2018 at 08:42, Knoppix <theknoppix@gmail.com> wrote:

> (Excuse me for my english I am not native)
>
> One disappointment for me was learn that meta-gnome is not fully-supported
> for running desktop. So i want to write all remain recipes to use desktop
> environment. I want to start from scratch (except from meta-debian-recipes)
> because for learn gnome world.
>
> Dear friends, how can I learn what are the necessary binaries&libraries
> for gnome interface (i.e: desktop window&display-manager panel, topbar,
> settings and other UI full-desktop-environment) to use on yocto project?
> Which project is I should start to write its recipe?
>

If you just want to know what the GNOME dependencies are then you should be
asking GNOME.  GNOME has a build tool called jhbuild, the module sets in
tht list all of the dependencies required.

Note that there's a series to add the GNOME 3 desktop to meta-gnome under
review on the openembedded-devel list, so working on that would avoid
duplication of effort.

Ross

--000000000000898467057a9e3194
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, 14 Nov 2018 at 08:42, Knoppix &lt;<a href=3D"mailt=
o:theknoppix@gmail.com">theknoppix@gmail.com</a>&gt; wrote:<br><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>(Excu=
se me for my english I am not native)<br></div><div><br></div><div>One disa=
ppointment for me was learn that meta-gnome is not fully-supported for runn=
ing desktop. So i want to write all remain recipes to use desktop environme=
nt. I want to start from scratch (except from meta-debian-recipes) because =
for learn gnome world.</div><div><br></div><div>Dear friends, how can I lea=
rn what are the necessary binaries&amp;libraries for gnome interface (i.e: =
desktop window&amp;display-manager panel, topbar, settings and other UI ful=
l-desktop-environment) to use on yocto project? Which project is I should s=
tart to write its recipe?</div></div></blockquote><div><br></div><div>If yo=
u just want to know what the GNOME dependencies are then you should be aski=
ng GNOME.=C2=A0 GNOME has a build tool called jhbuild, the module sets in t=
ht list all of the dependencies required.</div><div><br></div><div>Note tha=
t there&#39;s a series to add the GNOME 3 desktop to meta-gnome under revie=
w on the openembedded-devel list, so working on that would avoid duplicatio=
n of effort.</div><div><br></div><div>Ross</div></div></div>

--000000000000898467057a9e3194--
