Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1Ua42a-000824-CN
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 15:04:21 +0200
Received: by mail-we0-f172.google.com with SMTP id w60so1815296wes.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=DVoKVczlDx5vVgk1ga6ZKU1RWS2bYc00t+ztuR5k/hA=;
	b=ovouZOybjEJm0Nk5ltzodO45yjgvKN4LQ3dUuO+xY3Znau6eMaF9hAbH7kqQm+j7X7
	A/sQMptTfjk4m3s6FKxuJ0wh3JDTgInP/JHzy2BEmboHDFNtiYdMTCRbRX4rB+5oQd3u
	/ygkJuIXbpe1ZXjoIWQeOGAA0yHexsYOL38mgxRMyshtixyxbq2yqlNSLxrOZthFAWEw
	dl9f7QzfK7p764CS4P8aQmMfI2spX7BQcV4i4+h0gwMLdYuwZr1thqd5XGctMgyyo91S
	LTiOeVtWag3/NnR2tbgESEFcckJWR1eCvEntb7MibjhSaXdLJy1bjv6ufVZxKedtRPzv
	CwmQ==
MIME-Version: 1.0
X-Received: by 10.194.10.129 with SMTP id i1mr1582671wjb.21.1368017170276;
	Wed, 08 May 2013 05:46:10 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Wed, 8 May 2013 05:46:10 -0700 (PDT)
In-Reply-To: <CAJTo0LaHKGS+FRWJX9yE29sdSSVR6R4JsykHOx9N6RpaBuEn+g@mail.gmail.com>
References: <1367930701.27116.31.camel@ted>
	<CAHUNapT--78aOf=eCava7w9VsHAD8fL3odbreW-6EATt6mujbA@mail.gmail.com>
	<CAJTo0LaUSyekgycP37-jZnHmgy1wOM-PfJ0yZQtMrSP_bUp8hg@mail.gmail.com>
	<CAHUNapTCr_YV+pfCJod6LcGfhGh4HEX+GmcQSFQ9frFS+HiecQ@mail.gmail.com>
	<CAJTo0LaHKGS+FRWJX9yE29sdSSVR6R4JsykHOx9N6RpaBuEn+g@mail.gmail.com>
Date: Wed, 8 May 2013 08:46:10 -0400
Message-ID: <CAHUNapRQ9GWaCW3waCAiMsOqQP3xbiKrykn0-VCTB8oRa7rH8g@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Status Update
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
X-List-Received-Date: Wed, 08 May 2013 13:04:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 8, 2013 at 6:35 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 7 May 2013 18:57, Trevor Woerner <twoerner@gmail.com> wrote:
>> I've looked through the list of patches and don't seem to find
>> anything that will do what my patch needs to do in order to build
>> qemu-1.2.0 on openSuSE 12.3. Would you consider adding the attached
>> patch for Danny? (normally I'd send it in-line but I'm behind a
>> firewall at the moment that won't allow "git send-email" to succeed,
>> otherwise I could submit it this evening)
>
> Merged to my danny-next branch, after confirming that this isn't
> needed in Dylan/master as qemu 1.4 has the -lrt linkages declared.

Whoops, sorry. I guess I should have mentioned that (since I was aware
that qemu-native works fine with the latest Yocto HEAD).


