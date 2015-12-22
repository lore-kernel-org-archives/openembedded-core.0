Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id E0E037319E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 19:52:26 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id l126so122071585wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 11:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=txlN2yZoDBwtsPSV9Ti+B2Y6+eX05fYNZr76e2yK9R0=;
	b=z3xguGBV0LdSOWfg8w6ztFCVStZ5sGWHqnv7SQCP9Hl60+21qnu8W3fwy46JlD+dJB
	UejN3yvUSWsHDDa7f2eEyvMCnpWCHO7ZCFj1n4loFyXsUglZabl43PU5AdU2Y3LQHRRS
	4tHds0OXTQVDE6td4IcJ+v26FDb/dCuRJ7v/8/iDRGj4YJl66Vjypr7zA06lCtCkMdK/
	ZyneyJhScbaRPvdZNNg4X0Sa2RzoxVSPwviXo2SEBYm7xzukzk+bKVRzwyxa419g8PCW
	ImVSxk0G0fr5hhHsJ0lYnX015GAAaRsmHwdr5HckyCeNQzCpn3r7dk0zPOA2gEvdXhTs
	O//g==
MIME-Version: 1.0
X-Received: by 10.28.86.196 with SMTP id k187mr28491888wmb.61.1450813946962;
	Tue, 22 Dec 2015 11:52:26 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 22 Dec 2015 11:52:26 -0800 (PST)
In-Reply-To: <56794E98.3050605@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
	<91b12be58798efa4bcd8742b50d48077aa3ae6bd.1449671297.git.alexander.kanavin@linux.intel.com>
	<CAJ86T=Uo0tAtbNYXYkmcvm2bqMUeq79it_cH5aSChgtNsBdsNA@mail.gmail.com>
	<56794E98.3050605@linux.intel.com>
Date: Tue, 22 Dec 2015 11:52:26 -0800
Message-ID: <CAJ86T=V721kLwWtqLEWmTvJPj-LSw93uoM=s9afOH8xiZKd5Rg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/10] mirrors: replace references to archive.apache.org
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
X-List-Received-Date: Tue, 22 Dec 2015 19:52:27 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 22, 2015 at 5:22 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 12/22/2015 12:21 AM, Andre McCurdy wrote:
>>>
>>> -http://www.apache.org/dist  http://archive.apache.org/dist \n \
>>> +http://www.eu.apache.org/dist  http://www.us.apache.org/dist \n \
>>
>>
>> Is this change correct? Shouldn't mirrors.bbclass provide a fallback
>> to the historical releases URL (so that things keep working if the
>> oe-core version of an apache.org package is no longer a current
>> version) ?
>
> When I have checked, archive.apache.org did not have the latest releases of
> subversion, so it can't be relied on as a primary upstream source. On the
> other hand, primary mirrors only keep the latest releases, and remove
> anything else. So the right thing would be to first try to use those primary
> mirrors, and fall back to archive if those mirrors no longer have the
> version we need.

Yes, that's what I was getting at - there should be a fallback to the
archives since oe-core releases typically won't be using the latest
release versions. Your new patch looks good.

Checking subversion on http://archive.apache.org/dist today though,
the archive site does seem to have copies of the latest versions, so
not sure what was happening when you looked.

> This problem also shows up with debian upstream.
>
> Alex
>

