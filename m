Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQdxe-0005AE-T4
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 14:51:59 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so5108589ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 05:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9OXcM9o6RZHy71jduScmvYigjv6tglBrttScP4OVfuE=;
	b=fifO2pNcBP8H9Hqrm6kY8ExKmRRTG3kbkLyvDLwrLmRGZX9GqCg0sn5x2H3QK6L7cj
	85z9vC3Wjiac1fqgmuSkE7HzqpHipwRnHUBf877+MosbTZhhmiUJH6EXDZYXpgQ4Vgez
	7hsd1WQt/Oy3hgvjlu6BHGWRMQsPDokrHlipOv66HPr/tY05oXDNmmrOZHUTxKLAHV7A
	r3j7vIpdNgPqXZq5gRU4XyJ6TfMI2Y1+AVofsJy1AgMzqSWd+ZEpXsDxNSFwaulOaMm8
	0z8NKEXO/XVH72dy6wJwBD3wHQmenYb/F3q2QOU2SszhW4gvdXzfzp/7SoMIo8kA0Cwg
	jNHQ==
MIME-Version: 1.0
Received: by 10.50.236.6 with SMTP id uq6mr12693251igc.50.1350995912366; Tue,
	23 Oct 2012 05:38:32 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Tue, 23 Oct 2012 05:38:32 -0700 (PDT)
In-Reply-To: <1350991343.22340.43.camel@ted>
References: <1350975871-26719-1-git-send-email-schnitzeltony@googlemail.com>
	<1350975871-26719-2-git-send-email-schnitzeltony@googlemail.com>
	<1350991343.22340.43.camel@ted>
Date: Tue, 23 Oct 2012 14:38:32 +0200
Message-ID: <CALbNGRS20RGCEu=e9+TNbLxK2=+daj=ttvjhpni4YdjJDcBLcg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] gnome-icon-theme: fix icon mapping
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
X-List-Received-Date: Tue, 23 Oct 2012 12:51:59 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 23, 2012 at 1:22 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Doesn't this need a DEPENDS += "libxml-simple-perl-native" or whatever
> the correct name for the module is?

Sounds reasonable. Subsequent patch or V3?

Andreas


