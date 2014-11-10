Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5F81A65D4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 15:27:52 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id k15so5522447qaq.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 07:27:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3YwqPbnbWbwCBQ96N2YrImP7gKvqbhd7k5Nc48HKJD0=;
	b=iEMHG6FsCBX6Pjg5XqqxQkYok9YMNc4X2/l7k9KY+Mc2KL3xFoOxCD20vKQPD10G1x
	AaV4z7lA9AT5uMrM1n6ospcDTYQ8ig3b670Sau70/+8wxDJIgTcXj7WTzpQ+B2h0fbrY
	TVX9F/QdL3tmX5BrvoEsbVdn5/af0JIG/7Ustl6z1k35IPat1luSZLUKiLHsR9Q24/y8
	GRnYTlLWDoviIguS+OWUwQ6S/3OJnCcFcZywy7OWH8jmEGfXS608Pj3/G8fKRfJ/+TCv
	qS9mGxQCrQZd+Tmj+u6SYncj+PcvToLRSLIy+1WuvGGkDQbq3L78s1S3k/LMw7crvEjN
	ZbLQ==
X-Gm-Message-State: ALoCoQnI9cNb1GG2041TKk8F8Y4VFRuqj6fiH6uGfybpKWv3tZSn/Behwb92V8EEWu0gk/vKyGxk
X-Received: by 10.229.252.201 with SMTP id mx9mr40132271qcb.4.1415633270170;
	Mon, 10 Nov 2014 07:27:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Mon, 10 Nov 2014 07:27:29 -0800 (PST)
In-Reply-To: <1414751666-21525-1-git-send-email-paul@paulbarker.me.uk>
References: <1414751666-21525-1-git-send-email-paul@paulbarker.me.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Nov 2014 15:27:29 +0000
Message-ID: <CAJTo0Lbf8q3z+dAZzpOu0Rgt4MVKjiCJ9fePOdZoTuK2Yf6ZyA@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] opkg: Upgrade to v0.2.3
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
X-List-Received-Date: Mon, 10 Nov 2014 15:27:56 -0000
Content-Type: multipart/alternative; boundary=001a11c2ef94338235050782ce81

--001a11c2ef94338235050782ce81
Content-Type: text/plain; charset=UTF-8

On 31 October 2014 10:34, Paul Barker <paul@paulbarker.me.uk> wrote:

> The patches for opkg have been rebased using git so that they apply
> cleanly onto
> the new release.
>

Something appears to be broken with 0.2.3:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for
packagegroup-core-sdk:
 * perl-module-config * perl-module-config * (repeat)

https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/97 is
a build on the autobuilder using current master, and
https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/96 is
master plus your two opkg patches.

Ross

--001a11c2ef94338235050782ce81
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 October 2014 10:34, Paul Barker <span dir=3D"ltr">&lt;<a href=3D"mail=
to:paul@paulbarker.me.uk" target=3D"_blank">paul@paulbarker.me.uk</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex"><div id=3D":19r" class=3D"" style=3D"overf=
low:hidden">The patches for <span class=3D"">opkg</span> have been rebased =
using git so that they apply cleanly onto<br>
the new release.<br></div></blockquote><div>=C2=A0</div></div>Something app=
ears to be broken with 0.2.3:</div><div class=3D"gmail_extra"><div class=3D=
"gmail_extra">=C2=A0* satisfy_dependencies_for: Cannot satisfy the followin=
g dependencies for packagegroup-core-sdk:</div><div class=3D"gmail_extra">=
=C2=A0* <span class=3D"" style=3D"white-space:pre">	</span>perl-module-conf=
ig * <span class=3D"" style=3D"white-space:pre">	</span>perl-module-config =
* <span class=3D"" style=3D"white-space:pre">	(repeat)</span><span class=3D=
""></span></div><div class=3D"gmail_extra"><span class=3D"" style=3D"white-=
space:pre"><br></span></div><div class=3D"gmail_extra"><span class=3D""><sp=
an style=3D"white-space:pre"><a href=3D"https://autobuilder.yoctoproject.or=
g/main/builders/nightly-ipk/builds/97">https://autobuilder.yoctoproject.org=
/main/builders/nightly-ipk/builds/97</a> is a build on the autobuilder usin=
g current master, and </span><br></span><span style=3D"white-space:pre"><a =
href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/buil=
ds/96">https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/build=
s/96</a> is master plus your two opkg patches.</span></div><div class=3D"gm=
ail_extra"><span style=3D"white-space:pre"><br></span></div><div class=3D"g=
mail_extra"><span style=3D"white-space:pre">Ross</span></div></div></div>

--001a11c2ef94338235050782ce81--
