Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RFS0j-0002sL-PQ
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 16:48:22 +0200
Received: by ywm39 with SMTP id 39so102301ywm.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2011 07:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=BBoWAn2NdeDFUoV8CDWjvARr761/8vIGacBWFMLak6U=;
	b=TWZb91z6FQD97xFE9eaP3Cr3hr1S/re5MS7ibRYzYTeIPCW2BKelse8IThmDRJa9wK
	a5LDDzkr/jUHGYP50TZzFW+5wRahkPhjCUgHDgsvV339FkhiBtFev++/Fzc4xhJiCHmP
	F5SyJx7mmuLrOc4+zmIDVYPVwmzb4GniY3u5g=
Received: by 10.68.17.193 with SMTP id q1mr31148155pbd.98.1318776151995; Sun,
	16 Oct 2011 07:42:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Sun, 16 Oct 2011 07:42:00 -0700 (PDT)
In-Reply-To: <d2a709126af590d46dafc5b777c833b796da9b02.1318751027.git.sgw@linux.intel.com>
References: <cover.1318751027.git.sgw@linux.intel.com>
	<d2a709126af590d46dafc5b777c833b796da9b02.1318751027.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Oct 2011 07:42:00 -0700
Message-ID: <CAMKF1srto6dSsos+TY2x=Eb1Vme5AV9UUbYzLN091rkjrT6pOA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 02/14] resolvconf: Update to 1.61
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
X-List-Received-Date: Sun, 16 Oct 2011 14:48:22 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 16, 2011 at 12:46 AM, Saul Wold <sgw@linux.intel.com> wrote:
> +
> +PACKAGE_ARCH = "all"
> +

would it be better to inherit allarch instead ?


