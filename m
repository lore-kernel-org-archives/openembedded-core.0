Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S0ygI-0006IZ-7h
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 18:11:42 +0100
Received: by bkwq11 with SMTP id q11so2326901bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 09:03:19 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.8.129 as permitted sender) client-ip=10.112.8.129; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.8.129 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.8.129])
	by 10.112.8.129 with SMTP id r1mr1283300lba.38.1330102999456 (num_hops
	= 1); Fri, 24 Feb 2012 09:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=TbDXmNoe0UB+iUxZKJxQzPWhYsNCSh67wSJe03B0aSA=;
	b=mjrPwrHJaKhSmk0FvSsVwIoqiLa+PsGGh1pJ6EupdPKUhP3dD4dOhE4q3gqpEgIzn3
	pipNFJcPLIwjsfVSUElSZAWO8HgMNWaaY3wfOJ25ZZ1xPmoXiBkU9BGlviCSiCM3SkpN
	f1aJvKmWanK5iXTt4qgdCPenU848kXnEaNuVY=
Received: by 10.112.8.129 with SMTP id r1mr1058632lba.38.1330102999392; Fri,
	24 Feb 2012 09:03:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Fri, 24 Feb 2012 09:02:49 -0800 (PST)
In-Reply-To: <1330100410.5477.4.camel@ted>
References: <cover.1330053959.git.raj.khem@gmail.com>
	<0c86983a495510f1fec576591e2f5d5e70cb4aa5.1330053959.git.raj.khem@gmail.com>
	<1330100410.5477.4.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Feb 2012 09:02:49 -0800
Message-ID: <CAMKF1sryVQi_fprwd4TcVupdXHKghMarmb9pT1+ri-cQ2b9JYA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] classes: Add recipe class to overrides
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
X-List-Received-Date: Fri, 24 Feb 2012 17:11:42 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 24, 2012 at 8:20 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> With this change now we can say
>>
>> EXTRA_OECONF_class-target = "...."
>> EXTRA_OECONF_virtclass-native = "..."
>> EXTRA_OECONF_virtclass-nativesdk = "..."
>> EXTRA_OECONF_virtclass-crosssdk= "..."
>
> I think we need to drop the "virt" here and make this consistent since
> they are no longer specific to the virtual BBCLASSEXTEND code...
>

since they were used in quite few places I thought to keep them as it is
renaming would mean all places should change and other layers too and
I am infamous
to break other layers :) and keeping both would be more confusion.


> Cheers,
>
> Richard


