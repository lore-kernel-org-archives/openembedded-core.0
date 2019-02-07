Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id F16006BD08
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 17:21:39 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z15so737567wrn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 09:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=gM4uFnNkVFRTQ7XCuHMEPjKo6v0xMpbVwY4pVML+EE0=;
	b=d2XZ9Ub6j3vk+ogWxxBrAN14UPKKDoVI35p92khv7O4cOTr1NzmLJgnWeKxZ/DOTKm
	3LvwG/ZAgnzKfERd2+O0rVA2Sp4VxYKsr9HiqBi4L13Nk4d/iidPNNrYK76G021+kfvB
	bnm0uSWGScljS3W3OTWsNYsLovysPRkzhqZzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gM4uFnNkVFRTQ7XCuHMEPjKo6v0xMpbVwY4pVML+EE0=;
	b=bCQHFjXcQCOQu0Pu6lbOImi8XfR0gwrt2mGqM3HQ57+W8w2AahdaOz2J4APUbrQE5/
	0u+OB2VHCEpgB0KFgYeM/NJGpZLiLmxdv0vG9x7M1azvjYSdJLDcHVPSfIBR8kpNIwAs
	TiQ7PbQY2/81R8iqWPWnFAI9LVSbDqwZtC5uCaQVxPWwmNxKLkU6P2fPBEojhrnNAJ/h
	N48oVov8YEMxveS9uQyHnbzJpcFStt/Vcqfu9+NxtynGHZTHnMrm6RGrfyXW7O4enws1
	UNeAbjFF9iBwFZ1DFrqtHcbM7c4GRCBuKuX/iXAt5wELIFq54lOzcBSMMaBOgHgUOITs
	SnUw==
X-Gm-Message-State: AHQUAuYsEAFPB2nEZQO83QFE6oCMR415xNRXbbpqJ7U6ZgFZic+PAlL6
	YTImSVvEKlVpFhR0rVk6yXWpeQ==
X-Google-Smtp-Source: AHgI3IaverFH5BMv2/u/7WI7Hg9mVEYaPTa/bI0kHotdFFj14N6o5pDPuO0wwX3yHaDffzc8IMlsUg==
X-Received: by 2002:a5d:6452:: with SMTP id d18mr5130665wrw.183.1549560100525; 
	Thu, 07 Feb 2019 09:21:40 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j8sm18587496wrt.40.2019.02.07.09.21.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Feb 2019 09:21:39 -0800 (PST)
Message-ID: <01574523a8aa31529bbedabeee90ec541d91cb10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, Martin Jansa
	<martin.jansa@gmail.com>,  Khem Raj <raj.khem@gmail.com>
Date: Thu, 07 Feb 2019 17:21:38 +0000
In-Reply-To: <CAJdd5Gbg4hCkVUKopz5qXcqxEjmJsM-XP83rHKiqz3bHYUka_w@mail.gmail.com>
References: <20190207003537.7135-1-raj.khem@gmail.com>
	<88a02e81ed831ed4fba8adbd9e18f1a35dbf098d.camel@linuxfoundation.org>
	<CAMKF1sr9DyoaDpbz0O=1kur3-WRS=8FEuaq70YSfuSj71S_VkA@mail.gmail.com>
	<CA+chaQcx9tecJLN1jytyn41DGrEyJVHYPDRREXYUbtjFzD5EJg@mail.gmail.com>
	<118388284a74868c06bf5205a2268aea605d24e3.camel@gmail.com>
	<CAJdd5Gbg4hCkVUKopz5qXcqxEjmJsM-XP83rHKiqz3bHYUka_w@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-locale: Rewrite do_install using install utility instead of cp
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
X-List-Received-Date: Thu, 07 Feb 2019 17:21:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-07 at 10:59 -0600, Joshua Watt wrote:
> On Thu, Feb 7, 2019 at 10:44 AM Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > Martin,
> > 
> > Do you by any chance build in Docker (or some other transient
> > container)? We recently found an issue with building in docker
> > where when the primary container command would exit, causing the
> > container to terminate. When the container terminates, the kernel
> > unceremoniously sends SIGKILL to all its processes. This plays
> > *very* poorly with pseudo because pseudo keeps it's entire database
> > in a in-memory sqlite database and only flushes it out to disk on a
> > periodic interval, or when it get SIGTERM (maybe SIGQUIT?) or exits
> > normally. By default the pseudo daemon will also hang around for
> > 20(?) seconds waiting for a new connection from a pseudo client,
> > meaning that when our docker container was exiting, there were
> > potentially several pseudo dameons sitting around waiting for a
> > client with unflushed databases in memory that suddenly got a
> > SIGKILL and all their data was lost. This was particularly bad if
> > you aborted a build while it was running, or some build failure
> > occurred. Since 
>  the pseudo database was lost, the only way to correct these errors
> was to clean and rebuild.
> > I think pseudo could handle this better and keep the database on
> > disk instead of in memory, but in the short term you can hack
> > bitbake to pass the -S flag when invoking the pseudo client which
> > will make it tell the dameon to shutdown (and thus flush the
> > database) if it is the last connection.
> 
> FWIW, this patch makes it much easier to do that
> http://lists.openembedded.org/pipermail/bitbake-devel/2019-February/019813.html
> Just add
>  FAKEROOTCMD += "-S"
> in local.conf

Should we be doing that by default? Is there a downside?

Keeping the database flushed to disk would likely be slow but this
seems reasonable.

Cheers,

Richard



