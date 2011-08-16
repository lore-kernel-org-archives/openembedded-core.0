Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtSXW-0005qu-Gf
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 00:55:18 +0200
Received: by vwe42 with SMTP id 42so210625vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 15:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sT1/srfO0A7Q/cttyHpYm+3zbwMtJGfwStnJyEv+yv0=;
	b=pw353TGOadjfJgfFdzszrPXW0vQPlTqkzHqGXULSKzj4FIIEA5mQnc4aiLIG552Zyq
	eTz37ari6metDNomzI4OCGl2o4GHjwClu79Bar39rOIkd6ObbVUCp3w25ZCxDoUF/91j
	rm8Jrdshyirw5tsRA0AxcGaH0gCyZ9Vc4HqTo=
Received: by 10.52.23.225 with SMTP id p1mr309785vdf.186.1313535040366; Tue,
	16 Aug 2011 15:50:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.158.133 with HTTP; Tue, 16 Aug 2011 15:50:09 -0700 (PDT)
In-Reply-To: <1313414185.14274.576.camel@rex>
References: <cover.1313328487.git.ke.yu@intel.com>
	<fdc4b5810c9adedea19d41a7856612201615e99c.1313328487.git.ke.yu@intel.com>
	<73BE3575-4FA5-4C20-9476-A36B9A5422D7@dominion.thruhere.net>
	<4E491589.3030000@linux.intel.com> <1313414185.14274.576.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Aug 2011 15:50:09 -0700
Message-ID: <CAMKF1soK5EuK-6oXWUBVitfbFM_dLeAoHc0ih-QuDqtktT24MQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] gcc-cross-intermediate: revise the 64bithack.patch for multilib case
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
X-List-Received-Date: Tue, 16 Aug 2011 22:55:18 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 15, 2011 at 6:16 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> just curious question, what is gcc 4.5 for, since gcc 4.6 is already there?
>
> Some people are still using gcc 4.5 for various reasons. It is getting
> to the point we should probably move that to meta-oe though?
>
>
meta-oe already has recipes for gcc 4.5 so may be removing them from
oe-core and letting people who want to use 4.5
use meta-oe


