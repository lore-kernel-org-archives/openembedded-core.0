Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>)
	id 1RiXLh-0005B5-6A; Wed, 04 Jan 2012 21:22:13 +0100
Received: by qcqw6 with SMTP id w6so10072341qcq.6
	for <multiple recipients>; Wed, 04 Jan 2012 12:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=oax1KxhVP5ycVlX7w5qLYeek6gJGud+kdIqSHUwljc8=;
	b=Nsq3cOxNEYMpr75xNIVpmaM364+mp0FWzbXGKdafJGfC1AqPV6mVm+lay/FXdj2B51
	ejfIPiBB4GL0xrYmeegvSzBeFWrbvmNyhh0yXcfJC5F31dLCnlO81/cMs4h3vyvaBR79
	VIiqXKAgL/99Xe8HgdjhaxYqOTLIc/fx8FPSc=
Received: by 10.224.42.10 with SMTP id q10mr52704828qae.26.1325708087221; Wed,
	04 Jan 2012 12:14:47 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.187.141 with HTTP; Wed, 4 Jan 2012 12:14:26 -0800 (PST)
In-Reply-To: <20120104181400.GD587@denix.org>
References: <20120104181400.GD587@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 4 Jan 2012 13:14:26 -0700
X-Google-Sender-Auth: tH8gD76j3bEgjUWPV4-C8IGCocc
Message-ID: <CABcZAN=i6H+G_=v2KreWhzrOKe=fgVHv-vvrMhVMzKcefrXf2w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: BlueZ old releases have new checksums
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
X-List-Received-Date: Wed, 04 Jan 2012 20:22:13 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 4, 2012 at 11:14 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> The main archive of BlueZ/obexd/hcidump releases on kernel.org[1] finally
> re-appeared after missing for long time since kernel.org compromise.
> Unfortunately, all previous tarballs have new checksums, breaking builds for
> anyone w/o previous copy cached. Old copies were also extensively mirrored,
> so you never know which one you fetch next time...

Heh, checksums changing after a security compromise, that's worrisome
:) should diff their contents to see what's going on, or whether its
just a gzip timestamp change or something.
-- 
Christopher Larson


