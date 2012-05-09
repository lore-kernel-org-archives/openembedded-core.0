Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SRvOs-0001iP-7r
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 03:09:06 +0200
Received: by yhjj56 with SMTP id j56so1287997yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 17:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=I/May0Inue9CwZXLL0IppWYsppP5yaPu7qeDEvqjO7I=;
	b=PAROhY0dKONYtuYpsraUE6E7PSJaAGwca7GsFKDUtAXfGR/+uJbqJCB4P4zwy/fSfe
	NT5vgUOCWbhKI8tqQ8Sa7QcEJ9tLpVib3keKsfoHvkdpqlZvH5mlsSyLB49I988w2Ls/
	+1LilC/JwjKprC54/gRm2Tk/j5gouf8Hu1PyMNga4LvBsD2mTtPcG5gGtJ2r3oLcGPDM
	gZnhNKOUf/k+t/H+DUVEg1EUXfrQ87mhrYfN+xrFZ3mUhaA0rMqYL2cWeCd6Efa4jgGv
	hBtVCKfJghymGe1maAcCWdmNfk9380QcCS7vtFhqZ3tpXt23saH1K4FKCDQDRRXXA81T
	lXsw==
MIME-Version: 1.0
Received: by 10.50.94.234 with SMTP id df10mr12165536igb.31.1336525153438;
	Tue, 08 May 2012 17:59:13 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Tue, 8 May 2012 17:59:13 -0700 (PDT)
In-Reply-To: <fa8d138dc96a622f36b8783457c375186a84e411.1336524034.git.raj.khem@gmail.com>
References: <cover.1336524034.git.raj.khem@gmail.com>
	<fa8d138dc96a622f36b8783457c375186a84e411.1336524034.git.raj.khem@gmail.com>
Date: Wed, 9 May 2012 03:59:13 +0300
Message-ID: <CAF6bG8f21=Pcxjt3-pPemiBiF0TqPT2e8snxry_7VQWGa5BcNw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] uclibc.inc: uclibc rtld does support GNU_HASH
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
X-List-Received-Date: Wed, 09 May 2012 01:09:06 -0000
Content-Type: text/plain; charset=UTF-8

On 9 May 2012 03:43, Khem Raj <raj.khem@gmail.com> wrote:
> -RPROVIDES_uclibc += "libsegfault"
> +
> +RPROVIDES_uclibc += "libsegfault rtld(GNU_HASH)"

 You should know that I'm just figuring out what to do with
"rtld(GNU_HASH)" that already exist for eglibc. When building
deb-packets based image, that results in:
"reference to 'rtld': error in version: version number does not start
with digit"

 I've confirmed that error message is caused by this by simply
removing "(GNU_HASH)" -> eglibc build success


 - ML


