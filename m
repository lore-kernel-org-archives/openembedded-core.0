Return-Path: <ulfalizer@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 97D2D71A41
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 03:20:19 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id p25so255272uaa.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2016 20:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2XnYdN7jHGYx87FbrX7lfubgJpVmxf4Cql00TyQaS5g=;
	b=V+CYGt5Axyg4wNQZP3XHNdAnZ0Kiwxjue5ZJuJJxgFCoXvrafszYqyrvuczVXnNkZE
	mS9AxrGcCLBuDduhPdOEB1Rr4k9ZVGkguBQ/JFmvPLc63oGO9OowWCE+3wb9l7K6wr26
	1XRoGEWm4RfSDZYrd8GePXwwJmn8eInsGjSUofRGrRH+D4JIjARzEQZTLy7dIHwicW34
	Bdn0sng6XpqUU/2x8fkEINdwzBT8sEWaB1At78YYFpZ/SQ5kiLpTeqBomDNwmLIozY9V
	fxyUZkV7uVdpBbAaeegs9t9XD06vyR6BKWxg0pvUF4SfkEInHwkx7wAM/MOvfKcEXWeu
	IRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2XnYdN7jHGYx87FbrX7lfubgJpVmxf4Cql00TyQaS5g=;
	b=SO49xxNxbGY31seO0Pd+XgX4iZ5f+5u3JIQ1LoOx9FPQj+NI+0B560sHfmg5Wb0Rni
	i3/lGnZM92oKbbCEDxuF1aOGhQOMD22Bth7UD9DxcuJ+z4ge2zj3RiL4hw2YN+lQ4jog
	dbyNTg4XTi0dMQ8VCkMWd1or44TBdspKOHIXgHD2f/JNB/JKjPc7KplRJ9n/899hlUn+
	/fEcgBCxSqKLDxzemV6xq0126sUoSZRYVuY/NGIMXilYK4EnZtncu6+I09m3eG/lHjYk
	p1YdIU9RFYGr0QQSRYOVe2y0waErROAC6snqZ/1OR36zvhKu2UQBWhKDi23um6uTDykW
	4RfQ==
X-Gm-Message-State: AA6/9Rmu/41Cy3iW3VXnVtbrBHV9CUcCcsOKIyziiHCRGteTkAr8Qtc0fttgOdx8K+o+wxdwuHHNK1N+9mi0mw==
X-Received: by 10.176.65.10 with SMTP id j10mr7689115uad.17.1475724021329;
	Wed, 05 Oct 2016 20:20:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.140.8 with HTTP; Wed, 5 Oct 2016 20:20:20 -0700 (PDT)
In-Reply-To: <3333865.u7YMqIlQip@peggleto-mobl.ger.corp.intel.com>
References: <CABcZAN=WpicbLyg-sc=GDiMS81iwsGe1m+NE-fUfw2tniWpWXA@mail.gmail.com>
	<1780562.gdzQvQrqZ4@peggleto-mobl.ger.corp.intel.com>
	<b712b5e2-a8df-5520-900c-2ff543619304@windriver.com>
	<3333865.u7YMqIlQip@peggleto-mobl.ger.corp.intel.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Thu, 6 Oct 2016 05:20:20 +0200
Message-ID: <CAFkk2KSEJ6wc528YqZROFFtUCkQ=NPtJgOT+nKJXDLVefJ5t=w@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] scripts: add new script 'native'
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
X-List-Received-Date: Thu, 06 Oct 2016 03:20:20 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 6, 2016 at 5:02 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tue, 04 Oct 2016 12:22:56 Randy MacLeod wrote:
>> On 2016-10-02 03:37 PM, Paul Eggleton wrote:
>> >> "native" might be a bit too generic...
>> >>
>> >> > >> could I suggest oe_native-run or bitbake-native ?
>> >> > >>
>> >> > >> something that says it's yocto-galaxy specific and can be
>> >> > >> autocompleted
>> >> > >> with a reasonable prefix...
>>
>> I also prefer an oe prefix.
>> oe-native, oe-run-native, or oe-exec-native would work for me.
>
> Well, someone needs to send a patch, any volunteers?
>
> Cheers,
> Paul

Sent one (and caved in to peer pressure re. the prefix).

Cheers,
Ulf

