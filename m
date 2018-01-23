Return-Path: <raj.khem@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 59F3D7875A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 22:05:17 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id t78so1476082oih.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=Jlfcfcyrxxu8rg/jVyRuJ8wYPAeaCWnWiSptev2b6RQ=;
	b=Olt2MtQWr3Qwo/46FVb9TdbC2tahqZQgr0ELNnP5vTnq+GI9xSEAC74YuStgJb+y2+
	JZtWuC+lN1iLN3esauBsA8LyyD5HwFcOn/lT9VQOUphUnnoEZtQRjWuXcSg+WkWAmS7H
	z5M7W3fgGDR1gVN9GtYlnXSromhg9kPfwTFWLE2RVi1OYVr3U0k6FcO+tFzN2tNNo7J1
	tY9zqoV82EX+02v34b4HWMrY56lUYATvn5lpJz8SIgykG8sh2pNTXcku1ux1SFSb3IO7
	i531rPw5tMrEyHXj/dm+GQiDaNqfFf1LjtRqACekTN58pch6StFkkje8sDKbAUqF4RZF
	ObtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Jlfcfcyrxxu8rg/jVyRuJ8wYPAeaCWnWiSptev2b6RQ=;
	b=ME7KC62DEOfeW6zP92N1Ncfi5MBK3ebCRJxDPdWWeukJ5G38B1NfadLcihDGCNSBji
	YaY077obk8IR96hYymQskCyxnZE6by6XHcsS20z5LEhUpe6s+mYCKRUvYjEoYKeYVL5P
	OpeL0z84pRbtDdXjwh1z2YWSjjYSt0+CAkZNrLvoR9o0E7/ggSoUQuKB/RVZa5Vc0oL9
	BzzeWZ6Y2DBg0xK7gppmMTzbD+ic3m83wLylFCqL6Mg5MHKSbnqh718cwOiigquABjJV
	az6y67DDDRD1WDR4Z6uvMfKyrw1hNC+RNyjCOP4az5z9gOsl9E4AKXtPekszQ6ee8qSJ
	rdnw==
X-Gm-Message-State: AKwxyteBgruOz3V3ARaaf7VfouRXOAWvolgmVpkA5MsdZnJdqMW0cOmg
	/idxySED1IE2EjEs3/M6gaS+1slU
X-Google-Smtp-Source: AH8x224+IZsq5B1MkXCQpyiBNkxxqwY+Lg6s8kpRq5AIQXEUJ5aPo4l+xr5FcwhY9VnVaf5D/vAk4Q==
X-Received: by 10.202.204.85 with SMTP id c82mr6757782oig.160.1516745117829;
	Tue, 23 Jan 2018 14:05:17 -0800 (PST)
Received: from [172.27.88.30] ([217.140.111.136])
	by smtp.gmail.com with ESMTPSA id
	l66sm1508216oia.24.2018.01.23.14.05.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jan 2018 14:05:17 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1510934900-22044-1-git-send-email-trini@konsulko.com>
	<1510934900-22044-5-git-send-email-trini@konsulko.com>
	<CAJTo0LbsO5iYxo5W9GRn-CMNpY+oyky9emUO69RTRvo6-D8ATg@mail.gmail.com>
	<20171124153611.GD3587@bill-the-cat>
	<20171128155527.GH3587@bill-the-cat>
	<CAJTo0LaOB_=4EPi=k+HCf=sqYAfrw+5J_cqQ-MFmTtC24EZtRA@mail.gmail.com>
	<20171214024513.GJ372@bill-the-cat> <20171214031512.GK372@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <c03d28a1-8495-5885-2a2f-43061ff077c4@gmail.com>
Date: Tue, 23 Jan 2018 16:05:16 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <20171214031512.GK372@bill-the-cat>
Subject: Re: [PATCHv2 4/4] meta-selftest: wic: Add test for --use-uuid / --fsuuid
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
X-List-Received-Date: Tue, 23 Jan 2018 22:05:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/13/17 9:15 PM, Tom Rini wrote:
> On Wed, Dec 13, 2017 at 09:45:13PM -0500, Tom Rini wrote:
>> On Wed, Dec 13, 2017 at 02:40:34PM +0000, Burton, Ross wrote:
>>
>>> I finally made it break locally, with MACHINE=qemux86 and using sysvinit
>>> instead of systemd.  Basically, a pristine poky local.conf.  I've not dug
>>> into it beyond that, or why it passes with systemd.
>>
>> I found it, and, erm, ugh?  Here's what appears to be a systemd vs
>> sysvinit difference.  With systemd, if you have an fstab entry and the
>> mount point doesn't exist, it will get made.  So an entry of /uuid (a
>> very non-HFS and just made up directory) the mount happens.  With
>> sysvinit, no, the mount fails.  That's why the test fails.
>>
>> My gut reaction is that no, it's not wic's job to ensure that the
>> underlying filesystems have all mount points and I should just re-do the
>> test to use /mnt instead of /uuid, for the UUID test mount point.
> 
> And in fact, systemd just can't be used for oe-selftest and have
> everything expect to pass today.  The existing wic.Wic.test_qemu will
> fail on /dev/root vs /dev/sda2.  So I'm going to post a v4 that puts the
> UUID one into /media, and I've run the tests and they pass atm.  Thanks!
> 

/media is usually automounted when removable media is inserted. you
might want to use something else.


