Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 877A771979
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 19:43:38 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id w50so2776299wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 May 2017 12:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ib/1rdTG6o2F0AYRD7LiUvGPRwwNTosl0q5Mo9RE2Ds=;
	b=A+NM7VQYBkAA2ZbCyH0k+sc+o46OhlWneRTHW9oq8F+mPony738GDmqewfzz4g+fAR
	FKh5VOD2Uh+ghjL3RPuJLO/oNS9kYC3FqqOPkDp5GYHkPdnNnsU9ri5KNv1Y1Kp36MMR
	motRTohiN+xwTS5SpfhZzWQG5MWyL5kSU78VEErdBqWCNiq0CqCWmfRZXh/BeWlwtjsD
	fddSeoQw+mUX/dcSRfigAkH776hGw9WRIg+m0BCvAW7qL/Dz1lDCt1sQ9Tne8PxfTzTu
	pa8u0T2XfK/6XTcGAHChDH4ljD50ZPDuErD4+eO0JjbK0uuPexXwN7ww5l8a2FTfjcIx
	G9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ib/1rdTG6o2F0AYRD7LiUvGPRwwNTosl0q5Mo9RE2Ds=;
	b=otnFkLZs+zAvy1BDTz+1I4FcAbp6/wWEzSeZ0LJ+VIeOTzpQFwbJSnrPKozfcv5PpX
	TlLNOv+0mfadHGJCxSgFjrix86p2/4Cftem4zsAMGxvev9KgjavWv/H9VVVyRkK6Loiw
	vP4h0HfMXaRDYADflDgQyyyEhN2T3fnFfYpLqVWF+gzkX5Rg/Ee2T88DY4VADsgefkmn
	n5AmiCEqMTaAqhQQGD6uS/M8UiB+77K5aCjZVr6wNli0rxeaef8eZLAChLJN57R4QfR3
	FBJ9wVwvXBoiAgFDGX7ISeMZ+eLvFYy3QXXn/gplB6ThGsiw6QM+ksySHvnxHD0DasBV
	xLmA==
X-Gm-Message-State: AODbwcCWS8wPqr/1xzuD2A9L8ypYuwyRS6GZH+vVpdKRi0ye/8+lyvYa
	ADNQ5UiEh0y6hQ==
X-Received: by 10.80.184.57 with SMTP id j54mr1368871ede.172.1494359019874;
	Tue, 09 May 2017 12:43:39 -0700 (PDT)
Received: from Saturn.local.all (138-14-48-195.pool.dsl-net.ch.
	[195.48.14.138])
	by smtp.gmail.com with ESMTPSA id 4sm261103edt.64.2017.05.09.12.43.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 12:43:39 -0700 (PDT)
Message-ID: <1494359018.2459.2.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Khem Raj
	<raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 09 May 2017 21:43:38 +0200
In-Reply-To: <9779c7ca-6b12-a4d8-9fe4-c23c950ccfa3@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<CAJTo0LY67aoeeHiNXDSA+FYmEYMQdw3tq1_N7+N=a9xq9nyPiw@mail.gmail.com>
	<CAMKF1spO7Crq+rqse5BMrShom1tSGBuoY5zm1yL1eS2K2zfN-g@mail.gmail.com>
	<9779c7ca-6b12-a4d8-9fe4-c23c950ccfa3@linux.intel.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Tue, 09 May 2017 19:43:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Dienstag, den 09.05.2017, 11:10 +0300 schrieb Alexander Kanavin:
> On 05/09/2017 01:50 AM, Khem Raj wrote:
> > A general usecase is that someone takes the reference and tweaks it to
> > meet the needs of a product quickly. For such usecases, it would be good to
> > consider the most widely used UI framework in embedded space. I
> > personally don't know how much sato is deployed but QT based systems
> > are quite widely deployed as far as I know. I think users can drive maximum
> > out of the testing and stabilization we do if they were using the reference
> > software as much as possible.
> 
> Qt itself does not provide a UI, so we would need to find an appropriate 
> qt-based replacement for Sato that has the same characteristics and is 
> suitable as an 'engineering UI'. What is your suggestion for that?
> 
> I personally think meta-qt5 works fine; it's only missing a reference UI 
> environment. Why not add LxQt to that layer?
> 
Andreas already has those recipes in meta-qt5-extra:
https://layers.openembedded.org/layerindex/recipe/39614/

And for those who want a look at LXDE:
http://git.toradex.com/cgit/meta-lxde.git/tree/recipes-lxde/packagegroup/packagegroup-lxde-extended.
bb?h=master

Max

> 
> Alex

