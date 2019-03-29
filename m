Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id D47D57D0AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 12:11:23 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id o74so1882335ota.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 05:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X3s5tfL37qL6HHvJTPMVVNex6G75+rgWmP8WeiZHO9Q=;
	b=g+CDdZKsk1ZedvJnFcO/mqXUdP3Madd5z5ktaqjnMrEBV47SicICVvmP8OhxjpkDAW
	7n78ZaeRB85SLX1kKRoi5/Hy+YzJ6a7QENSZImSAps+aNlZPS2FYTJmLpn8pmzVKsk/G
	IDmlw6d0QGkCjPhRXvej2uJfIvjoWXwimGmQ0WI61AjnviL86sQ1mo4WLyMbO00lEsFv
	7nueSRLhZ9JjZRNzCBeyN1hY8tUpo4fPR92SyibiQUAAkcINfoVzPOfJUFmO/DXg+m5x
	qMjc6dK8pfx6qZVgWR+bUKimR4VO23I2SYLCvC89jp0q3HJflHoOnSn4YRmqvkm50F2o
	X0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X3s5tfL37qL6HHvJTPMVVNex6G75+rgWmP8WeiZHO9Q=;
	b=SUp4MbkPkUJUqnHZgouQP0YFOOx7UuPxpsesg1Fxui7hOglr7/WOi0yN6+XUio52t4
	Qqkq0b1hzsMfr8yIKOB0iD/mxwSVVTzIgtRPRLTaRtA2HbVFlFIlBFlw08ic3qi+4qEb
	OwwdBMsorA9ZSMo3OhXU3uUAOB/DGp9av6fE1NrkJ6vj1PMS4EySqnyTeddKoUPSrXtC
	0xqiDSZaxl+ZfFZeQiLqIqn1C+QPIHFsclf3JL3N3HGK19WXPMkQPJuRbuWJowsFcZMf
	DGG+xbWgtiaDa8Y76u7CYnSuFapYerePV9BljM3yvmpIQZ/B+D4Akys/q/F0QR6W9h2U
	speA==
X-Gm-Message-State: APjAAAUi56OJFhU2N4UdHY7TV2d7o0QyNY0jt0kuE6UieY93EBzOPqO4
	DlncWMNFT2ztagvg6om10CV0dVgTN517VD531Cc=
X-Google-Smtp-Source: APXvYqzrEt6uiCkqWTwtxyk/v4ySD8wqgu9/w0X0zbqHp9Vf1Hgmu1DCkysGxcwv5hIzX1VQRgR8OFVjixPr/UgJ6/U=
X-Received: by 2002:a9d:32f5:: with SMTP id u108mr1350684otb.153.1553861484702;
	Fri, 29 Mar 2019 05:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190326102919.7348-1-schnitzeltony@gmail.com>
	<CAJTo0La2G+3qUPzXOC6B0Mjwr70ygPuttHuNzfV85GRy3pZYpQ@mail.gmail.com>
In-Reply-To: <CAJTo0La2G+3qUPzXOC6B0Mjwr70ygPuttHuNzfV85GRy3pZYpQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 Mar 2019 13:11:13 +0100
Message-ID: <CANNYZj8Ds1A5o-C7tQspQgWc=7rT1FaMD1ALpPMKmi51pMn5ag@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: add librsvg to DEPENDS
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
X-List-Received-Date: Fri, 29 Mar 2019 12:11:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Mar 2019 at 13:04, Burton, Ross <ross.burton@intel.com> wrote:
>
> But GTK+ doesn't depend on librsvg at all, and this is a failure in
> adwaita-icon-theme.  Why doesn't the dependency belong on
> adwaita-icon-theme?

I believe adwaita runs some utility that gtk provides?

Alex

