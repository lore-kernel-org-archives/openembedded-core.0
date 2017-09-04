Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id BF12171A62
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 12:46:52 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id x184so3117573oia.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 05:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=3Aof6g1msxK/Ua3VFX824T3c1L5XiypKr4fPth5oCAw=;
	b=wf3CEDc38LFy7qRCvuwYIXkUfOo+QvJ61OkQBfba4zs13b6WwwlbvrjKYc4sFQtwKK
	osIaPbzj73Y8gPqljL3gAWtltGpUEfZS5j6AjfYeKa7pGQyjoweMKJT3GboCHQre+KCr
	e6zror6QY5UPlc2A+N+TykCPevLrD/gp5hJEyAwoICZjZiNaCrAby1d7oQOI0vTvysVE
	xjjrr2S8D+yVJNi6xwCdM3T6gTBcugjfOvRjxPlv+rUvMNq+HiLnJ61W0XOG8n0gxK0h
	1YF/g0z+02DutzZofFs3HGP5lQ6a2Qx3ZhnXsoNzzzDtbQrQ3zLtrQl56+ZGsBXIPr7X
	40ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=3Aof6g1msxK/Ua3VFX824T3c1L5XiypKr4fPth5oCAw=;
	b=nRfDJMfC7HiqYGjNOjANp6bvtXxSJOr82bmw9WpM2efma4sSjUoWsg+qkSO/uCmwXU
	9npwSMYK7vhMnmurFn2HqRwmtq+cnkkSzuexzFq/+rNweFzUjYhZTJgeh+OMPvlcOMTl
	zr9GHxnRFZ4cxQNVyrhmPJkQ0+wGt4/w0TqUYlnaEmbEmBO4J+r20R8wXFib+XNgmSes
	HBPYRXvLr2c2lOX8TiznDqgfmC78nrxAVXt4SEHbfRZBxnUzRnsERMWBSNvGDhJVT9PP
	XJ+EMLmvuiDabC3n7zJ6UQaKFQO55Ya4HxpOpdTmGVNm5n+yMrpo2QhZ3Bj+Wdyz0ypF
	baTQ==
X-Gm-Message-State: AHPjjUj0INFGb0FcEWcOapHkdvpzEmTiavqULNA3tugl+hBx/0g9ufa6
	cx5vEZ9L/rgQdQ3ivOE=
X-Received: by 10.202.198.79 with SMTP id w76mr548462oif.74.1504529213150;
	Mon, 04 Sep 2017 05:46:53 -0700 (PDT)
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com.
	[209.85.218.42])
	by smtp.gmail.com with ESMTPSA id a9sm9630479oih.57.2017.09.04.05.46.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Sep 2017 05:46:52 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f42.google.com with SMTP id n18so3053400oig.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 05:46:51 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb5sVrWhw9hGxtpNSy1/LgTZnxd6vZGHR9CcECmayUJdkJRpkguULbuEYtqbK8T46qT3CCk+vkppDAMTma50p84=
X-Received: by 10.202.83.10 with SMTP id h10mr533864oib.56.1504529211424; Mon,
	04 Sep 2017 05:46:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Mon, 4 Sep 2017 05:46:50 -0700 (PDT)
In-Reply-To: <1504506956.12799.55.camel@intel.com>
References: <20170902000458.28655-1-california.l.sullivan@intel.com>
	<CAP9ODKpRT_BQGqzCd-fihZp-Dy4w0uiNr2bG_AYAvdta4wQPRg@mail.gmail.com>
	<1504506956.12799.55.camel@intel.com>
Date: Mon, 4 Sep 2017 09:46:50 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr2AuEc61i6hWEm=SiAn0TFgP_HhyOk-01XX0zAV6y=Zg@mail.gmail.com>
Message-ID: <CAP9ODKr2AuEc61i6hWEm=SiAn0TFgP_HhyOk-01XX0zAV6y=Zg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
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
X-List-Received-Date: Mon, 04 Sep 2017 12:46:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 4, 2017 at 3:35 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Sat, 2017-09-02 at 15:17 -0300, Otavio Salvador wrote:
>> On Fri, Sep 1, 2017 at 9:04 PM, California Sullivan
>> <california.l.sullivan@intel.com> wrote:
>> > Having these the initramfs-framework recipe
>> > forced initramfs-framework
>> > users to build several tools they didn't need, and made it more
>> > difficult to declare the recipe as allarch.
>> >
>> > Fixes [YOCTO #12024].
>> >
>> > Signed-off-by: California Sullivan <california.l.sullivan@intel.com
>> > >
>>
>> The patch should be based on the allarch patch I sent as it adds the
>> dependencies on the whitelist. So you can also set them as allarch.
>
> I would prefer to keep initramfs-framework-setup-live/install-efi as
> arch-specific and only make initramfs-framework itself allarch. It's
> just a gut feeling about the (minor) advantage of not having to rebuild
> these two small recipes vs. the additional complexity of the layer.conf
> and having to keep that up-to-date.

The recipe is a shell script and there is no reason to not make it
allarch. The need to keep layer.conf up to date is minor as it is
going to be need only when new dependencies are added. Not ofthen...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

