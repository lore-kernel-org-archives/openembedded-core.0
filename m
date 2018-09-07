Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3AB9D79796;
	Fri,  7 Sep 2018 10:33:41 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id v198-v6so8666576oif.9;
	Fri, 07 Sep 2018 03:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dqLl59ZuIi+cEXnx4LtaRYKIBYRj8JGRJCdejZ60/b8=;
	b=iPPOcTR9ush71oXAmfH8lwiPxTjN1dU4H5r+OgZoqi4nLS06iraL+TFPmuqABKy+00
	ronJ9NpLTPRVypouY+X3oMxUObp5tMjD1oWuL27FNpNCvAHBEOy4V5hLDEuQfxuOXT+A
	Ah9G15uMlTfUQf6KBqe5gFLrf8kM2cIhXV907jUHmBDkqc3h8xqar9yY1bZjzIxKg9Ry
	sMyEdQggAbKcVzvpkqhsJoY7tpRawyWKdNEmAb9y3jENl0gNIYlRPem/woHC66X5IXnJ
	Uyh5BtJumdGRpvWvUMV8sv277lNZjIWCv6rp/AWlhpinqtd441dg+mHajs7NWLyx/RGE
	vqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dqLl59ZuIi+cEXnx4LtaRYKIBYRj8JGRJCdejZ60/b8=;
	b=GIi79fLOB2z0aQnwh3jbnc47VExMuIBk/cQbex4wYRZFkBuCL3l+UD1BIdtgKoFu53
	MA9qXoC/YZPpGPpe6ufAOSUjlST9K2YIf0REGWWLNXEU8D+F8rNrPg6JOyBztkZG8MqU
	Xk52jcmozeYOn4Xp93x/YGaMmGRNBj/d1BycZLscnt9fRuWqLAHP31PHiUBWaCjTCqq6
	gRzQBKrDxEKI2St7lkF0UawCxC6tnbTYr+8LwXnBfV1p8o9W0n6kP3WsDUOVJ9rUjuxO
	vyi82eQA2kUZUFS/Wh/g1+U3n0s1a0LBnoT7hsNnu/ywjS7dxKJm64kc1WY90FH5wbul
	A5tA==
X-Gm-Message-State: APzg51AzZEXcldGefDS1A8beii/8nc06p0FoIWyV4pzKzqk31bQHqMLg
	H/wELvK1kfcPzhEb7Zox+Y1/nsDBjhKUTdc3o+5KtPJnjXQ=
X-Google-Smtp-Source: ANB0VdbmJI8n6LlHg8ypHdsMUWjRZVvOPkHH6FxpH/hV43pho1vTPKBSDWZfmhJ4xOi2zSDXfdQM59VnNlwRTHVClmU=
X-Received: by 2002:aca:3ad4:: with SMTP id
	h203-v6mr7053206oia.294.1536316422217; 
	Fri, 07 Sep 2018 03:33:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:5c9b:0:0:0:0:0 with HTTP;
	Fri, 7 Sep 2018 03:33:41 -0700 (PDT)
In-Reply-To: <2106BCC9-BFE5-4E40-979E-59B3D62022EB@linux.intel.com>
References: <2106BCC9-BFE5-4E40-979E-59B3D62022EB@linux.intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 7 Sep 2018 12:33:41 +0200
Message-ID: <CANNYZj83qDfCfJbUiWWQj2BsrV7cLVvkDHTsCALETWsx8Hba_Q@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [WIP] perl upgrade to 5.26.2
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
X-List-Received-Date: Fri, 07 Sep 2018 10:33:41 -0000
Content-Type: text/plain; charset="UTF-8"

For what it's worth, I have started a similar project, but in a more
radical way: rewrite existing recipe (unmaintainable mess imo), bring
in perl-cross overlay from buildroot to do cross-builds without
resorting to ugly hacks. I got a bit further: the whole thing builds
and packages without errors or warnings but failures happen later in
perl-dependent recipes. I hope to pick it up at some point later:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/perl-sanity

Alex

