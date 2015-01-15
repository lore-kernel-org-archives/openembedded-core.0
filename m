Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 961CA727D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 17:08:11 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id z107so12657996qgd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 09:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=p2A07UJv6O1X1z1E4C9Byh5KwbUgHyvTwI79W07fJyA=;
	b=SZo5y6xDtTa1JpTJljzgXDwaGxzjF8khCOsG/RjoI2O4wDhvi+iArk+TLuHBmw0OGb
	NsN+oOBMJD0uIGkoIVauLhk7dinGYYzGR89UcbXMcr9flJ63JTY8sYGU4ZfM6pO3+G0t
	BsJNcU8CVlULivSrODFoey2UWkEhUlwTPiujEklOnwcL8rloFznXzKssuiyD60SOL013
	Ah70RDOBs5vDpVyW4A6n6N6Iw22LFn2BH/t9FihqftCMGmPQSj7OyNmoBhGnYEHttlvg
	UX3WJ7wRskaYGK0pVI2sTNsvVW6NeBIZA6rdv9kem+RpSNOLHXzOl/BGRMkYhwF8Rsdy
	4yHQ==
X-Gm-Message-State: ALoCoQkBfplFUOzOyHbUztKRTPe5DOSE7q2Wv3n54oD75vt92DtewDY7AqgQzJCTtBK0s2bN9V9d
X-Received: by 10.140.21.80 with SMTP id 74mr16712738qgk.87.1421341692363;
	Thu, 15 Jan 2015 09:08:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 15 Jan 2015 09:07:52 -0800 (PST)
In-Reply-To: <54B7EC76.9090306@gmail.com>
References: <1421314636.31262.42.camel@linuxfoundation.org>
	<54B7EC76.9090306@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jan 2015 17:07:52 +0000
Message-ID: <CAJTo0LZF6T5bA9TwAJwM1iXz3LYwij7J_nkuVFGW7=YRr4qt5A@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxml2: Backport fix for CVE introduced entity issues
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
X-List-Received-Date: Thu, 15 Jan 2015 17:08:18 -0000
Content-Type: multipart/alternative; boundary=001a11c131a4adc006050cb3e66a

--001a11c131a4adc006050cb3e66a
Content-Type: text/plain; charset=UTF-8

On 15 January 2015 at 16:36, akuster808 <akuster808@gmail.com> wrote:

> this will be required for dizzy when I pull in the cve fix ( which i
> missed)..
>

Yes, the CVE fix was broken.

Ross

--001a11c131a4adc006050cb3e66a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 January 2015 at 16:36, akuster808 <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3tn" class=3D"a3=
s" style=3D"overflow:hidden">this will be required for dizzy when I pull in=
 the cve fix ( which i missed)..<div class=3D"yj6qo ajU"><div id=3D":31e" c=
lass=3D"ajR" tabindex=3D"0"></div></div></div></blockquote></div><br>Yes, t=
he CVE fix was broken.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11c131a4adc006050cb3e66a--
