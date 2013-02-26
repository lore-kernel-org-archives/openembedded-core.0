Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UAOyI-0002n0-C6
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 19:09:46 +0100
Received: by mail-wi0-f175.google.com with SMTP id l13so5222298wie.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 09:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=8sCJOhnNZ1xG5LJQMXjBjjUCAnDu4uNrWweknU9EJr8=;
	b=t7XKFBlSoM9VE1a60ZmX2GXt7uM80wJwGJfl2PRSSgFjumsaQ1yyvH+937eT564KmX
	jAEg6nioWmXJ84g2L1x2y5jTGF09N5hkYJGSqCv8oF/7PT78VCO3rhSrXMust1iOetD2
	k+imkNR4uyuoQLIAxL6QYllbTeRjDU/09L2LNd1ph52qXveX/MFttUP2vOtQE1qg/FBa
	+h56IRvdUJsqooQ/e4R4qB/cPs1hl/6Mc8Gcv93/19lvKQZRB9lWFVEKQQGz+9l+nEVn
	ibZvMi8oni6EWXdNgsQxPLCzX4UTmjXXtyGFCnd1vIuL22AuGWGIIYcNsTWPNkZfl7Ml
	ajEg==
MIME-Version: 1.0
X-Received: by 10.194.5.196 with SMTP id u4mr28333990wju.47.1361901207150;
	Tue, 26 Feb 2013 09:53:27 -0800 (PST)
Received: by 10.194.45.100 with HTTP; Tue, 26 Feb 2013 09:53:27 -0800 (PST)
In-Reply-To: <cover.1361862860.git.liezhi.yang@windriver.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
Date: Tue, 26 Feb 2013 12:53:27 -0500
Message-ID: <CAHUNapS415=P=zzNjkHfv5dF2ptUdpad8A74Hcxm=9eaQ588bw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] Create ext* filesystems using debugfs
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
X-List-Received-Date: Tue, 26 Feb 2013 18:09:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 26, 2013 at 4:24 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> * Summary:
>   [...]now we use the mkfs.ext3/ext4 to create the image, and use mkdebugfs.sh
>   to copy the files to the image.

For a while this had me confused because I somehow thought you were
proposing using the Linux kernel's debugfs to create filesystems (i.e.
mount -t debugfs none /sys/kernel/debug). Maybe I'm still confused,
but if not I think, perhaps, it would be nice to come up with a better
name for this script since the name clash will probably trip others up
too.


