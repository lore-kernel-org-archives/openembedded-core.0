Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by mail.openembedded.org (Postfix) with ESMTP id F18AD6AF53
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 16:12:03 +0000 (UTC)
Received: by mail-vb0-f54.google.com with SMTP id q12so3702558vbe.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 09:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=B+3exutoObgqVZQuJz+06xRCSKQHj1LGiXhH0AI7zGI=;
	b=LObMBzM3v6/PjWpbPmZgkb9vlOoaoHuOSBMc5rSoBLfasxaWhTnUp2Y6eBY8zJVjWS
	cLNWbFpiSYR2fXcGXHwKpAEGvUrbBv7oJNNlJRWIr9NpIMs1obDC59xwECmC0Di2LIuJ
	Iv3UnQo1nIfu1NTnj42+hYGQ7lyAKK2QjBTdJl17x2OWzh/i2DiATQLIN+BDNPdPpsQp
	ejWdsC2V3wk+Dwf0fGOyVr4EK/amRkbOFA6i4IOqOfwjnT4rQp/bwiJTo3IVqQ6Jg0Jl
	Rj8jRxpST72aEG09kKiPNZNyGaMDb7fAPGbVeDR1Mzjtbdv9jjEEOITmrMmlkmAX6aNR
	mDRw==
X-Received: by 10.52.29.106 with SMTP id j10mr7995456vdh.77.1372695124894;
	Mon, 01 Jul 2013 09:12:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 1 Jul 2013 09:11:44 -0700 (PDT)
In-Reply-To: <A8A2F4C5E3D3D0468DDA3544476725F8AE1F720C@EU-MBX-04.mgc.mentorg.com>
References: <1371660580-4754-1-git-send-email-muhammad_shakeel@mentor.com>
	<A8A2F4C5E3D3D0468DDA3544476725F8AE1F5519@EU-MBX-04.mgc.mentorg.com>
	<19067624.GhNbuypGS2@helios>
	<A8A2F4C5E3D3D0468DDA3544476725F8AE1F720C@EU-MBX-04.mgc.mentorg.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Jul 2013 17:11:44 +0100
Message-ID: <CAJTo0LabwWqQP4dmRgwyp40HbGF6biY9p+dpDTuGYiOt5f0tMg@mail.gmail.com>
To: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>
X-Gm-Message-State: ALoCoQnLIvUwnpUA0uRNjgIEIGrGrf0IQSYVk6dFkqhdNtAVcUnB/9nM0tyyF1MVLO5UDrbaVaqy
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [dylan] lighttpd: Enabling with systemd
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
X-List-Received-Date: Mon, 01 Jul 2013 16:12:04 -0000
Content-Type: text/plain; charset=UTF-8

On 1 July 2013 15:49, Shakeel, Muhammad <Muhammad_Shakeel@mentor.com> wrote:
> That's what I realized right after sending this patch. I have already sent a v2.
> Please ignore this and see: http://patches.openembedded.org/patch/52027/

I missed that too, stupid mail client. :)

Can you run the service file through sed to remove the absolute paths,
so they respect ${sbindir} etc.

Ross

