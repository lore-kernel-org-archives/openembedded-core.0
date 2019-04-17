Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4D5557C410
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 08:46:28 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s15so30771056wra.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 01:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=9TV8WL2voggMrmcPENxLJVlJFs9cST2TKIKH6A/Y2BQ=;
	b=KeEITeYRptmu6Gujeh5QhF1A5JKPQlZgLlDEFpKeoqPrt4ucaYk2jVuXdYpYuwfpzD
	SbzKz2EStvRTvGgjY4MNcYj2KOAZr1ex1zZBsuYIXi79ygQiP5QSo2IGqPavGMuu50Wa
	evUtLcSO55EX2EdDMIEFKA+L4y0bJshtOfeZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=9TV8WL2voggMrmcPENxLJVlJFs9cST2TKIKH6A/Y2BQ=;
	b=mGZTdBMMsyz3j3vO/N1OGq7TBW8C4wZhL55hVPdth0kvsjpv6G9QY6+D3cgu1Xvoq7
	L22DRjn5Nr7MyPYZ4F6xaaGOBJLODNc8SDF9sB3F4cFSsTrmDPaR7xGnZdVF6AJ69GuL
	0Ap0Tnn06q+yLTnW6lQ8bKWQlNMt8QDwoSQiVeUulIfCKUJfRoMC+f9W81S1S+T0FDaO
	eC8oalRJJfdJwOMpzh4+mjeFbz1la/sKY8NVvpDCq0bMLOUIGrWdWsL2J6Lln+/7xkCA
	eXwo3ecXTHEzYMBlC0RzFGihOEcF/AeoAUKpbTWzERxTfc2qbNSOEoyYWuxZQgucVwBi
	2PoA==
X-Gm-Message-State: APjAAAUyw1CKvF1T53HPWjq/phTWPY6uINqC9fZ3gfUqDSTbMkj6vBEn
	3ZjoHQOwZ8VROQ2vxTSQxlrNLQ==
X-Google-Smtp-Source: APXvYqyz8XLf2qSwNnBUPB4QWMNjMI5IpnSlgVbp/r5VqA7wARMU+AYNl5XChn7S8GPJA63s+pA6Rg==
X-Received: by 2002:adf:de8d:: with SMTP id w13mr56699813wrl.26.1555490789077; 
	Wed, 17 Apr 2019 01:46:29 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u189sm3485066wme.25.2019.04.17.01.46.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Apr 2019 01:46:28 -0700 (PDT)
Message-ID: <eac500ca51a96c769ab3080bcd78dd93316bea9f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 17 Apr 2019 09:46:25 +0100
In-Reply-To: <95a0e409-ad9c-759e-bcf2-c9e6b20a2e50@intel.com>
References: <20190416055919.9090-1-naveen.kumar.saini@intel.com>
	<b7de17b7188d78a1da3c7200ce5263edcf979a22.camel@linuxfoundation.org>
	<95a0e409-ad9c-759e-bcf2-c9e6b20a2e50@intel.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 17 Apr 2019 08:46:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-17 at 10:20 +0800, Saini, Naveen Kumar wrote:
> 
> On Selasa 16 Apr 2019 06:23 , Richard Purdie wrote:
> > On Tue, 2019-04-16 at 13:59 +0800, Naveen Saini wrote:
> > > This provides git large file storage (lfs) extension.
> > > 
> > > Include git-lfs conditionally. If git-lfs is present on host and
> > > repo
> > > has lfs pointers, then git-lfs will be used. If git-lfs is not
> > > present
> > > on host, it will be ignored.
> > > 
> > > [YOCTO #13198]
> > > 
> > > Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> > > ---
> > >   meta/conf/bitbake.conf | 3 +++
> > >   1 file changed, 3 insertions(+)
> > 
> > This sounds like we swap the current situation where things are
> > deterministic for a situation where the situation is not
> > deterministic?
> > 
> > I'm not sure that is an improvement.
> 
> Currently, if host machine has git-lfs installed, build always fails
> and if host doesn't have git-lfs installed, build passes but
> does not download files pointed by lfs. So, the current behaviour
> depends on whether or not git-lfs is installed.

That is clearly a problem as the output is not deterministic (a given
sstate hash input does not guarantee a given output).

> With this patch, build will pass in both the cases and files stored
> using lfs will be fetched when git-lfs is present. So this is more
> deterministic than before? If git-lfs isn't present, then files won't
> be fetched as before.

So we swap one problem for a different one and its still not
deterministic.

> Should this be added to HOSTTOOLS instead so lfs files are always
> fetched for packages that use it?

No, that would mean everyone has to install it.

I'm ok with adding it to HOSTTOOLS_NONFATAL as soon as we have some
mechanism in the fetcher or in recipes which detects lfs usage and hard
errors if its present but git-lfs is not installed.

That way its deterministic - it builds with git-lfs installed and
errors if it is not.

Cheers,

Richard


