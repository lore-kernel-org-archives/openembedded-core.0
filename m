Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 832F76A9D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 09:59:03 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id q108so5635265qgd.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 02:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2JQD+PV3gE/0OsJ8YfcXPPuJIRRk4llUV4SpMRUOGhQ=;
	b=L6f2QkJ7Vph4wag5LpxeRFeJwVGvb0kjPX82BjkDMkvr3RAHGAJGEoLc61VW23UIh3
	u0/TjZAUqDRXKS1cks9SGyrSjPa4ngiOD2s5SSmnzHmk9sP3MXPJrQb/VQ2jZGmXjzMT
	8t5WeeyHb+MoOZNhVS8iu7RtcjvbZ3REzl0acBZfGVHGynTvTPkpZP398KEFNIe366BR
	GNHZcN239e5S4zbbIlSoTw6Q48JsE0jcWnf6XxXkA6ZnuSAACMT7VZYdOukDNjS9RDaU
	h1t8yYa9wDNQEdoDw1fb0XOfligdDkw7F3Ai9FvmZyXV4umpWIuwF8eJ0Vh3jV7ryggg
	Vfvg==
X-Gm-Message-State: ALoCoQkTfvo3pgOk6Y0zwUM1joOb6zJiH5qqUpXxBR3ip7rqFcPFMhWLmegbCa1KmaoiSMS7dlq7
X-Received: by 10.140.97.247 with SMTP id m110mr7641907qge.80.1411552744572;
	Wed, 24 Sep 2014 02:59:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Wed, 24 Sep 2014 02:58:44 -0700 (PDT)
In-Reply-To: <5421E92D.8020307@pabigot.com>
References: <1411053399-15548-1-git-send-email-pab@pabigot.com>
	<5421E92D.8020307@pabigot.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Sep 2014 10:58:44 +0100
Message-ID: <CAJTo0LZmqvbmOD2=0EaiKTd6UcoGv4M_LTyib4e_8zBbVG+pNQ@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: disable resolv.conf symlink unless resolved is enabled
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
X-List-Received-Date: Wed, 24 Sep 2014 09:59:08 -0000
Content-Type: text/plain; charset=UTF-8

On 23 September 2014 22:42, Peter A. Bigot <pab@pabigot.com> wrote:
> This has missed a couple merges; if the focus is elsewhere or there's a
> problem with it fine, but I think this belongs in 1.7 as without it
> systemd+connman doesn't function as it did before the update to 216.

Sorry, missed this.  Queued!

Thanks,
Ross

