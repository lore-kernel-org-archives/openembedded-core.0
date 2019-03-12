Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5EDB67BF9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 22:35:32 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id h34so2882286pgh.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 15:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=/l2c+HgEJvL5vwZGSg5jiDZ2i5jkZb/0JPSaO1H/Q6Q=;
	b=UHnIU6hNdi98tcImkVbEgxF0u0AAR97TRITOmdDn0eqfEKQpnCg7gFfRBYSt8R1Uy5
	rS8iLw8r1qbgcSAmnEzKgAC5RtTH2GELhJ63N3NXcryg4hnDgwXNOK8MVXfK0ufQlSq4
	n31lwuGugDZicQiGVl7VQHABjI/T9QcYz5VXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/l2c+HgEJvL5vwZGSg5jiDZ2i5jkZb/0JPSaO1H/Q6Q=;
	b=eyPuL8BQM3mByT6MOldhn6QX8qqH0VPKB+W/Dc6hW0ENIOXt12KiH6mYyWRa4PyU6O
	QxDU8oBv28RGjQgG/ZjjUTKIqCRQQEqdRAkSvi6a1J1HCtDzjNsA7HmmVBGctPY0bOa0
	fmpLZSGg5FXnMextuOEbWx4qtcxM0TPYxu04uwfmyHX8Br4eStfmyF7cOSW8srOzumzF
	cLpFJQKsjeQpf33UHyPqWsQhpb4OcRfoQ/TLeCaol/qSfRLDbqPx3Wt0YDJbu1n2qc//
	EVCsrRRT2pjMx5iXpml52zpNH62FY6dxtWlfQ4LNXBs69jewrw9uEU5SY6CyBR5vsnqc
	6SlQ==
X-Gm-Message-State: APjAAAU9GM685GRJ1rWIuwuGOEchbcrHlU6k+CRZr2QaLDFpIYqu9Vvk
	Jih0iX6GeCTvfieTwM6TVXZ13w==
X-Google-Smtp-Source: APXvYqx8E4ixIqMiB2A0eYpWo3ebg/YhBVMczqtEtQ469uqdAkWDYMXZVWRasemxsL5c3OrHZ39qSQ==
X-Received: by 2002:aa7:8059:: with SMTP id y25mr40284663pfm.74.1552430133377; 
	Tue, 12 Mar 2019 15:35:33 -0700 (PDT)
Received: from hex ([12.27.65.221]) by smtp.gmail.com with ESMTPSA id
	73sm17991025pga.19.2019.03.12.15.35.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Mar 2019 15:35:32 -0700 (PDT)
Message-ID: <a3a1014e9307a7d44e84bf50d54c1454d731ebca.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Kang Kai <kai.kang@windriver.com>
Date: Tue, 12 Mar 2019 15:35:29 -0700
In-Reply-To: <CAJTo0LbfKpABuhzzEdfpYQ_UEHSV7cV4ffMQeUj6ZhtFZu-hmw@mail.gmail.com>
References: <20190312012245.25551-1-kai.kang@windriver.com>
	<CAJTo0LbfKpABuhzzEdfpYQ_UEHSV7cV4ffMQeUj6ZhtFZu-hmw@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] virglrenderer: requires distro feature opengl
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
X-List-Received-Date: Tue, 12 Mar 2019 22:35:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-03-12 at 10:33 +0000, Burton, Ross wrote:
> On Tue, 12 Mar 2019 at 01:23, <kai.kang@windriver.com> wrote:
> > +REQUIRED_DISTRO_FEATURES = "opengl"
> > +REQUIRED_DISTRO_FEATURES_class-native = ""
> > +REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
> 
> I suspect you can drop the native/nativesdk overrides here, as
> DISTRO_FEATURES is overridden in those builds.

I suspect it is needed since we clear DISTRO_FEATURES to a small subset
for native/nativesdk and hence opengl won't be present. If its not
present, virglrenderer-native will then not build.

We may need to rethink how we're using the native distro features.
Maybe when you add virglrender-native, you need to add opengl to the
native distro features? We could change qemu config based upon that?

It would be good to confirm my above guess is correct...

Cheers,

Richard


