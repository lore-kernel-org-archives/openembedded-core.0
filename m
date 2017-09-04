Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 910C971A62
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 13:07:02 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id v2so4682640wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 06:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=JaV9n+QfEJ+8mrvfiSD5d7zqAY2uuLu50c7U6dW7uWo=;
	b=AiubOzScU3bdMUGeDjLi1jOpInpuB6w8VrJXbX8rYb8UiJ2ivgcErDcRmAEFbBIIW+
	6b1MurA/e9pqeafQ5KTA8ZZkj+VetEBMtedmr5atwCxvpegoamoGbn0s7gePonoWq3FW
	rWgPG7L9759O0NtA6WBU7atGBAqfoJGP32c1GgLsBZiikKbfDHcs0AoxJKJiVgIa0pSX
	IR03KPzalxf3SaWGaAX6AQ+0nh8U1LWzqtHHxh9L/i9j93nF0OR/b8q/iLs2S2dBFqJ2
	6UHi1MEDdIiCE664T5SEVoT2lUJgzm9WhSAvY9CnIkNffa/pYgnlugxf5/bQ+l0rh8J5
	LMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=JaV9n+QfEJ+8mrvfiSD5d7zqAY2uuLu50c7U6dW7uWo=;
	b=kWxpx9uMWssZmgz+2juC5O1tgqG8YuX75z++QmgOZQKyoMTfkyosWAuW3bfkpBzvw2
	znu0VzJgWUL9R70zhg2lHl2UWUA1kZVXOSyTycYM+02d5oShtdngczKIBuJUcwjGu198
	p7glpoY9AjeBP+qGfXQ66GxwC/fRgj4Vyk+7+FkJ3g/4b/xW75cApWlBpSkGeHelQiJr
	jpgOnxJ3Sy019aHOKfiKpPTOpTHC4nVxV353c2SaLRt6GQ6DZSZ1f8hOx7ZUQkGhgCoF
	KEqrevs1yx30RjwigVp7gYwha2NPFFCRO8NN9ZdPCxjXsSvtIlRlbLrVLe2shTFZftiH
	e6HA==
X-Gm-Message-State: AHPjjUhacAlUJrkofwWQAV5l9PkhXzKwXo2e+KTsvWVnZ6AUPwTCOM7M
	mvMcP+0qq3Rh0aXm
X-Google-Smtp-Source: ADKCNb7TP8j7LY3hyrAXgPYvaOgQK9PvE+BU6H9t6lTQnDuSppgw+9WaygsCZ33TFgbpaen7EOf8SQ==
X-Received: by 10.28.14.195 with SMTP id 186mr253252wmo.134.1504530423923;
	Mon, 04 Sep 2017 06:07:03 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F21C.dip0.t-ipconnect.de. [93.232.242.28])
	by smtp.gmail.com with ESMTPSA id
	c21sm3147372wrb.17.2017.09.04.06.07.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Sep 2017 06:07:03 -0700 (PDT)
Message-ID: <1504530422.12799.62.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Mon, 04 Sep 2017 15:07:02 +0200
In-Reply-To: <CAP9ODKr2AuEc61i6hWEm=SiAn0TFgP_HhyOk-01XX0zAV6y=Zg@mail.gmail.com>
References: <20170902000458.28655-1-california.l.sullivan@intel.com>
	<CAP9ODKpRT_BQGqzCd-fihZp-Dy4w0uiNr2bG_AYAvdta4wQPRg@mail.gmail.com>
	<1504506956.12799.55.camel@intel.com>
	<CAP9ODKr2AuEc61i6hWEm=SiAn0TFgP_HhyOk-01XX0zAV6y=Zg@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: split setup-live and install-efi into separate recipes
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
X-List-Received-Date: Mon, 04 Sep 2017 13:07:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-09-04 at 09:46 -0300, Otavio Salvador wrote:
> On Mon, Sep 4, 2017 at 3:35 AM, Patrick Ohly <patrick.ohly@intel.com>
> wrote:
> > On Sat, 2017-09-02 at 15:17 -0300, Otavio Salvador wrote:
> > > On Fri, Sep 1, 2017 at 9:04 PM, California Sullivan
> > > <california.l.sullivan@intel.com> wrote:
> > > > Having these the initramfs-framework recipe
> > > > forced initramfs-framework
> > > > users to build several tools they didn't need, and made it more
> > > > difficult to declare the recipe as allarch.
> > > > 
> > > > Fixes [YOCTO #12024].
> > > > 
> > > > Signed-off-by: California Sullivan <california.l.sullivan@intel
> > > > .com
> > > > > 
> > > 
> > > The patch should be based on the allarch patch I sent as it adds
> > > the
> > > dependencies on the whitelist. So you can also set them as
> > > allarch.
> > 
> > I would prefer to keep initramfs-framework-setup-live/install-efi
> > as
> > arch-specific and only make initramfs-framework itself allarch.
> > It's
> > just a gut feeling about the (minor) advantage of not having to
> > rebuild
> > these two small recipes vs. the additional complexity of the
> > layer.conf
> > and having to keep that up-to-date.
> 
> The recipe is a shell script and there is no reason to not make it
> allarch. The need to keep layer.conf up to date is minor as it is
> going to be need only when new dependencies are added. Not ofthen...

The need for that was already missed once, in the initial patch which
introduced "inherit allarch". I find it likely that whoever changes the
scripts in the future will also miss it, causing additional work for
those who then have to deal with the auto builder errors. At least add
a comment to the DEPENDS which explains that layer.conf needs to be
edited together with the recipe(s).

But that's just my opinion. If Richard and/or Ross aren't worried about
a too complex OE-core layer.conf, then that's fine with me too.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



