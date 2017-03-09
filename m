Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 775A373133
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 07:27:59 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id q7so56233313uaf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 23:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YdZ7TVO9wUM1ROujxT/ZMJIVyCrABGM+BUG1VdGE8LY=;
	b=rbcDe4yuI5rtRKJwGmzs74HKo7hp1IoPwZCNKlBbiIxjiyQALCMtEH+0v42OjzLJ2Q
	C5ioD/mzeDRftWAJxeLKvZDvhq+sEUCdnkyTYxoDPOe/2oXssXr4ouPo1E+6ALncYYhH
	xeE8d5DFMXjmU6eRRwnBjyp7R279rgIxF0YpThPbgwQvzFSAWuclN/liwV7YfXMRhCni
	STBgxjYLOVIfUnfqvtb4eLWAYdNw1S9TzflRysk6B5G4wnF5rauGGB6xTQfo0mmGQ5fM
	y1LH4A/2Mj57GWwhRAibZ++sI2hZ/Ng+BuT1GQYyP4Uo282tnL8nKfJlbdcSeAq3dZpF
	JC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YdZ7TVO9wUM1ROujxT/ZMJIVyCrABGM+BUG1VdGE8LY=;
	b=QrZhCWbRUlLQVBgyz0He8YziYo68AAZukjL0jiUkNtf9QFbQBz+FaNAtjsaFfTVieD
	wVF/yHYDJSwccZTW/rtq3g/IqJsvmEJXGLBf2puktXFWfN7dIjEVK+FNBCbV3+xQ+EY+
	N32oLQ/63OB/qgr/H5rjDkVmjzL6uL2fIWHaBZdksX+vP8NGe/6iWaZLsf1WBmNGjlSG
	hYr/uCtViEZEwdlmNe66Pa9Gj/x1D2PJCOnBEEn4r/nfKxWgfXtv9pwUUkAFyZjDD/tk
	fHuz7nYk/vUXhIlZF3sXTiY9KGJkGrQ7MQGdA0fS54FS/UonRSvgI6kT67v4jxd7FQBb
	73iw==
X-Gm-Message-State: AMke39n4FshLcBThprzX9Uxntx8/oc2K3efjOfjIawu2xd6XeC+CvCWq/2zLXQoZaVTKT9Vpk4/buSgUWszJ7w==
X-Received: by 10.176.64.225 with SMTP id i88mr6510622uad.60.1489044481018;
	Wed, 08 Mar 2017 23:28:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Wed, 8 Mar 2017 23:27:30 -0800 (PST)
In-Reply-To: <a1284fc5-f4e3-75a9-6832-893fedef7b30@mender.io>
References: <20170303231811.27812-1-raj.khem@gmail.com>
	<CAGgRHJrrmcvv6CkO+fH++85YD+SxzrsrPeVCdP+MgsgP_iP23w@mail.gmail.com>
	<20170308221933.GA8506@haswell>
	<a1284fc5-f4e3-75a9-6832-893fedef7b30@mender.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Mar 2017 23:27:30 -0800
Message-ID: <CAMKF1sq5DUzTfUBTovp5RyjmWyzcCRJbitRf1sZCO3mZgRNC5w@mail.gmail.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V7] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Thu, 09 Mar 2017 07:28:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 8, 2017 at 11:03 PM, Kristian Amlie
<kristian.amlie@mender.io> wrote:
> On 08/03/17 23:19, Khem Raj wrote:
>>> ...
>>> For the following go-1.4 recipes:
>>>
>>> I wouldn't recommend fixing go-native at version 1.4, which is now
>>> postiviely ancient.
>>> Instead, add go1.4.3's SRC_URI into the go-native recipe, loading it
>>> in the right place so
>>> that make.bash finds it.  This way, you can have all the go toolchain
>>> recipes build at the
>>> same version.  The go team only supports go1.4 for bootstrapping the
>>> compiler build now
>>> anyway, IIRC.
>>
>> since we do not use go-native for anything other than bootstrapping
>> right now, thats why it is there. there is no intent of providing a
>> go-native version for general consumption
>
> Just FYI, in Mender we use the latest go-native, provided by
> github.com/mem/oe-meta-go, to compile some build tools. The layer has a
> separate go-bootstrap recipe, which is locked to 1.4, for the purpose of
> creating go-native and go-cross.

Thanks for info. we should add it here as well.

>
> --
> Kristian

