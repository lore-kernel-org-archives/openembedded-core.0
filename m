Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id CB64D78294
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 19:45:23 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id w126so32855084wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XrB6rdR8k6cgbS1NsoUvBVWO/dPFbwx85dbW8HkGcn0=;
	b=Xy61ZT7Uvo9PS3P93W+HYY+4WGY54d2o5ItgYCDowCDiDH6eXVOvcsle/3Ol9l9sRP
	AzDsPIeavkle3qJRP2JpYd8bKUhGsNksLsMtg/Sr+0wVSnteesB14EExwV5us2hUcMIb
	kZn+2eFa//cYG4JMfF1R9oulUFbdAzfZPJSBwHqDBUeXYAv/LpF8WQvDA3orMHoSrSC8
	j430ZBOY/XhjitS9ZaATCFUEseaNaSyXV7irkSBapYkzG/YHGhZOdYtZkr3Mnv+v3R6a
	kYeB3ViAtnYnhp1Exek7RHUFRbuOKmX4C/4zw6VdkLQRZIGfyV0UTwQw2NBp2oY96BtF
	snMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XrB6rdR8k6cgbS1NsoUvBVWO/dPFbwx85dbW8HkGcn0=;
	b=YmZTt73N6/6UBHBO5O/LYgSi8xcNhJWq78ThrV3UFIBzMqKtxapwjU4XvkULrWnEfa
	jByPYJOtu83tW/w+SoUWKcLuyPcvYwTZ9/kKDQoRE5MEyrSY1on+j5WYf+mwKz2yAgQ0
	Rji40UqR+4D6QYGRO36WhDYt5aHiWziZ5EsmcKT9YBlmjQtifdarb4PimVspt74RcDlY
	FYB8XdEVU+0k6xLt4PYg+Vl56UREhSFXj7vTJ1v8O3YOw/dPXtt+1WwJsoVnaYc0097N
	rk4mm68FyRINZyh2wIOsINQDaL/0LUUjvI8+JVdklhMokiIoUA1/JshIUxqN1a/cM67Z
	/RAw==
X-Gm-Message-State: AIVw110It2zJ+Z7CYI47cKEwQEF6ym9wTcX4maqDS/iSCo+UhCrC1lg9
	R5SL+vIIaPOKzGIZ3uddVh4X4wZxKw==
X-Received: by 10.80.140.204 with SMTP id r12mr3904985edr.123.1500579924451;
	Thu, 20 Jul 2017 12:45:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Thu, 20 Jul 2017 12:44:53 -0700 (PDT)
In-Reply-To: <CAJ86T=XEYdhxaEcAgBGx48T63jBb61uPnF3u5czHJY8UbLb5aQ@mail.gmail.com>
References: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
	<CAJ86T=XT9yufogwxMbV-0dW1ooYdvy5DOequ_X4fRQ7=nFWdOQ@mail.gmail.com>
	<CAMKF1soRVeHPLh_LFSxpcGG=1u1OcKvMv3yEifihP_Y7Y-eXUw@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6119BDF6B@ORSMSX112.amr.corp.intel.com>
	<CAJ86T=XYR9Z=aMO-BAAZYJ2Lh=ZXQy+J5J-LjSuT-n_Hx-1ayA@mail.gmail.com>
	<CAMKF1soYE49jfc-pkYMLgdh5DJVuA0wyLFiA90Z_3OB7i6tUOw@mail.gmail.com>
	<CAKV_0egoE8wJPJGd3qZyePgOS6q0gVzDG-pvPvTpZ5UWQYasYA@mail.gmail.com>
	<CAMKF1srdmXi-uxH9eX2wK2VYXpmCpkTLTvfZxY+5_OZo65Q-Sg@mail.gmail.com>
	<CAJTo0LZ-goETzCb25RXab_ewnSENbcFucUDoEPmo48epdAfAdw@mail.gmail.com>
	<CAJ86T=XEYdhxaEcAgBGx48T63jBb61uPnF3u5czHJY8UbLb5aQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jul 2017 15:44:53 -0400
Message-ID: <CAMKF1soat+cDGepdsJGKXnz=rUAq77N1sTzFN9w_AAKr17tB1g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-7.inc: add new warning "Wnot-cross-compiler"
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
X-List-Received-Date: Thu, 20 Jul 2017 19:45:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 20, 2017 at 3:40 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Jul 20, 2017 at 12:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 20 July 2017 at 19:51, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> it does cause harm, by making the behaviour inconsistent and highly
>>> dependent
>>> upon build host.
>>
>> It *stops* behaviour being dependent on the build host, surely.  The problem
>> is that some recipes use the host compiler when they're not meant to be and
>> this can cause subtle (or not so subtle) breakage.
>
> Is there an example of a recipe which doing that which went unnoticed?
> Doesn't the fact that most recipes do get cross compiled (ie x86
> target on an x86 host is the corner case) should mean that bugs like
> that get flushed out pretty quickly?

in general yes, most of the issues should already be addressed since we
do cross compile a lot of host != target cases. Case where this might be
not catching are cases where the fall back is cross compiler and first choice
is native gcc. I agree though to have qualified data to see how often does
this occur.

