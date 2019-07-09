Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9362B7E502
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 03:44:59 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id m8so8575919lji.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 20:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=r5afFvyfaGfXJ8IbMK1zYqdK6GgtUYq9bbidJwYPk+o=;
	b=naFhGPleCg6LrGbPsIhSKgL7WE0R2oXCzgooNpTa6jT7ZVMwvngVJD15+pzn3IAWc5
	e3bie4zt7egLgJVo3++P3R5WKCWJGrkkQqoWidChdRD3TL2ZoP09jyvqqOgIk6byboGv
	uLZG/4DN8CSa1Q2NUXo9AnzlKYiNZ8AVRqDfyYTBN4vfrt4IqI9FcqKX4W9pd9RLnsTy
	BLWkUyp+u7ZUaE3Dn6NmSlUOKmINDunuxOZjIViE6qSDxWp5q0LIaJo7WG4/geEwysa3
	wd/85iPJEic9zvwjr2B2YO63tyKufwOP8yMF/htudk2OrvXLlxp99MPgYjm5rttf8/Ci
	OnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=r5afFvyfaGfXJ8IbMK1zYqdK6GgtUYq9bbidJwYPk+o=;
	b=AnyNPax/XMjdmy1fM0Fl1jqGe2fizFNYnxBCd7s77ZhyDbvySAHX2dv1hTOQAhzslm
	Xc3iN/L6z64rzdr5imFinL/pbR5v8O+n4uELLLMX01rs6HkJkVqJ0kyF40Y/2QlL9Psu
	Yu5ACuycJSbzzEfOqVFJXUi7WR6s/zzbiLkL5pJfRSYb/Gl4rD9MzHd8RvdTW7sSKmTb
	/TeqjEIXPX0mBRvHvfK4TjJhRR5DKJeW5m5q6SRBIjamx9GNX9X+iee4pmDO/IffihDo
	dlGapJrs4TO3Qy6NTnncqW9HppGmKdcdaQ/4Dbua4FxjLpSEWtXxTIQvE1wmSpCcV6oG
	4nug==
X-Gm-Message-State: APjAAAWM93EHn68HYofseJdQIN0raB/8vjuPuWbtaB4htFnlpRmwP+/O
	D9OtFpdPBInFkRf/LVY+4gjPwNEdg8Eb1Wi8zBM=
X-Google-Smtp-Source: APXvYqzLQBQcvskQW/Yqjaws9LROdrgqjiC1kS+cQc+qyBcWtl9rfVmBztrUda7Yplu8f+E/7Q9PjnTt5QHM+b7y9Js=
X-Received: by 2002:a2e:a415:: with SMTP id p21mr9391246ljn.111.1562643899879; 
	Mon, 08 Jul 2019 20:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0HgOebmE=uUJ718CBhsXv3bW7WoeXa4dp06LL=vcLd_qg@mail.gmail.com>
	<CAJTo0Lbm1DVcwKFjYBaXWsgzTGLbRRH2aFEzgTi0MAGQXQ4T_w@mail.gmail.com>
	<CADySD0E7mwou1DeeTWfjdXh3QjqM9oMDvLsVbkXMrFZCfcgdug@mail.gmail.com>
	<CY4PR12MB165398EE661D4CA2995CD0558BF60@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CADySD0HHhJHacwP0HXR52dpw1SEjg60y9-RRvuNgDHJFTw46Aw@mail.gmail.com>
In-Reply-To: <CADySD0HHhJHacwP0HXR52dpw1SEjg60y9-RRvuNgDHJFTw46Aw@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 9 Jul 2019 15:45:13 +1200
Message-ID: <CADySD0Hz1mmT29kZF6=0=kw3Af+8+OAaKMxUvfXXPpcM+2LASw@mail.gmail.com>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Problems with sstate-cache in Artifactory
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
X-List-Received-Date: Tue, 09 Jul 2019 03:44:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

1) I am able to fetch sstate using curl, wget

2) Looking in bitbake -DDD output, url is correct as I can use that
url to download it using curl, wget
DEBUG: SState: Attempting to fetch
file://5c/sstate:u-boot-ti-staging:wsl-linux-gnueabi:2019.01+gitAUTOINC+06e=
0b5babe:r17:wsl:3:5cdf9380b9b3f8c94a706344cf19554a_packagedata.tgz
DEBUG: Searching for
5c/sstate:u-boot-ti-staging:wsl-linux-gnueabi:2019.01+gitAUTOINC+06e0b5babe=
:r17:wsl:3:5cdf9380b9b3f8c94a706344cf19554a_packagedata.tgz
in paths:
    /home/nws/wsl/arago/downstream/ggl-oe-layersetup/build/sstate-cache
