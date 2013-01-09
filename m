Received: from mail-ia0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TsxQC-0004Wj-Py
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 16:18:30 +0100
Received: by mail-ia0-f171.google.com with SMTP id q36so998330iaq.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 07:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=9XDhc/KipHQo5oY9ln6lAXfGGM7OJmceVTFxPG6HI3M=;
	b=yEqP0ROXvk0v34BTVp0BBrWFKiF9sb34/5ti4RKnbb+2xK+wCRL6vgQqE/7QvkiycG
	kL7rqDAH6DXuDEdGAluzkjy2b1kstwDJ+pWSy7OVUVVIRKJXd9I3CD7M7R1y3W1QlqYQ
	M65tgnwYxaPLXj1kenU3rNpFx12VH8DqcT+OZ64NQ3nMK+xJ9k/QjJDpppasIGbK4D8L
	vBuxRrgJR5uD8ZAM4PnuJqVyqwQRy1f8h6oDBxSeIHofZGqktBTd3mspLTeGl0JEzb9K
	9e6bqJpxD5CMULgAR9FA0ASZjPTeCDsF6IyBZ1jgZogmAxWaHok1KyDNsgV5lJVt49YE
	EJHQ==
X-Received: by 10.50.169.106 with SMTP id ad10mr1889361igc.88.1357743796239;
	Wed, 09 Jan 2013 07:03:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Wed, 9 Jan 2013 07:02:45 -0800 (PST)
In-Reply-To: <50ED85D4.9000806@linaro.org>
References: <cover.1357343832.git.raj.khem@gmail.com>
	<50ED85D4.9000806@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Jan 2013 07:02:45 -0800
Message-ID: <CAMKF1srWtx55LRNM6_Dkrfsvb3N-kLnpNofjPwx8eeNV4TnMqA@mail.gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 0/4] eglibc 2.17 upgrade
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
X-List-Received-Date: Wed, 09 Jan 2013 15:18:30 -0000
X-List-Received-Date: Wed, 09 Jan 2013 15:18:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 9, 2013 at 6:59 AM, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> W dniu 05.01.2013 01:00, Khem Raj pisze:
>> I would like folks to try and test this upgrade. I have tested it on angstrom/systemd-image
>> booted on all supported qemu images.
>>
>> This is however now the final set since I have to put the 2.17 tars on
>> downloads location
>>
>> Please try it out in your configurations and let me know if you find issues.
>
> Other than meta-toolchain I did not found any new bugs while built for
> AArch64 target.
>

cool the patching error is now fixed. I have updated the contrib tree so if you
reapply the patches then meta-toolchain issue should be gone too.


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


