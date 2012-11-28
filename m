Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TdjUr-0003et-Nu
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 16:24:23 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 28 Nov 2012 07:10:05 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so65229499oag.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 07:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=7njnaU3+7BoT249cQoOx+l84F4nBalN14sSlauS3FxA=;
	b=PuG850R3UykZpNFFukBoLTOGZNDNFuqvYEgYJKo+0VHQSLJ8E72v1cF47aiBLptGp+
	BBvbCUlMMGlos5KQUDmlIW1X4FRJ1RJx+Y45TtNF8YqCpb5KvxI8HuvcJ97P5p419SpG
	OKbv1yJRvomduN9FK0S5lwGmnF4SHqT5pKwzLbcvKBVgOQaM0TJmeb/Y7DCe/WPqXvZa
	BTyKvVzcNYa0qfFcY6j2m5o426rCxwCmArhiUWEEgQqvw7pamcddzFBmRgAnrokhXBjp
	k9ZDZoMiU1j3sbMSAu00jHjxGn/dQePXZ6Hd6OKVROuFqJgotB4LPhNO72Vq7v/VROG6
	S1uQ==
Received: by 10.182.48.69 with SMTP id j5mr3810509obn.17.1354115404476;
	Wed, 28 Nov 2012 07:10:04 -0800 (PST)
Received: by 10.182.48.69 with SMTP id j5mr3810413obn.17.1354115403477; Wed,
	28 Nov 2012 07:10:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Wed, 28 Nov 2012 07:09:43 -0800 (PST)
In-Reply-To: <1350481324.3259.185.camel@phil-desktop>
References: <1350481324.3259.185.camel@phil-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Nov 2012 15:09:43 +0000
Message-ID: <CAJTo0LYHS+j4s_=+2t1v7yXQ6tPxkStOwMJUsAOy9U3BXoN2SA@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-Gm-Message-State: ALoCoQnltFujKZio10XF9RfqHrLfiqmYl0v1unGlH9Txlh82hg51i5jaAjEWa8j4oTGDLc+cVp8Tic+1ruoqeErCIem0uD/DiJWgRVlv3qwN0bSgt1wTcd6dNRSFAS2eyKTO2Kzxs2Y3twiH2xWRUtdeg75Tty4LzSQgpzCkNF7fPEoziqnF4ETcuMYNOOS9HDyBj8tIujOW
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] autotools: Don't install .la files if the distro doesn't want them
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
X-List-Received-Date: Wed, 28 Nov 2012 15:24:23 -0000
Content-Type: text/plain; charset=UTF-8

On 17 October 2012 14:42, Phil Blundell <philb@gnu.org> wrote:
> It's not obvious that libtool's .la files serve any very useful purpose
> on a modern system and they can be positively vexatious under some
> circumstances.  Make installation of this stuff conditional on the new
> "libtool-garbage" flag in DISTRO_FEATURES and backfill it for existing
> distros.

I never saw a patch with a less inflammatory (albeit accurate) name.
Libtool has been causing me pain again so I'd love to turn this on.
Is this still good for merging with a different name (libtool-la?)

Ross


