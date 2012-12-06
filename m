Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tge4M-0004CF-Mj
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 17:13:02 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 06 Dec 2012 07:58:35 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so29838979oag.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2012 07:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=9+6xA/IMle7jguohv8WRDTBww0N78y8MTVTzBtVVqFk=;
	b=Nx+NhIRkPy5Rs6jg+iomwgQ+s29e/7IO30FZVPYPY4kmlB4kE8LaxF274v192bDWYY
	1VH7F6lMTu0L/WkRJ0tVL8HQRnLslb9o9uBqcZ2rZzRdhg4NjdsauW2lP/fuhM8F0oXV
	LXphOGQyE/RPZbISmqUEyFuBzwAVkBENB78BzD9Lll5tHZdZo9GV4H6kaj1+S84Ov7dA
	gqd3WTA/TVPYG7m024ydK5gVkLErtXyUQMc1NQXVFtnD46/HEcUe5Rav8xIPj0T6eH/P
	9HFinFzo32UAeKvgX1bU8p1N87J391OFGf8Fi1FlGLoF0B2/0yFX7U3MVBlpdVse3tl1
	XHDw==
Received: by 10.60.4.165 with SMTP id l5mr1196250oel.84.1354809514595;
	Thu, 06 Dec 2012 07:58:34 -0800 (PST)
Received: by 10.60.4.165 with SMTP id l5mr1196246oel.84.1354809514540; Thu, 06
	Dec 2012 07:58:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Thu, 6 Dec 2012 07:58:14 -0800 (PST)
In-Reply-To: <50C0B38C.2050608@r-finger.com>
References: <1354746794-24290-1-git-send-email-cazfi74@gmail.com>
	<CAJTo0LaEnxc5GwZbxP2iqy943LSbE0AonKYaJkRBkciCVs4g9Q@mail.gmail.com>
	<CAF6bG8eaPKiBWELJG+7DcVPiiah1v626hcix0XN0Eh8tk3EDJw@mail.gmail.com>
	<50C0B38C.2050608@r-finger.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Dec 2012 15:58:14 +0000
Message-ID: <CAJTo0LYPkDoDXPnw=U2Ade0HgFOq2HimKf_ib_2EmbsEj3NeGQ@mail.gmail.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>,
	Marko Lindqvist <cazfi74@gmail.com>
X-Gm-Message-State: ALoCoQkivheks85WfWyUxmHyOc6xB+q0thX3SyooyAWDltMTUUwnAlIfShMXN+TfCEKpoTEl4ZoRJbxKHRT2KtRzPZ2EqYt6HlhpFXq2fKNj3qaHKlz9bXvNl0/H9ITc2D/urnXzcbnvTHsObMzTLkw+gpG59jop8ly4OGskEDJAEFamv9TlQA1Lh5wcuOyeovHTX1zRmHa5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libmatchbox: fix build against libpng15
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
X-List-Received-Date: Thu, 06 Dec 2012 16:13:02 -0000
Content-Type: text/plain; charset=UTF-8

On 6 December 2012 15:02, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
> This should go directly into matchbox rather than being an OE patch I think.

With my Yocto developer hat on, I agree that all patches should be
considered for upstream first.

With my the-best-you'll-get Matchbox maintainer hat on, I've just
merged this patch (which interestingly didn't apply cleanly) upstream.

We should merge this for now, and when I make a release of libmatchbox
once I've confirmed that all patches we're carrying are upstream.

Ross


