Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pusnr-00049O-2o
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 21:37:47 +0100
Received: by fxm8 with SMTP id 8so418874fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 12:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Sm89LLdmOz6NhCURI2cwL8j8+7J0zdJn9Rplwdf5XLI=;
	b=tItq3762lHaiWda9N0LpmqyXHOfQfAGWmGpA5L5luhG0OhcNAQ4hUcAdHFmKRw0HmH
	sOrbm9A6YHqx04KIYIXCiBooec4WbBPsLRf61BHa+z9bE2ugxHVKC0K09QltwGFNH733
	HAs3oHY0kv1rnyZwCDpZOuPliMfEOAwzby1VM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=BYt2T1RJjOy2f8kUXv7HKOW995AOnDqbpiTYOTvUnVFyoti/NvCoD3eYDfGw0t/cRk
	epzSHB/gQU9OEcYIJeSNfHMYUs8UiJGBajSiifbEo1d5Q1AK8w1oTk/Aw5Dp85mDCwHt
	tKa1c5NrdKgvz0rCiOAFo98eJ8Y9xJMePp7dw=
Received: by 10.223.114.203 with SMTP id f11mr454993faq.20.1299098179537; Wed,
	02 Mar 2011 12:36:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 2 Mar 2011 12:35:54 -0800 (PST)
In-Reply-To: <1DF2ADA1-2EC2-445A-A435-684956523715@dominion.thruhere.net>
References: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
	<1299055045-8096-2-git-send-email-raj.khem@gmail.com>
	<1DF2ADA1-2EC2-445A-A435-684956523715@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2011 12:35:54 -0800
Message-ID: <AANLkTinUm2Q6qX4s8gw5BrL1neZLfcKTAsKH352NATxt@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH v2 1/7] sqlite3: Update version 3.7.3 -> 3.7.5
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
X-List-Received-Date: Wed, 02 Mar 2011 20:37:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 2, 2011 at 12:56 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 2 mrt 2011, om 09:37 heeft Khem Raj het volgende geschreven:
>
>> * Imported from OE commit a2c3af2d608b1b713018d688b00e03873a538993
>> * native version of 3.7.3 does not build
>>
>>
>> +
>> +#do_compile_prepend() {
>> +# =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake sqlite3.h
>> +# =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 sqlite3.h ${STAGING_INCDIR=
}
>> +#}
>
> Is that hunk needed? Looks OK otherwise
>

No. its a lelftout will remove

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


