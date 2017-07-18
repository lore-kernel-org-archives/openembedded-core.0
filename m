Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 207D577F90
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 11:02:40 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id a62so18340958itd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 04:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mYuw9/FsXukUB7ZHJI1zQExl4w4Az3VQ4vQpChicHQE=;
	b=BUWWGrp8lYh8siau/5A6Tk92SGUsb4f2EvDBiujmOcRh8Ch4fGwH3GjBcc+FwyzObk
	uj8pWvJgIcpfsp1oTwl8nljMnJpRPeg9g+qk0sPUo340tKvkc4PjNs2tHyCTUs36OXRP
	6p2npGJsXAKFPOIl9vdqHhHTX4dZe9odEE6v4u5yNw6I3j2GYj/UttusD2ujlhfFkgDL
	eF3PdMMeK79uim/kl4I1bDL3qzAJ6ARPang0jQgr+XUi60KbQyGD9Xcc3LFMoG6Dj+Oe
	JmTWTzvx+SJMeWXQwoW7N7k4dDfwLqpwjCz0ZJIpbMq5B8sfw+Vl4+01n/VXTsLQgHr0
	yTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mYuw9/FsXukUB7ZHJI1zQExl4w4Az3VQ4vQpChicHQE=;
	b=poDPZkbINTV/8eemWKgrE0n7h5SbnWn/H4D1iGrGnbqLIrCD/TQJrqytGBc2Lf/wMj
	91qTAPba/RJFcIMruw1rL8lVH03Qn10N7ZDUYwNTAdFs32wm5fT393mOeGvOWJM8Vluh
	bhtB/n0zC7uWgnTvSLJzBg5ZQMXd9T/rLhm9kTxc/2t0Eg6XqItO6PALghezp8QV4Xa2
	DSHszjEWFLM9PPKy6uGenjavP9h2NzDuxIdpFz2VVaXICdKU7svR13tiJPCQrnycKy5s
	D02d0Ku8gFy2NTz0eHCR+/0uxsbb5TEZ4sBloGCYJ1Pz0GfxcuRa5M6a4oqTHXQLDcuW
	LFmA==
X-Gm-Message-State: AIVw1132GZZ1bV/G4yIrfy80dgij+DTwn92GbCbQOpkvVuZHlznekN4D
	2JOYOSbqcM8CZU+FjfIz+IGPXcxy1g==
X-Received: by 10.36.31.129 with SMTP id d123mr1987493itd.5.1500375762203;
	Tue, 18 Jul 2017 04:02:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.180.77 with HTTP; Tue, 18 Jul 2017 04:02:21 -0700 (PDT)
In-Reply-To: <CAJTo0LZjtttpf+HfoXczKwcMQVrXUtXZzam4oUgKqRU2Oo3G8g@mail.gmail.com>
References: <20170718100352.2686-1-ricardo.ribalda@gmail.com>
	<CAJTo0LZjtttpf+HfoXczKwcMQVrXUtXZzam4oUgKqRU2Oo3G8g@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 18 Jul 2017 13:02:21 +0200
Message-ID: <CAPybu_1L1ZPyZ-PMf5qcYnMAaCWxSsjxmZhP51JrOfR9MkaYtQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Add unzip hosttool
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
X-List-Received-Date: Tue, 18 Jul 2017 11:02:41 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ross

That did the trick. I have just posted a new patch!

Thanks!

On Tue, Jul 18, 2017 at 12:47 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 18 July 2017 at 11:03, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>>
>> Unzip is required for jar files. Without this patch:
>> ERROR: junit4-4.3.1-r0 do_unpack: Unpack failure for URL:
>> 'http://downloads.sourceforge.net/junit/junit-4.3.1-src.jar'. Unpack
>> command
>>
>> PATH="/var/lib/jenkins/workspace/qt5122-dyspro/build/tmp/sysroots-uninative/x86_64-linux/usr/bin
>> ......."
>> unzip -q -o '/var/lib/yocto/downloads/junit-4.3.1-src.jar' failed with
>> return value 127
>
>
> Proper fix is to fix the automatic dependency generation.
>
> The bitbake fetcher handles jar files:
>
>             elif file.endswith('.zip') or file.endswith('.jar'):
>                 ...
>                 cmd = 'unzip -q -o'
>
> But the dependency generation in base.bbclass just handles .zip:
>
>         # .zip should DEPEND on unzip-native for unpacking
>         elif path.endswith('.zip'):
>             d.appendVarFlag('do_unpack', 'depends', '
> unzip-native:do_populate_sysroot')
>
> So the fix is to extend that test in base.bbclass to handle .zip and .jar.
>
> Ross



-- 
Ricardo Ribalda

