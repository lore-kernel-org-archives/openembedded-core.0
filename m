Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1IUY-00005X-LQ
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 16:25:48 +0100
Received: from mail-vc0-f197.google.com ([209.85.220.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 07:08:22 -0800
Received: by mail-vc0-f197.google.com with SMTP id gb30so5531860vcb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 07:09:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=7F7nKMfUKFeNCyBObCgqB+2vjy3XRweerPiVZI0vcek=;
	b=AM0/bnpDVSlehUzCWnocGh6xYIkr1Cemg/VQn6pKxTvbqi+8d32wWOZq6bSsbU0bdf
	E2FadSDkK/5nJ3uRzsb5UDPNP9qCIdaAPjSBgbt9bGhvG0e/SVM3IcFLpshhOcGFFQnT
	nEIMzZhYGiyOn8ZOvhyld/G1o4H6DEyo/GaqOD1d5VQ+YQ477FXx5JvdlHRP8uYAQM1B
	KAUihY6uBE+qcFgjg/w8gPJkFqJ1SFeH7ShErewW71A7rarQnyEONkyrG+Knm7KNn+Ba
	OA3yGeDln8tW6Vv6z+h8j1UNPydFaZBG0PBnL6EMiO61qJZXSEAwjuBmA1nlfPjn1Uqn
	91eQ==
X-Received: by 10.220.115.72 with SMTP id h8mr11446052vcq.43.1359731374291;
	Fri, 01 Feb 2013 07:09:34 -0800 (PST)
X-Received: by 10.220.115.72 with SMTP id h8mr11446038vcq.43.1359731374100;
	Fri, 01 Feb 2013 07:09:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 1 Feb 2013 07:09:14 -0800 (PST)
In-Reply-To: <510BD7AD.5090506@topic.nl>
References: <510BD7AD.5090506@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Feb 2013 15:09:14 +0000
Message-ID: <CAJTo0LaaHc7Y9ZyFkuktBE02p9D4aeju0nOdFWAtMH8rdVXyZw@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQk7S68rRxrNSazwrzlEgg9rscd9g/UBcxw7jkXLsZGXqBVzq5kKGfPAczAx+V/Bn3q87quopM8X5zsqOEsyov0mNIyT7F7pvuaQaBGYanQf9HWuvwSQrxcgjYTFYW/pT7MJIDtJeh662Kv4v1TO+xL+9a9Y4Lio3hDR4ZcId0siqL5WUk9weaJEYRdREQSLqNunFK2r
Cc: openembedded-core@lists.openembedded.org
Subject: Re: What's up with "fontconfig"
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
X-List-Received-Date: Fri, 01 Feb 2013 15:25:49 -0000
Content-Type: text/plain; charset=UTF-8

On 1 February 2013 14:56, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> I have no idea what fontconfig is supposed to do and where it is supposed to
> run, but it looks to me as if that configure_append should not be there at
> all.

Erm, yeah.  The git log that file stops in 2007 and they were present
then too, so the appearance of them isn't easy.

Fontconfig is good old autotools, so I expect we can remove the
--with-arch argument too.

And the method of appending to do_unpack is unconventional to say the least.

This recipe needs a good spring clean!

Ross


