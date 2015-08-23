Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 83E1273CF2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Aug 2015 23:18:18 +0000 (UTC)
Received: by iodt126 with SMTP id t126so131176732iod.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Aug 2015 16:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Mvsq7pbS4adXM4qMx5mRk0JpjvFh+T7eNROwKC44uZE=;
	b=RRrR9Msi7vnJQ4qAZkK21SFsIqgQ/JHFgVmm2yVGIUxfBqudrsixf7jPnuk/+S9tJR
	Y/U69/DKGTrVEbxXHzBKljO4sLj1ko1moMp8piyF4dCO0OMzbxPP/tdixzjt+ngHOBC8
	ka1GV77VtYOnbJZ9VP9AAgtoj/LO8Tyyr54n8dUWW3FGABLZBPyUWSIckEz5QUgsXvKI
	aNuZnNYux2UlcM8osCcPr8cc3IsGq9EHKEzwEazFWyAhCCz+91hmdzOEmyA/92H3NiTc
	aYv++fiygr+BENQgcmk7gmhTGvVC9b3IvS+wWyOlHuOH7VJvUTdzuIAdsk5bpbpVlMMe
	jsbw==
X-Received: by 10.107.14.203 with SMTP id 194mr19397783ioo.195.1440371898515; 
	Sun, 23 Aug 2015 16:18:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Sun, 23 Aug 2015 16:17:48 -0700 (PDT)
In-Reply-To: <1440364561.5373.19.camel@iki.fi>
References: <1440259095-24566-1-git-send-email-raj.khem@gmail.com>
	<1440259095-24566-2-git-send-email-raj.khem@gmail.com>
	<1440364561.5373.19.camel@iki.fi>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Aug 2015 16:17:48 -0700
Message-ID: <CAMKF1sqJoC=sE-dJ3RXO27hW3onMypMpDu81VMM4WX6iyU-s9w@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] alsa-lib: Lift the limitation to use gcc only cross compiler
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
X-List-Received-Date: Sun, 23 Aug 2015 23:18:18 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 23, 2015 at 2:16 PM, Tanu Kaskinen <tanuk@iki.fi> wrote:
> On Sat, 2015-08-22 at 08:58 -0700, Khem Raj wrote:
>> alsa-lib configure tries to see that if CC variabled doesnt contain
>> 'gcc' then it tries to guess and redefine CC to be something gcc, which
>> doesnt work with OE since we define CC to have sysroot and options
>> attached to it.
>
> Can you give an example of a CC value that you've seen failing? If you
> don't plan to send this to upstream yourself, it's probably me who's
> going to do that, and I'd like to be able to point out a concrete
> example where the removed code has been failing.

CC = "arm-oe-linux-clang"

