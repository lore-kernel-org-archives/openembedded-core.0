Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7959378354
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 20:10:17 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id u26so4136332wma.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 13:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZvpEJQ6TZ05Yt5nP9JyTPAd578vg4Sjq6xY/kilaKLA=;
	b=qUS5VSiE8rBfDmWk2nNnxlsJw8ZyR+HHYQoVyeL7SDdZlkY+Q1Pq7VhqSba0fiFLla
	DBib7JU7yPt/W1R8Ukw3ddysasRWIeVjjw9qRyQJUOuK7ezb/DpV/nMQZ0TlS2s7fMGh
	JhkJxu4HCS/0Rw4hFCgNDblGzitpuLiUk9956ri7xfKx6D41LguZ5t64vU7uI3HIcaNR
	GYyCZ8hCQgiWx/DNHz6Ny9VC5mk68ZqB1X9f6q8ygz4SbUHmyXljmkqt6o9XxrNDlrjO
	dRnRpvgEfbgOoak/tnm6WSYZR9SUEyPqoqBaEW7p29i0Q4HgvMYiRcS0fLb+KYcA2hHx
	gO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZvpEJQ6TZ05Yt5nP9JyTPAd578vg4Sjq6xY/kilaKLA=;
	b=DlclV2kv1Xed7uTPnYQPRRjU05e3sR8peDje1c52rIf7u9RvaPY60nAAhXnb/VsS5U
	7RJP9cvkMOCqcPRW8GdvHj28DzD9oiWX+2uIwqdav5hGU2Dr+g+GGG4dnE+KALe/LFZd
	UQlx+/cRzF5HG5BJT+M5Ao7suvnXfU5w+o4Oy+E2YsHvkqNLfvaCTAEor0yb+4Yb6zwm
	RqgpFZv6Icf+olTol35UsgowckFx8jmT6OKXlp47rd5Njd4+2FzQDP28aIC9fGZkFeGt
	HPXu7HohNt0efGIde2IIlUWswogjDB+wcyg7kB7EHE8drDOrcXoLJvp3UwhO/pS3UJWH
	Piyw==
X-Gm-Message-State: AHPjjUgEIqupqkfLbuj9E3NsYPZmZrWf6GOS2hB0wwGeqlsU+Zo9513q
	ooAkrsx9819r8Vwsi3ICbnljpldp7A==
X-Google-Smtp-Source: ADKCNb4Q7IYfsP7VthPGx70WwiPjs/zIYeaq4pxXfmHdojQT5xADagGozGb0eR3lYW1po5F5opEZxiUAidP4KWlGWIc=
X-Received: by 10.28.107.76 with SMTP id g73mr1163533wmc.66.1504210218162;
	Thu, 31 Aug 2017 13:10:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.184.147 with HTTP; Thu, 31 Aug 2017 13:10:17 -0700 (PDT)
In-Reply-To: <0fa15a09e9554731a800e4e771e25ab9@XBOX02.axis.com>
References: <1499405543-3127-1-git-send-email-tobiasha@axis.com>
	<2d1bb10c-e13c-79d0-4e0e-bd5aa5d99a42@axis.com>
	<CAJ86T=Vfoe5e86OokE3j9dY8Lc0s4A1OAZPwo318mYdFiKTYdA@mail.gmail.com>
	<0fa15a09e9554731a800e4e771e25ab9@XBOX02.axis.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 31 Aug 2017 13:10:17 -0700
Message-ID: <CAJ86T=XX0-pkH-4jRMq1o3pJbz-iwGcksGuR7oZHkaYgn86new@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Tobias Hagelborn <tobiasha@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/2] Make source code browsable locally - devtool srctree
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
X-List-Received-Date: Thu, 31 Aug 2017 20:10:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 30, 2017 at 11:32 PM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>>
>> Just for reference, I think you could achieve something quite similar
>> with:
>>
>>   bitbake <your-image> --runall clean  ( or rm -rf tmp )
>>   bitbake <your-image> --runall patch
>
> Yes, but the drawback with this is that to find the source code for the
> individual packages, you have to dive down into tmp/work/... which can
> be quite discouraging for someone who is not an expert in bitbake. What
> our developers requested was a way to get easy access to all the source
> code being used, typically to be able to search through it all looking
> for some specific feature.

Right. I wasn't trying to suggest that the two approaches were
completely equivalent, just drawing some attention to the bitbake
--runall option, which was added fairly recently (specifically to
solve this problem).

The directory structure split under tmp/work between arch and machine
specific recipes might be a little confusing but obviously serves a
purpose (target and native sources may need different sets of patches,
etc) so maybe worth the effort to explain to developers. Below that
level I don't think there are many surprises in the paths to the
sources directories?

