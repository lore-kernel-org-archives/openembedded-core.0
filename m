Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URhwM-0002KB-TG
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:51:19 +0200
Received: by mail-vc0-f175.google.com with SMTP id ib11so3813263vcb.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 04:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=xrKYwi3cunsfTyP6VrM8TBLeV1vOOLHTMzjF1G6aCAc=;
	b=odY7uI90ArC/31ipBtWu+JIgKSwvlqvC7y9iUFw197qui5Q34b9kTmLYqL+hFKLT2k
	jzKjGD7tw9gnAavA4Pg5zAItGRaG0mzLzCW6LgM2y+k4ty056uAQ+Cyf0pFviO5IVUIF
	bkPZQwOcMtwpiaDYvZFAeqiQ0KqDbCWvjET9fD1PHvMaqhf3NvUISuR1UYPNDsihUuJ+
	1eEmGvCcMNfDgUbfGJP8vWJixY3H5VsKfY0kZoiUiBFko83mG9pSDZ++0llw2rlpQwEm
	OzQzl6CygYisEbUuV5yRgowCKwT08VG3QxWw5+aulwbUVxBWUnofAdVgvzm5u13qoiAA
	lNHg==
X-Received: by 10.58.188.48 with SMTP id fx16mr8714325vec.22.1366025629715;
	Mon, 15 Apr 2013 04:33:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 04:33:29 -0700 (PDT)
In-Reply-To: <CCA3D6B4-A857-47C4-AC09-CD642F627078@dominion.thruhere.net>
References: <1365947306-15542-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LYxbJBVqYTCiz2BaBaoPz=pzpm5w49Ube+SpnX_ZOLh5Q@mail.gmail.com>
	<9D7AC92D-FF69-4A31-B99C-D2008675A27B@dominion.thruhere.net>
	<CAJTo0Laqc93oxZcHZ+vF99q_UqJ_8TUV4QAxPy6VfBLDBUxOYg@mail.gmail.com>
	<CAJTo0LbfDu6bOAPYjd3ohzZJcvPDmYiT4RcUhZC9JXkQB6dmOw@mail.gmail.com>
	<CCA3D6B4-A857-47C4-AC09-CD642F627078@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 12:33:29 +0100
Message-ID: <CAJTo0LZhTJR-gm0jss8zSseA+VtZOrT2aX-P8kHPs7WXe20-mQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQniCkDpDBLIcobLNg/rEX4QMLND9VDh4+Gc+2oZu8aTUl31LS9YLy8PpvhOSd49agTRn0KL
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-dylan][PATCH] systemd: fix bootup with 'ro' by re-adding util-linux-mount to RDEPENDS
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
X-List-Received-Date: Mon, 15 Apr 2013 11:51:19 -0000
Content-Type: text/plain; charset=UTF-8

On 15 April 2013 12:31, Koen Kooi <koen@dominion.thruhere.net> wrote:
> So busybox mount is still worthless

Thanks.

In that case, I ACK your patch.

Ross


