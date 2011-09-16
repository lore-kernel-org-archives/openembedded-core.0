Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R4dp5-0004o7-U8
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 21:11:39 +0200
Received: by bke11 with SMTP id 11so6962656bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 12:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=qabjrq933xhlx7hr34jLB88Bb2nXADtJ3svj3w73Egc=;
	b=FswAkEf7nNedWZ1quiLgjVV7rJq7VQx71L6ryBuJS60luFGPPSjZFq/WHiQQVsqiTH
	hekxX3AcoBgkRHKYSFL1G+u+8gdqSpqcKZuNqJWFDBsbgpP1XmcBziO5Sp/wC9fprCJ/
	A0itB71N76zt0+6sZJEnrUpMTSIdUpl9A6hC8=
MIME-Version: 1.0
Received: by 10.204.7.144 with SMTP id d16mr1142520bkd.62.1316199986406; Fri,
	16 Sep 2011 12:06:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Fri, 16 Sep 2011 12:06:26 -0700 (PDT)
In-Reply-To: <201109161849.52647.paul.eggleton@linux.intel.com>
References: <1316177653.20858.23.camel@ted>
	<201109161816.28057.paul.eggleton@linux.intel.com>
	<CAP9ODKoVOSsDOKtiv-LExuKbeGciGp4hfC=V5j-zCY8wDNwr3A@mail.gmail.com>
	<201109161849.52647.paul.eggleton@linux.intel.com>
Date: Fri, 16 Sep 2011 16:06:26 -0300
X-Google-Sender-Auth: PwXFz_BxwUlL-yFGLY-NRJ_V_Uk
Message-ID: <CAP9ODKpqO4zN=gjOsod6UtTku6xZmRen63VBKs+_MOdjF1AAFA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core release process
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
X-List-Received-Date: Fri, 16 Sep 2011 19:11:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 14:49, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 16 September 2011 18:18:43 you wrote:
>> They all ended up in oe-core the problem is when they're not yet
>> merged but I want to merge them into my tree for use, test or
>> anything.
>
> Ah, so what you mean is not that the patches were in poky, but that there
> sometimes were pull requests pointing to a branch that was on top of poky=
. The
> thing is, the patches are exactly the same.

Yes but not pullable directly into oe-core tree.

>> The combo-layer was one example. It was made available on poky contrib
>> tree and I had to manually export the patches instead of pulling it
>> into a branch for testing.
>
> Git makes this almost trivially easy though, and in the combo-layer examp=
le it
> was only a few patches.
>
> Personally, I always post my OE-core pull requests on top of an OE-core
> branch; doing that means *I* have to manually bring the patches across as=
 files
> and use git-am to apply them onto a branch of OE-core though. I think tho=
se of
> us working on Poky know this is the accepted practice and try to do it al=
l of
> the time, occasionally someone might forget or feel that for an RFC patch=
 it's
> not worth the effort; but I think that's the exception rather than the ru=
le.

Yes I know but wouldn't be better if you could base your work on
oe-core and avoid doing this?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


