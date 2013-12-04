Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id B10F46DEE2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 16:40:25 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id i4so16667363oah.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 08:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=a+xC0RHKppQ6TFZzAUxwbW+skgNnNSMtvE0c9vKDcQI=;
	b=Ya7263wkcEgbCIhDvtvSsNNfWUSFBxnIrTtFERE57Ln0p14og26JoGlfmZwd5RHkHW
	no3Hm3Cn+K1qt2Y2vp4SL0/jDLNEChjSduRYXqfZZntqeI+WGcTAF3TG1NvVdRRIHW03
	2z5rDEA/28q38fAkGk8YeSSMCq+hlUkdl0BKLAqwnWBP2M8FYN6BBQ7q0G09GBUEKLIf
	GGj24bfCr+fSDZ/j3fL+IfKwCHinwEc6Eag98TvhMl6jP4l3mlIYsIvcUw43q+c6JH7w
	DwfmUUGFojFokpUj32wV9vasZwHb2cG0aaa8s7LwLofj8Ov+V4/PUpAP/AsdSAt1PjTc
	4Vyg==
MIME-Version: 1.0
X-Received: by 10.60.65.227 with SMTP id a3mr64321084oet.13.1386175224913;
	Wed, 04 Dec 2013 08:40:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 4 Dec 2013 08:40:24 -0800 (PST)
In-Reply-To: <CAKKsV2yS6dxKV0PVkhx32+TG6+-d2McUkzPxG1+B3tsgm+oqUg@mail.gmail.com>
References: <CAKKsV2wExa=EZ4FWdcXiRJY1B=QnzO3uBTn2s23V9MtNSxOS0Q@mail.gmail.com>
	<CAKKsV2y+ZuaS27QqLtXjcY_qsT1UV01RVtdC=6C_SQpD7nJR5A@mail.gmail.com>
	<CAK6=ix7pDXwnH6+GOB7XmZedt1QnznfTPdUwUxRqVh+didTWSA@mail.gmail.com>
	<5288FF5E.2020309@gmail.com>
	<CAKKsV2xcXo8NwO9jfiXb_D_=UfCYC9N1CSOb28fgaopFRFZ97Q@mail.gmail.com>
	<CAKKsV2yS6dxKV0PVkhx32+TG6+-d2McUkzPxG1+B3tsgm+oqUg@mail.gmail.com>
Date: Wed, 4 Dec 2013 14:40:24 -0200
X-Google-Sender-Auth: Z_hiAZrb1wrWhcZKOEZWLJfhwDM
Message-ID: <CAP9ODKrs7X1Xqhj_9dftRS4b86PRx4h=U93mrfpbbAAaN0Gwdw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Muhammad Tauqir Ahmad <mian.muhammad.tauqir.ahmad@gmail.com>
Cc: Behan Webster <behanw@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Exploring LLVM/Clang for OE
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
X-List-Received-Date: Wed, 04 Dec 2013 16:40:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 4, 2013 at 2:31 PM, Muhammad Tauqir Ahmad
<mian.muhammad.tauqir.ahmad@gmail.com> wrote:
...
> I am hosting my work on my github account in these two repositories:
>
> https://github.com/mtahmed/poky-clang
> https://github.com/mtahmed/meta-tc-llvm
>
> The first is upstream poky clone with additional patches to allow it
> to compile using clang.
> The second is a secondary toolchain layer that allows llvm to be used
> for the secondary toolchain.

Nice work! It would be nice if you could isolate the ready for merge
patches, from Poky, and send them so the review process can be done
along the finishing of the other TODO items.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

