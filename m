Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 798BE7810C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 19:00:42 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id m133so3610939pga.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 12:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=6VIZi5RdLyqqZuB+CfL/VOTP2ISxCY35DmM5cmoORbU=;
	b=Gf+Gb/Gbk+1+VvqF2ho/56IB6lmNw5ZOxb7MTwPomzGPcyVQP4bLpIvG5jXfNBvBVD
	72lBmZQecZDMUy8sgjhAD4QW3KD34OhU9oG/UCkjr0m5moI1bXWuDU9pGCCrrEx9urP2
	CdIIVSgktIKgqoxgNQmRm/LwX5IkYsAAIT2jRgrjLsG74U2PgDI2aSi8806OWb/Klkfy
	dh4MNFY+GOxG3f/fHEQTmMxiOWkWYntuO/IjHCCUr6ew+RvMmZz+hKZKBeF5JJ8ZmK9Q
	7suNp6uETrgtQQKMGt02DbUVbGTM5fMdtJgMSV82qfwP7Oj9XhOaQ9dm88JRqQru+Zzq
	hqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6VIZi5RdLyqqZuB+CfL/VOTP2ISxCY35DmM5cmoORbU=;
	b=nUINYJOyeAy+jtJQhPhmRH52IOcR7l6lzL2LXCasxeibNC+cWzzOYoTD9x/Pnnf6WO
	t5gNpK5W85KRPMn9V4eGLjxmn6a2k0n769h/Gz/AQ6N82LIEv356hiZyXkOdDWIi3ce6
	I0NOwauJtXMnN2P2dbFYhnLV5kmclhJsLZMYxSDQvQivxWN/CLHUZfsTIyi0kkaqliiV
	VjeWB0nGtvsY9oSvDox4rF79OeV7BoSFIf0+Bbo2As/L5ufROf2lIsOGji/2foCDMHwI
	ZMhKnw0JBDft+1aZGg/nHRXBkHXd6pT0eZPDyJjX62lJ2AwYOocvvNfoqyqiK4ua4OLq
	foeQ==
X-Gm-Message-State: AHYfb5iVogMFlpC3U/1Y+kU67gCUQslD0f8nEuA85oRrATqdKdvYJXIJ
	ukwEfPT+T6ilog==
X-Received: by 10.98.133.156 with SMTP id m28mr3771414pfk.208.1503514843703;
	Wed, 23 Aug 2017 12:00:43 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:6cf9:1d5a:396a:8869:87e0?
	([2601:647:4c00:6cf9:1d5a:396a:8869:87e0])
	by smtp.gmail.com with ESMTPSA id
	l80sm4217670pfb.107.2017.08.23.12.00.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Aug 2017 12:00:43 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Andrej Valek <andrej.valek@siemens.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	Armin Kuster <akuster808@gmail.com>
References: <1502981085-18209-1-git-send-email-andrej.valek@siemens.com>
	<1502987497.13978.239.camel@linuxfoundation.org>
	<b911b7ff-0309-e459-0baf-b0fab4b68747@siemens.com>
	<1503048946.32591.0.camel@linuxfoundation.org>
	<aa161775-9c09-bf1f-8190-9c6e701f07c7@siemens.com>
	<c9d3d7c6-f6d0-c316-1e1e-8b67f652ae4a@windriver.com>
	<dff127f0-b668-0d09-3270-ce1d67c04891@siemens.com>
	<1abbf9f3-8f0e-3fba-26f5-114f049cb977@siemens.com>
	<1503492285.32591.152.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <cda65980-6ae8-426d-72e3-0e016d9fe315@gmail.com>
Date: Wed, 23 Aug 2017 12:00:42 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:56.0)
	Gecko/20100101 Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <1503492285.32591.152.camel@linuxfoundation.org>
Subject: Re: [PATCH] ca-certificates: prevent executing update-ca-certificates from host system
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
X-List-Received-Date: Wed, 23 Aug 2017 19:00:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/23/17 5:44 AM, Richard Purdie wrote:
> On Wed, 2017-08-23 at 14:07 +0200, Andrej Valek wrote:
>> I have found out that even master with HOSTTOOLS does not fix my
>> problem.
>> We use ASSUME_PROVIDED for ca-certificates-native due to corporate
>> environment CAs.
>> Since nativesdk-ca-certificates depends on ca-certificates-native
>> whichis not built, so it could not be found. Unfortunately adding
>> update-ca-certificates to HOSTTOOLS is not working, since build user
>> does not have permissions to modify system CAs and also is in
>> /usr/sbin/ which is not in usual system path.
>>
>> Therefore I think that this patch applies for master branch, too.
>> Possible improvement would be also removing ca-certificates-native
>> from DEPENDS of class-nativesdk.
>>
>> Solution of installing corporate CAs within OE recipe does not seem
>> to be ideal, because the CAs have short expiration date. So using
>> system CAs assures reachability of resources over https.
>> We had to do this because svn fetcher uses https without option to
>> ignore errors (unlike wget which ignores certificates by default).
> 
> Reading this made me realise this is a pretty complex issue. In general
> we cannot assume that we can execute nativesdk binaries. Since ca-
> certificates is allarch and we're executing an sh script, this is less
> of an issue in this very specific case. There is a binary involved,
> c_rehash and we do need to make sure there are the right -native
> dependencies to get that.


c_rehash comes from openssl-native in this case.

> 
> There is a further complication with regard to the paths used, ca-
> certificates-native will use one set of paths, nativesdk-ca-
> certificates will use a different set and target ca-certificates a
> differnt set again.
> 
> I suspect you're right and the ca-certificates-native dependency may be
> incorrect and the certs installed into sdks may be broken too. If the
> native sysroot and target sysroot layouts don't match, that would cause
> an additional source of errors.
> 
> So some changes in this area does appear to be needed...
> 
> Cheers,
> 
> Richard
> 
> 


