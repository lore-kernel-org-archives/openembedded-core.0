Received: from mail-vb0-f48.google.com ([209.85.212.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UbqsR-0008Qq-G7
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 13:25:15 +0200
Received: by mail-vb0-f48.google.com with SMTP id q16so5016517vbe.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 04:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=dwiqq0z7f5rkpTo0n8RHy2Q0x60m3HK0z1ZNxLVfFzg=;
	b=Jrx3whNKCs9+SR8tPLW5BFqzrRr1BXkz8hmhTmLvZwi61qbX1ly9vGAL4tZpLyuIe1
	Ho37/MIFeZtlvvy4PsgXI9lfR3ghWNHl20cdKS9IkDsOE86d+Yhi7i+Hm8zJr8DQ4tY7
	gohR5i0hwpZFWdnmCtRaDZ3zN0eKQBLaWc5iuSt/AysiJsFfetZiIga/ixXvaoKXM5x5
	Xpby3GENECY4/JhimPCj5gP7yyqU3U0ZqBc/SbhQ4s47sgtyKBpMRsroPy6aw9PsJpun
	27Ah+ewxftKA6b0PW6/EsCfJZCCMQ+RQTjMeGXYgqVzgBElkjXwtFXCfpvZCyXtWR95R
	ONnw==
X-Received: by 10.58.255.229 with SMTP id at5mr16677929ved.44.1368443221630;
	Mon, 13 May 2013 04:07:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Mon, 13 May 2013 04:06:40 -0700 (PDT)
In-Reply-To: <1368442968.6920.4.camel@phil-desktop.brightsign>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518FB7F9.2020102@linux.intel.com>
	<1368384890.16243.79.camel@pb-ThinkPad-R50e>
	<3529451.hQA8zCVn47@helios>
	<1368442968.6920.4.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2013 12:06:40 +0100
Message-ID: <CAJTo0LYSqikcyXKsXA5OpnUNmwbvrRqbi4kQ93r2QzBtEuo2zQ@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQkXktoxnEm6OUMQ6P/RqQ8xpOQ+M0aHoEbK+GA/52RgpJeatUDqJYFW+caiSeGX0rNTfuiZ
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Mon, 13 May 2013 11:25:22 -0000
Content-Type: text/plain; charset=UTF-8

On 13 May 2013 12:02, Phil Blundell <pb@pbcl.net> wrote:
> That doesn't seem totally ideal either, since it means that oe-core ends
> up containing a bunch of "joke" PACKAGECONFIG options that will break
> your build if you enable them (unless you add some other layer at the
> same time).  Personally I would have thought that unnecessary rebuilds
> of the handful of packages that this would affect were probably the
> lesser of the two evils, though obviously it's not my choice to make.

The problem with bbappends is that they break every time the package
in oe-core changes version.  Swings and roundabouts really, though I
prefer PACKAGECONFIG statements in oe-core that can be optionally
enabled with linkage to other layers.

Ross


