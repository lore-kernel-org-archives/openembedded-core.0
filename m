Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id ADB3E7895F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 13:18:53 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id c6-v6so16316991oiy.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 06:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3/UYzHX1uCqntpS6C1huZY1rSQE4+2uW6EmyPUknpHw=;
	b=Wf3UxWa3t3QqsZvdDuaBvwMLkQxXCbLXTcyRj4E6hv0LTOvjFbrBjUO472XRAYocXq
	nuAmX11gkXF8aipwtmlfQUTpjbodp9eThC5DNqwVQTLJTciJ8liBx7wm8lj2KsZGepoh
	S1+SBRAgcPmL+t7gCIaGEAdZDd1m7WRUrZdWdV8UySH51XnB7ysJgwwijkBNV7jg3sYc
	lns/qp5Ru7cfzTyI2idvfRaX5+XaFhdaaKtf0wAyMLqNod821sTsskXDhOdjxkYNz+4O
	/pPX++RUPrK+fJIBObp9kHhKk0MutlgbKzcAlQU1dBaH9meLNCMp3p5riSANDRkZeSwo
	6irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3/UYzHX1uCqntpS6C1huZY1rSQE4+2uW6EmyPUknpHw=;
	b=ak2YWOkj/1XoXEPyDfeOJQ7T//rcPa+okrqKJQx5coq6n0/tB+lxzzxW75DQ+LJF/I
	qI5kKJJBYCD/Aix7/FBC0qlQ8vYKOnQsfoyhsm36dy9QbK34RofVWhaRZnPIrPBa7Zk+
	HZciR2XsbGjT6Awx5XemT8SGZSgrHoyiuiWJ6h6Wu+bSiRE5HhEJUjjFxEYWIBIA+1It
	+z2VOo4z9EcGMMFK90J1yZ+1Bl/XywItnVJ72uxsLSx/1p3JfwdXQ3s6iYPUQD5Pl8/p
	MHXOBvJZVswz+jaD79ET/iJtKCBAEFt5tz/z8rSjkm7UQi8HmuMhuhOLsu/oE54B9jhe
	jL5Q==
X-Gm-Message-State: APt69E0vdlIcAU9RZ0tKSllVA7kcWFMYVSSOasb9Qz6FDXOH9+Q9ulol
	o75/DJYxohmpvnseBPdecwvUFy27ZNomCppelYx9SA==
X-Google-Smtp-Source: AAOMgpeykz+z3mFimwsfehQlexyi86Tf9Sb3hSfV53xSIgo/LGygI8Zlp8Ypa6JCm6ubgPzSw31musJyRKsYAEU4g0g=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr16751815oih.102.1530537534753; 
	Mon, 02 Jul 2018 06:18:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP;
	Mon, 2 Jul 2018 06:18:34 -0700 (PDT)
In-Reply-To: <CANge7vXsQa9n7A8+W11vXwiz=_b2ndVKs2pp660TjjSN96F6Lg@mail.gmail.com>
References: <20180625175043.25267-1-jon.szymaniak.foss@gmail.com>
	<CADkTA4P881jar5PygYaY+i4VD_rXYsXOOhU3eZDLWGDn4xRcCA@mail.gmail.com>
	<CANge7vXk5XKAwmZEtfww0F0tUvOUyiE=sR3OsJoRZX3P-3kf=A@mail.gmail.com>
	<CANge7vVSu888hL05s9q07xxZmx1yzxHYD_sRvV8N5YsXsMTQXQ@mail.gmail.com>
	<CAJTo0LamQQmTSJTXuPgQmd4MbK4GBrtBD+L0Opg-X4RJCyKcVg@mail.gmail.com>
	<CANge7vXsQa9n7A8+W11vXwiz=_b2ndVKs2pp660TjjSN96F6Lg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Jul 2018 14:18:34 +0100
Message-ID: <CAJTo0LaC=TNwr-eRfHBrV_u6kC1WkJ-AbVS7=-DQg0OrgAfyEg@mail.gmail.com>
To: Jon Szymaniak <jon.szymaniak@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Use capstone version included via git submodule
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
X-List-Received-Date: Mon, 02 Jul 2018 13:18:53 -0000
Content-Type: text/plain; charset="UTF-8"

On 2 July 2018 at 00:18, Jon Szymaniak <jon.szymaniak@gmail.com> wrote:
> Alternatively, if the capstone dissembler only provides value when
> debugging qemu itself (as opposed to regular OE/Yocto use-cases),
> should we just use "--disable-capstone" ?

If that's true, then yes.

Ross

