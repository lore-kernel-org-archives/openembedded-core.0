Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by mail.openembedded.org (Postfix) with ESMTP id 014BA7451E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 23:17:06 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id a134-v6so1663886lfe.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 16:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=InixJubM/stF8apE44hCh1ZUwRPKLfa53HXRcnBZ9to=;
	b=q7OlR6kKqrJCbdfajPFh1iun2bSjmll8f/Eh3Q9FMXKMN//vL2mfMFJAZveDcjaTqn
	L0IqzhWg6pwzeI8+LSZ4dFJkPPNkD67NRzNnctHIR59nvzxgRNy9VBf/neVBqufPI2hs
	nVCjdHJQUGSDbEDFG/+L46ixRbVGTSWGwMrS7lCJLhqsTreZ0yHQCm2cJOiA4AnXQ+Qj
	L/6NKgZKwnWQ9pxOT7gnGGwajbIcZEVGxRxIzaIRM8+NjMJphknWZgWHyVm+0bTITG2w
	/bqSaFy4xAGTjX+oKXAkoPwnSus6KYvOYaMjUgu1Qhvdd8j4wdklZDvGbiU10+vBW9LU
	2HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=InixJubM/stF8apE44hCh1ZUwRPKLfa53HXRcnBZ9to=;
	b=aVXJ7qqjP836jZQAFriH0DA44baHimmKsbmEYgSvPh8ehRp54pu/5sa8+AbJ/ah4As
	eGvbrHTwG5YjOcvRw4FS1GyjSVFCwkP/ZIwtT8rsVYDaMd4/OZ19sX7Kf7YviNKPPbu/
	ZS1LIGZr6w7Be/KKLR7FI4Z87689+rRNyEsDjjDBBNzTSt/JbTtazVDpmX02BjaSdrap
	XjzmgWuJ5KI2lbYw366pbLXg+2H49/EaQ9kW1idj16F+kS9wROl9WyFDOHHrc8Hgb+in
	gz565GbzmrylbrV6eAsq9xi9ffm8v9IOK4OXnokHl9S0lso74sjAz5UPXTEjtj2PGoHZ
	BsNA==
X-Gm-Message-State: AOUpUlGSR5YG5IBpcyjvXq29JncLlQoaPHGrmSggI0TED0JcZaj2Cqcc
	+9V/KOLLJIsbr+MiAdD3h4PvLjTDik5b11ZQou0=
X-Google-Smtp-Source: AAOMgpe+GnnfF3VDQ7z6kShCB41zCbt1+ruTWlqNnguCSLHXBp6Ou89XqLJclKlR1v+lHGVbNpBwJ7REYIacNqfbE08=
X-Received: by 2002:a19:1190:: with SMTP id
	16-v6mr9138183lfr.122.1532387827600; 
	Mon, 23 Jul 2018 16:17:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:859a:0:0:0:0:0 with HTTP; Mon, 23 Jul 2018 16:16:37
	-0700 (PDT)
In-Reply-To: <CAJ86T=XuEUrsb8gZAXmh3m+sXFpU2T=bXqNRhjLYUNCH9DNtDg@mail.gmail.com>
References: <20180718225304.28673-1-alistair.francis@wdc.com>
	<CAJ86T=XuEUrsb8gZAXmh3m+sXFpU2T=bXqNRhjLYUNCH9DNtDg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jul 2018 16:16:37 -0700
Message-ID: <CAKmqyKNrUdU9wcUH8no9J_XNE=4ztujQ95tap7Zk5HBWv9XT9g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: Allow custom coredump config options
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
X-List-Received-Date: Mon, 23 Jul 2018 23:17:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 18, 2018 at 4:48 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Jul 18, 2018 at 3:53 PM, Alistair Francis
> <alistair.francis@wdc.com> wrote:
>> If the user has enabled coredump let's allow them to customise the
>> config options.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  meta/recipes-core/systemd/systemd_239.bb | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
>> index 7822548993..a625d060a9 100644
>> --- a/meta/recipes-core/systemd/systemd_239.bb
>> +++ b/meta/recipes-core/systemd/systemd_239.bb
>> @@ -279,6 +279,18 @@ do_install() {
>>                         chown polkitd:root ${D}${datadir}/polkit-1/rules.d
>>                 fi
>>         fi
>> +
>> +  # If coredump was enabled, enable it in the config.
>> +  # This just sets the default, but can be used to customise the values.
>> +  if ${@bb.utils.contains('PACKAGECONFIG', 'coredump', 'true', 'false', d)}; then
>> +    sed 's|#Storage.*|Storage=external|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>> +    sed 's|#Compress.*|Compress=yes|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>> +    sed 's|#ProcessSizeMax.*|ProcessSizeMax=2G|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>> +    sed 's|#ExternalSizeMax.*|ExternalSizeMax=2G|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>> +    sed 's|#JournalSizeMax.*|JournalSizeMax=767M|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>> +    sed 's|#MaxUse.*|MaxUse=|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>> +    sed 's|#KeepFree.*|KeepFree=|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>
> How does this allow the user to customise the config options?

They can edit the sed command line and have different options.

>
> By forcing the options to the _current_ default values you are
> creating a maintenance problem - ie you'll still be forcing these
> values even if/when the upstream defaults are changed.

That is a good point, is there a usual way to allow edits to config
files like this?

Alistair

>
>> +  fi
>>  }
>>
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

