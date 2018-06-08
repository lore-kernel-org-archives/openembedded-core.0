Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 60190751F9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 22:42:14 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id r18-v6so3023492otk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iCO2cMRrCOlBawQo7wiM7s7kZ398XMweycIiM3g+7tI=;
	b=ehBsDSQY7dP3ZKVf8hg6HNrhQ6OYOiJTzfjB5e5j4BZdpi2x8rEW5ac/M9lWnuOOIc
	Zrk2+BzZrcxwpCmqlO3aXqlkHWPhKE7PK+Bi52FBLDfZt7pgYVMWpD+tmeD5RunUE3xK
	I/2dg3BZpGmuy4L6D7cDP2L/ZAzxoROQlTF8RzO64raDs91pNwlzEMae9IHg0VmOdz+C
	l0NfmbDrfONnODs12SB4fN/0TMFe6qax/oMaBwLSqXXX9AdtbSylVCkWLS+7aE9kx5fr
	lnhGwHCktmwibupAvy7kEIXS/dbL6FKJWfh29jkm1YwKZoKEyZCc8XvCWv0Mrj0wq5pq
	XXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iCO2cMRrCOlBawQo7wiM7s7kZ398XMweycIiM3g+7tI=;
	b=c9QI7/BWzjRQQrkFcbimZl2TTlRF4JqVIWKNIlLCL3mx+ReQSe2WTq5+C4xyabSOJJ
	+uagWowSHhjoP3jDGe47e1bI5uF+bETQ/ETIUFgZ6A6HwcC/c62rGTlhuFqTt4ikQHfI
	Xl3SEN3zNT6NjkQv4nXShhT06oDjlEil8KpBolvgK4RfEPixyY9KLtKSAq0E86ZCegdK
	2p3LvK+BO7jQej2BuoZb3ewDguAdpHOlgPHjjPXK5/f5ZNXrhh1vDO1OL9vboTx6QATS
	GVmkflBwojWF40fquCMVTbcS5S+i3jli4iOBHhRUWExw261LT+uSAU4+Bd4QTllsCuFr
	ZyQA==
X-Gm-Message-State: APt69E27IrMfQrlIkw8Ea9DV80/nPBNXQLJmlz6EJ9KWsOe88ZfazS4p
	9vjbeXOFE3kpP8jFW8Uvsb/knJ210okT+FSX4BkDSA==
X-Google-Smtp-Source: ADUXVKIlqsUpDRZfQBjVPsCk/jBFCwLAudpvz5H0cFofksfYF/gUYqZMuBlgAdElEw3jUnlZKQnGd12hseg6p9P/XvQ=
X-Received: by 2002:a9d:307:: with SMTP id 7-v6mr5270346otv.300.1528497735364; 
	Fri, 08 Jun 2018 15:42:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP;
	Fri, 8 Jun 2018 15:41:54 -0700 (PDT)
In-Reply-To: <ca098509-8af1-4fa8-f037-ba4f93142998@gmail.com>
References: <cover.1528442551.git.raj.khem@gmail.com>
	<5cd02eb482d16a30056d860dc3ef24b365eedc88.1528442551.git.raj.khem@gmail.com>
	<CACS+7ZSGxyfMhN0SRti8m1h9t1n_HCGfQC1-myiFj+UnkjAGbA@mail.gmail.com>
	<ca098509-8af1-4fa8-f037-ba4f93142998@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jun 2018 23:41:54 +0100
Message-ID: <CAJTo0LYopp=23x3FUduKLWm8mnh4_BiDsk=RLc=ucc_4cS4Ftw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] tcmode-default: Switch to gcc 8.0
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
X-List-Received-Date: Fri, 08 Jun 2018 22:42:14 -0000
Content-Type: text/plain; charset="UTF-8"

I've already tweaked this in my branch to be 8.* (as there's a
wildcard), so don't bother changing it unless you need to send further
changes.

Ross

On 8 June 2018 at 23:28, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On 6/8/18 3:26 PM, Dan McGregor wrote:
>>
>> Should the subject read switch to gcc 8.1?
>
>
> right or better just gcc 8,
> Richard do you want a new rev ?
>>
>>
>> On Fri, 8 Jun 2018, 01:29 Khem Raj, <raj.khem@gmail.com
>> <mailto:raj.khem@gmail.com>> wrote:
>>
>>     Signed-off-by: Khem Raj <raj.khem@gmail.com
>> <mailto:raj.khem@gmail.com>>
>>     ---
>>       meta/conf/distro/include/tcmode-default.inc | 2 +-
>>       1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>     diff --git a/meta/conf/distro/include/tcmode-default.inc
>>     b/meta/conf/distro/include/tcmode-default.inc
>>     index 8e15f694d0..cb17061706 100644
>>     --- a/meta/conf/distro/include/tcmode-default.inc
>>     +++ b/meta/conf/distro/include/tcmode-default.inc
>>     @@ -22,7 +22,7 @@
>>     PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial =
>>     "${TCLIBC}-initial"
>>       PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?=
>>     "nativesdk-glibc-initial"
>>       PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>>
>>     -GCCVERSION ?= "7.%"
>>     +GCCVERSION ?= "8.%"
>>       SDKGCCVERSION ?= "${GCCVERSION}"
>>       BINUVERSION ?= "2.30%"
>>       GDBVERSION ?= "8.1%"
>>     --     2.17.1
>>
>>     --     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

