Received: from mail-ie0-f170.google.com ([209.85.223.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tf33D-0007yg-3f
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Dec 2012 07:29:17 +0100
Received: by mail-ie0-f170.google.com with SMTP id k10so2517762iea.15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Dec 2012 22:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CHA2gT0TPcIOYhgqk5E/L1qdJPCpQPfNfY2hxTAEgzg=;
	b=y6i34v5lgeMjAJWGwnAhGzWiilyPnAyrVdW2Oz0kX5chH8wUT2FafzMMPg44ihnhxE
	G21yFJAuenYOw8L3L8IBhSfLH21BJuqYm/fdV9DrkFmXCctoJvs3scHaLU+6Dfx2JjRO
	PcmgnMzsJUpytFedvNTVheWvR8w5YRGcfUfAdk+UZnyWf3WSGI1m9O/0kaQ53qz/rFMp
	zBY+XUdh/w/fnFewbqOrNyjMGZgcNcyQqbVr8M+9BJCiuPtm7oyzInbcX+r9wrFxa7It
	+ydy9cjvlZ1lKuIsJ8S8gm9tEy82M1LIDawmldhAqrYFmka9Rrx15d5PF0iVH+7ckxT4
	xFmg==
MIME-Version: 1.0
Received: by 10.50.173.106 with SMTP id bj10mr2915515igc.13.1354428895046;
	Sat, 01 Dec 2012 22:14:55 -0800 (PST)
Received: by 10.64.24.175 with HTTP; Sat, 1 Dec 2012 22:14:54 -0800 (PST)
In-Reply-To: <1354273734-7103-1-git-send-email-cazfi74@gmail.com>
References: <1354273734-7103-1-git-send-email-cazfi74@gmail.com>
Date: Sun, 2 Dec 2012 08:14:54 +0200
Message-ID: <CAF6bG8cVQr-XKTUY1WjNnmNE=jH0Vr2+38c=cZqY92zN80jPGA@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: update to upstream version 8.20
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
X-List-Received-Date: Sun, 02 Dec 2012 06:29:17 -0000
Content-Type: text/plain; charset=UTF-8

On 30 November 2012 13:08, Marko Lindqvist <cazfi74@gmail.com> wrote:
> * cross-prime-list.patch added to fix cross-compilation

Upstream has fixed the problem by providing primes.h in the tarball,
so there's no need to build it all -> no need to run make-prime-list
in build system.

http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=f16e251dae43117c2cd19359c26ce7b5e05165b6

They say that primes.h is not architecture-specific, but it should be
created on host where integer width is greatest (128 bits). I've yet
to check if that means that my patch is broken in the unlikely case
that build system has narrower int than target system.


 - ML