DEBUG: Defaulting to
/home/nws/wsl/arago/downstream/ggl-oe-layersetup/build/sstate-cache/5c/ssta=
te:u-boot-ti-staging:wsl-linux-gnueabi:2019.01+gitAUTOINC+06e0b5babe:r17:ws=
l:3:5cdf9380b9b3f8c94a706344cf19554a_packagedata.tgz
for 5c/sstate:u-boot-ti-staging:wsl-linux-gnueabi:2019.01+gitAUTOINC+06e0b5=
babe:r17:wsl:3:5cdf9380b9b3f8c94a706344cf19554a_packagedata.tgz
DEBUG: Testing URL
file://5c/sstate:u-boot-ti-staging:wsl-linux-gnueabi:2019.01+gitAUTOINC+06e=
0b5babe:r17:wsl:3:5cdf9380b9b3f8c94a706344cf19554a_packagedata.tgz
DEBUG: For url ['file', '',
'5c/sstate:u-boot-ti-staging:wsl-linux-gnueabi:2019.01+gitAUTOINC+06e0b5bab=
e:r17:wsl:3:5cdf9380b9b3f8c94a706344cf19554a_packagedata.tgz',
'', '', OrderedDict()] comparing ['file', '', '.*', '', '',
OrderedDict()] to ['https', 'artifactory.local.gallagher.io',
'/artifactory/rnd-yocto-packages/sstate-cache/wsl-thud/PATH', '', '',
OrderedDict([('downloadfilename', 'PATH')])]
DEBUG: For url file://5c/sstate:u-boot-ti-staging:wsl-linux-gnueabi:2019.01=
+gitAUTOINC+06e0b5babe:r17:wsl:3:5cdf9380b9b3f8c94a706344cf19554a_packageda=
ta.tgz
returning https://artifactory.local.gallagher.io/artifactory/rnd-yocto-pack=
ages/sstate-cache/wsl-thud/5c/sstate%3Au-boot-ti-staging%3Awsl-linux-gnueab=
i%3A2019.01%2BgitAUTOINC%2B06e0b5babe%3Ar17%3Awsl%3A3%3A5cdf9380b9b3f8c94a7=
06344cf19554a_packagedata.tgz;downloadfilename=3D5c/sstate:u-boot-ti-stagin=
g:wsl-linux-gnueabi:2019.01+gitAUTOINC+06e0b5babe:r17:wsl:3:5cdf9380b9b3f8c=
94a706344cf19554a_packagedata.tgz
DEBUG: checkstatus: trying again
DEBUG: checkstatus: trying again
DEBUG: checkstatus: trying again
DEBUG: checkstatus: trying again
DEBUG: checkstatus() urlopen failed: HTTP Error 404: Not Found

Regards
Ankur

On Tue, Jul 9, 2019 at 9:16 AM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
>
> Hi Chris,
>
> Thanks for your pointers, I will try them.
>
> Regarding using curl for sstate fetch, how to set SSTATE_MIRRORS ?
> Below is my current configuration
>
> SSTATE_MIRRORS ?=3D "\
> file://.* https://artifactory.com/yocto/sstate-cache/PATH;downloadfilenam=
e=3DPATH
> \
> "
> Thanks
> Ankur
>
> On Tue, Jul 9, 2019 at 3:37 AM chris.laplante@agilent.com
> <chris.laplante@agilent.com> wrote:
> >
> > > I can't see any "log.do_setscene" inside the tmp directory.
> > > When I start an image build, it does say executing setscene task but
> > > then no setscene task log for any recipe
> > >
> > > Initialising tasks: 100%
> > > |####################################################################=
##########################################
> > > ##############################|
> > > Time: 0:00:01
> > > Checking sstate mirror object availability: 100%
> > > |####################################################################=
##########################################
> > > ######|
> > > Time: 0:00:02
> > > Sstate summary: Wanted 484 Found 0 Missed 968 Current 0 (0% match, 0%=
 complete)
> > > NOTE: Executing SetScene Tasks
> > > NOTE: Executing RunQueue Tasks
> >
> > We have Artifactory serving our sstate as well, so here's some tips.
> >
> > 1. Try seeing if you can fetch some sstate using curl directly. If you =
are authenticating to the Artifactory server using a .netrc server, make su=
re to pass "--netrc" to curl.
> > 2. You can diagnose the sstate mirror by passing -DDD to bitbake. It wi=
ll spit out a ton of debug messages, so you might want to redirect it all t=
o a file. E.g.:
> >
> > bitbake something -DDD >out.txt 2>&1
> >
> > Start looking after the line that begins "DEBUG: SState using premirror=
 of". It will dump out the URLs that it tries to fetch.
> >
> > 3. Within Artifactory, you can check the access log by going to: Admin =
> System Logs > access.log
> >
> > Look for "DENIED LOGIN" errors.
> >
> > Chris

