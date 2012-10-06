Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1TKZ5n-0000PZ-PH; Sat, 06 Oct 2012 20:27:15 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so1675547wey.6
	for <multiple recipients>; Sat, 06 Oct 2012 11:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VGQZkiG0uplmrkrZ1F3NoO/SsOF/DnyuEvxOPrAToQk=;
	b=O3YdZlu1MuII94guJhrG7QS4ELye784BRVWFDzpnszPwX3SKq0fUCd+IvXRZgCbuZD
	wL7p1G71CeyfuZdejT3t5q0UJURMtnSt1GwjkvCfu8hpDHAuVuaE62yYxKpJTR/uJbxT
	deEPTUyH8eX9+nT5kQr2gDaTTMdmJH82bO1rYo0pSek4OKm453xQadFHFMx+18e17OIJ
	BY6UsL0alfYvqcBjrQwJWCYas31cjjd2AYaMmKTPx+NqfdzCNdAL6hcv4jetEqNB/hgE
	/OC+8HnZ5my/Qe2mV5ijR1Yfpgh+LrkC+xOayKWGktcY2bTE1x21rq3ntWHcX9u8r4O8
	pwDw==
Received: by 10.216.56.82 with SMTP id l60mr6731627wec.18.1349547251953; Sat,
	06 Oct 2012 11:14:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.56.68 with HTTP; Sat, 6 Oct 2012 11:13:41 -0700 (PDT)
In-Reply-To: <20121006162136.GA24453@jama.jama.net>
References: <20121003114821.8D16410375@opal>
	<20121006162136.GA24453@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Oct 2012 11:13:41 -0700
Message-ID: <CAMKF1spAUgXTptMAdXe=utSRap2_xc6ULuLMA7=QdX0ewis6BQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : qemu: add wrapper for qemu-mips binary
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
X-List-Received-Date: Sat, 06 Oct 2012 18:27:15 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 6, 2012 at 9:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> +# IMPORTANT: This piece needs to be removed once the root cause is fixed!
>> +do_install_append() {
>> +     create_wrapper ${D}/${bindir}/qemu-mips \
>> +             QEMU_RESERVED_VA=0x0
>> +}
>> +# END of qemu-mips workaround
>
> What about checking if mips is in QEMU_TARGETS before doing this?
>

or simply for check for existence of qemu-mips before creating the wrapper

> Right now this breaks all distros without mips in QEMU_TARGETS.
>
> Cheers,


