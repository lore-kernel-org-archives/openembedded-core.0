Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel@fooishbar.org>) id 1TKfan-0008Ix-R5
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Oct 2012 03:23:41 +0200
Received: by mail-vc0-f175.google.com with SMTP id p1so3307697vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Oct 2012 18:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=MyfNcD0aIbLl3k5IgAVPCkLLJJ01cLDHYp8eLlFSXc4=;
	b=Gr+NszEB2uG4mWr77ClUZebLo++oKbG9gTPoX4V2iuQq6n45CDNsnKYqv/nqdldP6O
	bquUv9GbIP9/gGfEvkP1CIUIjr2mvWr1gkFWjISdU5JJjUR5L4vRk1EHxaSUGetkmb34
	VQHpCZdvrvGtsUNzGwwuz4mm/aLwxA8uZuZs96SDchUyNiw/fS2lMHPpIuHOnFH8YYpX
	HcGHA6KQwwHolc4GBUm1URF8iiPXD3Yzzr3pJSdxJZWqtqv+7AVOmYiUCETMIcKGT4Ar
	qDeQITXJAs3Ev2IN79ISSXMkOtMdshKAtpfS23Ba0sAuI1eFnnFSdHPcUuAACCsS5jlZ
	ZYFA==
MIME-Version: 1.0
Received: by 10.58.94.44 with SMTP id cz12mr7893422veb.34.1349572237176; Sat,
	06 Oct 2012 18:10:37 -0700 (PDT)
Received: by 10.58.161.231 with HTTP; Sat, 6 Oct 2012 18:10:37 -0700 (PDT)
X-Originating-IP: [115.64.155.100]
In-Reply-To: <1349437649.15658.20.camel@ted>
References: <1349437649.15658.20.camel@ted>
Date: Sun, 7 Oct 2012 12:10:37 +1100
Message-ID: <CAPj87rO=rnyWBjnoMnx=2QCZ3BoMqfiq1w+Vf8qZAmMLyJg-sg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQled9KK7IG3/A/TM+Vu3hzDOLTG1BZ5ZcT62KkggL+LIspPgdiN3Uc6QUVQMQ4sdEzLTP3v
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Explicitly disable the cairo dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Oct 2012 01:23:42 -0000
Content-Type: text/plain; charset=UTF-8

Hi Richard,

On 5 October 2012 21:47, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We don't want the cairo dependency. Unfortunately simply checking whether its present
> isn't good enough. If its not in DEPENDS, it can disappear half way through building.
> We therefore need to explicitly disable it.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

I've done roughly the same thing in this commit:
http://cgit.collabora.com/git/user/daniels/poky.git/commit/?id=96a6e8e9eb7c086be3fcbde6a38ac3b699fca008

which has already been submitted upstream:
http://lists.freedesktop.org/archives/dri-devel/2012-October/028514.html

Cheers,
Daniel


