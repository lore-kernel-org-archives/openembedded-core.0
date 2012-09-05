Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T9OcN-0005G8-E7
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 01:02:43 +0200
Received: by lban1 with SMTP id n1so743558lba.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 15:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=8VBBgQEIOMMfPGdSvD6V09XQOlf7XbcNKGoNNf7G9bE=;
	b=Thl5IpJyzU1IvOywVywvzCgbZXWpPifAldhXlBiL7+vSXlMLIN00MhuYy1ARA+HZvd
	2XxrENSYJoQG19dr6Z4ysDk+RuYtpE8ru+IEGP8OfhSUfSQIpJ/YkolRod4rFZi/8sG8
	Zi3c8YN5CzDzUad1lJwdP++HLCR4vny2BSPKIVemxGdrzVXs8mHQkDfLbjz3dwML+PRM
	s6nycKF2jtvw5hO3N/n78KmrZY+60sD3pSRKMO7j9GcjjSjXwplykXwH/l6z1FWa1bL5
	d+ciEZ/W6OWO+junTJcpFuMOee7Xj0HEKSFY5nMogSULZgj+SOBDFiF156FjbuKwI4C5
	b0dQ==
Received: by 10.112.101.6 with SMTP id fc6mr146848lbb.110.1346885419786; Wed,
	05 Sep 2012 15:50:19 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Wed, 5 Sep 2012 15:49:59 -0700 (PDT)
In-Reply-To: <1346884973.21985.137.camel@ted>
References: <1346855269.21985.57.camel@ted>
	<CABcZANk+N+3Gg3kASaQ_19DYd_AtyDoWsS-hfv=mFZe0Jaz6Qg@mail.gmail.com>
	<1346884973.21985.137.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 5 Sep 2012 15:49:59 -0700
X-Google-Sender-Auth: 4Iajf9Eq0WEdWzRhkKSb29J0n50
Message-ID: <CABcZANki2S09rxGwUEd_t_MQaMs=J-H5P3O_fqvjzs=xbxRnVQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity.bbclass: Move back to running at ConfigParsed time
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
X-List-Received-Date: Wed, 05 Sep 2012 23:02:43 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 5, 2012 at 3:42 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-09-05 at 15:21 -0700, Chris Larson wrote:
>> On Wed, Sep 5, 2012 at 7:27 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > If we don't do this, users can get extremely confused errors since the sanity tests
>> > happen too late (after parsing) and don't see the warnings.
>>
>> Can you elaborate on this? This commit message is extremely unclear.
>> If there's an open bug in bugzilla or something that could be referred
>> to here, that'd be helpful.
>
> Sorry, I should have elaborated.
>
> Set an invalid MACHINE, try and build and you set all kinds of nasty
> warnings and no sensible message about what is wrong.
>
> Change LCONF_VERSION and you don't get the warning unless parsing
> completes which it may or may not depending on the kind of change.

That makes sense, thanks for the clarification.
-- 
Christopher Larson


