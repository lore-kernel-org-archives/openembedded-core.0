Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1T1UCJ-0002mv-7v
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 05:23:07 +0200
Received: by qadc11 with SMTP id c11so3105387qad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 20:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=eIwdOu1DlBZktjuhQ7V7XmMNuxzJK00ShCyO3rR5e8I=;
	b=OZ59kXeqlAC85YySq1+PjJYhznu1PORWyVaPzdv9/rXp+op5VBhIQ2w+wswZMbDVCD
	hj6km51he51zn6iVzFS1jDd5VAZzgxO6S4344oemUDxxZahybqftcNZcKihGIyF9Npqi
	Ga21Y2xS8f6IQVQCI9dLi8ivFhC9leBibJ30fv57hBaajBYshJOAVb2KPhBWsLNQtoD2
	ea1jXbGpPS02wWkIY6Jk5gbCubk4H9nNZ26Z7kEcgcUUHlQm5ij4ncJTuRU9/hHVEwiz
	9GweIHt4QtiibY7MeBKIBuk2ogmxj9YThqbVGjCuKFr1PfDBpHfiww+PoqOXopwZS8/L
	JQdQ==
MIME-Version: 1.0
Received: by 10.229.105.100 with SMTP id s36mr420547qco.88.1345000271112; Tue,
	14 Aug 2012 20:11:11 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Tue, 14 Aug 2012 20:11:11 -0700 (PDT)
In-Reply-To: <CAEsOVNcP1hf8OqHqDYmt1QJTQ2S557-HjHOa5ihNxVt-veaqOg@mail.gmail.com>
References: <CAEsOVNcP1hf8OqHqDYmt1QJTQ2S557-HjHOa5ihNxVt-veaqOg@mail.gmail.com>
Date: Tue, 14 Aug 2012 23:11:11 -0400
Message-ID: <CADkTA4Ox5KqWoBFMa5k6HObyMYBK7jNThakNO6AKS04zLRPM4w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: perf on older kernels
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
X-List-Received-Date: Wed, 15 Aug 2012 03:23:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 14, 2012 at 6:39 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> I've had to fix / hack the perf_3.4.bb recipe to get it building on my
> older kernel. Should we add perf_3.0.bb recipes in oe-core or my own
> layer? Or try to keep one recipe working for all versions? I have no
> strong opinions.

I'd prefer one recipe. Liang sent another proposal earlier for a fix
that should make
it work on all kernels. Just waiting to hear on that at the moment.

Cheers,

Bruce

>
> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


