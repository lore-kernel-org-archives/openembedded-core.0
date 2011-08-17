Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QtYnL-00026r-6W
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 07:36:03 +0200
Received: by ewy5 with SMTP id 5so280389ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 22:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8cZmSWKhIAmP5fkQzKzs+bjfHCf1WYw9wnrLAO1RlRI=;
	b=SKEPqHgU8cVkDBvuk/8l1R1tuIYKeX7MT0sV3DNU4+GRDaN6CY/O4exnoIdqlnIuTn
	4aBdLtTNQExzLhhO9cMbWmTGDNZ88OWrrGmm7solrfJKvwpQxMP/CeP1RsMRVuMJdloA
	nTqpZxmZM/wpICvhQmAGw9BaBx9Rq/VKJETbU=
MIME-Version: 1.0
Received: by 10.213.26.219 with SMTP id f27mr1099120ebc.76.1313559085117; Tue,
	16 Aug 2011 22:31:25 -0700 (PDT)
Received: by 10.213.106.8 with HTTP; Tue, 16 Aug 2011 22:31:25 -0700 (PDT)
In-Reply-To: <CAMKF1srp=45++6LUkqkB7CL9oqthEeGF_8+=siH75SrEpgkczQ@mail.gmail.com>
References: <1313547374-10263-1-git-send-email-agnel.joel@gmail.com>
	<CAMKF1srp=45++6LUkqkB7CL9oqthEeGF_8+=siH75SrEpgkczQ@mail.gmail.com>
Date: Wed, 17 Aug 2011 00:31:25 -0500
Message-ID: <CAD=GYpaCSZnKTRaM9Q58-a_fTG=2U4a_paqiQgGuOmwBvnZZAQ@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: jdk@ti.com, k-kooi@ti.com
Subject: Re: [meta-oe] [PATCH] gnome-system-monitor: Add dependency on gnome-icon-theme
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
X-List-Received-Date: Wed, 17 Aug 2011 05:36:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 17, 2011 at 12:14 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Aug 16, 2011 at 7:16 PM, Joel A Fernandes <agnel.joel@gmail.com> wrote:
>> Without this, the configure stage of this recipe fails with pkg-config not finding
>> the gnome-icon-theme package
>
> may be you should bump up the PR to ensure a rebuild

Hi Khem, Actually it didn't build to begin with. In this case is it required?

Thanks


