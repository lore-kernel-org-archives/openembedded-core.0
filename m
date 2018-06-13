Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 81B8578AFF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 12:00:11 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id i205-v6so2055708oib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 05:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e1FlKG4+QOi/7H+vHM28p08nTxIH+u50iF928Hgnbbs=;
	b=LRnp1D1Ap5gVlicsANnkd0XuIWw2w0PQfSSSu4dqAeFgB0uaRdlRT5EEt2msJKc17B
	DtDpsqxVCjB8QG92FsllB0EWn23kaYu6lEZTQ8+u/DbIIsy+I992IR8O8JrjgwQVoJ8l
	S75v5aMpzvWFlYWlDtck5/LTES8YzWTu2c/tQrgn8Q4NaiE/mQK0BMmiRWI4+fh5ZEqg
	Y8jXKlDJ+2/Jkq0PIOcvYGcOa4tzlKIFv01oswIIjmu31fl617JAbsq2fFQMLE67ZvLj
	bQOyswqYEPlrRwfmpfNrakqso5SGHot2EpZc42b8wWOg4iUzGgmwybYXs1/mrpIbFpvV
	N/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e1FlKG4+QOi/7H+vHM28p08nTxIH+u50iF928Hgnbbs=;
	b=H7oqapN6dm0ppFnQu9dcYUVNa6c1s5y4gbRioT7yj94QVf/RF8lx4Z3/8y5QPmi+ZV
	zqDmPBxxR/vE+9SrDX/FdGi89r9ZzGAfSPwj36JRfIe7+Q0Bp3VCiveFmn5339/KiVY2
	Fbgu5DczHw1SSqc14aPjmBFfDWJXLcTjYnBjhqnh5n1SLXUN6K+YSjMK70x3hJwT+hLz
	MOoRikEe1nXdEpohd05/lXgJIf8IKUK+1EM4TNRJJyi8umyU2W1auSXimW1Y4DVEROQ8
	42I8eXVmPO0w84oxjNrUNUNZb+BMVUudkrqtJmcHhJMsOOVYbDvuYAP/qsFFD/uRbuHQ
	N8Rw==
X-Gm-Message-State: APt69E0On4aAizolfrwUdM85Z+CGCyTfUoUhGuH30DE/+gByuqq9MwZW
	t//UDa/bWm9xft9SgfphcNW6whldDxD0mF5J6bwjng==
X-Google-Smtp-Source: ADUXVKIwIq6G88qBQlFNAvi55GawUzbSkLwuEVkvN2Qdakf2CS/po4rQVbkGyfK5CmCiGCf/pWucve0XJAMk2puD/nE=
X-Received: by 2002:aca:5406:: with SMTP id
	i6-v6mr4502064oib.115.1528891212310; 
	Wed, 13 Jun 2018 05:00:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Wed, 13 Jun 2018 04:59:51
	-0700 (PDT)
In-Reply-To: <CAJ86T=V8kntC=VVCuLUiBJDpqgZFDcATr5fLmhin0a4qn6ruCQ@mail.gmail.com>
References: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=V8kntC=VVCuLUiBJDpqgZFDcATr5fLmhin0a4qn6ruCQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jun 2018 12:59:51 +0100
Message-ID: <CAJTo0LYSCpoBCQBbDRfGXBvNVzKNaPFtm-3nhL7OZF4+5sbfYg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] openssh: stop adding -D__FILE_OFFSET_BITS=64 to CFLAGS
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
X-List-Received-Date: Wed, 13 Jun 2018 12:00:11 -0000
Content-Type: text/plain; charset="UTF-8"

Looks good to me, marked for MUT.

Ross

On 12 June 2018 at 18:38, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Jun 7, 2018 at 11:48 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Openssh takes care of enabling large-file support automatically via
>> the AC_SYS_LARGEFILE in the configure.ac, so additional help from the
>> recipe is not required.
>>
>> Even if it were once required, defining __FILE_OFFSET_BITS (ie with
>> double leading underscores) looks like a typo and probably never had
>> any effect anyway?
>
> Ping.
>
> Any issues with this (the whole series of 7)?
>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
>> index 7b6ee5c..7cf34eb 100644
>> --- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
>> +++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
>> @@ -46,9 +46,6 @@ SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
>>
>>  inherit autotools-brokensep ptest
>>
>> -# LFS support:
>> -CFLAGS += "-D__FILE_OFFSET_BITS=64"
>> -
>>  EXTRA_AUTORECONF += "--exclude=aclocal"
>>
>>  # login path is hardcoded in sshd
>> --
>> 1.9.1
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

