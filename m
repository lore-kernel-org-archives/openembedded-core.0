Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 945B275D39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 07:10:12 +0000 (UTC)
Received: by oiab3 with SMTP id b3so771470oia.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 00:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SODD2oDnDStQYF1Uy4qb1h9sjpyInTUoO77Q9wCE/B0=;
	b=O/P/CYucDF5ycmdLF2tI+7LlfaJi4fF2HYku0Me+8AYm7FihY/w7eYVnsGTlC/sKJk
	VJ3zNOsFcgyisHS0WLuPhRjpnuE2m+kgHA/UpFnB+MS0R6HThEs7Bve8903BraBrGyYk
	ylaNJQS9dQOvHBSaLBzpCN+NTpAENgNsp+Gelo/4lJ0byLzRXFxoqhvI35ayq7u/6bb4
	t+TR7bXnEuhB19O4ojCfRG/3+9USVJrurH370U+MRrOZSIfyBf8p4rrAFu3TuyI9Vt9C
	wK3VlxrWnYEgOJz2juiAuWxSbCWd1hPujujh/v7HjiT9jTm8GU8UHHFE8G++amOWS9gN
	QKjw==
MIME-Version: 1.0
X-Received: by 10.60.16.228 with SMTP id j4mr3525863oed.59.1436857813113; Tue,
	14 Jul 2015 00:10:13 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Tue, 14 Jul 2015 00:10:13 -0700 (PDT)
In-Reply-To: <cover.1436536403.git.paul.eggleton@linux.intel.com>
References: <cover.1436536403.git.paul.eggleton@linux.intel.com>
Date: Tue, 14 Jul 2015 00:10:13 -0700
Message-ID: <CAJ86T=W4wmk=j1AWwo9zeNtiYXfvqt4SxSXOX4f=gKnybRraMg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Shell message function support (OE-Core side)
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
X-List-Received-Date: Tue, 14 Jul 2015 07:10:13 -0000
Content-Type: text/plain; charset=UTF-8

Hi Paul,

On Fri, Jul 10, 2015 at 6:56 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> I'm finally sending out the patches to support the output of bbwarn,
> bberror etc. actually going to the console. This is the OE-Core side
> of the changes to implement it (changes are also required to BitBake,
> the patch for which has been sent to the bitbake-devel list).

Now when I start a devshell and run "../temp/run.do_compile" warnings
etc which previously went to the devshell console now end up in file
"../temp/fido.XXX".

Would it be possible to fall back to the old behaviour if bitbake
isn't listening at the other end of the fifo?


> The following changes since commit 18cc6d2ec4dc289bb0333dddc96df5a645ea53d0:
>
>   wic: Set default set of bitbake variables (2015-07-10 13:34:50 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib paule/oecore-shell-logging
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oecore-shell-logging
>
> Paul Eggleton (1):
>   classes/logging: make shell message functions output to the console
>
>  meta/classes/logging.bbclass | 32 ++++++++++++--------------------
>  1 file changed, 12 insertions(+), 20 deletions(-)
>
> --
> 2.1.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

