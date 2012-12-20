Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tlk2D-0002pI-IT
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 18:35:53 +0100
Received: from mail-gg0-f200.google.com ([209.85.161.200])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 09:21:07 -0800
Received: by mail-gg0-f200.google.com with SMTP id k5so5143387ggd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 09:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=rBimrdOAAz5jjgauXq54d3erL3LWi+QiOgyVrL/Woh8=;
	b=T/mLTjzE46e7BNpyTGFqhdR1sVtG+aGMfkKk4X4D6bgm5vHvmFxzWT/fWfy4yvOdvf
	umCFb0qGsepxSsC3Lw8UHIZA3A3EqNi49ilUHaboZvBpz7cb/bFt20lz+fh1Ts4yU0P/
	foE3UAmtw49z6+symQah9m5BFJFSIzP7tjNztbFMBDStpF1wUxwGjCMlz+z1KrU+brpw
	dS2UaoKtwN/L37ML2l0s5XMinwQv+Tlf+OYsgXI3by4zU7b1tA8b1eRI8BEH/BX7VP8I
	DDLW80vramUZartYiNN4yMqZ9IbR/G+fT5dOezq7jeHhQRveetoO5WSsSQcZdl+at2gP
	q13g==
X-Received: by 10.58.107.235 with SMTP id hf11mr16175465veb.16.1356024066185; 
	Thu, 20 Dec 2012 09:21:06 -0800 (PST)
Received: by 10.58.107.235 with SMTP id hf11mr16175452veb.16.1356024066074;
	Thu, 20 Dec 2012 09:21:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Thu, 20 Dec 2012 09:20:46 -0800 (PST)
In-Reply-To: <5f9c3b67176f90714a2fd394e64f7d8da3cb0258.1356021837.git.alexandru.damian@intel.com>
References: <cover.1356021837.git.alexandru.damian@intel.com>
	<5f9c3b67176f90714a2fd394e64f7d8da3cb0258.1356021837.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2012 17:20:46 +0000
Message-ID: <CAJTo0Lb2QgqE77f4oZm8sqc3izJfDhmcniGoMMCyTtBOsne2Dw@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQngR5OyE6AkdENZDmZPIFFWZwkGnr7f8pPqkroOX6oWYaD8Xuajdq/hiLS9UJ3Ci6ivpDp2WzJWkKaIB894cW5GUf8BvV9l/2PboI3xQITdWRaNYYHCx4h9nbu44xLQVahFr2JS4FydknT9p4RvLXE8PhB2Ut3jTixOHqmQ2oZynxB4t2QM6SG7bsHZ83l/PuXGmfej
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] Prepare mesa-dri for weston compatibility
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 17:35:53 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2012 16:48, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> +PROVIDES += "wayland-egl libgbm libglapi"

Remove this.

>  # this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
> -DEFAULT_PREFERENCE = "-2"
> +# adamian - switch to git version
> +DEFAULT_PREFERENCE = "1"

Please don't touch this, we can document at the moment that people
need to use mesa-dri-git until the tarball is sufficient (9.0.2 should
work).

I also don't see anything that adds a build-dependency on wayland for
the Wayland EGL backend to build successfully.

Ross


