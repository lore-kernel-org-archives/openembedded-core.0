Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id D356E731C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 07:40:31 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id 187so31652052wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 00:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9UVhZemxuq0htOR+fKDBCoTZpdQp+LNRAocTroUF4OM=;
	b=0elYS5Apdz7Ehicjh7sG+b5NlWHkUq/5JoWNQB6t9rQMT742tCKmQJrXddsumF6L8f
	9nu+1G2fRtuOqo7Jf5CKVPYOZk4xeCFaYGqymxdNC+5uOQPa+ERTm7fdrDWHvt6egK5k
	z9vXLWBQtRrpeHRKS3lJRcyycXfRegDl/X6G4tCwo2ZkdmoJxOfJHXTCGl67BQI+Q1Oc
	QZwv2L6dKFdn9ABJEFE64ZmHWnky0XRBs/LrR7xd8c1nbuwyMrawSMIAHwMlaQFsfXwA
	/goHShHtBaYDl+g1iQMl/fxCQm/FJ+EaupuEssWyCGD9qYnTL2OtBCJw/7WY4JTssgwo
	1heg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9UVhZemxuq0htOR+fKDBCoTZpdQp+LNRAocTroUF4OM=;
	b=W6g6+Vx6pubWi9+BspDd2wxH2RV0LAT5at24Qk5amEk7peEZzZcV/mnF92Wje2L/DJ
	J01vEDdcECqkID/4Bafu/txKsQm5t1nEIZ6afCvasvqSGwcb7CDCLmgyy54V09oL0PFB
	aaxwdr9bmZOkAMdeeAM3/z1J6KuMjM5MTLyZXsmoNQ4sjA26lPAUU5ntwFZ4BFqZcIzZ
	gHThtLpt59OEKla9/KcegoJo2/YffDyolC6aTNooEJRW4649gUY1+ogZvMwEh7pIgcH9
	1QVjnL8eEsr7itXoJN7fLVjzfz3uoVDMMExku/UL+RxzWvSwu1NyOaqy2ida/UnQ98G9
	GPWA==
X-Gm-Message-State: ALyK8tIy09TIUIyiEoFJisaOObnYUbX2ccVgZ4PE0BE74aVy+FGJ8rhopnkK0SjZa/4OA4oqSH6Nq1/eBuPiOg==
X-Received: by 10.194.104.227 with SMTP id gh3mr6920413wjb.3.1467186031844;
	Wed, 29 Jun 2016 00:40:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.6.165 with HTTP; Wed, 29 Jun 2016 00:40:31 -0700 (PDT)
In-Reply-To: <4011216.TxvZQ32zt2@peggleto-mobl.ger.corp.intel.com>
References: <CAJ86T=UX4mrrftUtmnFX=Gv5JHXr0nFbh+qj7JOxbxFnKcfT9w@mail.gmail.com>
	<4011216.TxvZQ32zt2@peggleto-mobl.ger.corp.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 29 Jun 2016 00:40:31 -0700
Message-ID: <CAJ86T=UbbVc+ZD8V4=_8jRa-2pwspmW3mpDV-JAVxzG=C4AX8A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Setting SRC_URI via anonymous Python fails in OE 2.1
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
X-List-Received-Date: Wed, 29 Jun 2016 07:40:33 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 28, 2016 at 7:15 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Andre,
>
> On Tue, 28 Jun 2016 15:53:24 Andre McCurdy wrote:
>> The following works in OE 2.0, but fails in 2.1 and master:
>>
>>   python () {
>>       d.setVar("SRC_URI_FOO", "http://foo.com/foo.tgz")
>>   }
>>
>>   SRC_URI = "${SRC_URI_FOO}"
>>
>> Is it a regression or was something like that never intended to work?
>
> You didn't mention how it fails. However, I don't see any reason why we
> wouldn't want this to work, so if it does no longer work that seems like a bug
> to me.

The problem is that the intermediate variable doesn't seem to get
expanded, so SRC_URI ends up containing the string "${SRC_URI_FOO}".

ERROR: /.../footest_0.1.bb: Error executing a python function in <code>:

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 1, function: <module>
 *** 0001:__anon_651__home_andre_rdk_meta_classes_base_bbclass(d)
     0002:__anon_1315__home_andre_rdk_meta_classes_insane_bbclass(d)
     0003:__anon_242__home_andre_rdk_meta_classes_package_bbclass(d)
     0004:__anon_747__home_andre_rdk_meta_classes_package_rpm_bbclass(d)
     0005:__anon_25__home_andre_rdk_meta_classes_debian_bbclass(d)

File: '/.../meta/classes/base.bbclass', lineno: 552, function:
__anon_651__home_andre_rdk_meta_classes_base_bbclass
     0548:    needsrcrev = False
     0549:    srcuri = d.getVar('SRC_URI', True)
     0550:    for uri in srcuri.split():
     0551:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
 *** 0552:
     0553:        # HTTP/FTP use the wget fetcher
     0554:        if scheme in ("http", "https", "ftp"):
     0555:            d.appendVarFlag('do_fetch', 'depends', '
wget-native:do_populate_sysroot')
     0556:

File: '/.../bitbake/lib/bb/fetch2/__init__.py', lineno: 360, function: decodeurl
     0356:    """
     0357:
     0358:    m =
re.compile('(?P<type>[^:]*)://((?P<user>[^/]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
     0359:    if not m:
 *** 0360:        raise MalformedUrl(url)
     0361:
     0362:    type = m.group('type')
     0363:    location = m.group('location')
     0364:    if not location:

Exception: bb.fetch2.MalformedUrl: The URL: '${SRC_URI_FOO}' is
invalid and cannot be interpreted

ERROR: Failed to parse recipe: /.../footest_0.1.bb


> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

