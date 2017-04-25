Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3121377B50
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 21:11:28 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id r190so108170842wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 14:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YdlYxPcgNVvwM4P9eKoOPvh+pROcl2e1N2l4orDjbio=;
	b=ZOnvUMONN1dOqBTUCoe7S5ja+VbHqylaWcz0XYhThXQiyzm5iDVzWCaVQNXG1Qr2py
	5rkP7i/oqi0gcCyRHuTvyJL5fuZhm2u6al05WfJLLN/jkqhu/ZZGXsbtDYD7/5DE5Q6F
	zsQ+BBGurBwzlwrCQGAmw8oenBHAefC3dJOnUmYwYQ7BKF3TJYjSmxnqLbwwVPYWAmq0
	XBSnhlvI8nySDdyFnXagJlVnq1Hrw23nJq//DB5BLV3VeAXN8UHCG2FyMAge7XKjkYr6
	/TvYvkBNmkE7b+4HGtfvDZkfpzL1NtsszydDWBigUocMgnlO0QbUh6QgK1ghb6PfGEnc
	FK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YdlYxPcgNVvwM4P9eKoOPvh+pROcl2e1N2l4orDjbio=;
	b=PT41aXBNDNuisj9vsv5ZvV0VEk0Cosx1rSTlAbT9qWUyD1nqPIWlPcR3oMTgwwR13Z
	sBmum4xBRYuS4E2WG9hY6/uBKteGh6QLnPI9T6KY10qWwFL06Ns8KCORddJnEatpK1RL
	zizB+zAGpE0ygo374zk8ZAcmvMDDOpPOues3NHvmWRpYSItt1oOCmlBO54S2UqEPORtO
	iQ07y8+4Ak9YUTnsTNxOvYL1NXy7t7AtH641TXC9I4y6ludBrVSu9KLYqQdPixl2Nwsq
	DXQsUxzaH0nVYyoSEoQT/A1PcDws3NfpFIuarlPGXYt+tB0KEBxv97X9aBJ0BY+IyEzA
	0h8A==
X-Gm-Message-State: AN3rC/4HFi1/GNi0IAMCK3XBac+yOZZS8zQa5Mm/aX3ik+rNWoF+6fh1
	alOKs//BFqFWiegRY8yT1Up0iMTaIA==
X-Received: by 10.28.56.1 with SMTP id f1mr3599237wma.20.1493154689805; Tue,
	25 Apr 2017 14:11:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.172.100 with HTTP; Tue, 25 Apr 2017 14:11:29 -0700 (PDT)
In-Reply-To: <1493136369.1798.26.camel@linux.intel.com>
References: <1492649254-29363-1-git-send-email-armccurdy@gmail.com>
	<20170420010154.26296.84391@do.openembedded.org>
	<1493136369.1798.26.camel@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 25 Apr 2017 14:11:29 -0700
Message-ID: <CAJ86T=UcDR14vkrTeGiOK9uADqH5B0SkV9Xj-vP=YXdG1uGdyg@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGJ1c3lib3g6IGZpeCB0eXBvIGluIENWRS0yMDE2LTIxNDdfMi5wYXRjaCBVcHN0cmVhbS1TdGF0dXMgdGFn?=
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
X-List-Received-Date: Tue, 25 Apr 2017 21:11:38 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 25, 2017 at 9:06 AM, Leonardo Sandoval
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> On Thu, 2017-04-20 at 01:01 +0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: busybox: fix typo in CVE-2016-2147_2.patch Upstream-Status tag
>> Revision: 1
>> URL   : https://patchwork.openembedded.org/series/6429/
>> State : failure
>>
>> == Summary ==
>>
>> Thank you for submitting this patch series to OpenEmbedded Core. This is
>> an automated response. Several tests have been executed on the proposed
>> series by patchtest resulting in the following failures:
>>
>> * Patch            busybox: fix typo in CVE-2016-2147_2.patch Upstream-Status tag
>>  Issue             Missing or incorrectly formatted CVE tag in commit message [test_cve_presence_in_commit_message]
>>   Suggested fix    Include a "CVE-xxxx-xxxx" tag in the commit message
>
> Andre,
>
> there is no need to send a second revision due to the above patchtest
> issue. The system detected the CVE on shortlog thus triggering the check
> on the commit message, but for this case there is no need. Will fix
> this.

Thanks Leo.

>>
>> If you believe any of these test results are incorrect, please reply to the
>> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
>> Otherwise we would appreciate you correcting the issues and submitting a new
>> version of the patchset if applicable. Please ensure you add/increment the
>> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
>> [PATCH v3] -> ...).
>>
>> ---
>> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
>> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>>

