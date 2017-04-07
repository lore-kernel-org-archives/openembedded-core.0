Return-Path: <freesilicon@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id CCEF577D86
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 12:27:46 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id o21so14510629wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 05:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=eQKXJf5sQK+weTWd+7gUvobovNB383FihPe97xqXHSo=;
	b=BspNgureFBWj7OPKptBxGBasP4QLjI9Ldb40uxZxNeGEAP3hc3lHHpizk8WJLcSgqm
	sFS2ckvpVqmqVv39Wryt5ajpALmMHZL+9edhE78BF3+TUcZKXB+xd+xATwpnHuaK2THp
	FuA8m/uwb3F/rjPpYocDQk0NBueXLRRCRiFUdjmG/LTOOv5d/95ShvgYGOU6WcSUHSoQ
	CftvP+3NL5bbOultHW5fV5B9SiD+5hUJ+oqBI+PnAqYa4S5HBpz+hz4tvdVQFm/LJNg3
	kFsWGESdoCGhcZjwTprUqWC8rHmLTiIJpo9SzK4eV7lIs9ySValOZaxypQCscJvqdc1F
	orfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eQKXJf5sQK+weTWd+7gUvobovNB383FihPe97xqXHSo=;
	b=JbWkz6EcBoU0SKVk3KgdDdR93Nfy94zC7l3mCjBoFa4/nKTRhfKFSOpy7kreSJJ8ey
	zBoWK/XSN/14JcaD4u3G+9fmKWbsGthU8dsIEasYTzuDyWM2ee+4s/2OFzVvOHeG+2Ee
	rkn1JC6fXB/kM49ixyBYzaAv/JUv0eCvu0hEsLuDNUqhBBXAOS/W7flkH6u1Zbv5HSA8
	AOMUvUkGpM/3lnKK0HNaHexQJl59WX0FbvszANhuPDma+obCejiD+l6yBQmxdI9ujpz0
	PEDDefd6SmldkKuRwEqRLp7Sa8bFlWIxhs4teJINOqmvncXPtFbAHAzHhivAVQlJ2OCB
	k/zg==
X-Gm-Message-State: AFeK/H19jsCheo6Oy8MN9U40D2huHdbgmhCgCMfRO0fK25ghQeDVO5yBLO/PjEMLQLfbcw==
X-Received: by 10.28.167.216 with SMTP id q207mr24952893wme.134.1491568067560; 
	Fri, 07 Apr 2017 05:27:47 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	t85sm6125119wmt.23.2017.04.07.05.27.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Apr 2017 05:27:47 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 07 Apr 2017 14:27:45 +0200
Message-ID: <3319701.6ygbhHyYrO@crde-port-20.cahors.local>
In-Reply-To: <CA+chaQdGcpevoyue494P0FkYp_C8dt4fbZ3CLoza7sVHoRSWjg@mail.gmail.com>
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<CAHiDW_FWnBo8vsQ_OTwHYDJmMDXfH1b+6UkTjWf1=qK9QiYWLg@mail.gmail.com>
	<CA+chaQdGcpevoyue494P0FkYp_C8dt4fbZ3CLoza7sVHoRSWjg@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Fri, 07 Apr 2017 12:27:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On jeudi 6 avril 2017 15:03:36 CEST Martin Jansa wrote:
> I still don't understand why not use standard update-alternatives and
> install another package with your favorite openssl.conf which has higher
> ALTERNATIVE_PRIORITY.

Why not, but maybe this https://bugzilla.yoctoproject.org/show_bug.cgi?
id=10777 can be a stopper since libcrypto RRECOMMENDS openssl-conf

> This way u-a will switch to new config even when you just install the
> package which require it on the target later and will switch back to
> default openssl.conf when the alternative package with config file is
> uninstalled.
> 
> On Thu, Apr 6, 2017 at 12:55 PM, Jussi Kukkonen <jussi.kukkonen@intel.com>
>> So previously openssl-conf package included etc/ssl/openssl.cnf and the
>> symlink ${libdir}/ssl/openssl.conf.

The symlink is not inside openssl-conf package but rather inside openssl.

>> Nothing RDEPENDS on this package (but
>> libcrypto RRECOMMENDS it).
>> 
>> After your patch the actual configuration file is still installed. In a
>> postinst
>> 
>>   * ${libdir}/ssl/openssl.conf is removed if it exists (why? If it's for
>> upgrading, then this should happen in a prerm or postrm)
>>   * the symlink ${libdir}/ssl/openssl.conf is created
>> 
>> My confusion is this: how does the above solve the problem you describe?
>> If you've managed to use RCONFLICTS to prevent the configuration package
>> from getting included in the image, why are changes to the package needed?
>> 

To avoid creation of the symlink inside openssl package. But I agree for the 
postrm/prerm tasks instead of postinst.

>> 
>> Some alternative solutions to your problem I think might work:
>> * openssl_%.bbappend with a do_install_append() that simply copies your
>> conf file over the one from upstream recipe. No extra packages needed
>> * BAD_RECOMMENDATIONS or PACKAGE_EXCLUDE to prevent openssl-conf from
>> getting included in your image, then adding your own package with your
>> configuration (does not work for dpkg I think)
>> 

I could consider this if the patch gets reverted, but I still prefer using 
extra packages. It's easier this way to know which configuration has been 
applied (but update-alternatives could work too).

TBH, I say that because I've submitted a similar series of patches for openssh 
based on the same principle. I think my main problem is the handling of 
configuration files at build time. This holds especially true for read-only 
rootfs where these files must be available at build time. Is there guidelines 
for that ?

>> Jussi
>> 
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

David

