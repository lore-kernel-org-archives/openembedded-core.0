Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyPHb-0005xm-W7
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 17:04:08 +0100
Received: from mail-qa0-f70.google.com ([209.85.216.70])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 07:48:33 -0800
Received: by mail-qa0-f70.google.com with SMTP id bs12so255385qab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 07:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=WjPRg/Hq0KeybOQitNhv71CdCWxAyOeh9I30dnO48Kw=;
	b=hi6Ul5SM8MMnVBq3aaO3FVZz1RYxcIZKVRYGk1WU7GXQHXahlphXCBGz5bcjSd3+60
	v0hXGdCNgb/wu+ysCT57U/w8YYrAWGC3vUhPSLWAJ1pZ/UPsEQQTiuN+ske2MF9ixkUV
	XK+wKkAQrur89Y2cnjeODRzy5ZWFU3TJDi1JtRoKvGl4xioNOq3PyfmbmKOf7GdDqnm3
	AUbBxmKgAJheWdAlLTFyW625yH5iCax7z6/cC5VJ5GiXHV9qYUTHNSr8tRHRee2Zoxz8
	fbfmI6JVH2U8cSVqPXMbHVfJNeUWnw26bni97UbB/LryQMf5CGwQFirdgVKtKh66Xqkp
	xBUw==
X-Received: by 10.52.28.44 with SMTP id y12mr2110492vdg.19.1359042511247;
	Thu, 24 Jan 2013 07:48:31 -0800 (PST)
X-Received: by 10.52.28.44 with SMTP id y12mr2110479vdg.19.1359042511138; Thu,
	24 Jan 2013 07:48:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Thu, 24 Jan 2013 07:48:11 -0800 (PST)
In-Reply-To: <20130124154325.GB3200@jama>
References: <1359034562-31592-1-git-send-email-radu.moisan@intel.com>
	<20130124134801.GD3012@jama> <51013F96.80302@intel.com>
	<CAGiJk9ca5XZXMamBFOr+syV08WK--2CYONS_0f=rCxrZkm+n-g@mail.gmail.com>
	<CAGiJk9dpU1vpqUZt_+3aS4Bu97_kEkftPrOameF-LAB1qd2qDg@mail.gmail.com>
	<CAJTo0LbN7djNS17qDc60716+uSSgjKbtXHnUvsCWq6Bm_zKigA@mail.gmail.com>
	<CALbNGRQhr3GGp+Hx2jMOs0sEXCw5PNYdQhfoiHL0Kw1AxWvf6g@mail.gmail.com>
	<CAJTo0LZR4BjQYHPfaBtGpDe9Oi1qTuv=wAvhCkQ6EtfNkuLKtg@mail.gmail.com>
	<CAGiJk9ca7C5UWwLW0GTsiqSxH=TjOHfQ_bd4L9YgiKW+151cuw@mail.gmail.com>
	<CAJTo0LaEiSg-V_kFPLMVDfz51GunE97JwPUHTDW_WWjCXoPOaA@mail.gmail.com>
	<20130124154325.GB3200@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 15:48:11 +0000
Message-ID: <CAJTo0LZLkLsYfiiQhFXKgBPL6x1AMF5g6EU3dEZ0k9LMSRaf+A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQkLSFPCOYjMRCIx0MX3hCg+byUU7DJqA+GTYh5sQ6z+FiyN/qzhr2yiVTioMXI84Kar7BIBBJArR1ID7S4Bu+/dOAPIIOf2zDQHS7I1ILs87rp9Ok8MKMDvz1kgj82OQvvkHQgnnLDUDr6IshaNKri+veW4ZfEK7ZwlY8wIAv0T4L8KVqiZI8arElvIJZZ4Yqbfny+B
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Thu, 24 Jan 2013 16:04:08 -0000
Content-Type: text/plain; charset=UTF-8

On 24 January 2013 15:43, Martin Jansa <martin.jansa@gmail.com> wrote:
> I think the point is, keep default default.target for images where it's
> OK (gui or warning) and change default.target to something else only for
> images where it matters (nogui if you care about warning).
>
> Changing default value by patch in systemd recipe and then setting
> default value back in many image recipes doesn't look sane.

Sure, so we make the default graphical, and there's no change as far
as the final image is concerned.

Ross


