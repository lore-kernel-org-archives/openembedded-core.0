Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RiZb1-0001rk-5i
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 23:46:11 +0100
Received: by lami14 with SMTP id i14so6376625lam.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2012 14:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=zl4tTRhia/m1I+sEsl9wZfcIcLmktUWXNUuD+CAwwPk=;
	b=jUsFqCeAGY7DUwtVuwD9OUMas4Ve1rahDbco0T829jPIdS6aWp3lM/PBXY9TqaZkFT
	lP6jd65Ur8+JMMNR1/heuzTmoBfVFzj+gq2R8DgD2Siz+FFFbyIwyscXOCiZX0Tj881A
	SYgLlQm0q2A7xzvxM/qfoxFsKVGSUHzGX/Df4=
Received: by 10.112.24.4 with SMTP id q4mr328069lbf.80.1325716725285; Wed, 04
	Jan 2012 14:38:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Wed, 4 Jan 2012 14:38:14 -0800 (PST)
In-Reply-To: <CAMvUbCzvVSiLqKPsMx1PyLHnaErKwd2R+nRZqbmLPtRfpoF=YQ@mail.gmail.com>
References: <CAMvUbCzvVSiLqKPsMx1PyLHnaErKwd2R+nRZqbmLPtRfpoF=YQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jan 2012 14:38:14 -0800
Message-ID: <CAMKF1sqTpGDnzM=L3k25ipw1wCJGFRttbpVrMXF=ASDH5iXweA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-openembedded: avahi-ui-0.6.30: 'Fetcher failure for URL: 'file://fix_for_automake_1.11.2.patch'
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
X-List-Received-Date: Wed, 04 Jan 2012 22:46:11 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 4, 2012 at 1:26 PM, Leon Woestenberg
<sidebranch.openembedded@gmail.com> wrote:
>
> I cannot spot the error, other than that the patch exists in oe-core, but it
> required from meta-oe. That should work, shouldn't it?

I dont think so unless you have the oe-core locations in FILESPATH


