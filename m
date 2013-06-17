Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1FC716007B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 17:49:40 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id ta17so3443275obb.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 10:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=p1rz1o3ZjE73TFw5+NAtXpMlqJxGLYfnbxrAfs6gVPI=;
	b=ms7ybFrl+B+y5Y8P7Tb6oqSyhrBKHB1UxQtL2qOHYt+gd/jZo36cIo/BxXXnhFBTo+
	cmtUHVQhbBDOVKZz9FTEQz2Zs2XZSB130F/XTBvw5aa1aHlouyVWhezx1i4LYLJTUUAn
	8kcJ3GRLABQkrK9K/VGqLriqYZlNAa6x1f2kKxYk9gSndgfx36R1qFbGDrYO9g05Vuz/
	G8yiH1fGax3e/QbH1Ex79U5hFljoyYjrAxGleGePNFgluIcVRGRnaX/YxXxAaUBQU9bZ
	FJVZiCl6DyV6uxVe15DsUOntFsK/0EVsbYe4u6VQFhHm9KZA3RNWpB1lWJDb+ZMwsiXe
	CR0Q==
MIME-Version: 1.0
X-Received: by 10.60.85.34 with SMTP id e2mr5464761oez.0.1371491380201; Mon,
	17 Jun 2013 10:49:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 17 Jun 2013 10:49:40 -0700 (PDT)
In-Reply-To: <1371428523-21377-2-git-send-email-paul@paulbarker.me.uk>
References: <1371428523-21377-1-git-send-email-paul@paulbarker.me.uk>
	<1371428523-21377-2-git-send-email-paul@paulbarker.me.uk>
Date: Mon, 17 Jun 2013 14:49:40 -0300
X-Google-Sender-Auth: 6N2STXFj_7iL1kXdnXifE-FAROU
Message-ID: <CAP9ODKq3qXML4fb8V-g3SCqtR9YcmjuSc5gNNwoHDW39vuKRYA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] opkg: put libopkg header files into libopkg-dev
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
X-List-Received-Date: Mon, 17 Jun 2013 17:49:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jun 16, 2013 at 9:22 PM, Paul Barker <paul@paulbarker.me.uk> wrote:
> The header files for libopkg belong in the package libopkg-dev rather than
> opkg-dev where they are placed by default.
>
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>


--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

