Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 357 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Feb 2016 10:45:35 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 87E09731D7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 10:45:35 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id A683F1FE09
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 11:39:38 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <CADwFkYfpFmA_29cJqSJTD=9ZMkBCWVGbqQm9_-05inkLJEYkbg@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <56B1D8E9.4000902@pseudoterminal.org>
Date: Wed, 3 Feb 2016 11:39:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CADwFkYfpFmA_29cJqSJTD=9ZMkBCWVGbqQm9_-05inkLJEYkbg@mail.gmail.com>
Subject: Re: can't compile ffmpeg without x11
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
X-List-Received-Date: Wed, 03 Feb 2016 10:45:38 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

I think libxv should be part of the x11 packageconfig dependency list 
instead of part of DEPENDS. I'm running a test build to see if it works 
like that.

On 2016-02-02 11:08, Yi Qingliang wrote:
> HELLO!
>
> in ffmpeg.bb:
>
> DEPENDS = "alsa-lib zlib libogg yasm-native libxv"
> PACKAGECONFIG ??= "... ${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'x11', '', d)}"
>
>
> the 'DEPENDS' says it need libxv which need x11, so the x11 detection
> in 'PACKAGECONFIG' will not work anymore.
>
> can I use ffmpeg without x11 ? (indeed, I want to use opencv)
>
> the old poky will work with libav, but now libav has been dropped.
>
>
> Yi Qingliang


