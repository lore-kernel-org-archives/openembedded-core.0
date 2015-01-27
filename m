Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 641B472C60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 21:54:17 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id v8so13472971qal.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 13:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5J+k6KWV7dBxFniFNE7ZIMNrY1mVWfC62ba2mo0Ix10=;
	b=dxLwJyHRGG8h8VwIXfOwLfQVpJVasbxaduHS5TKm9SLtJbNu9aAvhftSS2RWCD9bqk
	oddfR/Ul3eXx18zEY+6P409FGCb+w+A6gi4gcDKpkORqJRB4DZUnBKtsLGgbISg07o6k
	cAVFGUEdoE2oDFtplubyU5eOF07VGqt4LaxX6jdmy82FI8cI7Y+x0y4gsyjVu+45ebUB
	ZXuKMjwsxQlr3t6SuB5IAnSzMO+FnJq8ZA/zs6t/h/pJZRd7mpY9IqkYhFYqKBy6Bbs2
	4XJjnSFvYmdE2htGmvJgOxIvXDhvJylBqCEo4JvO9Erdn4FnvY/GgBouvuH8jhZQtksC
	mcog==
X-Gm-Message-State: ALoCoQlxPLJ79R4HGWns0AS+NZ7l2YpceUobsiepcGXEU+HP3ARUfCE5JgP3FNW3zQC/pMqPABAT
X-Received: by 10.229.80.3 with SMTP id r3mr4587052qck.23.1422395657985; Tue,
	27 Jan 2015 13:54:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 27 Jan 2015 13:53:57 -0800 (PST)
In-Reply-To: <1422341773-12634-3-git-send-email-raj.khem@gmail.com>
References: <1422341773-12634-1-git-send-email-raj.khem@gmail.com>
	<1422341773-12634-3-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Jan 2015 21:53:57 +0000
Message-ID: <CAJTo0LZyAtth=_R8iUmJDmmXHyWgZsFe+xek_NTu+NJHS7ecTQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] pigz: Upgrade to 2.3.3
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
X-List-Received-Date: Tue, 27 Jan 2015 21:54:25 -0000
Content-Type: multipart/alternative; boundary=001a1133cb78ecb8dc050da94b5c

--001a1133cb78ecb8dc050da94b5c
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 27 January 2015 at 06:56, Khem Raj <raj.khem@gmail.com> wrote:

> Fix build issues due to libz being required but
> is specified before use.
>

Unusual build environments cause this to break:

http://errors.yoctoproject.org/Errors/Search/Details/7981/2/10/186f59834b147ba51c65da82138dcc26fd7b1e4a
http://errors.yoctoproject.org/Errors/Search/Details/7959/3/10/186f59834b147ba51c65da82138dcc26fd7b1e4a

Can you have a look at this please?

Cheers,
Ross

--001a1133cb78ecb8dc050da94b5c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Khem,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 27 January 2015 at 06:56, Khem =
Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D":5u2" class=3D"" style=3D"overflow:hidden">Fix build issues due to libz=
 being required but<br>
is specified before use.<br></div></blockquote></div><br>Unusual build envi=
ronments cause this to break:</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra"><a href=3D"http://errors.yoctoproject.org/Errors/Se=
arch/Details/7981/2/10/186f59834b147ba51c65da82138dcc26fd7b1e4a">http://err=
ors.yoctoproject.org/Errors/Search/Details/7981/2/10/186f59834b147ba51c65da=
82138dcc26fd7b1e4a</a><br></div><div class=3D"gmail_extra"><a href=3D"http:=
//errors.yoctoproject.org/Errors/Search/Details/7959/3/10/186f59834b147ba51=
c65da82138dcc26fd7b1e4a">http://errors.yoctoproject.org/Errors/Search/Detai=
ls/7959/3/10/186f59834b147ba51c65da82138dcc26fd7b1e4a</a><br></div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Can you have a look=
 at this please?</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Cheers,</div><div class=3D"gmail_extra">Ross</div></div>

--001a1133cb78ecb8dc050da94b5c--
