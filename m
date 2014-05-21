Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (unknown [209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4561165F99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 19:01:13 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id i8so4032321qcq.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 12:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EiUD2OYCdAQwbHMESXc6O63kxkH5GngMKB/filYE+hQ=;
	b=FGd5STR8gXo/5+DSNh7QOderjEHp8s5f5rvZPaW3tt9RbO60KIJzq0mGN1K/88N2fA
	f5UBuX8aIWsn0uGMw+/9ryJ+HgaCmDCjReu2X8kzi6BWR5UW28JM3C26PvO7jpZkYwt3
	M1KdA/vgxpf9MdujfXFHPGhZ7AZy7QgWW2HyNZJ30SnH7Av6WicnpQU/ROBoiVh+jrsL
	OixTZ3pw78bpo8eeqXkgimUA+bO9hmUe6Cwc6atRyLQXXFrUaq2NTL/FWz+cye74omza
	RvCbVbxwUyW7J+Wx8Iue3qgIjAj/yCo22xcCuNeis8UW90XQyx7SQSUWZ9Qdgzdo2XSq
	nPzw==
X-Gm-Message-State: ALoCoQlZe6xvx3eVKyiBOcv2I2DBw36oNUErnchSaWomSNLKVQDmSyuPcXAQ9hWIgLm6qTQ5PwnS
X-Received: by 10.224.32.138 with SMTP id c10mr60714792qad.35.1400698871742;
	Wed, 21 May 2014 12:01:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Wed, 21 May 2014 12:00:51 -0700 (PDT)
In-Reply-To: <20140521135823.09df4ad0@e6410-2>
References: <cover.1400277127.git.peter.seebach@windriver.com>
	<3e32cfa9c91fb088c91cf3ef9db200d848a4ed07.1400277127.git.peter.seebach@windriver.com>
	<537CC2C6.1040503@linux.intel.com> <20140521135823.09df4ad0@e6410-2>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 May 2014 20:00:51 +0100
Message-ID: <CAJTo0LaCDvJeZdPnQ+Tjr=nxRsiEdD1ajfgGWf9gOFv_dm25LA@mail.gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo: handle fchmodat better, mask out unwanted write bits
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
X-List-Received-Date: Wed, 21 May 2014 19:01:17 -0000
Content-Type: text/plain; charset=UTF-8

On 21 May 2014 19:58, Peter Seebach <peter.seebach@windriver.com> wrote:
>> Peter, I know it says Backport above, but can you please add an
>> Upstream-Status: tag to this .patch file.
>
> I might be able to, but I'm sort of swamped right now; I will see if I can
> shake some minutes loose. Do Upstream-Status tags have a specified format?

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations

Basically, Upstream-Status: Backport [original sha here]

Ross

