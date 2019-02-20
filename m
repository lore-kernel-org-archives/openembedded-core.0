Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 535C27C37F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 17:35:38 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id v62so32684027otb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 09:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=Cq925XtWVIVmLN4eaJE5hX1hdp9eF4zJmlVKsm3fH8g=;
	b=GAcW5jnvdOWwbWPO4vRoXGP0f1Zp8KRhU851eNcN0TEuZXz0LXzGENC0muEupwRsA3
	yNjzE7cTH2DBA+Zfon0F5UaJSuYwnE9mFod2DT5loLFeH+Px/qNGzXNBTlQHqz9ZtXfX
	xhsGu/C26V0HErlFYpH8XwxmImj89Avsy+VRl70YBqng897DSIhk1P+UbCUBWK2DEZem
	vzY0QwQPb6nugBPUa1bA5gOT5s5s1bw4ip6T9o7wQSjZwlCefymiVwLcuNphcsRa3hmF
	XEr9dz6+2Pj0agfJAZ+i/mXxkGl5hfvE05zN/LRa3H/xrak6qcORa+IUYNEPxQcbF0Bq
	i3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=Cq925XtWVIVmLN4eaJE5hX1hdp9eF4zJmlVKsm3fH8g=;
	b=YZDONqZrWCgOyxw5X+0owrRYPnuuFz2yti5SCAEdvdl/ZzJzHzTmi2xtrRha2nFi02
	Zs+8yaDSecBHXdFSiv673bDufUM2FhTgiAq89AKE5ZH41EKSKtaRwudh+XFf2O9obpop
	KmVKU3yUcmTdMsL30k1KHmYovdSFl6boXIYJvGmKP/vcGDFVJC+yTrId3k8HXx+RmdF2
	k/xoeevIZJFHsn7n6JNSYVwIqEzJGt7TiougLM8IqT02JOZIh4W4ADO6vadBgOCBuTjC
	IfFMONGWC9xNYDZtHDBz0wwA0Jdu3TK7Si+KiGSc1k75QXdYqS6iZBzE94pCFl9gwyaW
	cSQg==
X-Gm-Message-State: AHQUAuaGFcnOopxrgMwSpoiSKAHEc5gzDk+NHF7LfJOeyGPeQ05eomAs
	C+TLOHHu8E71czYywisno+tR3DQmHRw7EQ==
X-Google-Smtp-Source: AHgI3IbgIVhCHOo9ENUlSe6VokhwKxK0eVtdvNHn4VVysp99Xamtlr/xmQmk8uQCJbwmZYhIBgAljg==
X-Received: by 2002:aca:ad0f:: with SMTP id w15mr6794346oie.131.1550684138950; 
	Wed, 20 Feb 2019 09:35:38 -0800 (PST)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
	[209.85.210.49])
	by smtp.gmail.com with ESMTPSA id q5sm3480066otf.73.2019.02.20.09.35.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 09:35:36 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f49.google.com with SMTP id v20so9566826otk.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 09:35:36 -0800 (PST)
X-Received: by 2002:a9d:7390:: with SMTP id j16mr10100347otk.231.1550684135875;
	Wed, 20 Feb 2019 09:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20190220121544.9462-1-fabio.berton@ossystems.com.br>
	<20190220121544.9462-2-fabio.berton@ossystems.com.br>
	<CANNYZj9yLw3oYy0AK6ey2F85JTV9onR47fdxCpNTMjMsyg5R_A@mail.gmail.com>
	<6620040d80c34ea1a79f622e1ceea4c15f095f0b.camel@linuxfoundation.org>
In-Reply-To: <6620040d80c34ea1a79f622e1ceea4c15f095f0b.camel@linuxfoundation.org>
Date: Wed, 20 Feb 2019 14:35:23 -0300
X-Gmail-Original-Message-ID: <CAP9ODKodjXx1qG4pVt85HrGgChcBupwqS28A_92xHB_vvfnhWg@mail.gmail.com>
Message-ID: <CAP9ODKodjXx1qG4pVt85HrGgChcBupwqS28A_92xHB_vvfnhWg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] mesa: Replace dri-native with dri for native and nativesdk classes
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
X-List-Received-Date: Wed, 20 Feb 2019 17:35:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 20, 2019 at 12:22 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-02-20 at 15:47 +0100, Alexander Kanavin wrote:
> > On Wed, 20 Feb 2019 at 13:16, Fabio Berton
> > <fabio.berton@ossystems.com.br> wrote:
> > > -DRIDRIVERS = "swrast"
> > > -DRIDRIVERS_append_x86_class-target =
> > > ",radeon,r200,nouveau,i965,i915"
> > > -DRIDRIVERS_append_x86-64_class-target =
> > > ",radeon,r200,nouveau,i965,i915"
> > > +DRIDRIVERS_class-native = "swrast"
> > > +DRIDRIVERS_class-nativesdk = "swrast"
> > > +DRIDRIVERS_append_x86_class-target =
> > > ",r100,r200,nouveau,i965,i915"
> > > +DRIDRIVERS_append_x86-64_class-target =
> > > ",r100,r200,nouveau,i965,i915"
> >
> > This produces:
> > > configure: error: classic DRI driver 'r100' does not exist
> >
> > radeon has been renamed to r100 in meson builds, until then it should
> > be still 'radeon'.
>
> Its getting a bit frustrating/tedious to kill all the builds and drop
> the mesa patches again :(

We are doing our best. It is unfortunate it ended being a
"one-big-do-everything-together" patch. This should have been done in
steps since the beginning.

Fabio prepared the new version. We hope it finishes this patchset.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

