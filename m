Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f46.google.com (mail-vb0-f46.google.com
	[209.85.212.46])
	by mail.openembedded.org (Postfix) with ESMTP id 835E76B118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 13:13:50 +0000 (UTC)
Received: by mail-vb0-f46.google.com with SMTP id 10so2326302vbe.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 06:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=yiboZsukuAMSQAq186ovAVj+EWEPHy3ly9Q+ZxYRkPs=;
	b=IerAPsevwwbXQSGxmB2UPyqK11XJqvmROXDTPL1umQcc6btmztEbVXB4XzckK1izKr
	Qvky8h3kJer9dLBdqeDU+9Ao7S17q15suwzyvyJuUtoiki2tmuNq9W+dXT1tYWI1ERSx
	90KicuJT8o2i8789eZJ4oqfL2CrzUmACWNvOxJgdQ18zNFMkZ0jEdiizC1314yNzHeN+
	87Pb7ACWsbFeXWH2FJgsQde1lkL/ucCn8tt9NS692AnL/75OPamnpLQPUZeU7SwqCLcj
	lh8vCv1q0VKbQrZ6JVzSaRKYV2sAhZZt3rSEnlkFKx4nedwG7NTh4Q83D9+44Wrzq7pP
	UJ4g==
X-Received: by 10.220.1.9 with SMTP id 9mr4046944vcd.37.1374153230791; Thu, 18
	Jul 2013 06:13:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 18 Jul 2013 06:13:30 -0700 (PDT)
In-Reply-To: <CA+jg_OV-i-dRAw92j2dXsodfi5=EmXSnFuA-GVvRCJYbEbS=gg@mail.gmail.com>
References: <CA+jg_OV-i-dRAw92j2dXsodfi5=EmXSnFuA-GVvRCJYbEbS=gg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jul 2013 14:13:30 +0100
Message-ID: <CAJTo0LaDbFWTXQ0NPtjQ-LMt+B+ZABRG17Ed3BW1=mH2Bv3jgQ@mail.gmail.com>
To: Daiane Angolini <daiane.list@gmail.com>
X-Gm-Message-State: ALoCoQkKy8FbG9oqrML92t0R0dI3BRqj9NBuIkl61CfgeCd1f80HtDPbk6lMfXYgxERNlEG3GLcb
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: No package 'cairo' found for GTK+
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
X-List-Received-Date: Thu, 18 Jul 2013 13:13:51 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2013 13:33, Daiane Angolini <daiane.list@gmail.com> wrote:
> I'm facing the following error. Anyone know what I should try in order
> | configure: error: Package requirements (glib-2.0 >= 2.28.0    atk >=
> 1.29.2    pango >= 1.20    cairo >= 1.6    gdk-pixbuf-2.0 >= 2.21.0)
> were not met:
> |
> | No package 'cairo' found

cairo is a build dependency on GTK+, so I'd recommend having a look at
the config.log file it generated and see if that has any hints.

(also, this is best discussed on the support list at yocto@)

Ross

