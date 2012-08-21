Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3sqY-0003G2-Iy
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 20:06:34 +0200
Received: by eaad12 with SMTP id d12so25916eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 10:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Uz087Nf97tXeVEknMMuQzRS/oByFsZCbmvI15oQlVpM=;
	b=vjxQ7nZ73wo5zOYmRO0pxchH5vVuxYuZIAtY7YBft21gbIRNSjziGyLK3nBhmzO4eK
	F+LkSZmWz2yHG0ani9soRUfzSDKLQwLIXexq9GNaycDFyutV1xWgtP/jxaBx7RY6iJcB
	ZIgO3P6qj9tz8tZ7aegg1owAOXftoBvZSCGDCkK4IIv5A/oAkGLTjIBi3WZo75DB9Run
	6k0S06ToC5kCQ7IySxN1UeBf8pLlQPwNR0ykLS7t3GYPE46yzsIpqKX3TY1AaEFMUcnx
	qTkJ5awMPf4OPoVlS3Nr707zUTWaeLu2CCeervF9szhnRtdPfDKXrik3w87Oyixl9Dxh
	NtDA==
Received: by 10.14.4.201 with SMTP id 49mr14703667eej.0.1345571670774; Tue, 21
	Aug 2012 10:54:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 21 Aug 2012 10:54:00 -0700 (PDT)
In-Reply-To: <1345566017-15508-1-git-send-email-msm@freescale.com>
References: <1345566017-15508-1-git-send-email-msm@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2012 10:54:00 -0700
Message-ID: <CAMKF1sp2eYPuaU0yF-BBX9DNjPHwFjfOknLen10gog1n3spDfA@mail.gmail.com>
To: Matthew McClintock <msm@freescale.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kmod-native_git.bb: fix builds for hosts with older libc
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
X-List-Received-Date: Tue, 21 Aug 2012 18:06:34 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 21, 2012 at 9:20 AM, Matthew McClintock <msm@freescale.com> wrote:
> +
> +do_configure_prepend (){
> +       if ! grep O_CLOEXEC -r ${includedir_native}/bits/fcntl.h; then
> +               export CFLAGS="$CFLAGS -D O_CLOEXEC=0"
> +       fi
> +}


IMO It would be safer to create a patch for kmod itself where you
define O_CLOEXEC if it
was not defined before. The above seems a bit risky


