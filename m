Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZ2Wt-0005G8-So
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 17:06:16 +0200
Received: by pzk2 with SMTP id 2so4682988pzk.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=rHHyxuxzUW33Bbga0Wpcav5PzH2+ba+5F8D5T/vwiYM=;
	b=hc/zglk/vVNqMZlvupJCaoF+39P7xWsuPefbnpr2UlnpeKcymvodizm+CIVCwYDHMo
	ZHsxkoDE8MQ+LPEkztvq4iKdmoFECgaMsjzL6wRbnYUJEHfAe2xIxvB5cUkYSIe5oyz7
	/WDVrj4xatvefbKqBMU90rhVmGrBdqFuifmvQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=LgjXAPPpKsk9EH/hlD6DK83ERdEzmNghov5ZzNK9VhioX3w/arh93xwN3sbnUSkI1M
	SioDX7YQ+w9WVQxWkico2MzVlTCBTeaMIdwVwSweOm/iOJZHcbD46LVprE0FxtCScRoW
	PqZSB9hlNR6888H27VqIJb5jcHnEuNBbn7Jqc=
Received: by 10.142.171.18 with SMTP id t18mr1419588wfe.57.1308668561796;
	Tue, 21 Jun 2011 08:02:41 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v6sm7168466wfe.2.2011.06.21.08.02.40
	(version=SSLv3 cipher=OTHER); Tue, 21 Jun 2011 08:02:41 -0700 (PDT)
Message-ID: <4E00B28F.4080802@gmail.com>
Date: Tue, 21 Jun 2011 08:02:39 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20110621140419.GA8589@raven.pace.internal>
	<1308668047.21613.30.camel@phil-desktop>
In-Reply-To: <1308668047.21613.30.camel@phil-desktop>
Subject: Re: Using TCLIBC = "uclibc" in oe-core
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
X-List-Received-Date: Tue, 21 Jun 2011 15:06:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/21/2011 07:54 AM, Phil Blundell wrote:
> On Tue, 2011-06-21 at 15:04 +0100, Tom Parkin wrote:
>> The attached patch allows me to (at least) assemble the bitbake task
>> list when TCLIBC = "uclibc".  I'm not sure whether this is the correct
>> approach, though.
>
> Do you know why glib-2.0.inc is doing this crazy thing in the first
> place?  If we're going to have code in the config files to effectively
> make it think that USE_NLS is always on, maybe that check should just be
> removed.
>
> You're right though that the current line in tclibc-uclibc.inc is
> clearly just wrong and should be either fixed or deleted.
>

Yes and another issue is USE_NLS settings applies to native recipes as 
well. The intention is to just have it for target recipes. May be 
native.bbclass
should forcibly set this var to yes unless someone is building on uclibc
build systems which would be rare.

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



