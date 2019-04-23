Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail.openembedded.org (Postfix) with ESMTP id 418FB7CF9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 13:44:58 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id d46so12656581eda.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 06:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=Mj8XByYyPbrs+X+qkuIcTy7KJo/G8brp0UGuuG4RtuE=;
	b=bny851wb5UkmHGzwmvtmFWoNUOnLkBGV4ynMJAe/knaXiHpfBcXgLqRdwR9i8G7H5H
	17lRloZQoGECZJrSByI2cnDU1Ws8wtAaD86H4yMltNJCtFmmbeW85+tCHmDxXRcNWR7H
	y4ldZsQ5hpsVE6H/0ISiKHOcu5hPjwiloBuT9VG9FZ2ldbESn7suO+fwjHEbAEaPtEIU
	eVsk8NiWYm+e0B3HYvi1j/ZhPmMMQqGf+m+2K8x4X9EPemxnNZs6QwrJAVTbn9O9SzeK
	xYCa7WeUGvWkHPIAAZxGzSKZWG3PHFXVqAbYA6F29zEzVXRQIuzl3dvmSJXbdQlKUqbT
	ElfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Mj8XByYyPbrs+X+qkuIcTy7KJo/G8brp0UGuuG4RtuE=;
	b=VI9wAu471GUttBrYMiiHTpgaASTeH78F8uKWHNnL6aZZSaU8WZZUIwJsWkaNyRbpsx
	NRb/EPTk/5FCsw1Cl7XBR0wsi0jLRc/20lCe+yfblVxw73UXdy5iffw16VuxakdFeT2o
	TTQrBnIPL3qp0UTWFXw92VG6WlpaVEk9GnsqtgnFnuwMnP9sot6y6WZ5UPtO7wtk/+Ds
	P//2nUuW6QZK2m9b6q49MNC9wddyyH0Ft4MxuSg8kVKa7Y2Oa0XCYucf28bT1NbZ+HM3
	Mp3UY3kB/ijnV9S6u6GOpPbGF6VV9hevJRrYD8OhK5ConANIdtv4Fl648tg1Fkj9uDHq
	s3lw==
X-Gm-Message-State: APjAAAXLO5aqqHWZhC6RmMhRF8VjjEKhePfWXWJMxiCASCEn42U4M9AA
	EyRENpxnuehDlOMQ7V4BktSVyVuOApU=
X-Google-Smtp-Source: APXvYqxonbho7GN1gwYIqtxN/1vKILgq7iULHaXtT+sxkHDdLD240kb+C4m7IEJnfO28RuQlMN4w+g==
X-Received: by 2002:a05:6402:389:: with SMTP id
	o9mr16134072edv.85.1556027099536; 
	Tue, 23 Apr 2019 06:44:59 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id x14sm4778065edm.1.2019.04.23.06.44.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 06:44:58 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20190422223648.30507-1-open.source@oleksandr-kravchuk.com>
	<CAJTo0LYefGWi6Y8qo68oi=7RnLLVyYFYewdvrxUNnb0HZ6Y7jg@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <b2f825a1-b567-8f15-752c-347e6d83b2c5@oleksandr-kravchuk.com>
Date: Tue, 23 Apr 2019 15:44:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYefGWi6Y8qo68oi=7RnLLVyYFYewdvrxUNnb0HZ6Y7jg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] libnotify: update to 0.7.8
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
X-List-Received-Date: Tue, 23 Apr 2019 13:44:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 23/04/2019 13:59, Burton, Ross wrote:
> Fancy following this up with a Meson port?
>
> Ross
>
> On Mon, 22 Apr 2019 at 23:37, Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  .../libnotify/{libnotify_0.7.7.bb => libnotify_0.7.8.bb}      | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-gnome/libnotify/{libnotify_0.7.7.bb => libnotify_0.7.8.bb} (80%)
>>
>> diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.7.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
>> similarity index 80%
>> rename from meta/recipes-gnome/libnotify/libnotify_0.7.7.bb
>> rename to meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
>> index 6c299bc175..82c137ca33 100644
>> --- a/meta/recipes-gnome/libnotify/libnotify_0.7.7.bb
>> +++ b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
>> @@ -10,8 +10,8 @@ inherit gnomebase gtk-doc distro_features_check gobject-introspection
>>  # depends on gtk+3
>>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>>
>> -SRC_URI[archive.md5sum] = "e9d911f6a22435e0b922f2fe71212b59"
>> -SRC_URI[archive.sha256sum] = "9cb4ce315b2655860c524d46b56010874214ec27e854086c1a1d0260137efc04"
>> +SRC_URI[archive.md5sum] = "babb4b07b5f21bef42a386d3d7019599"
>> +SRC_URI[archive.sha256sum] = "69209e0b663776a00c7b6c0e560302a8dbf66b2551d55616304f240bba66e18c"
>>
>>  # there were times, we had two versions of libnotify (oe-core libnotify:0.6.x /
>>  # meta-gnome libnotify3: 0.7.x)
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

2019-04-23 13:41:30,546:scangobj.py:execute_command:1200:WARNING:Running
scanner failed: [Errno 2] No such file or directory:
'/home/sashko/projects/yocto/open-embedded/build/tmp/work/i586-poky-linux/libnotify/0.7.8-r0/build/gtkdoc-qemuwrapper':
'/home/sashko/projects/yocto/open-embedded/build/tmp/work/i586-poky-linux/libnotify/0.7.8-r0/build/gtkdoc-qemuwrapper',
command:
/home/sashko/projects/yocto/open-embedded/build/tmp/work/i586-poky-linux/libnotify/0.7.8-r0/build/gtkdoc-qemuwrapper
./libnotify-scan

Is it worth fixing?


