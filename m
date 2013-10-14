Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8498B6D10A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 17:41:25 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id gx14so5966619lab.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 10:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=XarGI2p1rqvKwWyjgrQq+6x0HEu1e5Xl6TNCw5452xg=;
	b=Vhnnwltsf8zuLipm0vQA/ry3QKguX7ivX9eLzKYsF1Y4dXuD1GHlXilPSNww1QE+EG
	+b+aemW65jQRzZB8u24ukm/26OJJjlugXPodYNcFPOBD9wTqXYaqwS7mEMYNFwtgL2zL
	qk/zajXLYqH+OVLL9xcj3qp/ufU0mW2NB4BCMsPAbyhO5nxZrYcJEgCAh27XrF2UTsI2
	YR/miZKuBVK8Hq5bHik3ief91QsX/wxBrnnV5127n6VH+ipqBR6pxOiNgslVid8bQWde
	aMGhYonrZxWw/fjVUeO68Fos5ji8M4MK3njIkv5UELgK9+WIwbYmr2/TgZ9mVXyvKoW3
	r69A==
X-Gm-Message-State: ALoCoQlo6dOd7H2h9pnjOBvAF6ZxujQtBn7lvDyuiXzYw3ArmpGHQ/fv5x3J2oguVafzb6a4qASv
MIME-Version: 1.0
X-Received: by 10.112.172.137 with SMTP id bc9mr31543188lbc.21.1381772485494; 
	Mon, 14 Oct 2013 10:41:25 -0700 (PDT)
Received: by 10.112.173.66 with HTTP; Mon, 14 Oct 2013 10:41:25 -0700 (PDT)
In-Reply-To: <20131014162423.GF27046@denix.org>
References: <1381573062-29065-1-git-send-email-fathi.boudra@linaro.org>
	<CAP9ODKoO7xmkw0X39a7J2gQdzsjneBHLbV6hyF2JKKrvCaKDVA@mail.gmail.com>
	<20131014162423.GF27046@denix.org>
Date: Mon, 14 Oct 2013 20:41:25 +0300
Message-ID: <CAGNsrLD_VcX_9PKJUHnM6J5XVFXXeLSMrJn-MVZibNRqGUCXCA@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] openssl: add Aarch64 bie-endian support
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
X-List-Received-Date: Mon, 14 Oct 2013 17:41:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 14 October 2013 19:24, Denys Dmytriyenko <denis@denix.org> wrote:
> On Sat, Oct 12, 2013 at 02:59:19PM -0300, Otavio Salvador wrote:
>> On Sat, Oct 12, 2013 at 7:17 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>> > Signed-off-by: Victor Kamensky <victor.kamensky@linaro.org>
>> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ...
>> > --- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
>> > +++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
>> > @@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
>> >
>> >  CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
>> >
>> > -PR = "${INC_PR}.0"
>> > +PR = "${INC_PR}.1"
>> >
>> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
>>
>> Please don't change PR here; this is not need anymore for general use
>> (but exceptions).
>
> And please correct the typo in the subject - it's big-endian, not bie-endian.
> Or did you mean bi-endian?

no, it's a typo (read the patch). I have a better fix to propose. this
one could go in the trash.

