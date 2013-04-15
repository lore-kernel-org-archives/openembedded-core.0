Received: from mail-vc0-f174.google.com ([209.85.220.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URgol-0002Xm-0U
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:40:27 +0200
Received: by mail-vc0-f174.google.com with SMTP id kw10so3711244vcb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=OmyEJWHeSBKkHXXznvDHROG2N3cZ/EsmODIVRl8I9vk=;
	b=WAnAXwaxFnS+WGGpZ7GbnbOvLSvaXyweqtQzrlwrFodxLwydOQSrVTdnePV12Fk+GI
	sfZ2vUZjI22tucFpFYE7VtfjQnqLmKS1ZjFdydcHxrQVFJIh8Zj/o0h/LruFoZN8Zuz7
	1SDlubHbgcmfPXGpO6zVKQ7GIxEpqdDWuULncgnynFZv7gDGR5HnCGLJzhZ6afBX6p8Q
	a7UxYEdlA5trZ6hwuQRItqkGpBY+UIiXX5jaZU0OrI4wxq6T1zSe0cvf4bhw4NJqGFR9
	+iwBjz4QwF22I6DnA/dAfD36zUkfyiOiZ9wL8Uh7rc3cgYxEJhROTQHEasgmdeu9q0S4
	wRNg==
X-Received: by 10.58.15.193 with SMTP id z1mr15567422vec.40.1366021314095;
	Mon, 15 Apr 2013 03:21:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 03:21:34 -0700 (PDT)
In-Reply-To: <1366020744-2958-1-git-send-email-koen@dominion.thruhere.net>
References: <1366020744-2958-1-git-send-email-koen@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 11:21:34 +0100
Message-ID: <CAJTo0LbZztWUJa3wVDrCqe0seLcM64LTkjJc=drjxBNCv5HvsA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQnilIYYnjDqB1Nc58retbwlm1ngLjKhRTVNDvqiPznQpadCSM30r1IWs7xWVmOKT9ywCKfG
Subject: Re: [PATCH] udev: remove udev-extraconf from RRECOMMENDS
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
X-List-Received-Date: Mon, 15 Apr 2013 10:40:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15 April 2013 11:12, Koen Kooi <koen@dominion.thruhere.net> wrote:
> In the original udev and systemd updates these extra conf rules and scrip=
ts where removed and moved to a different recipe to avoid pulling them in b=
y default, making them opt-in. The systemd merge into oe-core regressed thi=
s into making it impossible to opt out of it when using package feeds for u=
pgrades.

If/when this merges initramfs-live-boot will potentially (read: will
break in Poky) break, I've just sent a fix for that. Another fix
incoming for Sato images.

Ross


