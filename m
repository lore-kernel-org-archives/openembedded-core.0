Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SS9ND-0003Fr-H1
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 18:04:19 +0200
Received: by yhjj56 with SMTP id j56so445963yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 08:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=wB85hpxXk9qwDWAN1Y/Sm5ArhzTa7qextbfv5KKnmWQ=;
	b=o5orSo5fKH72tOl2+mpFDMjJkFIkD+1kBGzn0juLZT24K4SU6wXxUUKcQaNjvQ0eac
	3MntffL21iQ2pPULLM9XMmHTRoyrMZqJIHmHf/bZSzjSbfATH/JEj3NaI4CRgk6hxQIn
	H/WuwKIeI7L/EpTWaPR2AHY8gmrR+f9P14ZsoIP0pyEWpvDFQuR4OYxdtq16yv7HKAFI
	y+xPHeyQ4iEiwu5kvCVRycsITaM+fxrASyAI3Wwp7FQsKpa9e7dwPsVA5iEzgcxm8LFt
	shl0hri+sXtPk/2cDs1hV/9hP/Qk34Co224qZqhYM9sxbTCj2eLJEZ0vj2VmT+VVulVj
	GZmA==
MIME-Version: 1.0
Received: by 10.42.150.8 with SMTP id y8mr376483icv.10.1336578865414; Wed, 09
	May 2012 08:54:25 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Wed, 9 May 2012 08:54:25 -0700 (PDT)
In-Reply-To: <4FAA8A03.50309@windriver.com>
References: <cover.1336547713.git.liezhi.yang@windriver.com>
	<03d9cdca29477f34348a0f97138504441c5804fa.1336547713.git.liezhi.yang@windriver.com>
	<23E51582-C3C4-4673-B646-F29E74FEB428@dominion.thruhere.net>
	<4FAA84B3.1080108@windriver.com>
	<6122E5DC-EFF1-4592-AB36-22E9D68DF2BF@dominion.thruhere.net>
	<4FAA8A03.50309@windriver.com>
Date: Wed, 9 May 2012 18:54:25 +0300
Message-ID: <CAF6bG8fpapsxi5xkWebK53Gpr-nn1fWPhe2ARX0nMSWUrD9g2w@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] rootfs_rpm.bbclass: don't remove rpmlib when INC_RPM_IMAGE_GEN=1
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
X-List-Received-Date: Wed, 09 May 2012 16:04:19 -0000
Content-Type: text/plain; charset=UTF-8

On 9 May 2012 18:15, Mark Hatle <mark.hatle@windriver.com> wrote:
>>
>>> On 5/9/12 3:50 AM, Koen Kooi wrote:
>>>>
>>>> What happens when I do a build, enable INC_RPM_IMAGE_GEN and do another
>>>> build?
>
> Using the following:
>
> . ./oe-init-build-env build-test
> <setup local.conf w/ rpm packaging and INC_RPM_IMAGE_GEN>
> bitbake core-image-core
> --- time passes, git pull pulls in changes ---
> bitbake core-image-core

 That's not the same sequence. You were supposed to make first build
with INC_RPM_IMAGE_GEN unset, and set it for second build only.


 - ML


