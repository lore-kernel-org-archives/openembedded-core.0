Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id A8EFF6B6D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 17:44:43 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 10so40556512ykt.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2014 09:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=YVcon/7k9RoEgUxfKOMM/IqklZbX+/b7beQ7gE8ACfw=;
	b=xJ+qJXG1/Bt7MOgihLlkn4D0hYw9De899fdrZwCwgGmbntZgp+HaCv1njipx03zoFB
	rpbDuvi5NOSELMjn/lYHLDXDz3AEslD4zsc5MTMt7jRQ/Mes9vNa5NPmXQSYPgaL7B5j
	ZJfhxo9ocN0VDbY4EOA227YjIjz85GDkuPyawMTypB9mGjPBc26NnsdZtqY9ZCYh//pu
	uZ5bb58fSx8D0ANv1zvPW8KjAi9Rr9dE+xB0Wn71/FB9lPSlJf9r2dP67LjhUWE7byGw
	S1XOEW219HL5UwxJOiSVilLm/RxZTFr4+exWNHVgx182LGkW2FsV4BzLHHZgFQop+gEK
	1/HQ==
MIME-Version: 1.0
X-Received: by 10.236.183.111 with SMTP id p75mr415417yhm.148.1391449484132;
	Mon, 03 Feb 2014 09:44:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.62.84 with HTTP; Mon, 3 Feb 2014 09:44:44 -0800 (PST)
In-Reply-To: <1391343549.3068.58.camel@e130.pbcl.net>
References: <1391343549.3068.58.camel@e130.pbcl.net>
Date: Mon, 3 Feb 2014 15:44:44 -0200
X-Google-Sender-Auth: 6MxgVo63WHBFubQ3l4Za--QGtjA
Message-ID: <CAP9ODKosEqvQ0ud5=rY5PAt1KHoiBetiAE9J1xCwrvQzg-a19A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <pb@pbcl.net>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-ust: Move lttng-gen-tp to ${PN}-bin
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
X-List-Received-Date: Mon, 03 Feb 2014 17:44:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 2, 2014 at 10:19 AM, Phil Blundell <pb@pbcl.net> wrote:
> This helper script is used only during development and is not generally
> useful on the target.  Inherit lib_package to move it to a different
> package from the libraries.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>

Did you check if it provides an upgrade path, for package based distros?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

