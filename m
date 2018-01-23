Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF6A7852C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 21:39:44 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id r19so1203171pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 13:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TFIzr+LtKpjXqwTuNJwNmBqmf++JFGF7nTP+G0nw7FU=;
	b=SDjiaKeKKxaMEUFOmGh5UHoWkIZMfbCh28NGKEZjKXJuAZbaFl+ng9R/5eofNVOxHN
	9Rc9CyQmIX5dMAkO3eoH8k0Bfb8dkNcUbpqfqC5ll7pnL5g9dscRHinWjZ2DvtmfRx3+
	BSoI1PDozgDbVgZCoNbDPQX0O3DZCzQ0G4aEP7ph6MJfpQnLDia2Ut2Gfc4fYwTA5wmR
	MqC8BVwWAqiAoFVxT5p8wY93p0BVVpfNBROkvD3gEkLeYli4a7LtigTIaek4DLrd0s1U
	9S4doiK8oz4fbDMYdA865nUdUEEiSymhZBbCNzjmaJgYJPXTu7OYOd+QV5m6RRcnCrAx
	JIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TFIzr+LtKpjXqwTuNJwNmBqmf++JFGF7nTP+G0nw7FU=;
	b=qoJ4BoOd61Ifbc47uj7MX5ZdVletXUOhB1NE063YjcljSIGUO9WDEhHJfPJw3dgHB7
	cBMYF+Hz2L7qJh1kqYASDSvGhSupTMUOgjTTxic673Kg8G8TJcN/Fx0fYzLv92InvePc
	4gqer2U9tfbALx1rWwQkYB+A1L+c6/UU1/T7iK1DtfyaNyC6BKrCAI0NlwBUkj/16FWG
	5nHLm4w/TS5ogXv8L/BOT52wvE1Ec/fPT0+wApOzfH1/UVtFaSAGQoOpkD+Pj7pAQCZb
	EbMzO9r94fYh7aUCk1uMI4A7ckJJBTB569vuJG1TgRlEVuJK0PosnzLVXUVVVtiKz8Lm
	+frg==
X-Gm-Message-State: AKwxytfJafqxUOM/uvvaxndvkVybufQQXqJKGKZFlK42/YR8K1Exxy38
	0q2cSTo8f/OtPwH0WDG41jmfZhg6KzJyW0DzIB8=
X-Google-Smtp-Source: AH8x226WXdV1entL7eLMqFyizb+K9+RMbu3rKPuzIL7XJynd6KZZ5YWS+0XZNqg4PdAgFqnbGvq63sOiWkqkirs0CMQ=
X-Received: by 10.98.156.71 with SMTP id f68mr11258952pfe.29.1516743586232;
	Tue, 23 Jan 2018 13:39:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Tue, 23 Jan 2018 13:39:15 -0800 (PST)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B64051B447@ORSMSX112.amr.corp.intel.com>
References: <1516661989-26346-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spfw=Z6UJRM6x5GD7bUs=yJdTe2YbDT3n4naBM-0_N6+w@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B64051B447@ORSMSX112.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jan 2018 15:39:15 -0600
Message-ID: <CAMKF1soaz0h4hsK-L9RSZKqyTvHL4yXVbdWYUkkovsqnNC3d3w@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libc6: improve reproducibility
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
X-List-Received-Date: Tue, 23 Jan 2018 21:39:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 23, 2018 at 2:44 PM, Bystricky, Juro
<juro.bystricky@intel.com> wrote:
>
>> >
>> > plural.c: plural.y
>> >         $(BISON) $(BISONFLAGS) $@ $^
>> >
>> > If the above rule does not fire, we use a "fallback" plural.c, otherwise
>> > we use plural.c re-generated from plural.y.
>> > The fix is to always require bison to be installed and unconditionally
>> > re-generate plural.c. (This is achieved by touching plural.y).
>> >
>> > [YOCTO #12291]
>>
>> 2.27 will be there for next release. So I wonder if we should just wait.
>
> AFAIK 2.27 will always generate plural.c (plural.c will not be part of the distro at all). So "touching" plural.y is not needed. But we still need to add bison-native to DEPENDS
>
> DEPENDS += "gperf-native bison-native"
>
>

right. perhaps we should apply this patch and make a note for 2.27
upgrade to drop the last hunk

