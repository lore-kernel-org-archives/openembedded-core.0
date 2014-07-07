Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id E33037028C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 13:42:23 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id cm18so3659897qab.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jul 2014 06:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=d88/bP5FK/4mAGp992Z0pMxRGLDooIzOlBlCY70BK8w=;
	b=HQ10bmeJ4HMRNiCyE334/JqsOf1rZlbLeaysnfCv535HOQ/fhhDCb/tl4zUQSsQsvQ
	CunXnFU2/fxmnrXuZzRwzpdNqaiEEVhSTh3xYJYppQkvwFG81a277Xvyx+ILwDTMnQg5
	7lih1dnuuFqMOFP5zne+xBnAV94SVFjsoh/iPeWHX3LJU9ccf5Bo+MTAS0uNUQrfEfkd
	hhAHfkYKthVeZ5ScB6fjPMy+1obxmXo1aEvZdDd8i9ZECkXvWNDOEcg0F4Y5JZ2zHz9T
	rUKBLidfHtTu9C8HyR+to6sj5awZ/WMQm0qkFRHCUjXEIfDnlPxSV9ySkp1RhkPdV98q
	Q2zw==
X-Gm-Message-State: ALoCoQnydNAZjEJKRsOZDnKaX7a1fbVSH+9kkxXA4RSKCcEjC1YmxdxbI8+aFXeURlE/J31vCOfH
X-Received: by 10.140.91.164 with SMTP id z33mr45473071qgd.65.1404740545086;
	Mon, 07 Jul 2014 06:42:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Mon, 7 Jul 2014 06:42:05 -0700 (PDT)
In-Reply-To: <1404740449-28121-2-git-send-email-ross.burton@intel.com>
References: <1404740449-28121-1-git-send-email-ross.burton@intel.com>
	<1404740449-28121-2-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Jul 2014 14:42:05 +0100
Message-ID: <CAJTo0LYEjFjkR0Mf3Zo2eTQyQCSi7YosOsnLaYThi7z4Dr5J8w@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][xserver 2/2] xserver-xorg: fix xshmfence autodetection
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
X-List-Received-Date: Mon, 07 Jul 2014 13:42:29 -0000
Content-Type: text/plain; charset=UTF-8

Let's just pretend I didn't put [xserver] in the subject, that was
intended for the xorg-devel list... :)

Ross

