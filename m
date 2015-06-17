Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id B1C7873BB7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 18:54:05 +0000 (UTC)
Received: by pdjn11 with SMTP id n11so46633806pdj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 11:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=jsQKQTgq1rZX62F/fKfYcEFr3YeMn+ZvrdlZYSgyPt0=;
	b=kgTvaKJji73AOsYZGixFdWX2ZIRPSgtRwkrzIWm/yRLGRV2Te+H4adp/mD+QwEb58K
	gvgQcPX1Xc0oHZ+jtOv6CKkXmZqPjpq8csWoNbpYMryRKiGgprKOSTdO/CL5kRs+zypT
	B4ycCxQHJ9CdjE5uoRd9qs++jBKkpCnrsh/4h+1vbtQDmXshYCcbV648HAgp9zQGVVN5
	dwSbV1rMOGeIQB50hPtuiv7+goRrkfHntwSAVYlS2ubbUXUTL2ncNLYjFuzgdDZyOdjk
	mBiuBXkW7kTPwdZBDsYJABf5R01gfRT4veHXZnMdY7tdBH9KIDP7VT0E9i/r34ZNIOHb
	UTRA==
X-Received: by 10.70.91.234 with SMTP id ch10mr13914088pdb.39.1434567246513;
	Wed, 17 Jun 2015 11:54:06 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:a5ff:d7b:c36b:ccb?
	([2601:202:4000:1239:a5ff:d7b:c36b:ccb])
	by mx.google.com with ESMTPSA id bi4sm5444488pbc.56.2015.06.17.11.54.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jun 2015 11:54:05 -0700 (PDT)
Message-ID: <5581C24B.90902@gmail.com>
Date: Wed, 17 Jun 2015 11:54:03 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>	<1434547172-24620-10-git-send-email-alexander.kanavin@linux.intel.com>
	<CALbNGRTOzzmCBthScS4EZg9z7YHT9i6+RXxYgSX2LTjzS8RGjg@mail.gmail.com>
In-Reply-To: <CALbNGRTOzzmCBthScS4EZg9z7YHT9i6+RXxYgSX2LTjzS8RGjg@mail.gmail.com>
Subject: Re: [PATCH 09/22] Add a recipe for libsecret
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
X-List-Received-Date: Wed, 17 Jun 2015 18:54:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit



On 06/17/2015 08:05 AM, Andreas Müller wrote:
> On Wed, Jun 17, 2015 at 3:19 PM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> libsecret is a dependency of webkit
>>
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>   meta/recipes-gnome/libsecret/libsecret_0.18.2.bb | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>   create mode 100644 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
>>
>> diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
>> new file mode 100644
>> index 0000000..cebc83b
>> --- /dev/null
>> +++ b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
>> @@ -0,0 +1,12 @@
>> +SUMMARY = "libsecret is a library for storing and retrieving passwords and other secrets"
>> +LICENSE = "LGPLv2.1"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
>> +
>> +inherit gnomebase gtk-doc
>> +
>> +DEPENDS = "glib-2.0 libgcrypt"
>> +
>> +EXTRA_OECONF += "--disable-manpages"
>> +
>> +SRC_URI[archive.md5sum] = "23cdf8267d11a26f88f0dbec1e2022ad"
>> +SRC_URI[archive.sha256sum] = "12fd288b012e1b2b1b54d586cd4c6507885715534644b4534b7ef7d7079ba443"
>> --
>> 2.1.4
>>
>> --
> I think I have seen this recipe somewhere.. A note would have been nice

it is in meta-openembedded/meta-gnome per layer index. So is this part 
of move from one layer another task?

I take once accepted, the removal patches will be sent out?

- armin
>
> Andreas
>

