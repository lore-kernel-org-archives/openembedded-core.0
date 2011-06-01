Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QRf6o-00055z-HF
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:40:54 +0200
Received: by pwj9 with SMTP id 9so2559435pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 23:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:reply-to:user-agent
	:mime-version:to:subject:references:in-reply-to:x-enigmail-version
	:content-type:content-transfer-encoding;
	bh=vqfxmvKGXf3/C3gSOJytUwvY1+we0M1CYn5pSJ4WYnw=;
	b=cAWF7hsEgmq5Q43917u7ugLWKSwuyzJHQVLE4XnI3mm6Z2vagzecrAkP9EOdt2ndvZ
	LZU/dEJwb9lJn3Wcbe4lSKv0CfV0VE6qJ8e5GMdrswgQYD19ZgBe0AGbNQa1OMJ/aN4l
	ZJGGC6KEKOS6tB9QdyA9laVn98oJlnp9hywis=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	b=qMN2M8Vw/NUvEI4XtEq7r3S+IjMr91+mXYrg+VKz0jWvODJktw7TIog4xF1L2bAx0e
	AtMn6EwCBNHifczlqzj8n3441botyvA+A5udgUIHpC1BoEj/mH17uBftDo+UwNSjxBnj
	71+g+WbqKW/99F119b85UiEpxoe8H55diemoo=
Received: by 10.142.166.6 with SMTP id o6mr1109940wfe.3.1306910223619;
	Tue, 31 May 2011 23:37:03 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id o16sm481735wff.1.2011.05.31.23.37.01
	(version=SSLv3 cipher=OTHER); Tue, 31 May 2011 23:37:02 -0700 (PDT)
Message-ID: <4DE5DE0C.3070102@gmail.com>
Date: Tue, 31 May 2011 23:37:00 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <BANLkTi=mR7KKfXxiwiF1ZFA6epxx8hfaug@mail.gmail.com>
	<129A9155-4B39-48EA-86A6-39EFB55D5AE6@dominion.thruhere.net>
In-Reply-To: <129A9155-4B39-48EA-86A6-39EFB55D5AE6@dominion.thruhere.net>
X-Enigmail-Version: 1.1.1
Subject: Re: Parsing errors
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: raj.khem@gmail.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 01 Jun 2011 06:40:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/31/2011 11:31 PM, Koen Kooi wrote:
> 
> Op 1 jun 2011, om 00:45 heeft Khem Raj het volgende geschreven:
> 
>> Hi
>>
>> In slugos when I updated to today's snapshot of oe-core  and meta-oe
>> its giving me this
>>
>> ERROR: Information not available for target 'all-linux'
>>
>>                                                  | ETA:  00:00:37
>> ERROR: Error parsing
>> /home/kraj/work/slugos/meta-openembedded/meta-oe/recipes-core/systemd/systemd-compat-units.bb:
>> Failure expanding variable SITEINFO_ENDIANESS, expression was
>> ${@siteinfo_get_endianess(d)} which triggered exce
> 
> 
> ENDIANNESS is spelled with 3 Ns, so that might explain your problems. See
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=87dc166bade8722af4076c8644cac6a0a437826f
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=45fc36a32fb23c513833d7e27fb4b9cd8be68fb5
> 

thats in oe classic I was bitten by that earlier when big endian kernel
was not building for slugos because I was using the variable with 3 Ns.
In oe-core it still uses the one with 2 Ns. So the usage is correct.
Plus the code has been working well.

I have requested Chris to port those patches to oe-core

> regards,
> 
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk3l3gsACgkQuwUzVZGdMxQmYACeIX35izwTLaOL2/9i+IpadMKx
KioAnAjzszBOwItO6SKbDmqH48LOX41I
=bITL
-----END PGP SIGNATURE-----


