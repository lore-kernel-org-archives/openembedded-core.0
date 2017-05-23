Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id AAF996025F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 18:14:44 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g15so21731012wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 11:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gZAPaSBCuCdZMhJ4BMDUL6PFrxryi3X0DTE+kLzEX7Y=;
	b=URqteet8D+nLer2P5t+rFTA5iIAhcocAWIvyTJ5XLHCvGr6i0/0aVqcWJd2zoHSyml
	H1ZU+xkhFmkfCd2mBpJu4cfKipy5FDy+HbPRq6KZ+4PULqfZkzZQTyorvW0f912N/CQ4
	kp66bmqqbFEyHEzH17uMf/O6YnvImW/4xaJt2r41UhI/40Q7iPVk04jtpyF7qGKh9c8F
	OwzmRAL27rMe8dlkGMmhNQl7wTVj9+eCyxfs/TLzLnqRf8NK8MQyp62kOZyXQyXDm4M9
	a811ACQwOLDULCLDl03kxTdPm+rw8PDmaT+CwffY1B0IwrecyAW7QJt+1KOOf+LXKkBr
	CNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gZAPaSBCuCdZMhJ4BMDUL6PFrxryi3X0DTE+kLzEX7Y=;
	b=Q8CeKiwOzqVATPXRdjS36szZ+YLCejb9o/jrVeWdlVF6r9n6LU6kp5SX0bmEEfYTxB
	Smuub98RCN1UaysXUsZhUZgGUa+84jzR/PseefczW0hnvfoT2gq8HV6BN7FMHbo4k9Gc
	f4dlRypvoenzM9jilXNapvCS8q+4Isc8K6puMMqrPvgqzRsjFdIWZCjhj3WgYpKCDY0u
	w0p4ApuxdUISMALpII1Em6SROLGliSsz/JGmYFXSf86P+BHqgbOSi35em6upi+7XBt9X
	3Fv/fnldH5FQi6kjCBct463IiJsa5xfLbDXRbVakmTvAoen180RKus+C6j7OlusGRTIa
	0SfA==
X-Gm-Message-State: AODbwcCrIcUG6TaFX6M+2pPHptS+wjVJvPWiyY0rx9wTo+5+ub2Oc8rb
	IFtY30DKlk3ohU/n4aF2Iys0rGr0dA==
X-Received: by 10.80.154.165 with SMTP id p34mr21586544edb.127.1495563285733; 
	Tue, 23 May 2017 11:14:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Tue, 23 May 2017 11:14:15 -0700 (PDT)
In-Reply-To: <10077e31-2f0d-2915-fa2c-38c5eadc8b87@linux.intel.com>
References: <20170522222523.15978-1-alejandro.hernandez@linux.intel.com>
	<CAMKF1soNk9DWEuiYSy_zQ=MrUSK186FAGQJOSDOu=_nfHGByqw@mail.gmail.com>
	<10077e31-2f0d-2915-fa2c-38c5eadc8b87@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 May 2017 11:14:15 -0700
Message-ID: <CAMKF1srhUEO3QGgbZUuEE6Z49pJUGJ5rkhSghcNebrv7vkHcHw@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] intltool: Adds gettext as a DEPENDS
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
X-List-Received-Date: Tue, 23 May 2017 18:14:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 22, 2017 at 4:08 PM, Alejandro Hernandez
<alejandro.hernandez@linux.intel.com> wrote:
> Hey Khem,
>
>
> On 05/22/2017 05:41 PM, Khem Raj wrote:
>
>
> On Mon, May 22, 2017 at 3:25 PM Alejandro Hernandez
> <alejandro.hernandez@linux.intel.com> wrote:
>>
>> When setting USE_NLS="no" and building systemd-boot
>> (which DEPENDS on intltool), configure fails,
>> complaining about missing gettext:
>>
>> configure: error: GNU gettext tools not found; required for intltool
>>
>> This is caused because USE_NLS="no" makes the gettext class
>> add gettext-minimal-native to BASEDEPENDS instead of adding
>> gettext-native.
>>
>> Since we still would like to set USE_NLS="no" and build systemd-boot,
>> we add gettext-native as a dependency to intltool-native, which makes it
>> available for the configure script of systemd-boot fixing the problem.
>>
>> [YOCTO #11562]
>>
>> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
>> ---
>>  meta/recipes-devtools/intltool/intltool_0.51.0.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
>> b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
>> index 551bdf0619a..ecff2faf253 100644
>> --- a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
>> +++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
>> @@ -16,7 +16,7 @@ UPSTREAM_CHECK_URI =
>> "https://launchpad.net/intltool/trunk/"
>>
>>  DEPENDS = "libxml-parser-perl-native"
>>  RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"
>> -DEPENDS_class-native = "libxml-parser-perl-native"
>> +DEPENDS_class-native = "libxml-parser-perl-native gettext-native"
>
>
> This will serialise the build I think it better to add the dep only when NLS
> is down disabled
>
> I thought about doing so but I couldn't think of a clean way of doing it.
>
> I can't get rid of it on the gettext.bbclass since it would mess up the work
> on b090fde5c184
>
>
> What I can do, is set gettext-native as a DEPENDS to systemd-boot which is
> the one that is actually
> complaining, this way we would keep returning gettext-minimal-native when
> USE_NLS="no", but we would
> also fix the issue, what do you think?

Looking  more closely, I realize this is right fix since all packages that need
intltool would invariably need gettext during configure

