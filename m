Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TKEx6-0008Cr-OG
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 22:56:56 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so5171442ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2012 13:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=O1TGErHazBE13xymBXE1cZFKVVSRJNVBIvX14A1oTJQ=;
	b=fxJLqUhF3bzczj/5Plf1vJQvkxjWGEyzc4eTHqeNFTEke5DvTT7iXe6PuwK9WnJaav
	eMJTMHbTzp8fNGtmVydIQMY2LwyyzqvRqzPnGU5w4i5IBov99vP8fKZ9PG0fKArjxWWa
	yVAXLp2vkDMcGSwbMbGURU6TBBpQDH7r4Ng6jPEZj/lsgFUO5T2ixVlP9agpdajTFwyg
	wmdiucIU+PgboAgpD1hY8X++LOSCZdQjjymbqZS7+ADo918R17bBZeeEazGISobSh2K3
	XUQOqvPkC9Nwd7G7PjU9ksO+rrYrkh8Ge1nuENVXFdVOij9EY29amh8N6vk9Q2O3FXlZ
	rHYw==
MIME-Version: 1.0
Received: by 10.50.47.129 with SMTP id d1mr60048ign.45.1349469833464; Fri, 05
	Oct 2012 13:43:53 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Fri, 5 Oct 2012 13:43:53 -0700 (PDT)
In-Reply-To: <506E809F.3080206@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<CALbNGRTCyvfZFYHx6bKV8oVDJWH3X0tj1DHSJm9CkvT4xY2f7A@mail.gmail.com>
	<5059E5C3.2080603@intel.com>
	<CALbNGRS2WzGmRgM0ibnArYgbWWrRVG8VEYayXB12mLcKJmaPAA@mail.gmail.com>
	<CALbNGRST8C-p=M5V8KoVe5ug1MXwp5=7z2rUubEg_MxeR776Kw@mail.gmail.com>
	<5062AA0F.3050604@intel.com>
	<CALbNGRRT47T4RsVHSypgg0J12+0R0y1y6jPWK4GGTgZAaG_2sA@mail.gmail.com>
	<CALbNGRR6Zg6aDwZmFiW9WAFKBgass7c-DpADwcKiQYXLgwoLAQ@mail.gmail.com>
	<CALbNGRTH_ETydVMCyxduE90AvPk_nAgK6mUqgve4=Y9+fj6PGQ@mail.gmail.com>
	<506E809F.3080206@intel.com>
Date: Fri, 5 Oct 2012 22:43:53 +0200
Message-ID: <CALbNGRTtE8txfemS8PS+7C=hfZLjUAu3qJgFZCt-swsEviRE5A@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 0/7] Postinstall improvements
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
X-List-Received-Date: Fri, 05 Oct 2012 20:56:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 5, 2012 at 8:39 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com> wrote:
>>>
>>> ROOTFS_POSTPROCESS_COMMAND ?= "run_intercept_scriptlets"
>>> by
>>> ROOTFS_POSTPROCESS_COMMAND =+ "run_intercept_scriptlets;"
>>>
>>> an now see larger caches for all my icon themes. But the sizes are
>>> still different from those mentioned above. Will run-test tomorrow.
>>>
>>> Andreas
>> Hey Laurentiu,
>>
>> With the minor change mentioned above I tested all my working images
>> without issues. Thanks for taking care and speeding up first boot.
>
> Thanks Andreas for your help with the tests and for finding the issue.
> Unfortunately the patches will not be able to get into 1.3 (we're a
> little late for that). I'll prepare another patch-set as soon as I'll
> find some spare time and, hopefully, we'll get the patches in for 1.4.
>
> Thanks,
> Laurentiu
>
>>
>> Andreas
>>
Although I would like to get this in I agree. Meanwhile I will put the
modified patches in on one of my build machines to get further
experience with them.

Andreas


