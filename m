Received: from mail-ve0-f182.google.com ([209.85.128.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UX6ql-0005js-6f
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 11:27:52 +0200
Received: by mail-ve0-f182.google.com with SMTP id da11so196975veb.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 02:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=XCLKgUOmigLR3eNI0eA39rZV87kFT63gasmrYBFwe4s=;
	b=iLt3xzJeHu7Bqgv0/F4bHl4UbPIihy3lnFXAItr33gmCgINS/EO3/A0eSF4YgbkUcG
	nmvlUDzcKeyr0WJUMsr4qiit1cfLEwLGw3CXS+hpZjURL6+QB/BmeKIopXuNmB61AtoY
	jphxvhIk/BaEWYmRFYT7mqs9SCVSYbnp3wAtuv3436967RPDcIyl8G9+JH2VsTdBteSJ
	gxoYf5C3+9wS2Jz4dPXD2iCvCQE3Tp0IE7LRTHNw/ZCeLPG2LSlqGO0b2EAEY3Zo7UQo
	AM2vFM8UxzYK4vMsMoZlo7zYc0ejx6vyg7R9xhk5ohRo6GVfyisiE3orD3sFlD11Otyc
	V+YQ==
X-Received: by 10.58.214.231 with SMTP id od7mr34817561vec.44.1367312999910;
	Tue, 30 Apr 2013 02:09:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 30 Apr 2013 02:09:39 -0700 (PDT)
In-Reply-To: <1367307108-18479-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367307108-18479-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Apr 2013 10:09:39 +0100
Message-ID: <CAJTo0Lb-RNvd85JO6O0iTZSiuJ3HMe6=rpGdgqa4QF4Xv0SE_g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQlpvuRkrViiLDrRUtBNKWYEIyJHAhidjYPOwdljAwk6PkFlXk60lzrbcXy3RseHWDAfhvb8
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: do not recommend udev-extraconf for udev
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
X-List-Received-Date: Tue, 30 Apr 2013 09:27:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 30 April 2013 08:31, Andreas M=C3=BCller <schnitzeltony@googlemail.com> =
wrote:
> * adding this extra functionality is an image- or distro-decision
> * at least automount-rule/script breaks other automount solutions causing
>   misleading kernel messages as 'VFS: could not find a valid V7 on sda'
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

If you're going to do this, please also do udev at the same time.

Ross


