Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id AED2C60621
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 19:06:42 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id u68so2304615uau.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 12:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=u35pc+1fFZbeY58GkeG6DGpJRVBmrXITg8e/0N1zIZk=;
	b=eiwbZ4nos+7pt9LzcygQPccMz0LaZoDK8KsTOOoteb+nM4idjajLXTIGlNG5d350Tc
	K5ZhsCYegE99+Nz6C3tmqJd4k4TW2TJnFwqqdweSTgyuyVKpibdaQxxfpQ5XBl4h8I9H
	6tRTZgFkC45G1/Dwy+WqE6A5RN9OH9VAZ0ydqsW7O5Sq9gv8cizRgdf3+LZnmd0HJKuN
	qPkTIEZD1t6KYXvI1i70AmfvI5+beH4IQqbT0WbSxLSnsTtBngkPQuy+5JrtpsTplWHe
	OXVnyPz9rBxsJGzxBMu6tEkbqeMpqpNXUfZe9zMKyUaNz/9ECINJFkTXvXD2Si/yEfgF
	xvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=u35pc+1fFZbeY58GkeG6DGpJRVBmrXITg8e/0N1zIZk=;
	b=hqmSaZG4DBmioL6qnuU+go6AUirbaEflaHJ+TAU87Wk8WFHS592IItkgcjpbTz2Y8h
	8qxUQnB76WnGW8qmo5nBrSS0u83l6ChNDbWG5m3d7tx/51/KVxuTNLz1qgMSsroukb/A
	dHYqZ/kokslrtvNw3RvbAEkARq6OEZsKOXXUoWebct2TdJO/9EwtfumKcimL/oBymlH0
	J+a+P6KWDt0QOG4FUqGowd5hJpoBy+dbKs+Oz1zp/FaD6CVhFbj5vWK5A0FkZolROrcc
	JIesVUAQ7hipH+yOk53R0AFdLAkVnUV88Fmi+g+9TSt8KcG/2u17wPayTJsRtgdCrP9F
	tzGA==
X-Gm-Message-State: AA6/9RnvD3AUEmR6OLbQiEqMOZfZuoQ34YaGBJyelgfeIfCH9UniLjbtwVpIjal+dhoDnA==
X-Received: by 10.159.36.9 with SMTP id 9mr5155589uaq.36.1474657603313;
	Fri, 23 Sep 2016 12:06:43 -0700 (PDT)
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com.
	[209.85.217.173]) by smtp.gmail.com with ESMTPSA id
	r63sm2272660uar.25.2016.09.23.12.06.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 12:06:42 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f173.google.com with SMTP id 15so55167971uai.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 12:06:41 -0700 (PDT)
X-Received: by 10.159.33.184 with SMTP id 53mr5897690uac.88.1474657601557;
	Fri, 23 Sep 2016 12:06:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.148 with HTTP; Fri, 23 Sep 2016 12:06:40 -0700 (PDT)
In-Reply-To: <CAMKF1sp=h+c1MU4nU5vkXCWJLgTZa6jXSf1f4B0QOn0A8XbvkQ@mail.gmail.com>
References: <20160923164301.560-1-otavio@ossystems.com.br>
	<20160923164301.560-2-otavio@ossystems.com.br>
	<CAMKF1sp=h+c1MU4nU5vkXCWJLgTZa6jXSf1f4B0QOn0A8XbvkQ@mail.gmail.com>
Date: Fri, 23 Sep 2016 16:06:40 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqY2T5U_4gkAYQtYrBZ_MJnscJ=BeODs0d8ieSa67GBaw@mail.gmail.com>
Message-ID: <CAP9ODKqY2T5U_4gkAYQtYrBZ_MJnscJ=BeODs0d8ieSa67GBaw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] tune-ppc[65]00.inc: Disable QEMU usermode usage
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
X-List-Received-Date: Fri, 23 Sep 2016 19:06:43 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 23, 2016 at 3:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Sep 23, 2016 at 9:43 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> The QEMU usermode fails with invalid instruction error when used with those tunes.
>>
>> The issue is being tracked in [YOCTO: #10304].
>>
>
> Does this option remove using particular SPE option when invoking QEMU
> in usermode ? if so there may be another issue where these
> instructions are emitted by compiler and they wont be emulated.
>
> What will this change do which fixes the problem ?
> from bug it seems it needs a Qemu with 32bit ABI, are we building that
> version of qemu-ppc

We are not, at this moment.

I did a local patch to enable it and test the usermode and it still
produces an exception at runtime:

http://termbin.com/9g6t

if we can fix the underlying issue, better, but disabling it allow for
better user experience in meanwhile.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

