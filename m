Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id CC9D36D847
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 00:52:47 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id tp5so9956997ieb.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 16:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0I53fLWfSf1CKcNnMyZJW51BAamJGJEjvPPCT0ml/Yk=;
	b=KMgWUYsBGKQZxdi+POei4MxN3pHwe9DHQhKqb6fT888wqzRYA7HffY3UWZ654MUiwu
	V5DXHwi4glOJE4lo6U9FE9U3KkLxMS0jwVsIHdD/Zlsm0mrYVP79HmwtJHtoVlvaSWLa
	s4KAFCMkX1s89qBRfFoJcSS91qCBJEDXBCfVnpHZYyTQLLmvF6WOkxeQU0qhp08XVpjW
	X3Wh0kmuV/YDs6c44EslQOWHCw/PtfXQgd6UyKMz0akvRglRqE9OiNlg2e726v3rRUZ4
	ymks2nds5w9ne9Hlx3P7AtF4+GpDyrb7c/YIdZn1/RRNEII5oS7LN46139eWOi+6PwCt
	TeGw==
X-Received: by 10.43.60.139 with SMTP id ws11mr19675576icb.12.1386723166931;
	Tue, 10 Dec 2013 16:52:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.79.167 with HTTP; Tue, 10 Dec 2013 16:52:16 -0800 (PST)
In-Reply-To: <5616775.7LhWvOXBE4@helios>
References: <cover.1386687474.git.liezhi.yang@windriver.com>
	<5616775.7LhWvOXBE4@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Dec 2013 16:52:16 -0800
Message-ID: <CAMKF1spMpasnjJ9z41rt57cfnbze_xHVuK1KoQNcoG+d16aL3w@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 000/124] [dora] fixes for dora (cover leter only)
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
X-List-Received-Date: Wed, 11 Dec 2013 00:52:48 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 10, 2013 at 10:03 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>
>> Bruce Ashfield (10):
>>   kernel: restore scripts in the sysroot
>
> Wasn't there a problem with this patch? I can't recall if it was rectified
> before or after it was merged to master.
>

Problem is elsewhere, there was more of documentation issue with
Richard fixed in module.bbclass.
this is ok.

