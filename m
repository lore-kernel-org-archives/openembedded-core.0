Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPzLC-0001NY-NS
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 18:57:18 +0200
Received: by wgbds1 with SMTP id ds1so494444wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 09:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=DvCwcShBclPTTAg+BKXkBiSk0fifhE6Ll3aHRVVslOo=;
	b=ZpYUPqJno7Tawvcvatb4Ur+P0i/mOySxHBCIcnwPIK6n1WI63GPgffoG8hfPxoXh6a
	wXqrLfhGtx9sPU83zPEXiOiWmv9op6Q9cBIZJq5FKKVWuEK0SJWOoWHrTmRy3er7ezWa
	Rdkw7kLt24K0B6eS9/yMkQjllKtEqAH1JK3IQ0e8fIVmZuMCNPUheIYtei41YVQlU9f9
	PixV2FnJOv2OiMzSH0+SFok2k7Dre2zKdJbepD4gkK7FAAArerR5Tm42ZdoaHHVg7jRA
	BE6+pT35PfPAvEL4GylWdrLFuER25RkfT3uTbcd2wi9h1CyjXVOqGBJliMsgwahaPcdF
	RfcA==
Received: by 10.180.24.35 with SMTP id r3mr5014865wif.7.1336063653179; Thu, 03
	May 2012 09:47:33 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.27.148 with HTTP; Thu, 3 May 2012 09:47:12 -0700 (PDT)
In-Reply-To: <CAMKF1sqiSO9kz3-0fKV+XDpB8+v2+pph_rZgRb6xof3OSHjTWg@mail.gmail.com>
References: <e6ccd54276855728be4e18f3fab28136736963a1.1336015963.git.raj.khem@gmail.com>
	<fb85f4acd897466f053198dd9606143b90c14c66.1336015963.git.raj.khem@gmail.com>
	<1336055718.30113.125.camel@ted>
	<CAMKF1sqiSO9kz3-0fKV+XDpB8+v2+pph_rZgRb6xof3OSHjTWg@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 3 May 2012 09:47:12 -0700
X-Google-Sender-Auth: uyzsiEePqHe_fXBOjJw8_5MiAGw
Message-ID: <CABcZANm5muqfeq6hDnA-qUsMX+hof=BvdXA6THAnBvLCjUK5zA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] qemux86-64, qemux86: Override XSERVER variable
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
X-List-Received-Date: Thu, 03 May 2012 16:57:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 3, 2012 at 7:46 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, May 3, 2012 at 7:35 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> We probably want to keep the weak setting but do it by fixing the
>> ordering so this happens before the include of qemu.inc...
>>
>
> Thanks. I have revised the patch

??= may be of use here (though I haven't looked at the files in
particular, it seems appropriate)
-- 
Christopher Larson


