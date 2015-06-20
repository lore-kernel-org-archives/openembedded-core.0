Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id ACC9B758E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jun 2015 15:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 9036331565E8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jun 2015 17:11:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id lTMGSh-t83_S
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jun 2015 17:11:10 +0200 (CEST)
Received: from [172.22.22.61] (55d46f31.access.ecotel.net [85.212.111.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id AD2BA31565E5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jun 2015 17:11:09 +0200 (CEST)
Message-ID: <5585828D.90002@opendreambox.org>
Date: Sat, 20 Jun 2015 17:11:09 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAJ86T=W1YVmDnA6PfkUDRaGsftRt8+1MhWcN2U-DFUAjzoct5g@mail.gmail.com>
In-Reply-To: <CAJ86T=W1YVmDnA6PfkUDRaGsftRt8+1MhWcN2U-DFUAjzoct5g@mail.gmail.com>
Subject: Re: Incomplete runtime dependencies for gdb python PACKAGECONFIG
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
X-List-Received-Date: Sat, 20 Jun 2015 15:11:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Andre,

On 20.06.2015 05:00, Andre McCurdy wrote:
> The runtime dependencies for gdb seem to be incomplete when python
> support is enabled via gdb's PACKAGECONFIG.
> 
> gdb ends up with a runtime dependency on libpython, but not on python
> or any python modules, and gdb then fails to run:
> 
>   root@7401:~# gdb

just curious, is this a BCM7401?

>   Could not find platform independent libraries <prefix>
>   Could not find platform dependent libraries <exec_prefix>
>   Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
>   ImportError: No module named site
> 
> Manually installing python and all python modules seems to be a fix,
> but I haven't narrowed down which specific python modules are
> required.
> 
> The issue is a little more serious for anyone using meta-qt5, since
> meta-qt5 (fido and later) contains a .bbappend for gdb which enables
> the python PACKAGECONFIG by default:
> 
>   https://github.com/meta-qt5/meta-qt5/commit/9d17546d56b5e710a6420b482514202236f410e3
> 

Here's a patch for fido that I was going to submit after testing
with master, whenever that may be.

http://git.openembedded.org/openembedded-core-contrib/commit/?h=obi/fido&id=5461b4a6db9b9429132952ce31d293550c945179

Feel free to adapt, test and submit.

Regards,
Andreas

