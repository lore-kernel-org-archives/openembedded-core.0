Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id DDE10607BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 02:21:58 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id c1so4164101igq.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 May 2014 19:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=dS6a7GL3xp+wRGaxJRNoWu73NdkMoUjUY0hhE7NTx8g=;
	b=HdMInkZq7sKLhy1+3rcDplLJLZsv6oJbU11khVP95RzlNvKnsOn1AGN2CW7OfIbKZE
	yzgjajZuUJsVK7oFIFGAA8LFpcP2shnojjipJPgU4oys/7RBRg+58qy3h+X3HocIh/IP
	Rj/z/v84W7hFf6uhKkiuCoDJLEqy+3c4Uy3uclPCgfhqVbyubuBVQLDkrdanhLebjhrY
	F1nNxiMCxBtWGvzBcEl93olDYBUIO9lPp9Sh6v/fi4wITS8bZn/nNPBA+K5GavXLB21w
	iq4wd8LLphXjvmFwZadntdYbm1jjYRXZ22UEFCkLP3rlps/8RTcwy1vkgZVFeys0tERz
	RlXQ==
X-Received: by 10.50.30.167 with SMTP id t7mr20044673igh.17.1399256519609;
	Sun, 04 May 2014 19:21:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Sun, 4 May 2014 19:21:29 -0700 (PDT)
In-Reply-To: <CAPbeDCkQ5+fKDLwmwsRK6y8WcJwoctTrGw1_FbF9JAr3o3bWTA@mail.gmail.com>
References: <CAPbeDCkQ5+fKDLwmwsRK6y8WcJwoctTrGw1_FbF9JAr3o3bWTA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 May 2014 19:21:29 -0700
Message-ID: <CAMKF1soHJS21Or1b=hByJrRCV5qL343NjkNXXUx__fgnVaKsfw@mail.gmail.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: rm_work not cleaning up when doing "-c populate_sdk"
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
X-List-Received-Date: Mon, 05 May 2014 02:22:04 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 4, 2014 at 1:04 PM, Jacob Kroon <jacob.kroon@gmail.com> wrote:
> Hello,
>
> I'm using the rm_work class in my setup, and I noticed that the work
> directories for all my nativesdk-* packages we're not being cleaned up.
>
> I do "bitbake -c populate_sdk my-image" to create the SDK.
>
> From what I can tell by looking at rm_work.class, the rm_work task is
> appended at the end, but for some reason rm_work is not executed.
>
> If I do "bitbake nativesdk-<somepackage>", rm_work is indeed executed.
>
> Would it be possible to hook in rm_work in the populate_sdk case as well ?
> Or is there another way of executing rm_work for all packages ?
>

rm_work is run before BB_DEFAULT_TASK which is set to 'do_build' in bitbake.conf

populate_sdk is added to be executed before do_build as well but there
is no dependency
of rm_work on populate_sdk thats the issue here they are independent.



> -- Jacob
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

