Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id DE26C708B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 19:06:21 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id v1so935526yhn.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Oct 2014 12:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=VCallBcaJ+jwEk0oPe0zU+qc/1XlGbAf+D92aItRpLo=;
	b=eM5lDCNmfGvwPgCLyCl/q6B/aP7DcW4MwvpGNZJQpVB/75Fw5FHs5f5n6RRxsatOU/
	8Rq2qknvSWysfeKEbn1xI6u1jzOJe99MmD487EJxMu1e/Q+d9i9BfmvjdqEb5qPV6A8P
	CyWA+Wn8RPI2V0TvnFLTlxKEoAcjcjjOvrOhf4ssljnRJBDoPE3jGYZPzB13gjE5lrzH
	Ph3HK85TrSul4I9tY4WvigLHiPUtjn6b6IQYYu519wHdXSM2jaqxStAIyJrtdUpCVGQ0
	WLmEtWA7CsNWXVYazcvY3bdJBVp5kvEa3FeIWjuDR+aMV+VpKzawdxlbrarbqB6+rb1V
	lpEA==
MIME-Version: 1.0
X-Received: by 10.236.148.212 with SMTP id v60mr1161653yhj.102.1412276782726; 
	Thu, 02 Oct 2014 12:06:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.70 with HTTP; Thu, 2 Oct 2014 12:06:22 -0700 (PDT)
In-Reply-To: <542D73E0.4050306@windriver.com>
References: <542D65BD.1000904@windriver.com>
	<2071526.AGrvLGiTzH@peggleto-mobl5.ger.corp.intel.com>
	<542D73E0.4050306@windriver.com>
Date: Thu, 2 Oct 2014 16:06:22 -0300
X-Google-Sender-Auth: aCrWQgz8DR_hiomfW4b7NtXKvJU
Message-ID: <CAP9ODKpCRr2yBN5X2TRwKRLNg7vQVQym-f_S5AqEs9eMzOTCAg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Bash security vulnerabilities - Question for master
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
X-List-Received-Date: Thu, 02 Oct 2014 19:06:24 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 2, 2014 at 12:48 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 10/2/14, 10:13 AM, Paul Eggleton wrote:
>>
>> On Thursday 02 October 2014 09:48:29 Mark Hatle wrote:
>>>
>>> With the recent vulnerabilities, a bunch of patches are being sent up to
>>> the
>>> list.  The content is generally fine, but I'm wondering if for master we
>>> should apply all of the official bash patches to get to the latest patch
>>> version, instead of applying various 'security' fixes that may or may not
>>> be the official version.
>>>
>>> For instance, bash_4.3:
>>>
>>> SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
>>> [followed by a bunch of local patches]
>>> "
>>>
>>> ncftp .../bash/bash-4.3-patches > ls
>>> bash43-001        bash43-004.sig    bash43-008        bash43-011.sig
>>> bash43-015        bash43-018.sig    bash43-022        bash43-025.sig
>>> bash43-001.sig    bash43-005        bash43-008.sig    bash43-012
>>> bash43-015.sig    bash43-019        bash43-022.sig    bash43-026
>>> bash43-002        bash43-005.sig    bash43-009        bash43-012.sig
>>> bash43-016        bash43-019.sig    bash43-023        bash43-026.sig
>>> bash43-002.sig    bash43-006        bash43-009.sig    bash43-013
>>> bash43-016.sig    bash43-020        bash43-023.sig    bash43-027
>>> bash43-003        bash43-006.sig    bash43-010        bash43-013.sig
>>> bash43-017        bash43-020.sig    bash43-024        bash43-027.sig
>>> bash43-003.sig    bash43-007        bash43-010.sig    bash43-014
>>> bash43-017.sig    bash43-021        bash43-024.sig    bash43-028
>>> bash43-004        bash43-007.sig    bash43-011        bash43-014.sig
>>> bash43-018        bash43-021.sig    bash43-025        bash43-028.sig
>>>
>>> The community has 28 patches for various bugs (and these security issues)
>>> posted.  Would it make sense to update to bash 4.3 (28)?
>>>
>>> In our bash 3.2.48:
>>>
>>> SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
>>>
>>>
>>> ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=p
>>> atch001 \
>>>
>>>
>>> ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-050;apply=yes;striplevel=0;name=p
>>> atch002 \
>>>
>>>
>>> ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0;name=p
>>> atch003 \
>>> ...
>>> "
>>>
>>> Some of the upstream items are applied, but I'm wondering if we should
>>> extend that to patch level 55 (the latest) in the same way.
>>>
>>> Both patch level 4.3 - 28 and 3.2.48 - 55 will apply all of the fixes
>>> that
>>> keep getting submitted plus a set of other general bugs.  It will also
>>> make
>>> it easier for security scanners to simply check the version and know the
>>> right fixes have been applied.
>>
>>
>> FWIW, I'm inclined to agree - given the severity and high profile of these
>> issues I think we should patch up to the latest patchlevel. Do we have
>> enough
>> tests to mitigate any risk of doing that for the 1.7 release, given how
>> late
>> we are in the release cycle?
>
>
> I think between the ptest and normal system integration testing, we have
> enough tests to mitigate the risks.  Plus the patches themselves are heavily
> tested by the [bash] community and the official changes, so I think it's
> significantly less likely they will introduce issues.

I agree as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

