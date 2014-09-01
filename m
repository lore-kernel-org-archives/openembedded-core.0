Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7E4ED701F3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Sep 2014 14:16:48 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id o8so5551968qcw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Sep 2014 07:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/BFhsn/JO+RAeNYqrfrbi4z68LsiSELP3Zsj3msq7eY=;
	b=SSfrPhEETw9pj/GSCinift+KrdnRSSENNQpGQ+pzOqixmHRQ6uC87X42hPJzS4wn20
	Scs7KDW9dXxoZoQlwsowGPmSB9gqmN9qptYYsh2W1C+7M6CnDVJHmtWuqpN9tNqzV/eP
	cL7Fej5fz193WfqGFWDjewSKGXdx3XFuzfozC+NRhJQWFD5eCNFwl4aALpOz00THFYzf
	Q+2mZawbVydilKupkfnMX72SQf+iD4sKLHmu4IowIVgBeZzAWGjzd36xFD/LzJoL5v83
	gTYGnEyrCE5SFP7xAhoTHQFK2FstNtGIw7dLWGlYnDz7dcUjTpISUEzYnosXwfSAQc9+
	za8g==
X-Gm-Message-State: ALoCoQkd/2sPth+LWsRIDNcRh//FNsUfMhLVy8uCZodK2fHYVfwGml0stCtPVLx6KNp3GxbBATpu
X-Received: by 10.224.38.10 with SMTP id z10mr45653994qad.52.1409581009654;
	Mon, 01 Sep 2014 07:16:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 1 Sep 2014 07:16:29 -0700 (PDT)
In-Reply-To: <1409336458.8504.3.camel@maxtothemax-Studio-XPS-8000>
References: <cover.1409074419.git.max.eliaser@intel.com>
	<ef8574dfdd5992bdd42b788a909d0610d8b23b21.1409074419.git.max.eliaser@intel.com>
	<CAJTo0LZ_fZsexOVt2M1Tb4Pv-zghRJa=2ALMxxAKrHwFPc9Vqw@mail.gmail.com>
	<1409336458.8504.3.camel@maxtothemax-Studio-XPS-8000>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Sep 2014 15:16:29 +0100
Message-ID: <CAJTo0La9Dmx7kGmQXmt5BTAH1hYBvBUw9O9=rFm0sjFr_VwSEQ@mail.gmail.com>
To: Max Eliaser <max.eliaser@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] qemux86: support X11 when QEMU is emulating a different GPU than vmware
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
X-List-Received-Date: Mon, 01 Sep 2014 14:16:53 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2014 19:20, Max Eliaser <max.eliaser@intel.com> wrote:
> My understanding is that xf86-video-modesetting is completely
> unaccelerated, whereas xf86-video-cirrus does some 2D acceleration. Is
> that not correct?

The question is what acceleration does the qemu cirrus actually
implement, and is that acceleration actually useful?  Years of working
on acceleration architectures for the intel gpu driver have generally
shown that you can't easily beat direct access to the framebuffer...

Ross

