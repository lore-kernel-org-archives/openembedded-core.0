Return-Path: <cazfi74@gmail.com>
Received: from mail-qe0-f54.google.com (mail-qe0-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 98D0F6010E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 19:13:21 +0000 (UTC)
Received: by mail-qe0-f54.google.com with SMTP id i11so1362124qej.27
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 12:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Pl8mdpr14W5LkGNJ68v/yOS4bu0+EOvqR1F6VZhE6xY=;
	b=DJecHCiOYwC5JvU6Cox9W8byfQvglwjZu1YDSOnm/wPc93YEYN4C4Hy6ABNbQ7izCb
	NYiba1EZ9huL4scnoV2qdtdrwJs/Gqi72sOh3wyG2S0/kwBUbLpqt29Iw02xNv9AzYwK
	U0DmCALgsr/B+2NHQofIT48/GVmycYlFVdTp320ZsYwl+fi+7P/ubMwlvfzbiIqssr8B
	f3V58eMaAGFlv1k+pjsNLCEHShNOAt+mPmDZSSTcIMisxEqh1U5PGcnm3UrzvbD2y0pJ
	san2h4L0trbU1CDPDzKyl5HeN8Z+R5aOGWSUcHf1S64+IsmRiAW3zN9/Ttc0z4+aO1ok
	9i9w==
MIME-Version: 1.0
X-Received: by 10.49.64.38 with SMTP id l6mr7508525qes.30.1377458001494; Sun,
	25 Aug 2013 12:13:21 -0700 (PDT)
Received: by 10.224.114.207 with HTTP; Sun, 25 Aug 2013 12:13:20 -0700 (PDT)
In-Reply-To: <52178BA7.2020107@intel.com>
References: <fdbdadc72d3c6c1ef1feb0602d9f16dce3645a33.1377207091.git.cazfi74@gmail.com>
	<fa107ce2393b834fd74c353526e98e9edcac0a85.1377207091.git.cazfi74@gmail.com>
	<52178BA7.2020107@intel.com>
Date: Sun, 25 Aug 2013 22:13:20 +0300
Message-ID: <CAF6bG8caJp+U9HWUaNtR_-xxNCK=_ta-UOCLkcEU3CZg_L3M_Q@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <saul.wold@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] automake: update to upstream version 1.13.4
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
X-List-Received-Date: Sun, 25 Aug 2013 19:13:21 -0000
Content-Type: text/plain; charset=UTF-8

On 23 August 2013 19:19, Saul Wold <saul.wold@intel.com> wrote:
>>
> Seems this update might have a perl script that is hard coded and will need
> to be worked on.  This occurs with a toolchain build:
> bitbake core-image-sato -c populate_sdk
>
> | Computing transaction...error: Can't install
> nativesdk-automake-1.13.4-r0@x86_64_nativesdk: no package provides /bin/perl

 I couldn't reproduce, and grepping for "/bin/perl" reveals nothing
that would be new since 1.12.6.

 There's one perl handling related error in the patch - recipe has old
version number hardcoded when adjusting perl paths. It needs to be
fixed in any case, and we can hope that it fixes the issue you are
experiencing. I'll make the version number unhardcoding separate patch
so it can be applied already before the automake update. I'll push
updated series to contrib tree to cazfi/am13 branch for those
interested (probably late tonight or tomorrow), but won't send pull
request before 1.6 development begins.


 - ML

