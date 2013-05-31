Return-Path: <ross.burton@intel.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD6E608F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 10:03:30 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id mc17so1965495pbc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 03:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=JHzToQFmueJK5ijHJMGvHEiDy+YTE+5uGSu6XSNofh0=;
	b=ZoD2IIcXGuO85987KsaDq2inEotIzCHnxXXAX+socp5te9eV41hv2xzSasUb/BZT28
	6cJiz4xhv6bKYJ8iaU4xQmpRUbMFSVNHedkZSDfhiI2yheTaHGrPnE7tOntEqRBeqxmQ
	7s7nSMwa0wPrwUJh5bdoa8hZSZUghesyDlwPckd0kjXv+Cj6bDiwc9EzRSHQvC/W0ZbJ
	EwGrnFjgYZOiHJtY+ZafWqnvmfQJhk/hrs/li0zltzO1ZTe5DFyfvCtomN3iY85ikB2n
	+C7bkV2OCHyWWqtKVaePQHgfCUjN9VGwvqpGw/zJiinLKvWraNFPq6T6t1yYyythF8Nx
	NXig==
X-Received: by 10.68.193.138 with SMTP id ho10mr12107434pbc.163.1369994611375; 
	Fri, 31 May 2013 03:03:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Fri, 31 May 2013 03:03:11 -0700 (PDT)
In-Reply-To: <1369994854-22597-1-git-send-email-net147@gmail.com>
References: <1369994854-22597-1-git-send-email-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 May 2013 11:03:11 +0100
Message-ID: <CAJTo0Laa2-LKTXh+DRTc1oxOh+-fxjtYzpRgCGRacnGgSatWRw@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQnMxrOK9in/tb6KK1XO5S89x6UUOECImJL+JrOIxew0cebJxzwPteVY/f4jJvtiySJiiRGU
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xf86-video-modesetting: backport fix for graphics corruption
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
X-List-Received-Date: Fri, 31 May 2013 10:03:31 -0000
Content-Type: text/plain; charset=UTF-8

On 31 May 2013 11:07, Jonathan Liu <net147@gmail.com> wrote:
> This fixes graphics corruption that can occur when using 32 bpp pixmaps
> with 24 bpp framebuffer.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>

