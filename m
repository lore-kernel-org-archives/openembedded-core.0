Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A747B780C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 23:27:02 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id e69so768577pfg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 16:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6TMJHLmh1XNruwKI/daHh5rNpGMFsQ8z1gftAkL49IU=;
	b=HT84knsbHdFvo2RE+XmJ7q55OQ44fMjT66gGZnqi5VSgSaNC4xIlN/ldFWBqVbWqjL
	T0ywYtny5exwyDawDdK1AF6lOqHtTxxBMuGDPfj/2Wulqh8S0/ynB/KA+ObNSB9wgV9m
	JDRjhy05L2157wN2NqUHL+FbOaRK3JF7HPiLh/aQ/zzAEDbZyVJmOGwHxVB+jMGWd02Y
	LZILPPNk2fKaO/UCUz9rhPVfMK+DZMBmO7SiX7dwMFulifs47bPmlRQUcrTY/Mq2lRlC
	AWN1M47Awt/UfZdHzBzYyjkDrN55eHiSoRyVrTk2vOoKHSVGd0qsjkcfPfbhi9J+Sg5L
	k7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6TMJHLmh1XNruwKI/daHh5rNpGMFsQ8z1gftAkL49IU=;
	b=Xjzxk6/bgaf/BiT3jQJUzg4cVvksfoNAI9YiOzSrS0gAKspeYDgN/noIXDbz7fgnf+
	pLjdCO0CGxoZGiey8AijUSFZ+Page3FrZ0Qya+DUYHlpaIel/HcPWbYRFbc1bIkXKPvf
	9Q8sic2d7I4E5tlPzLwJmUWl6y7IayyJuW3uu2V0hHME1sXfBVSs0jUor49g/npfjOpE
	kDT3jN0Lsezd6JFMu4DRD+qNGbl8Y4LhxELQcujkjJp8FndCKDj83PPzbpHPWcxw5+Vq
	hZ8oETM4KEB9m4GKRaMOA9Eq5Gt+S5APUSLYX4vv/zyiuF3/3cPOvXCSXBWYUM67IOcF
	bfUw==
X-Gm-Message-State: AHPjjUjDR4Nj2bcHcPS3KRkEZu+vAWvdK6uqvE0rTdNq47vW37W5UAYr
	PyiluU8om0376HI8H1tFkSE0PE1gbN0qUIKESHI=
X-Google-Smtp-Source: AOwi7QCYQhEgc9KX2hpBvyezZrbhVe0mb+V7jfLM2oIwszaYFgdMUGtpMzUti2v7CdF6hnp5PaIFQFPeRFVxSEQGcg4=
X-Received: by 10.99.138.73 with SMTP id y70mr196831pgd.317.1505777224089;
	Mon, 18 Sep 2017 16:27:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Mon, 18 Sep 2017 16:26:33 -0700 (PDT)
In-Reply-To: <b8a7eae3-2b65-e17d-efe0-f7efb113fd38@windriver.com>
References: <007BD92917A2324FA403BCF9A464CF84CF41E3E8@ALA-MBC.corp.ad.wrs.com>
	<20878500-1BB2-43F0-A6A5-087775FC0FAB@madison.systems>
	<b8a7eae3-2b65-e17d-efe0-f7efb113fd38@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Sep 2017 16:26:33 -0700
Message-ID: <CAMKF1spd-DuNQLT+iGCTVWDXcWzpsXyEGtUCeHFz953jF5e2Sg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>
Subject: Re: go-runtime does not build for mips32r2 tune
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Sep 2017 23:27:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2017 at 3:52 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 9/18/17 5:50 PM, Matt Madison wrote:
>>
>>> On 18 Sep 2017, at 2:11 PM, Slater, Joseph <joe.slater@windriver.com
>>> <mailto:joe.slater@windriver.com>> wrote:
>>>
>>> This is the default tune for qemumips.  It appears that the problem doe=
s not
>>> occur for an oe-core checkout just before the split creating go-runtime=
.
>>>
>>> Before the split, go-helloworld will build, but after the split it will=
 not
>>> because it needs go-runtime.
>>
>> There=E2=80=99s a TUNE_CCARGS_remove in go_1.9.bb to remove the =E2=80=
=98-march=3Dmips32r2=E2=80=99 flag
>> that probably either needs to be moved to a .inc file or copied to
>> go-runtime_1.9.bb.  Missed that when splitting out the runtime recipe.
>
> That seems wrong.  We should be using the TUNE_CCARGS, and -not- using th=
e
> arguments that 'go' has decided must be right.
>
> Otherwise the optimizations may or may not be compatible... and if someon=
e
> selects different arguments, they won't get filtered.

go supports mips32r1, and needs fpu or kernel FPU emulation enabled
so using mips32r2 might be fine back when I was adding it to oe-core it
did not work, things might be different with 1.9 release where mips
support is complete in golang.

