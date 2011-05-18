Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMdWh-0002Nk-Ni
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 11:58:47 +0200
Received: by ewy5 with SMTP id 5so405756ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 02:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=5GSnyEliGul1e630SuS7+ljhH7zk8FDdqS5fbLlOIcU=;
	b=QTI8LltxIn93ha8yIC4hIs4xO/E+0Xsg45VVCgla6iRhMG9St42Wszlt8z6RCW3wCV
	mmC2zi4zlHmVe7mltSiecPL+SCNRlWln9Bgm5jf4MS8SFBsbYnp9WT0QwGvEpPkoqLI0
	K34bClgQi2GnnK8eYmTIX6kWpb6hseyb4Huuc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=uviNTI+6G+pB44lv8+ML2hlJ/GRnWNl2/yCJ63+MKV/ziPvFwiUWCQOe+MoT//4jhM
	mEDZJx4GvANXQ5udBIjsDiYXdjvDDzUv7I+TkDaFkVXwP94Ydl5kh6ejg5FvDm8+SECz
	f9HUdtxgg4Q6LIrdL0Z6Vn6q5OHwIMBNYaQaw=
Received: by 10.14.9.18 with SMTP id 18mr607365ees.236.1305712553277; Wed, 18
	May 2011 02:55:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Wed, 18 May 2011 02:55:23 -0700 (PDT)
In-Reply-To: <BE336ACD-3C70-4797-B667-9BC3ACCE153B@dominion.thruhere.net>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<1305591231.3424.152.camel@rex>
	<20110518074909.GA31650@sakrah.homelinux.org>
	<1305705436.3424.299.camel@rex>
	<20110518081234.GB31650@sakrah.homelinux.org>
	<BE336ACD-3C70-4797-B667-9BC3ACCE153B@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 May 2011 02:55:23 -0700
Message-ID: <BANLkTi=N9VvPvEDC1tHrJ0P5hOCX9izSpg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
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
X-List-Received-Date: Wed, 18 May 2011 09:58:47 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 18, 2011 at 1:47 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 18 mei 2011, om 10:12 heeft Khem Raj het volgende geschreven:
>
>> On (18/05/11 08:57), Richard Purdie wrote:
>>> On Wed, 2011-05-18 at 00:49 -0700, Khem Raj wrote:
>>>> I think we need to globalize libc variable like MACHINE or MULTIMACHINE
>>>> and we could check if PREFERRED_PROVIDER_virtual/libc == TCLIBC or not
>>>> in base.bbclass for sanity. Something like attached patch might be
>>>> able to do it
>>>
>>> Having assessed how many places in the system we'd need to make this
>>> kind of change I'm now of the opinion its too great. I think
>>> manipulating TMPDIR is a better cleaner solution and we should inject
>>> this there...
>>
>> hmmm ok. So we delete these definitions from tclibc-uclibc.inc
>>
>> DEPLOY_DIR_IMAGE = "${TMPDIR}/deploy/images"
>> DEPLOY_DIR_append = "-uclibc"
>> STAGING_DIR_TARGET_append = "-uclibc"
>> STAGING_DIR_HOST_append = "-uclibc"
>> SSTATE_MANIFESTS_append = "-uclibc"
>>
>> and append define
>> TMPDIR ?= "${TOPDIR}/tmp-${TCLIBC}"
>>
>> should be enough
>
> Like this: http://patches.openembedded.org/patch/4229/ ?


yes exactly looks good to me.

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


