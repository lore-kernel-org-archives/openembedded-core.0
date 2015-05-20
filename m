Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4EEDB601E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 13:20:04 +0000 (UTC)
Received: by padbw4 with SMTP id bw4so67141308pad.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 06:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=AJpo18/xGpvS3vXeU2rQsmrbm9GBG8xYw3s5Uo3DbLI=;
	b=Su4JIOot0Jqh8FrH92dcBgHxupEei/rtXKjgMSy00fG+H6C3+4+FvFLLezyeCuts3l
	VZFuXFjBetGXU+lV0p3cRwvLSErB95MCksx1k8kIBQGI1GPkGVR7YZCfXSbwjXsSu9yx
	pulWvZld4x2Px5Mb+YzUZR9d3ulsToYXWr5npPUvnd2J01KaZrEfom/eLctOBJsa+uis
	2SLcQWAa/FK5mGlHik96dvkpbh2O7hjAgWw0a5+MEZpLNZYaF7UB5rTpBUzb7ahxN2/o
	I7G63x/+MwgBIyliVKQTY1LckG82AkuWrDvEX7tlxdXMklcbFmSCrLwiimxcUp/nlwTD
	+hiA==
MIME-Version: 1.0
X-Received: by 10.66.141.12 with SMTP id rk12mr47887362pab.97.1432128005564;
	Wed, 20 May 2015 06:20:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Wed, 20 May 2015 06:20:05 -0700 (PDT)
In-Reply-To: <555C896A.8020107@kernelconcepts.de>
References: <1432122583-24497-1-git-send-email-florian.boor@kernelconcepts.de>
	<CAJTo0LbOKfUpUyor7AczZyffp7gQruYy3hYMqz+ewGxZzRc+mQ@mail.gmail.com>
	<555C896A.8020107@kernelconcepts.de>
Date: Wed, 20 May 2015 10:20:05 -0300
X-Google-Sender-Auth: DIy7LvNyZkUQyvruZzDiBXqemIE
Message-ID: <CAP9ODKo7H5T3Thb+1SW9hGwkzxEbTzYJr2=fLraqje67ssHRpw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Florian Boor <florian.boor@kernelconcepts.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-engines: Allow gtk-engines package to be empty in order to make the -dev package installable.
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
X-List-Received-Date: Wed, 20 May 2015 13:20:05 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 20, 2015 at 10:17 AM, Florian Boor
<florian.boor@kernelconcepts.de> wrote:
> On 20.05.2015 15:08, Burton, Ross wrote:
>> No need to bump PR.
>>
>> Personally I think that the fix here is to stop PN-dev depending on PN, instead
>> of creating an empty PN package to confuse people.
>
> well, in this way it automatically fixes this issues with the -dev package which
> is not installable for every build where gtk-engines has been built already, so
> in my opinion this is a good reason to increment PR.
> Randomly laying around packages with broken dependencies have quite more
> potential to confuse people than incremented PR most users do not care about much.

No. You should rely on PR Service for this. Drop the PR bump as it is
pointless here.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

