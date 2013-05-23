Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3416968D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 15:19:23 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id kw10so2272429vcb.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 08:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=p7U1RgmuL3F1zVnH+9pTm1jXFUhEjKlOh00kLOM/1q0=;
	b=jy0IqEfFKJEycEmSLGePvlJATmDqqOjz9EjCR+ACYAt0WDD3wXChpujVKQqSs6nvjT
	xOF1EtQF/1GKjPtyt7HWTXXfF4aw+KLWuxY2w8HS995xAlxZhMCKNT83R3+XLps64Jt4
	VWKMIrC70qVk9QmeG96tvxvoXyLeWQMUT9LO2wB2AdYTgxSFyl/v1rF41FvWpNVQrx3m
	D7AyXD36Dk25k0YDcufzyTvdDwCv0bIvUzOV9VdU7KGKQAZVhK5per0x8AvVH6Gw0gPG
	dQ8rimuX6KY04fXgEwj80leRyVv/ZbkP9QPdEtAuomUV+cwNnX5bVTzS27j46EOBIzkA
	SqHQ==
X-Received: by 10.220.146.199 with SMTP id i7mr3241038vcv.42.1369322364033;
	Thu, 23 May 2013 08:19:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Thu, 23 May 2013 08:19:03 -0700 (PDT)
In-Reply-To: <fab7098c7b3a81a1ade98561176d376f26becc8c.1369313581.git.laurentiu.palcu@intel.com>
References: <cover.1369313581.git.laurentiu.palcu@intel.com>
	<fab7098c7b3a81a1ade98561176d376f26becc8c.1369313581.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 May 2013 16:19:03 +0100
Message-ID: <CAJTo0LZK25W0GSu0757SCrW+t0W0X49mEym=hTf=H+JvyN6a9A@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQkP7btclDVep07eDVtffGh0yTE3monpEwppkTxgVjzOSe8JXTfkaRAfUUQra2UqOr1hykeN
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/7] run-postinsts: make it generic
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
X-List-Received-Date: Thu, 23 May 2013 15:19:25 -0000
Content-Type: text/plain; charset=UTF-8

On 23 May 2013 14:15, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> This patch intends to make run-postinsts generic and deprecate
> rpm-postinsts. Here's why:

If it's generic, please move it out of the dpkg/ directory in oe-core.

Ross

