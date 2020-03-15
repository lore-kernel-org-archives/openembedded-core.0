Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 945DF60984
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 12:30:23 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g62so15021928wme.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 05:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=N5lBv2Ne+C+b4GSHY8bXQ1IohO5tKSilORViyNSg0y4=;
	b=MpEJpjCmOHKV62I1jy2tOI6Zfe49CVKQV0xiTGZj/UfWZ1I+MNkr5RS5YaLG3U1UM/
	z3WJ/HyFtJdYMMGx/xOy3dvWIU5UQDwV7zeoVtk2jHXxsPgD++r3v7AITFEEam63XE/0
	lETdTk8igIQ3swMILaSF7FeCdNcuIJAT09HpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=N5lBv2Ne+C+b4GSHY8bXQ1IohO5tKSilORViyNSg0y4=;
	b=oDk16ZQCtEQTEnqw+yZ2flbz9QSnLFCwPCaVrmYhEY9ZkO3+mYpxyTMv3eJ3QB0vKu
	DO8Fzcr4Ra/WSDMZDliXOgX0Cti+gMslICaelOS0VpM2MOA0tS76zthw5TTTY5w2dTh3
	Xnfp2k51ZueSy3OsbfX3rLcQjlzGbGdIlgHWj0uoRtzJOu2PrT78uOlIcusuKNYrNDiz
	qC2USpggksx/zgrBkMWB7llBzBp4l12i1gCtWFBCvhIiyM9g4W2oSwWP0Uye3eXHgvsz
	tIzHWJ69jWbiUqggQ3gyREwwNcBdFxuQFPsQPSHE8U1LEcxNiLZ9cX2hZzh/c5uzm1OZ
	+A/A==
X-Gm-Message-State: ANhLgQ3EjXGcvquEMUze+AepMWqRgA4U8tQONKtnHgLZqI7wBcRUBlAz
	TQv1d1BEqxoWqWRKBQ9RfJQ/HFOfipg=
X-Google-Smtp-Source: ADFU+vuTuHesQFuNdUxs4zZzU32rc5uQ9DgUNTq6iIkDWVPNDEFm/QkUCHLnQp/K/jvESsZmQhVjyg==
X-Received: by 2002:a05:600c:2f10:: with SMTP id
	r16mr18352368wmn.92.1584275424146; 
	Sun, 15 Mar 2020 05:30:24 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g7sm89539202wrq.21.2020.03.15.05.30.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 05:30:23 -0700 (PDT)
Message-ID: <7a2ed63ed53af8e472dde821cb5a416bf04140d4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Wang, Mingyu" <wangmy@cn.fujitsu.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sun, 15 Mar 2020 12:30:22 +0000
In-Reply-To: <6aff6b44d0d9458992b5467336ceac82@G08CNEXMBPEKD05.g08.fujitsu.local>
References: <1584097866-54513-1-git-send-email-wangmy@cn.fujitsu.com>
	<44535d2e53175baa8b7b7969fa9276e924a43fca.camel@linuxfoundation.org>
	<6aff6b44d0d9458992b5467336ceac82@G08CNEXMBPEKD05.g08.fujitsu.local>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH] base-passwd: LICENSE changed to GPLv2
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
X-List-Received-Date: Sun, 15 Mar 2020 12:30:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2020-03-14 at 04:49 +0000, Wang, Mingyu wrote:
> Hi,
> Richard
> 
> > Why? The license file didn't change. This needs an explanation.
> 
> 1. For base-passwd, I think that it's gpl-2.0-only since it is
> declared as "gpl-2" in debian/copyright, not "gpl-2 or later"
> 
> License: GPL-2
>  On Debian and Debian-based systems, a copy of the GNU General Public
>  License version 2 is available in /usr/share/common-licenses/GPL-2.
> 
> 2.GPLv2 constant:
> >   9. The Free Software Foundation may publish revised and/or new
> > versions
> > of the General Public License from time to time.  Such new versions
> > will
> > be similar in spirit to the present version, but may differ in
> > detail to
> > address new problems or concerns.
> > 
> > Each version is given a distinguishing version number.  If the
> > Program
> > specifies a version number of this License which applies to it and
> > "any
> > later version", you have the option of following the terms and
> > conditions
> > either of that version or of any later version published by the
> > Free
> > Software Foundation.  If the Program does not specify a version
> > number of
> > this License, you may choose any version ever published by the Free
> > Software
> > Foundation.
> The license would be GPLv2+, only when license name is "gpl-2 or
> later".
> 
> 3. The bb file of libcomps contains the following contents:
> LICENSE = "GPLv2"
> The "COPYING“ file from libcomps and base-passwd are the same,
> So it seems that the package LICENSE fields of the same copyright
> declaration are not unified.

Thanks.

Can you resend this patch with an explanation in the commit message
please?

It can just be something like:

"The source code such as update-passwd.c states the license to be under
GPL v2 only and does not contain the "or later" clause so correct the
recipe LICENSE field to match".

Cheers,

Richard




