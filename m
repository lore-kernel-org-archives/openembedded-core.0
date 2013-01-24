Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyM0F-0001Of-Cv
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 13:33:59 +0100
Received: from mail-da0-f70.google.com ([209.85.210.70])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 04:18:25 -0800
Received: by mail-da0-f70.google.com with SMTP id t11so9390836daj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 04:18:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=eUvGJEYIyZbpbZ7bQbnlalDgdMMjPIrmjiZN4jKRB9M=;
	b=SCp6R1RAb4AwEG1s+zBa+W2n5UUT5JTKkwBibvtYNa3AI/4sl5yLstYKze9dgMWxR8
	5xJSW/nkiD37L3FFBboTaJZEtDXWWR45uyT7q/s5O7vFiX83DdiMl89Zx04AjKxtqw+Z
	BzECudol/tSsioCXvSDOpSVEVzUVTuHChchiPv8irOZFjqIWttyCwzuBGexHLe9NnMlx
	vlot0pzpS0py5hAVNuavCRYXMhfiMzfGjMLi80Cxq5ioQrHSDkwahBIKcGKR/Ka0y4Gy
	R7eC98m30G2jR3Gt3lMviTSa3yoDdCBcEcjNdh7k5L9Mgs4KzbcjOTv4wMTkQqpZKww1
	Lnag==
X-Received: by 10.68.203.137 with SMTP id kq9mr4179186pbc.115.1359029905326;
	Thu, 24 Jan 2013 04:18:25 -0800 (PST)
X-Received: by 10.68.203.137 with SMTP id kq9mr4179175pbc.115.1359029905234;
	Thu, 24 Jan 2013 04:18:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.66.253.233 with HTTP; Thu, 24 Jan 2013 04:18:05 -0800 (PST)
In-Reply-To: <1358974076-25725-1-git-send-email-jstashluk@dekaresearch.com>
References: <1358974076-25725-1-git-send-email-jstashluk@dekaresearch.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 12:18:05 +0000
Message-ID: <CAJTo0LZ+i05u1pqSQris2-GmX87r6LytgY2T8AYdvtQA9M8x=A@mail.gmail.com>
To: Jeremy Stashluk <stashluk@gmail.com>
X-Gm-Message-State: ALoCoQm0HZ05fDVUEq0cJ844dhU2NlKDRNdYzab/Ly5tXqpzp7VfcdICrdqw/7nBk6rZAZ9ya/fF18dBoW09ThWMaTjE/3q009YhNwA/QuBhtUWRgVDsgdcgAFz5tb4Fj3iZzRS6VQyv1glgfThzP0ILmt48Hcj6b4rUb30V/f/sdZ0wyM2ab2sUSN44UPIDBOtwTzT59XS+
Cc: Jeremy Stashluk <jstashluk@dekaresearch.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gst-plugins-gl: add package recipe
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
X-List-Received-Date: Thu, 24 Jan 2013 12:33:59 -0000
Content-Type: text/plain; charset=UTF-8

On 23 January 2013 20:47, Jeremy Stashluk <stashluk@gmail.com> wrote:
> +EXTRA_OECONF += "--x-includes= --x-libraries= NM=nm"

--without-x is a shorter way of disabling X, but unless there's a good
reason to you should respect the x11 distro feature.

Why do you need to set NM?   bitbake.conf sets it already.

I also don't see any dependency on virtual/libgl which you'll
presumably need for GL use.

To be honest I do prefer grabbing tarballs instead of git if you're
making a versioned package.

Ross


