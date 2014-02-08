Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id C81036E396
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2014 11:50:26 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id um1so4305761pbc.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2014 03:50:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=kxtqVwkelkaLFpRaECoUfpEtnzmfjw2l+nrqUuVIPyA=;
	b=Tf1Pb7iOWg9i9LctT4cQEMNoN0SvMz+9kDdHKLl2QdcZimh9t4KvRKg0dGQ1HI6t3O
	1TE+2oMx0xMqcZrmsUCJ0f+lGxCQ5VZ5qMNdd6Nx22L7vOnKhlpgfZInmQaafIfRF3fE
	7W5oYW6HQ+zG1HIP4ljnJDg/gmOxOmLNfSDDl0t9EGCcTYNcRkW8QOCDYLBDjaYUh1X6
	by/UM9CYP3vUgja2b2/RYvzKCvoN09VBGg7mV10GROIOiRhMbu+SrNdGLNpYh3TjnY7/
	cMclwPypuGVsTMIrvZ7RA/sABpKmGEFqkAneDWZYmN5OtSNOjOFDZeUkv6IohwpIujpC
	BB5A==
X-Gm-Message-State: ALoCoQnzYILb3apYTCs2WDi34W2ZcloV/oQDVZst2JsJ+RaFb/7j2d9w7YNvK9fNUVw82RbwA4vG
MIME-Version: 1.0
X-Received: by 10.66.163.138 with SMTP id yi10mr1028732pab.95.1391860227676;
	Sat, 08 Feb 2014 03:50:27 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.21.228 with HTTP; Sat, 8 Feb 2014 03:50:27 -0800 (PST)
In-Reply-To: <52F25D84.6060501@linux.intel.com>
References: <1391598835-1631-1-git-send-email-lpapp@kde.org>
	<52F25D84.6060501@linux.intel.com>
Date: Sat, 8 Feb 2014 11:50:27 +0000
X-Google-Sender-Auth: WRzP9bCWYQ3hXuvFhXRrFhYAOhs
Message-ID: <CAOMwXhMUuS2-dV1xe0YWFxOeD08ByUHHm8DPaqeT=4jAFzHXVA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/recipes-core/base-passwd/base-passwd/noshadow.patch: Split it into two parts
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
X-List-Received-Date: Sat, 08 Feb 2014 11:50:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Saul, would it be possible that you leave a short message on the
mailing list in the corresponding thread if a change is merged to
avoid such things in the future?

On Wed, Feb 5, 2014 at 3:49 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/05/2014 03:13 AM, Laszlo Papp wrote:
>>
>> The current change contains two different logics resulting that users like
>> me
>> may need to partially override the behavior of it. It would be easier for
>> end
>> users to keep one change while dropping the other if needed, like in our
>> case.
>>
>
> I beleive that your first version of this was merged, is this different that
> the one you send on 1/30?
>
> It seems that the line count in this patch is different than the first,
> please rebase against master and update this patch please.
>
> Thanks
>
> Sau!
>
>
>> Signed-off-by: Laszlo Papp <lpapp@kde.org>
>> ---
>>   meta/recipes-core/base-passwd/base-passwd/nobash.patch | 10 +---------
>>   .../base-passwd/base-passwd/noshadow.patch             | 18
>> ++++++++++++++++++
>>   meta/recipes-core/base-passwd/base-passwd_3.5.29.bb    |  1 +
>>   3 files changed, 20 insertions(+), 9 deletions(-)
>>   create mode 100644
>> meta/recipes-core/base-passwd/base-passwd/noshadow.patch
>>
>> diff --git a/meta/recipes-core/base-passwd/base-passwd/nobash.patch
>> b/meta/recipes-core/base-passwd/base-passwd/nobash.patch
>> index 6371576..eed87db 100644
>> --- a/meta/recipes-core/base-passwd/base-passwd/nobash.patch
>> +++ b/meta/recipes-core/base-passwd/base-passwd/nobash.patch
>> @@ -1,14 +1,6 @@
>>   use /bin/sh instead of /bin/bash, since the latter may not be included
>> in
>>   some images such as minimal
>>
>> -comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
>> -
>> -remove "*" for root since we don't have a /etc/shadow so far.
>> -
>> -by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
>> -
>> -Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
>> -
>>   Upstream-Status: Invalid [configuration]
>>
>>   Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> @@ -17,7 +9,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>>   +++ base-passwd/passwd.master
>>   @@ -1,4 +1,4 @@
>>   -root:*:0:0:root:/root:/bin/bash
>> -+root::0:0:root:/root:/bin/sh
>> ++root:*:0:0:root:/root:/bin/sh
>>    daemon:*:1:1:daemon:/usr/sbin:/bin/sh
>>    bin:*:2:2:bin:/bin:/bin/sh
>>    sys:*:3:3:sys:/dev:/bin/sh
>> diff --git a/meta/recipes-core/base-passwd/base-passwd/noshadow.patch
>> b/meta/recipes-core/base-passwd/base-passwd/noshadow.patch
>> new file mode 100644
>> index 0000000..14e3959
>> --- /dev/null
>> +++ b/meta/recipes-core/base-passwd/base-passwd/noshadow.patch
>> @@ -0,0 +1,18 @@
>> +comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
>> +
>> +remove "*" for root since we don't have a /etc/shadow so far.
>> +
>> +by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
>> +
>> +Upstream-Status: Invalid [configuration]
>> +
>> +Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> +
>> +--- base-passwd/passwd.master~nobash
>> ++++ base-passwd/passwd.master
>> +@@ -1,4 +1,4 @@
>> +-root:*:0:0:root:/root:/bin/sh
>> ++root::0:0:root:/root:/bin/sh
>> + daemon:*:1:1:daemon:/usr/sbin:/bin/sh
>> + bin:*:2:2:bin:/bin:/bin/sh
>> + sys:*:3:3:sys:/dev:/bin/sh
>> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
>> b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
>> index 082037a..5b31fce 100644
>> --- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
>> +++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
>> @@ -9,6 +9,7 @@ DEPENDS = "docbook-utils-native linuxdoc-tools-native"
>>   SRC_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/base-passwd_${PV}.tar.gz
>> \
>>              file://add_shutdown.patch \
>>              file://nobash.patch \
>> +           file://noshadow.patch \
>>              file://input.patch \
>>              file://disable-docs.patch \
>>             "
>>
>

