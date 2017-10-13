Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DA23177E93;
	Fri, 13 Oct 2017 02:40:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id b79so7779884pfk.5;
	Thu, 12 Oct 2017 19:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HNH39IfWmpS7igaw9exWpLcvf0NdX+YqVcIWfmBswS8=;
	b=BE5/n8Pau8WXQ9QKBMA3Z+EobJJF7B11NsRlpcsO+DT/1tGkYmJ3d6MOnn/b4t6xvM
	Ec4dIL84LMhjRULgNP/Wn+SC5x8uH7536eZIYm9NAs536iwbZ+BGVvimiuYIvq5EisZy
	HhWg/I6vKxMJGkGr9DhMax8qVEBR1zq4SM3z45aQ+3TlgmKiwIfI+QEf2mkv6FiyGMfQ
	885ZECwij70JB0MjC215cXvFjYpYMYvZoWOQxfiwNabVfHTo9kdFG8NDMjo1PbYqj9sD
	9gKxw6/4QmxxqQPjTCNXYN1wYzBLATShm5WlWGHBT5L85O0BpjikZtncto5tqb6nKNVk
	CHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HNH39IfWmpS7igaw9exWpLcvf0NdX+YqVcIWfmBswS8=;
	b=i6OBU0J635tHMcCiX81QoUm7G1JmcrROwREzQt/Ay6DzRyFJI7XmFP74TfwuGhoinX
	mL5un1h1dnOm0wy5jjCxNvGIhmZZOxowqviah6q2IG2sJcu211+2XJpmDRDob8pWmkrP
	q+ij/ZaQS8PtIM7pIfvgrGrnEJXbXxNo7aE6UycvpdqTRtHpDWGwTzxvVdarw9r9gVWr
	zhWDiIbtp0uc9gp6hMCf4Yh7ilMj0cqJeVIZ31MKGKs3huLgQWnKXtItpffcNRGHQ8ap
	JF9bDTj2BIK+1i1RMx87t9ACO/oYMq3Ky/MmaTpg0R7NI2ROH8bQ2bB112mX+OV8aRVQ
	ykeg==
X-Gm-Message-State: AMCzsaXsNlsqZkDteDdeRSjUT0vaY/fvoeA8UVFi5JwuMj8kKf5vtlbJ
	ovSPt8+sm5BSmqp1CFw32sjqxkiQhO0Y3q+wnX4=
X-Google-Smtp-Source: AOwi7QBex57K91bhJAkHSwkH9c3m26Jw2PnrrfaNDDvbcvk2OZ2QxLVKtxen0RwkUSlIGlXw2ihFTc3GTMsIEhKZWIQ=
X-Received: by 10.99.152.17 with SMTP id q17mr1742587pgd.287.1507862434765;
	Thu, 12 Oct 2017 19:40:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Thu, 12 Oct 2017 19:40:04 -0700 (PDT)
In-Reply-To: <CA+chaQe1gHwBOzvA7mKTMU312iF5HApkMjib7J5CysEQCuA-3g@mail.gmail.com>
References: <150754017019.10662.17591818165714630277@git.openembedded.org>
	<20171012015609.GA3832@jama>
	<CAMKF1sptwf=LMdHmXCKN1tCyPGgQcezhvKqHX3rNs113pL1dnQ@mail.gmail.com>
	<50262241.T8AzmBLD0O@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1sqqx-7PgL7833JVTn87Tdc57+h-Ob7VLfBD4khmpKN+HA@mail.gmail.com>
	<CAJTo0LZMRAP4t4XcjyNw-uhnqLLU=sQW38=EMKn=RKo3=c-bEw@mail.gmail.com>
	<CA+chaQe1gHwBOzvA7mKTMU312iF5HApkMjib7J5CysEQCuA-3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Oct 2017 19:40:04 -0700
Message-ID: <CAMKF1sq-BgVCA0C_coZDpxWJhnOLxsUTxZQyHg13AO1zoLbGgA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/01: bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
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
X-List-Received-Date: Fri, 13 Oct 2017 02:40:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 12, 2017 at 7:35 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I just got bunch of do_fetch errors from components using
> git://....;protocol=ssh
>
> So it isn't just the sanity check and CONNECTIVITY_CHECK_URIS, it's
> everywhere where git-native (by default in ASSUME_PROVIDED) is used with
> ssh.

right, I realised that it wont make the situation worse, then it was
in last release,

>
> On Thu, Oct 12, 2017 at 1:34 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 12 October 2017 at 06:01, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Wed, Oct 11, 2017 at 9:32 PM, Paul Eggleton
>>> <paul.eggleton@linux.intel.com> wrote:
>>> > On Thursday, 12 October 2017 3:15:12 PM NZDT Khem Raj wrote:
>>> >> On Wed, Oct 11, 2017 at 6:56 PM, Martin Jansa <martin.jansa@gmail.com>
>>> >> wrote:
>>> >> > On Mon, Oct 09, 2017 at 09:09:31AM +0000, git@git.openembedded.org
>>> >> > wrote:
>>> >> >> --- a/meta/conf/bitbake.conf
>>> >> >> +++ b/meta/conf/bitbake.conf
>>> >> >> @@ -484,7 +484,7 @@ HOSTTOOLS += " \
>>> >> >>  "
>>> >> >>
>>> >> >>  # Tools needed to run testimage runtime image testing
>>> >> >> -HOSTTOOLS += "ip ping ps scp ssh stty"
>>> >> >> +HOSTTOOLS += "${@['', 'ip ping ps scp ssh
>>> >> >> stty'][bb.data.inherits_class('testimage', d)]}"
>>> >> >
>>> >> > Shouldn't we include at least ssh by default?
>>> >>
>>> >> I would say no, since nothing in OE-Core depends on it. more we
>>> >> abstract from host system better it is.
>>> >
>>> > I'm with Martin on this one, let's not make it painful for people to
>>> > use
>>> > the SSH protocol in git URLs in their recipes. I don't see much
>>> > potential
>>> > for host contamination.
>>>
>>> Standard distro do not install ssh, if we want to add it here, probably
>>> we
>>> should at the same time let user know that he should install ssh
>>
>>
>> That's what HOSTTOOLS_NONFATAL is for.  Who is going to claim the glory
>> and post a patch?
>>
>> Ross
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

