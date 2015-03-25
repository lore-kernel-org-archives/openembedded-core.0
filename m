Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 016AC723B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 21:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2PL927q007323; Wed, 25 Mar 2015 21:09:56 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cNA0dxwZxlPG; Wed, 25 Mar 2015 21:09:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2PL9gf5007372
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Mar 2015 21:09:53 GMT
Message-ID: <1427317782.14020.44.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>
Date: Wed, 25 Mar 2015 21:09:42 +0000
In-Reply-To: <CABcZANkfjcqPVHPOKZBjQYGAr2HRwmAEha1LgPM3spZ90NwxBw@mail.gmail.com>
References: <1427242586-23928-1-git-send-email-randy.e.witt@linux.intel.com>
	<CABcZANkfjcqPVHPOKZBjQYGAr2HRwmAEha1LgPM3spZ90NwxBw@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_ext: Log the "Preparing build system" step
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
X-List-Received-Date: Wed, 25 Mar 2015 21:10:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-03-25 at 10:31 -0700, Christopher Larson wrote:
> 
> On Tue, Mar 24, 2015 at 5:16 PM, Randy Witt
> <randy.e.witt@linux.intel.com> wrote:
>         When using bitbake to do the setscene as part of sdk setup, it
>         would be
>         useful to have a log in the case where it fails.
>         
>         The log is called preparing_build_system.log and is in the top
>         level
>         directory of the extracted sdk.
>         
>         Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> 
> Is this step just doing a setscene from shipped sstate, or is it
> intended to build anything from scratch? Because I've seen cases where
> the sstate isn't used as it should be, and it ends up taking ages to
> run real tasks.

Are you using http sstate mirrors out of interest?

I've been experimenting with them and there are some serious performance
issues trying to do that if there is any kind of network latency :(.

Cheers,

Richard



