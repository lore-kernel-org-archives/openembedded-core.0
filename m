Return-Path: <just.another.mariano@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 318887964F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 16:19:32 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id t81so10479570oig.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 09:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=kwoofcQ9ir30x6qn5Xu4nK36PLYKb03Jefh9HQfqsJ4=;
	b=WIshPZbWNpbGHpSRDaiZ3Zx21MgQfEH+Ezj6OANYzfDFzltN3iTUchDCnWl435QDzC
	3/dnonZRODBRdnNH91V0CqxOMqTDkiBidgKVjQ/0dG3I5W4KmLj3iGHYLF6Mu+ZhK3Bw
	Ka/8s93wt1ShSA38mvR+CJU8IxAl8KU54pvfMTlw3TVBKQTdphj8m8AiLZJ2E3K9PsGq
	A/mEgBItOzUxmYl7aZo2FkD2T/EahYTEUTFOb5Lo7/BdwwXqOEtxOpfOXnrSiWz4XYjI
	mXFgrDzwZwsLDh9i27i7OPOkPj9TPos27HrJnSovI72rGs/6vYs72qlxegXFOzGQmoy8
	2rTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=kwoofcQ9ir30x6qn5Xu4nK36PLYKb03Jefh9HQfqsJ4=;
	b=YIdH96v7OSGR5aq821WwQ4JHKio4z1l1ysMtGz16s/q0FdIu0ytzVjai86SyuG6vmH
	eGCOFrLOyAfjlaB9IYqtpyEJknG05mQG0TKcf/v5gt1VFSc6fIkEI273RbPrL4GUEQ7R
	4MMOyJlXNMXllM4PYn1gzRxGQHt6kwFa2sUep5091cqM/GFqCF+FDnvqDtBGLZJz+uYJ
	dRcTFd6/hur93W4kkFcnIPqShLszpOKgye9WeDQ7boqTCLyhF+iE27JLIFZSjuFQc3OU
	sl92duxRavdoIB/185bMB2gQpmpNemmB5m27s+UG8QKiYNWLdBycyLjMANH9z4l6I/6t
	GCpA==
X-Gm-Message-State: APjAAAXZchtqiAMRz5pjiDJAmyrBhoIrGn2cEmZNbzWZpg2LlNy1iiWU
	jB4aGultGU5v4e7WWp397/yUPSB0
X-Google-Smtp-Source: APXvYqwTeKm4Zgl3wwvzdxdPplWPnlAnEfImnWYXaW+142KEdOOGGu3+sa09fDPOhLpgmPFZlYCQWw==
X-Received: by 2002:aca:3e41:: with SMTP id l62mr14306833oia.24.1555172373920; 
	Sat, 13 Apr 2019 09:19:33 -0700 (PDT)
Received: from ?IPv6:2605:a601:43d5:f700:c5be:7ada:a7e0:e98c?
	([2605:a601:43d5:f700:c5be:7ada:a7e0:e98c])
	by smtp.gmail.com with ESMTPSA id
	i81sm12432007oia.4.2019.04.13.09.19.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Apr 2019 09:19:33 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <cover.1554787765.git.just.another.mariano@gmail.com>
	<102ba655188d6b90411171468c0c354602e3e549.1554787765.git.just.another.mariano@gmail.com>
	<a9b15f00daefad23c17a4f8199f9da7d361b1f51.camel@linuxfoundation.org>
From: Mariano Lopez <just.another.mariano@gmail.com>
Message-ID: <b7667a68-8100-7e18-a391-064f64a021d1@gmail.com>
Date: Sat, 13 Apr 2019 11:19:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a9b15f00daefad23c17a4f8199f9da7d361b1f51.camel@linuxfoundation.org>
Subject: Re: [PATCH v4 2/4] ptest.bbclass: Add feature to populate a binary directory
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
X-List-Received-Date: Sat, 13 Apr 2019 16:19:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/11/19 3:11 PM, Richard Purdie wrote:
> On Tue, 2019-04-09 at 00:44 -0500, Mariano Lopez wrote:
>> This adds the functionality to create a binary directory within
>> PTEST_PATH directory. This directory will be populated with
>> symlinks pointing to the binaries installed by the package and
>> then renamed by update-alternatives. This way the ptest only needs
>> to source this binary directory in order to use the expected
>> binaries.
>>
>> To enable this feature just add PTEST_BINDIR = "1" to the recipe.
>>
>> [YOCTO #12597]
>> [YOCTO #13238]
>>
>> Signed-off-by: Mariano Lopez <just.another.mariano@gmail.com>
>> ---
>>   meta/classes/ptest.bbclass | 32 ++++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
>> index 97865c9338..e87a9659cb 100644
>> --- a/meta/classes/ptest.bbclass
>> +++ b/meta/classes/ptest.bbclass
>> @@ -65,6 +65,38 @@ do_install_ptest_base() {
>>       done
>>   }
>>   
>> +PTEST_BINDIR_PKGD_PATH = "${PKGD}${PTEST_PATH}/bin"
>> +
>> +# This function needs to run after apply_update_alternative_renames
>> because the
>> +# aforementioned function will update the ALTERNATIVE_LINK_NAME
>> flag. Append is
>> +# used here to make this function to run as late as possible.
>> +PACKAGE_PREPROCESS_FUNCS_append = "${@bb.utils.contains('PTEST_BINDI
>> R', '1', \
>> +                                    bb.utils.contains('PTEST_ENABLED
>> ', '1', ' ptest_update_alternatives', '', d), '', d)}"
>> +
>> +python ptest_update_alternatives() {
>> +    """
>> +    This function will generate the symlinks in the
>> PTEST_BINDIR_PKGD_PATH
>> +    to match the renamed binaries by update-alternatives.
>> +    """
>> +
>> +    if not bb.data.inherits_class('update-alternatives', d) \
>> +           or not update_alternatives_enabled(d):
>> +        return
>> +
>> +    bb.note("Generating symlinks for ptest")
>> +    bin_paths = { os.environ["bindir"], os.environ["base_bindir"],
> I'm going to merge this but is there a good reason you're using
> os.environ[] here? If not we should merge a small fixup to use
> d.getVar() since ultimately we don't really want these things in the
> environment if we can help it.
>
> Cheers,
>
> Richard
>
Sorry about that, I just sent the fix for this

Mariano


