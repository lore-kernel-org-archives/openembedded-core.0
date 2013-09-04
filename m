Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id DF8E16BDDC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 15:39:58 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id g12so623513oah.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 08:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=LcxlIp1OYaoNUZZQTSwMN8E8nbk8v+kLhMxNSTT+oKI=;
	b=jHSJl5NOW9pm9AVHFMsWNgkVCvBlwdByXT8FyJCc8h8+zBpcgk9YZfuPSNrf3Gr5u0
	ytOG2TXraKQg4Wf+sFE9L0TyQKc4f1h9hinDWrLdMWoi7ZcUrC8RwPwunwLbNsbp00Kz
	LUtlvYJ+LRVm7IG5A9zAYGQnivWAkqp38T51yksyMWr91qFl6orysHxfYOmo4asywZn7
	ZoGpiPJiFfafoG/88F/5INm+2fr/Sz01hJ/ImBoUly0iba0ny9Rasro5OFtS3h/DPbxB
	zA8qoi3Zf/NJ7H0uAHqb7p0+y5Ye0e1bzuMLfcSVVvzDwH7syqvevX48t1OzjxribBsZ
	lkHQ==
MIME-Version: 1.0
X-Received: by 10.60.94.164 with SMTP id dd4mr1259882oeb.68.1378309200159;
	Wed, 04 Sep 2013 08:40:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 4 Sep 2013 08:40:00 -0700 (PDT)
In-Reply-To: <1378299645.1059.236.camel@ted>
References: <CAFpw0gLn_s_SYaj9mMtYJvBfc1dqYEzYcXFn04J9+Xm1UroLeA@mail.gmail.com>
	<1378299645.1059.236.camel@ted>
Date: Wed, 4 Sep 2013 12:40:00 -0300
X-Google-Sender-Auth: wbdRMOJnQWFhD_CTyO5xmKVczD0
Message-ID: <CAP9ODKrEX1CqaPDDpLJNnDjrSzcqZhX43VY6gS4dF4xCHdu53Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC search paths in MinGW SDK
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
X-List-Received-Date: Wed, 04 Sep 2013 15:39:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 4, 2013 at 10:00 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I've shared the result of my tweaks as
> http://git.yoctoproject.org/cgit.cgi/meta-mingw/ btw. I flattened the
> history as I had a ton of now meaningless commits and tests so it made
> sense for a clean start IMO.

Richard, I think it is better if we use Francois repository and don't
make it under git.yoctoproject.org for now. It will confuse people and
potentially people can base work on this, instead of Francois one.
Once Francois is happy with this, it can be moved to
git.yoctoproject.org and turn github one into a mirror of it.

My 2c.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

