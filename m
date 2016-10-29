Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id DF979719AF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 13:55:23 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p190so65838664wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 06:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8JtdlAZjgxnmNdVD8hn7tyB/PNM0jLCjMXBxk1GMPS0=;
	b=O9bBwTU2cXy+ZuFD3SoBd9OM2p0/+CvvCMGcBxHiuPBphOY+GlXZVJNIlbiJpS9K/c
	FcsmB58o1hw1fdByFUvf52PlzWYjN8VaBP3WnAM+PerbPftL6p1Ss17Q3Vj11VqrJVA/
	OCsVfYkrUVHMK5L6lrvelCEqsjLXwu0pKzX0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8JtdlAZjgxnmNdVD8hn7tyB/PNM0jLCjMXBxk1GMPS0=;
	b=OSSoLcGa0P4C6p6QNtSIl1+DAkuzDy8tBAZqmJ9g08RvkjaF8oGhQqIrP7slVtr3EF
	NciwwBmFYoNRFAVDWXidWBaoxmt3ztKbcW9ldJ8sNR31B/4P2/nADi2q/h/ATaPCTfLQ
	O0AizBy2TEwYxaf8gg3uDYDyoH4pEhKbOGd2S/fUFxtElsp/MB0HwlmlW3gxW5s2ijJz
	sBDOy4NWs0JhwvG1YA2YAOz9fqw9W2mnqX2J2lrrL/sGo9sV5y9Mzzl3WWmqUlyU2hfG
	mPSG0BuQ73SeIYDGyWRO/4gbGZjPLug//KLZAePltLvYYnH7dsAWM6yQfferiKambRol
	JLMA==
X-Gm-Message-State: ABUngvexZtQIjhf+u0z8aTU3xFWiuSsOweJzbgcjnnic98nNu29NG1f+lgi2VYI3lKCavdVpqaYC0OdViJI51EUu
X-Received: by 10.194.87.130 with SMTP id ay2mr14648493wjb.44.1477749324510;
	Sat, 29 Oct 2016 06:55:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.209 with HTTP; Sat, 29 Oct 2016 06:55:23 -0700 (PDT)
In-Reply-To: <CAJTo0LaJdDBiUA29J0VZF_VU=rpZXknH3WdCJc3h6LZrCg8Xog@mail.gmail.com>
References: <1477418985-28961-1-git-send-email-daniel.diaz@linaro.org>
	<CAJTo0LaJdDBiUA29J0VZF_VU=rpZXknH3WdCJc3h6LZrCg8Xog@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Sat, 29 Oct 2016 16:55:23 +0300
Message-ID: <CAGNsrLB_-xRzb41u3Jf+ZnhaPhcL5G5ijQ2Mh8wfiDbb-pa7pQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][krogoth] weston: Add no-input-device patch to 1.9.0.
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
X-List-Received-Date: Sat, 29 Oct 2016 13:55:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Ross,

On 28 October 2016 at 18:54, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 25 October 2016 at 19:09, Daniel D=C3=ADaz <daniel.diaz@linaro.org> wr=
ote:
>>
>> The included patch, backported from Weston master, allows
>> it to run without any input device at launch. An ini option
>> is introduced for this purpose, so there is no behavioral
>> change.
>
>
> The patch process requires that unless there are exceptional circumstance=
s,
> patches should be submitted to master and then past releases in order.  D=
oes
> the weston in oe-core master/morty have this patch included already?

no, the patch isn't yet in oe-core master/morty.
We'll submit it shortly. Thanks.

> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

Cheers,
--=20
Fathi

