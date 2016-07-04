Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id C9E0260616
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 13:19:18 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id t127so265509949qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jul 2016 06:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SDecCP4/QMTMIIjCC9ym9j6K+p/EAms8O5d58k+wxpM=;
	b=XdU9TcvtWL2IPtykOWubQOKy1QKd90dtgBrRc8v+F8mtBRrA1vqAEUj/t7ZjQTTpGv
	YdS6c7w7b4GvdGlHuSbkAgwmGS449xs5kBbtZfr4A3IidYZUT52xPxf5/7p/aXKNRVNO
	7N7vONuNZwDU+0pYH91/iIGuVfuwjDjcyuFgFrE53HdSGEDtB2XMOVNByg8Mu8tL7OM7
	+wS01e15uBVwbzZ/0rxqIwxAyJ0e2nUJrWeUMafcjyrp4xwdC9lLZb54UXvjCtng3ykw
	grWDYcVuciDnXXoH6GiZHdTOSeV5tjyHhvZ8CHh7UEEUuTeEdPyyPQ+w3099I+v2Bckq
	1YYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SDecCP4/QMTMIIjCC9ym9j6K+p/EAms8O5d58k+wxpM=;
	b=YhgGHZWaC4piw1Z/Q4rS9okypIS90mkQjlkSOAXzFa5p5JoG2Qi9zAWPeDEcjJ7fKM
	R2TZQcNG/HnIN+wp5r3BwIGN74WryMrbfuOh525QhG9eR3wkh79kDcW7/61u7V0ElETU
	8cdWU/Y2I1/Mts+lSKZ99aMGZP/uep2GIE6UHLvfCt+HC2UwCppToSwAUOAExpWlkUp/
	KYbE4HJnLsxyRkp+biAw3O37hbtC9UmebHG4c0O8KQHEkheFZNzvHD2JRUvDfJM+Me+i
	jrYe9rbvBhC43xkGVHg+WbCO0zC/c6fiMJ69tqrswDAWNwIxdDzbwWw/oNyoGI6VGLN7
	+/EA==
X-Gm-Message-State: ALyK8tIUZOb7vTiK/4N6fTnnZABd6FDGU2GyXF7jwdoz/rqNSGoQtU0t344C5vkaEPx6Co/1cGkaUX+cIVpGQA==
X-Received: by 10.55.16.232 with SMTP id 101mr16310635qkq.151.1467638359351;
	Mon, 04 Jul 2016 06:19:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Mon, 4 Jul 2016 06:18:49 -0700 (PDT)
In-Reply-To: <CAJTo0LZUvOTA9X=SE=GrK4PkFvO-F4S556zEUjdSK2yBhZkShA@mail.gmail.com>
References: <1467637324-16642-1-git-send-email-maxin.john@intel.com>
	<1467637324-16642-2-git-send-email-maxin.john@intel.com>
	<CAJTo0LZUvOTA9X=SE=GrK4PkFvO-F4S556zEUjdSK2yBhZkShA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Jul 2016 06:18:49 -0700
Message-ID: <CAMKF1sr-kDvBVC7swKrDHCqW+ojvtDNxEifL-91gMazoj7NuEg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] libsolv: upgrade to 0.6.22
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
X-List-Received-Date: Mon, 04 Jul 2016 13:19:23 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 4, 2016 at 6:06 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> As we're tracking versions, can you change the filename to libsolv_0.6.22.bb
> so you don't need to specify PV explicitly

we do not do that for recipes with git fetchers usually. PV is encoded
as PV+git{SRCPV}

