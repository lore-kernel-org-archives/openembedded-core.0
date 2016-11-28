Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 92664719B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 07:15:27 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id b14so89105010lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Nov 2016 23:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=ydWVRy8sTYG+0IAP2qHuPpAQiGRo5FJfv/AlOdYXN5c=;
	b=vkBmAC9ljH4cBoYabjHB1ycNM+kseBqsJA+Ql9YmrRnHsYqufXV5NP6wTwVJdy/Hpc
	xaBNP8vs0+7wD2Hg3nCZWNGEEQcwqlNUQq8uVN8ZL779vqgp5xWpWND/2muT+QuUjoCp
	N5P+LM/UQckMHtS9POmY7mBKL2SxEJS1PMM5buvwIgFxoSXYbUSMmyR2+K+Qq9C4kW1w
	7ZwTvPTlxVHM7DUoOESuY0U1+QFf6VVpylNdJgSd/H1ugRtVY421CSw2IC2TIUigyPuM
	xLXSj9OZ1O51HIdUF9tJca6rR6AZhj59zACgVvURrBGqL6tLQNHNSoGnwJaATIhVHLM3
	/GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ydWVRy8sTYG+0IAP2qHuPpAQiGRo5FJfv/AlOdYXN5c=;
	b=C1CJaEmFUMxIFPws2CanVi/cTZpVhGml0lVSHc+/xSw7mex+S02QrnlB1qQ41Y7y89
	fUk5lZo8fhfVP5XFtd1tV0dUVcuK+6lnOG3u8fTLUJuV1kIJOnRTTfSBmx2eq6O/ieSD
	0FcOsTjhFrTKh8slWaIn3FF27TSRu/heOqK9wUUkayOniZlRa5947gBaFfiWjm6TFVrr
	z7b97JHFcLpeXZFOXmBJ7ZebaXBGUYphVhP5zs99WFwhOMSG5/kasqAlzvMrsY/QdW/s
	mUuzlz2njT4KoUD2p2le0V5ZSmL4nAPgzvFjunNNnzZJLoMEEHMlNSpZlaKjBStl2IQL
	LH4Q==
X-Gm-Message-State: AKaTC01RjxvONiS1ruNn6dHNDk07BIdta63kk0MNP29oZq2phf1mJqq5e9gPXgk+783V4w==
X-Received: by 10.46.0.218 with SMTP id e87mr8757697lji.54.1480317328230;
	Sun, 27 Nov 2016 23:15:28 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	q19sm12521406lfi.1.2016.11.27.23.15.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Nov 2016 23:15:27 -0800 (PST)
To: ed.bartosh@linux.intel.com
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<1480069993.6873.98.camel@intel.com>
	<f1699a69-1949-9cb3-8bef-adf9b68f385b@mender.io>
	<20161125163103.GA4830@linux.intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <e29489aa-8303-d8ac-be67-93d650d09f6d@mender.io>
Date: Mon, 28 Nov 2016 08:15:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161125163103.GA4830@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Mon, 28 Nov 2016 07:15:29 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 25/11/16 17:31, Ed Bartosh wrote:
> On Fri, Nov 25, 2016 at 01:07:34PM +0100, Kristian Amlie wrote:
>> On 25/11/16 11:33, Patrick Ohly wrote:
>>> On Fri, 2016-11-25 at 11:15 +0100, Kristian Amlie wrote:
>>>> +            if os.stat(real_rootfs_dir).st_dev ==
>>>> os.stat(cr_workdir).st_dev:
>>>> +                # Optimization if both directories are on the same
>>>> file system:
>>>> +                # copy using hardlinks.
>>>> +                cp_args = "-al"
>>>> +            else:
>>>> +                cp_args = "-a"
>>>> +            exec_cmd("cp %s %s %s" % (cp_args, real_rootfs_dir,
>>>> new_rootfs))
>>>
>>> Not a full review (I'll leave that to Ed), just one thing which caught
>>> my eye: when the rootfs contains xattrs, they get lost here.
>>>
>>> Use oe.path.copyhardlinktree() instead, it also does the hardlinking
>>> trick.
>>
>> Thanks, that's a good tip! I'll include that in the next patchset.
>>
> 
> Thank you for so fast implementation!
> 
> Sorry for not answering on original e-mail. I've lost it somehow.
> 
> My comments so far:
> 
> What's the reason of insisting that path must be absolute?
> May be it's just me, but I find it a bit scaring to use absolute path in .wks
> The patch is relative to the rootfs directory from my point of view.
> 
> It also looks quite strange in the code to insist on absolute path
> +                if not os.path.isabs(path):
> +                    msger.error("Must be absolute: --exclude-path=%s" %
> 
> and then immediately making it relative:
> +
> +                while os.path.isabs(path):
> +                    path = path[1:]

Not really any strong reason. I just thought it was a logical thing to
do from a user perspective: When you're making an image you're thinking
about paths in the final image, and the path after "part" is absolute,
so I thought this one should be too.

The fact that it's made relative in the code is just an implementation
detail to make join() work correctly.

I'm fine either way, so just let me know which you prefer.

> I know, this is just a matter of taste, but I'd not use brackets around
> head, tail here. They're redundant and the code looks better without
> them from my point of view.
> +                    (head, tail) = os.path.split(remaining)

Noted, I'll remove the brackets.

> This causes rmtree to throw NotADirectoryError on files:
> +                    for entry in os.listdir(full_path):
> +                        shutil.rmtree(os.path.join(full_path, entry))

Oh, nice catch. I will fix that one as well!

Thanks for the review!

-- 
Kristian

