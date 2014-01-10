Return-Path: <paul.betafive@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id CB08760E5A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 15:50:39 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id h16so5200452oag.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 07:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=kJyNLrPxIb96yFNapgp5QVPasFleOLGwVQyAGU1nw5c=;
	b=cuO2KTYzU/u3W0r2m6liNTJdQMMy9kFtuYQyMyouDaczR+0U2WvumQ6Pnt8qfrb8J/
	ZHeySi1DVnuo1v4vpGZMgT3b/SdsvVk9cflP+bMx/qq+O7J4Jf5ljVCwUWCA4Z8XJNDc
	5kLmIWgmFl5ohJdrJevrHBS9smqGft4Jx6RWPnocIN2CMb85c47x6Jig85lbBRjgS98B
	A1Moeo1KxY/dGoU+VfyvV2jbJsa+7Vti1DVk0/3npW4A5GZLA2WXCtYmM5kLmmhG5zJg
	a7urrZB/gFTHqo9cKTkr6BaGBDQr+DEqkAqT/4Uv+FHR2dDurixy8Nm3vPZTOIXsaTPu
	dmPA==
X-Received: by 10.60.123.19 with SMTP id lw19mr8457716oeb.24.1389369040319;
	Fri, 10 Jan 2014 07:50:40 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.76.122.171 with HTTP; Fri, 10 Jan 2014 07:50:00 -0800 (PST)
In-Reply-To: <CADV-EXEygnQGWan8VLtZbieUozXPnfRNytXg9TBv1ALwJ_y3cA@mail.gmail.com>
References: <CADV-EXEygnQGWan8VLtZbieUozXPnfRNytXg9TBv1ALwJ_y3cA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 10 Jan 2014 15:50:00 +0000
X-Google-Sender-Auth: NmFdvvA8ieUNdvVyEx-hfAMTgmI
Message-ID: <CANyK_8cntHRL7rRSUibaCX_1L3zDmYhx_P=pa6S7RA4G_LeG5w@mail.gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Failed to build opkg with curl support
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
X-List-Received-Date: Fri, 10 Jan 2014 15:50:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 9 January 2014 12:04, Yevhen Kyriukha <kirgene@gmail.com> wrote:
> I define "curl" in PACKAGECONFIG for opkg.
> After that I'm getting circular dependency errors during building opkg.
>
> Best regards,
> Yevhen

Sorry, this is a known problem.

The update-alternatives script needs to be moved out of opkg, either
to opkg-utils or to its own recipe as it is the use of
update-alternatives that is causing the circular dependencies. This is
what I am planning to work on next as soon as I get some time.

This is required for my ongoing development work on opkg so it should
get sorted out soon. (Future versions of opkg will depend on
libarchive which also indirectly depends on update-alternatives).

Related to this is the fact that no other providers of
update-alternatives seem to work, again due to circular dependencies.

See http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/45321

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

