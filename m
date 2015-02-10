Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id ED0076E593
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 16:17:54 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id t59so7937436yho.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 08:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=uFgO/G41Bv+/TCa1tex6lxdZVJsXk1J2mLaTK/EtWog=;
	b=WgoKtXqbW14m9HOzXc+oRFbLXCBWjy51EtJLPKLNo32JzhtFzWU7onRcvXSfG76Eco
	+GXRxjdCGF7+IrFy1UGIcTXantRH3DAflswWx65L4A0B1eMJBuNPZUuG8BigyTlUI+0H
	mAuJlUr6VOh4QMbwpj1ZmSyigVnX1ylFtG4LIJNGvWBYlS8Q2kgC/PrmUE1Z+Gdcw+c/
	oc3QVJMPd5blctFssxNag8zdYiUFbawo4mOhUe9oiIpr19tU4CmoueFw7doH3xpXdnMt
	NVFABjsD2iYPx/OBVLBMzJwEVAU7P5PqqUF/gdJsEWms9JvWx+0tP3A2SEIvRQKJHTuN
	UTfw==
MIME-Version: 1.0
X-Received: by 10.170.74.5 with SMTP id q5mr10303211ykq.30.1423585075730; Tue,
	10 Feb 2015 08:17:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Tue, 10 Feb 2015 08:17:55 -0800 (PST)
In-Reply-To: <CAJTo0LZHiTSkhv9YPobmssY_szH4jyzBeUXVyZnnTGYo5oAf4Q@mail.gmail.com>
References: <1423584126-27786-1-git-send-email-denis@denix.org>
	<CAJTo0LZHiTSkhv9YPobmssY_szH4jyzBeUXVyZnnTGYo5oAf4Q@mail.gmail.com>
Date: Tue, 10 Feb 2015 14:17:55 -0200
X-Google-Sender-Auth: u66kPGhOMPk_woZQ165EPz_FYGY
Message-ID: <CAP9ODKogEuxRj0QoO-t5S3svVq9gYUjceBg5LfBrXS8k54US_w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH v2] u-boot: update to version 2015.01
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
X-List-Received-Date: Tue, 10 Feb 2015 16:17:55 -0000
Content-Type: text/plain; charset=UTF-8

Hello Ross,

On Tue, Feb 10, 2015 at 2:16 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 10 February 2015 at 16:02, Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> +DEPENDS = "openssl"
>> +DEPENDS_class-native = "openssl-native"
>
>
> That *really* shouldn't be required. :(

I agree it is not needed and it does seem to be a fail in meta-fsl-ppc
which should be fixed there.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

