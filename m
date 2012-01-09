Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RkHyD-0005Gk-5H
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 17:21:13 +0100
Received: by lami14 with SMTP id i14so1390909lam.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2012 08:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=O3h8xJqCyxmq0vela/lmKqBDmr9Uyy3lkWanlAeNNQY=;
	b=V6kU/NeoPQ4J3uiG7VX+4uj0Ph24v/+5SeFB59/iC5aRSrLz9L91kIE2ZTpX5PaIbp
	DxuzmoQ4/fw4KkS64XVkswzY7zTLhWthBdt4FQz/zV2Og9guoYOwVASIpUWQV7lpcDLT
	LCz3URxuZdhb7Kk6f7g2UAe0digyIBYJKhFMg=
Received: by 10.152.132.133 with SMTP id ou5mr7101593lab.46.1326125622283;
	Mon, 09 Jan 2012 08:13:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Mon, 9 Jan 2012 08:13:10 -0800 (PST)
In-Reply-To: <1326104251.12160.16.camel@phil-desktop>
References: <1326083969-28287-1-git-send-email-raj.khem@gmail.com>
	<1326104251.12160.16.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jan 2012 08:13:10 -0800
Message-ID: <CAMKF1sr9BPHgaesEnZKmPkqav9sJQR3CPRcgxXK9bz-RsGhfCA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] site/common-uclibc: Cache gl_cv_func_wcwidth_works
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
X-List-Received-Date: Mon, 09 Jan 2012 16:21:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 9, 2012 at 2:17 AM, Phil Blundell <philb@gnu.org> wrote:
> On Sun, 2012-01-08 at 20:39 -0800, Khem Raj wrote:
>> Its not computed properly during configure and
>> we configure uclibc with widechar support anyway
>> so its fine to cache it. It fixes the errors like
>
> Is this really a good idea? =C2=A0Wide character support is already
> configurable for eglibc (via libc-posix-clang-wchar or whatever in
> DISTRO_FEATURES) and it seems as though making uclibc respect that as
> well would be a desirable plan for the future.

hmm indeed I think I should have used that instead of this.
I will redo it.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


