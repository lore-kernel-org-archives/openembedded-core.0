Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB0070057
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 11:29:17 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id b6so466861yha.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 04:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=UthNZj34ob0SKEsNAYif1pFr3WffF9MsBdFbMvKaLWY=;
	b=MEAFZsBupdn1fmhBo30c9pHTy1AYf0++SCTK45fp+9K5ZLC/B+tuiQpEmnOQD6SDqr
	fT98TojGT+6Xa05JJYM7bvJaDm3+BAJ06Zjzzvi9D5iM/Y7fyX4q8GR3JFr0rVQFJTJM
	EgMYGjbv1LICNxCIbA/1ONwudGB+MLdB/FFEoHtoA5vpDPETa9Bp+BzG3mr5aa0e8Qlj
	pR3SADle8vypnMtMLWkTcPN1NC21gDTTX9iGON0SI/rCC2haAlBTPJrP3gxrWS3EWIsW
	1gzQBjw9EyLFhi6Xdu+g5RtdMYvdoq904Px56LX9/k7RNMaLAMxguakB8iYpsvcrl7Qx
	1fdQ==
MIME-Version: 1.0
X-Received: by 10.236.124.7 with SMTP id w7mr54848216yhh.33.1403090958856;
	Wed, 18 Jun 2014 04:29:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.209.68 with HTTP; Wed, 18 Jun 2014 04:29:18 -0700 (PDT)
In-Reply-To: <1403086542.2104.9.camel@ted>
References: <1403011013-29977-1-git-send-email-meier.dennis@siemens.com>
	<CAP9ODKo_tNpKNkOpr9mwFGosmuXiKfXQuNnTURaZzptsamSyzA@mail.gmail.com>
	<1403086542.2104.9.camel@ted>
Date: Wed, 18 Jun 2014 08:29:18 -0300
X-Google-Sender-Auth: ce5EOjm24dQizZs4k9SST6t6Iz8
Message-ID: <CAP9ODKrrPXzvjt6XVdibeQdU8Z3J=kG7kq1R1PsOzsefNn=_fQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: add auto-completion in setup
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
X-List-Received-Date: Wed, 18 Jun 2014 11:29:18 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 18, 2014 at 7:15 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-06-17 at 11:39 -0300, Otavio Salvador wrote:
>> On Tue, Jun 17, 2014 at 10:16 AM, Dennis Meier <meier.dennis@siemens.com> wrote:
>> > Signed-off-by: Dennis Meier <meier.dennis@siemens.com>
>>
>> I do like the idea but how portable is it?
>>
>> For example in my envinronment it does not work as I use zsh.
>
> The script in question has "/bin/bash" at the top so this shouldn't be
> an issue?

In this case I second it :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

