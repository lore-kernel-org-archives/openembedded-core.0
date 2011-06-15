Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWt75-0008DJ-Be
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 18:38:43 +0200
Received: by iwn19 with SMTP id 19so464854iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 09:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=/xknE03/m0yhCZ/wZFUvm3PMu3Uyd2EannFUXKaE0gg=;
	b=S/ihLk/BuXdyI9ggOT9DWKKtLBItLzwNXfQ++vyHlpEqnO+H5RwS9zWn3f6LGeeGjQ
	BCXnHdagaA2f9tT9OWFnVWwPkMVCncK4HGFCiXTOqLQnGgNxIB6j7wz9PGSv6fPVnwtP
	ja4uhBx9RoTIyDrlConiU270Kfg+Rmm8Y7vNk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=YzlUeqtWEOqjGuQwWBMy4hE0YcjwlQwkystNIPVofGrY3WhFdoIdNUA2Am7SE4krdI
	LA9L2KyObbIVlZfN8DOlSCQx43BulTw8heFAT4U2ogC7JB6MWkNacDbc7zU+UDTxYcF+
	yam/OcDMPoRTntggGNTj9EigWDWCLmUOwHezM=
Received: by 10.231.80.193 with SMTP id u1mr630544ibk.21.1308155716206;
	Wed, 15 Jun 2011 09:35:16 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v16sm305682ibe.51.2011.06.15.09.35.14
	(version=SSLv3 cipher=OTHER); Wed, 15 Jun 2011 09:35:14 -0700 (PDT)
Message-ID: <4DF8DF40.6050401@gmail.com>
Date: Wed, 15 Jun 2011 09:35:12 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1308065443.25285.268.camel@phil-desktop>	<E934E895-3391-4437-A310-E5B99624AC38@dominion.thruhere.net>	<1308125091.6879.39.camel@lenovo.internal.reciva.com>	<1308148335.25285.1774.camel@phil-desktop>
	<4DF8DD52.70502@gmail.com>
	<1308155502.25285.2038.camel@phil-desktop>
In-Reply-To: <1308155502.25285.2038.camel@phil-desktop>
Subject: Re: [PATCH RFC] binutils: allow distro to select gold as default cross-linker
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
X-List-Received-Date: Wed, 15 Jun 2011 16:38:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2011 09:31 AM, Phil Blundell wrote:
> On Wed, 2011-06-15 at 09:26 -0700, Khem Raj wrote:
>> this might not work second time around when gcc-cross has been staged.
>
> Oh, I thought that mess was fixed nowadays.  Doesn't eglibc always use
> the -intermediate compiler from the special tcbootstrap place?
>
> If it's just picking whatever was staged most recently then yeah, this
> will lose.
>

ah I stand corrected.

STAGINGCC = "gcc-cross-intermediate"
PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"

so yes it uses gcc-cross-intermediate all the time.

This will work. Do you know what problems eglibc has linking with gold ?
may be we can fix it

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



