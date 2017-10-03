Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id A37C16B6EA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 06:41:47 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id w63so7465064qkd.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 23:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ghTWn2S69NzmO/VpSs5tCAnWeFHYyGU2EK7RND8dsg4=;
	b=JHvL02FTsZgzDs+rTWgciuk4Cz+sJqYUEODtVHKt2CLxwMfBzZPHJ3iOrmRuyTSbIW
	9yiE+CI/9Nyt+6zEfymt/u/HBt8TK9GiJA52aCR0ueh0ah8VBJshCo8rhJygohyb9XI0
	Tcaps1+76IZ5Tteid3C5ub81NFBhMlHZQzDAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ghTWn2S69NzmO/VpSs5tCAnWeFHYyGU2EK7RND8dsg4=;
	b=axxOn70EtnA6UkUK7GB6sAWeF3J5RaNhAmu4IOpeQ+Uvrt+nqTriACfMoY8CN/JlIA
	7XbF6cXDdkmWYqNpFNdT27PywbERwMnIUb5OXo4hw8l+u5RDZ2A4Ul5HoW34/JHamB+Q
	oGQFwizGoSFC3NH8pVBiW8+fiSRllpRjO5z5QbB125724WErUjvyk+7E6HOWPKBaqxrx
	IKZZzjTMokpyZBoD42ME6NK0/BCvAQHW9PBGHjx/yh3xm72pkyF2qzs43gt7TmWMBZKW
	zwM/nU1oGby9Oi581HhszPXf8LuRjenkRH17qRD43dbcd2fxdGpFwO6F1fzzxa0zku+O
	R6YQ==
X-Gm-Message-State: AMCzsaVR+dgXdTfmGhFANcEzPuwiaFHxIx8GsOPT3kExYh9mnCSU3VT1
	e5PtPMjn2qkXROoQqmLXOOZNQShREl4mqRD9JSrVMw==
X-Google-Smtp-Source: AOwi7QB6ZN2VQcWdjqZBLgrIPD9q3gtvQh9+x9YB8XwVgPUvsW8L7w+7KyPy5pp+HzPQnnEdycZbpqHCWnCrpCnsb2Y=
X-Received: by 10.55.17.36 with SMTP id b36mr11027218qkh.3.1507012908415; Mon,
	02 Oct 2017 23:41:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.104.146 with HTTP; Mon, 2 Oct 2017 23:41:27 -0700 (PDT)
In-Reply-To: <CAJTo0LbBTXoPGJWs-eU7T4uKA06Y5RP2A6zDnKBAq5c7EKFekQ@mail.gmail.com>
References: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
	<CAMKF1src=fX9LRauodhyBtWOBgpYSRYKukFN2x9t5srkPxAsrA@mail.gmail.com>
	<CAP71WjwMd7F1ZB+et7W_rBhh=dmk-g1OXqyEjTGF7+-py9GGYA@mail.gmail.com>
	<CAJTo0LbBTXoPGJWs-eU7T4uKA06Y5RP2A6zDnKBAq5c7EKFekQ@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 2 Oct 2017 23:41:27 -0700
Message-ID: <CAP71WjyCz4nrjd4hWs75iOOQCA1FSyYjMom9qyZcmrnQV6F-9g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10] gstreamer1.0: upgrade to 1.12.3
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
X-List-Received-Date: Tue, 03 Oct 2017 06:41:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 2, 2017 at 3:05 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 2 October 2017 at 21:49, Nicolas Dechesne <nicolas.dechesne@linaro.org>
> wrote:
>>
>> I have seen these patches on master-next at some point, and they got
>> dropped. Was there any specific issue?
>
>
> They were pulled in briefly for a test build to check for any serious
> problems, but as I'm sure you're aware from the weekly status emails sent
> every Monday master is currently frozen solid as we built the first 2.4
> release candidate last week.  The current schedule is that we release 2.4
> around October 20th (again, this is in the weekly status emails sent every
> Monday), once that has been released (or maybe earlier) master will reopen
> and patches such as this will be merged.

of course, I am aware ;-)

I was surprised to see the patches in -next to be honest, and then
surprised again to no longer see them , thanks for the explanation!

>
> Ross

