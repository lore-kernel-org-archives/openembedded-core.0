Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7B9197F937
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 18:09:54 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i12so5601737wro.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 10:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=MiNW9elj8yj8QbWItO3MPKAjTeEE6WYSOZCYcMKkgRE=;
	b=f+QtVVmyqhtltaFXu/97TknmjWxy8smaxvq/frVYadfxfOIh+tzsaLj6t9AsheABKO
	QncG4PMvsuMzURfEUpQ5HF0NnSAwsdDL1Y/FDe6H0h+tRqIRVfvdm52aR6EPXdpNDbpz
	NCj6DBoOudn6ySnC9WVcD7lNyC+yYNTQj3SYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MiNW9elj8yj8QbWItO3MPKAjTeEE6WYSOZCYcMKkgRE=;
	b=ZPZSxdXi5MjWDJwgOWNmIcZ/8p50S0SuqDwExylzkfS2xDyUpzN0nKsWrLuECmhmOh
	625iJocGOQGclJdNI9haPOrzRjhqbFwB3drPacMQ4D37joFtdGQN/n2n3kXnDrOZZy7T
	9BLppYTG7njwWurIhRfqkiU+9lkfjKX2Fsm5utFKobagPJcNI/bTorjbDuBZT+/UMhNV
	tUAxL/CqDTWFDj+NgK34djaHmTyaOEiBHfZB6qbm73YM87j1yf8Ut9An52sz1na3DfJr
	YQnO7wdOa/LYjOjpVHUitr5uzpqxAhKBLCkD7WgnwOb++Enig0i0zpq7ZwgxHOY5ge5L
	jHig==
X-Gm-Message-State: APjAAAVzgi2qI4D2f0qb604uNxn0qti+ksE5TJudHAB6b4jk2GRnC47D
	Pl4KapBWZ0gCP4qzQtJo7JIpACWhA1E=
X-Google-Smtp-Source: APXvYqxBFoggibhNkrQxlNazONx2V4y7D9tpjcws63I2mml03lZWerllf+/9WTXUVshcMmAxlKKGNg==
X-Received: by 2002:a5d:4684:: with SMTP id u4mr12166520wrq.352.1574359795087; 
	Thu, 21 Nov 2019 10:09:55 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w17sm4413166wrt.45.2019.11.21.10.09.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 10:09:54 -0800 (PST)
Message-ID: <0f2a46118e8847a3a785a2ab50999ecc22ec205f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>
Date: Thu, 21 Nov 2019 18:09:51 +0000
In-Reply-To: <20191121170948.GC28013@localhost>
References: <20191121150207.3657-1-richard.purdie@linuxfoundation.org>
	<20191121150207.3657-3-richard.purdie@linuxfoundation.org>
	<20191121155018.GB28013@localhost>
	<ec0c2ab6397acc54c64cc4f8927eed97e82a9509.camel@linuxfoundation.org>
	<20191121170948.GC28013@localhost>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] sanity: Add check for tar older than 1.28
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
X-List-Received-Date: Thu, 21 Nov 2019 18:09:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-11-21 at 19:09 +0200, Adrian Bunk wrote:
> On Thu, Nov 21, 2019 at 04:54:12PM +0000, Richard Purdie wrote:
> > On Thu, 2019-11-21 at 17:50 +0200, Adrian Bunk wrote:
> > > On Thu, Nov 21, 2019 at 03:02:07PM +0000, Richard Purdie wrote:
> > > > Older versions break opkg-build when reproducible builds are
> > > > enabled.
> > > > Rather than trying to be selective based on which features are
> > > > enabled,
> > > > lets just make this a minimum version.
> > > > ...
> > > > +    if LooseVersion(version) < LooseVersion("1.28"):
> > > > +        return "Your version of tar is older than 1.28 and
> > > > does
> > > > not have the support needed to enable reproducible builds.
> > > > Please
> > > > install a newer version of tar.\n"
> > > > ...
> > > 
> > > How does "Please install a newer version of tar" work in practice
> > > on a supported host distribution like CentOS 7 ?
> > > 
> > > As user I would expect such things to just work when using
> > > a distribution that is documented as supported.
> > 
> > We're going to have to solve this issue on our autobuilder. Centos7
> > already causes problems and there is documetation in the manual
> > about
> > it:
> > 
> > https://www.yoctoproject.org/docs/3.0/ref-manual/ref-manual.html#centos-packages
> > 
> > (and the need to use EPEL)
> > 
> > Unfortunately a newer tar isn't in EPEL.
> 
> EPEL does not contain more recent versions of packages already
> in RHEL/CentOS.

Sorry, I had thought Centos7 had python3 already and we needed EPEL to
obtain python 3.6.

> 
> > I don't have a solution yet, I do know that silently creating empty
> > packages is much worst than telling a user something won't work
> > though.
> > 
> > Any suggestions on how we fix it?
> 
> My preferred solution would be to replace CentOS 7 with CentOS 8
> as supported distribution, which would also allow to drop hacks
> for two major releases of gcc in various places.

We are working towards that, equally the older version support is
useful to a significant portion of our userbase so its a balancing act.

> If all other supported distribution already ship 1.28 this would
> solve your problem.

I believe that is now the case, yes.

> > (We could make opkg-utils-native depend on tar-native but for most
> > people that isn't necessary so it seems a shame).
> 
> Building tar-native is not something that would strike me as 
> problematic.

Its an extra build dependency and extra build time, just complicates
things. "tar-native" is in ASSUME_PROVIDED and gives bootstrap issues
although we have the "tar-replacement-native" mechanism to account for
this already. So possible but not entirely straightforward.

Cheers,

Richard


