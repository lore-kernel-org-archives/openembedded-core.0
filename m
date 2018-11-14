Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id 305DC6C183
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 11:49:01 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id k141-v6so23400538itk.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 03:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sT5RBlJtgDnGuVQCayTe7DyQ1HKxcL2gH7DaEF+VFzY=;
	b=OU7FtAy5Tef71Q1UKewZ3wKiKao2nXdAHSTHhNUhAok+UUrQJMwNkXKstSb6BpbL5V
	EV9QCTgXEkEgU/Zb+o/a9qFSSMAkPSLZM1d+FQjCWsAWJg7XMhjGRAshOAe3dsXzwVNf
	Izb2VZAilVy0NmX1splFxnoWELzu78+Df245Pl5wTprIKxaPMiJqhMlW0qJMiLwXBd3t
	bVpakxggAMtDWM7wj2WU3gAwpnEfSltuIh7AKdFvL5i3C1T1BjbdWqLTP9EuWNLLlZ24
	tLp0ePrVDpS5gW9Npwl1M9bK/aTAlRm2pC0kHMQt+yCllxJM9yRDi/ynrN9fEPq3vKnM
	41+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sT5RBlJtgDnGuVQCayTe7DyQ1HKxcL2gH7DaEF+VFzY=;
	b=hCvXj4tN4zKrWa8rUwUIcREz6OI0c4CIjQld59m8tVXvBTWQI1oZ41lp1mZo4p38M6
	52AbGvl5uPSNT2VPXjDyeakyKdtL60koRGwig/lCzgZm2f6S5N0i6kvC+o+zD9V/u1ON
	SzIA1SKD7d54imwrVuCdiekIjWHZ8R8mmGRGo+kbKudQ4veWwycfAKIDB4eeEyXQUCMo
	7UcmJKtDJtbRIhv4emdTb48EILPfc8la17XaYQvuwttjMF+vUjng4g+PwnZBLeAtNwcB
	YZwAbsUNjMlOhJVMyxL3CQ01ofodmmEB/oZY/CNcy/cHMWJ+SidoWuwFs9oJc13lBJ5G
	Zr/g==
X-Gm-Message-State: AGRZ1gL17mJAmTff1Pici3Cfwt/CRi5I72TdXxm6lwAFKsgo79Gtv5/b
	weH01UQ761Tv49QJiHiaKXBVhiQzGxW6e/7NPuSchg==
X-Google-Smtp-Source: AFSGD/UG3jsoNaJ1amf6bT/YTSB7RpkW6npz8I8L9QARIbIhAXqoeSuvBADjFByGpAuOrNSVAlxICG9DKkpxUMmN3TI=
X-Received: by 2002:a24:9142:: with SMTP id
	i63-v6mr1766177ite.130.1542196142287; 
	Wed, 14 Nov 2018 03:49:02 -0800 (PST)
MIME-Version: 1.0
References: <CAD9sEJu_CbZYAGCiytx1GuM+HEQ+ar8mRG+aWG55dRe_okpK8Q@mail.gmail.com>
	<CAJTo0LY4jYkwWH0LEjzoAmjPWpm3W7P0m45YSWC7CfTW11P_CQ@mail.gmail.com>
	<CAD9sEJsfnEMaPpREK26BoXqteh+3yXw3Uy6jQThBJMnnomJ3EA@mail.gmail.com>
In-Reply-To: <CAD9sEJsfnEMaPpREK26BoXqteh+3yXw3Uy6jQThBJMnnomJ3EA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Nov 2018 11:48:51 +0000
Message-ID: <CAJTo0LbnVE9zCecktM+qchTDEn1gPwcXj8bfUb5erOhFtJqJug@mail.gmail.com>
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
X-List-Received-Date: Wed, 14 Nov 2018 11:49:01 -0000
Content-Type: multipart/alternative; boundary="0000000000003c472a057a9e8551"

--0000000000003c472a057a9e8551
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Nov 2018 at 11:46, Knoppix <theknoppix@gmail.com> wrote:

> My question were implement the missing recipes for yocto->meta-gnome
> To start from point I did want to learn dependency graphic of gnome3.
> I subscripted devel right know.
>

Just to repeat: all of the recipes you'll need to write are on the oe-devel
list now.  They need work and testing, and your contributions are welcome.

--0000000000003c472a057a9e8551
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, 14 Nov 2018 at 11:46, Knoppix &lt;<a href=3D"mailt=
o:theknoppix@gmail.com">theknoppix@gmail.com</a>&gt; wrote:<br><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>My qu=
estion were implement the missing recipes for yocto-&gt;meta-gnome</div><di=
v>To start from point I did want to learn dependency graphic of gnome3.</di=
v><div>I subscripted devel right know.</div></div></blockquote><div>=C2=A0<=
/div><div>Just to repeat: all of the recipes you&#39;ll need to write are o=
n the oe-devel list now.=C2=A0 They need work and testing, and your contrib=
utions are welcome.</div></div></div>

--0000000000003c472a057a9e8551--
