Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TYHpi-0002nu-AW
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 15:51:22 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 13 Nov 2012 06:37:27 -0800
Received: by mail-ob0-f197.google.com with SMTP id tb18so23249815obb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 06:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=J9Mu9I9ZF5AYyfSMisvWeMEg7C/OBeDl2s5wLcaGNTw=;
	b=BvUpa+yWciggmghugWjUKVOHXwlz0ViGeDMRuP7ye8EKe168Xz7DSNRR1YbAIjAoXa
	D0N7sO8Fv1acblxvHo7aLmGesIUW55X1H98X6DL5yjd2ipvKsBsHBzXlC/1+3RMfSC8Q
	esJ4DBoGIY1Bl3y7LTcDVSkqYri9KF2lNqRMva0B7m8jFxo/2wR1l9rKtLQqoQRAkZfj
	ZECXThLfDRQ7iCyKDMksXLdkdDeQXf0C3RDcwFURuP7CzGwUmCzZzq6jbr6eB4KAyLZB
	JvDRBkyQrTjhKP4QYIbNkAq/OuKbhyqm22lwwZIZqO4b4IdsUltC4YoIcJxQcDggZ1AA
	QM2A==
Received: by 10.42.37.17 with SMTP id w17mr21348994icd.32.1352817446541;
	Tue, 13 Nov 2012 06:37:26 -0800 (PST)
Received: by 10.42.37.17 with SMTP id w17mr21348991icd.32.1352817446463; Tue,
	13 Nov 2012 06:37:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.58.197 with HTTP; Tue, 13 Nov 2012 06:37:05 -0800 (PST)
In-Reply-To: <cover.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Nov 2012 14:37:05 +0000
Message-ID: <CAJTo0LY43QNYqD0Ko1ZdC_pzDmQ3r=QiOnEbtGujLp7bH1t40g@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQn22vsokUttrA8vB/cOsntSyVNfp0eE4K1WfNdOP878A4DS6xcWwaRWvFrvEHFO7MNtPbMa55pQFdt3Hl3y/G2ltdhAqx6TDZGqfsM4IKiwqG4BLhL4dASkjyGdf/ft6ADSFiQmozh2yQzqnphjQ0GjvMXWn916gf2pL571C68gnYautCoaoO36+bqx7TdgGvJ3xISJ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/12] xorg upgrades
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
X-List-Received-Date: Tue, 13 Nov 2012 14:51:22 -0000
Content-Type: text/plain; charset=UTF-8

On 13 November 2012 12:18, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> Laurentiu Palcu (12):
>   xf86-video-vesa: upgrade to 2.3.2
>   xf86-video-intel: upgrade to 2.20.12
>   xf86-input-mouse: upgrade to 1.8.1
>   xkeyboard-config: upgrade to 2.7
>   xcb-proto: upgrade to 1.8
>   fontconfig: upgrade to 2.10.1
>   mdadm: upgrade to 3.2.6
>   xf86-video-vmware: Add compat API
>   xf86-input-synaptics: add mtdev dependency

Acked-By: Ross Burton <ross.burton@intel.com>

>   libdrm: upgrade to 2.4.40
>   xserver-xorg: upgrade to 1.13.0
>   xf86-video-omapfb: upgrade to 0.4.2

As has already been discussed, work needed.

Ross


