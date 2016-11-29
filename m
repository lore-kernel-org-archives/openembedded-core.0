Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E5A5560291
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 00:32:16 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m203so21722200wma.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 16:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x9hCNlhziJSas/u91ZdVDIX40dDIfWHR+FEMJww80AM=;
	b=c4TduhUDvYtJpYaD9+0+zFD9JgRf/TmznqJ8T2SK3WlBQJ6O4sqEV67pCjj+D4zcpV
	T/RM9Q8096Y1aax1X0K5NxnyAGzYOo2U2fqJpDpIBHdOxko9cYiGpnOymUxMbqUvwPuU
	RExu599LXseynQ/A6lHDqu2qyHLyvo93MK9e2zP3ITTTLnWk0StWc2Mu5vUvLeMEb4td
	rFCcVrOVzcNcjxcXKKI6WGRPey6rZKh8TWslFdqvqWDsVIQkd7lPS1IasBXqVQ4ssBzX
	MK/RefK9RamQ/8amdrVuo2wP1PV8TZe3xAHzUrAKUBJgfpEpHLrvkEn355AYO5YPgLd3
	u7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x9hCNlhziJSas/u91ZdVDIX40dDIfWHR+FEMJww80AM=;
	b=LX4AMwxfl7DQMq1tzfi4OsV1vCjP6gkr8OY6v0eHspy0wsYYrjzWZoIoNitsRDqfsR
	FLO0W6BNcV8dAftl5ES4hAGVqzRlMrHvwfsjnI5OMz9sWjqWSaW/DkTZalwD3Wgy5aLb
	8nNkraywMg51u89Sj2DmRA77ePrxsjKpbYN/IBVQiwg0VlUAe+N7SJp5uy9IINtjYo+y
	OAANT/hWh+rKZR4BupjEcTDCpQDaFqZLgIrMP2fh7u6Zi3JauG70yNX7uzLIfnOXbtik
	GzqV/cYcgwglL/F1FSDxyTCj1+2pra3sex/6A4jtiT6B55Y4582goXQm0T+VWwFMQMgE
	iiRw==
X-Gm-Message-State: AKaTC01JouZsiX/7fT+oCvUz125eDzMW0+5CNbWSj3d6unzEBROY0NVGhfet0lrHd93oTID4PXatwGOpr8wm9w==
X-Received: by 10.28.212.131 with SMTP id l125mr20448007wmg.117.1480379537430; 
	Mon, 28 Nov 2016 16:32:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.45.33 with HTTP; Mon, 28 Nov 2016 16:32:16 -0800 (PST)
In-Reply-To: <CABcZAN=QjzMYd9my-xyOA-=12Mpv6bOvAS2a8shBSxyZFqZ5cQ@mail.gmail.com>
References: <1480371801-21467-1-git-send-email-armccurdy@gmail.com>
	<CABcZAN=QjzMYd9my-xyOA-=12Mpv6bOvAS2a8shBSxyZFqZ5cQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 28 Nov 2016 16:32:16 -0800
Message-ID: <CAJ86T=UjuGJjnGJ0MnttSf3YcfeuTS8ky-Bh75i5TeLWL-EMYg@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: squash whitespace when printing BUILDCFG_VARS
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
X-List-Received-Date: Tue, 29 Nov 2016 00:32:17 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 28, 2016 at 3:53 PM, Christopher Larson <clarson@kergoth.com> wrote:
>
> On Mon, Nov 28, 2016 at 3:23 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> TUNE_FEATURES for ARM targets typically contains a lot of whitespace
>> due to refactoring in OE 2.1:
>>
>> http://git.openembedded.org/openembedded-core/commit/?id=f774b44fa007a2a756ada892ede832b1251d940c
>>
>> Squash whitespace when displaying BUILDCFG_VARS in buildcfg_vars().
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/classes/base.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index 024fe43..c36c5ed 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -191,7 +191,7 @@ def buildcfg_vars(d):
>>      for var in statusvars:
>>          value = d.getVar(var, True)
>>          if value is not None:
>> -            yield '%-17s = "%s"' % (var, value)
>> +            yield '%-17s = "%s"' % (var, " ".join(value.split()))
>>
>>  def buildcfg_neededvars(d):
>>      needed_vars = oe.data.typed_value("BUILDCFG_NEEDEDVARS", d)
>
> This will result in inaccurate values displayed for non-list variables.

I didn't notice any changes in the other fields. Do you have an
example of a value which wouldn't display correctly?

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics

