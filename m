Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Rip1M-0000oQ-Uh
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 16:14:25 +0100
Received: by wgbds11 with SMTP id ds11so592254wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 07:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gKHAhttYQ/NqpbxQR5OB5c4OCrWAiGrn81A9IE4I9zA=;
	b=wJZf/X9CxYuoJnI441GzzM4unjEfZOrXu0tgpIdLyvMrJQcvI/VmwgqF1wXG7QeolH
	0yl3+j28QgwmPWEFE6vibrKV/wMjjbyY9NAyohtPCo6WOMT7HWC1HzAyJEmTHQVWRgs/
	ZaFEyAIhJHrvAXse+CUrFFFWat/9S9Hije6Zs=
MIME-Version: 1.0
Received: by 10.227.208.81 with SMTP id gb17mr2087910wbb.26.1325776022082;
	Thu, 05 Jan 2012 07:07:02 -0800 (PST)
Received: by 10.223.78.136 with HTTP; Thu, 5 Jan 2012 07:07:01 -0800 (PST)
In-Reply-To: <338da10abcd744ab75dfb184f8f81370727e5653.1325669461.git.dexuan.cui@intel.com>
References: <cover.1325669461.git.dexuan.cui@intel.com>
	<338da10abcd744ab75dfb184f8f81370727e5653.1325669461.git.dexuan.cui@intel.com>
Date: Thu, 5 Jan 2012 16:07:01 +0100
Message-ID: <CAGiJk9c52xhqhZz8d07u5mFf54RT+s44aPk11WzRrJ2YYVXUOA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] mc: fix configure with automake 1.11.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jan 2012 15:14:25 -0000
Content-Type: text/plain; charset=UTF-8

2012/1/4 Dexuan Cui <dexuan.cui@intel.com>:
> As Nitin said, "automake version 1.11.2 has made use of dir variables
> more strict, the pkglibexec var can not have SCRIPTS suffix. Using pkgdata
> instead."
>
Actually this is a Automake inconsistency, it should be possible to
use pkglibexec with SCRIPTS suffix as stated in the manual [1].
After experiencing some build errors of this type, while building
commonly used software, I searched around and this thread came to my
attention:
http://lists.gnu.org/archive/html/automake/2012-01/msg00002.html

[1] Automake variable uniformity:
http://www.gnu.org/software/automake/manual/html_node/Uniform.html

-- 
Regards
Samuel


