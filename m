Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 643E07F7F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 16:19:03 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id r9so20170382ilq.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 08:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eue9yLGB5l0IYlSShH1poswE77N6xXgv/HnV2yBkElo=;
	b=J6MmId1mCIv9H6xjWYsHS5KkG/0c9apIqis3tPeVC7TFK7C7T8AHNifjr00jk35VRF
	kLUcdBEizWmyOmPe+t3ClrQQS5XgoIzGJHbWJmXkn4iOxyFxrsCW9BA/FyUQx8wgKvVU
	g7y/0ErCSp3eTasOfpgBYw/FgBGTqvsF35vd/x2KJWCiz04Zmes+8B7Vg+YPtc1sAsKh
	i57fkKRL7KZ+gpk8nB38txTQkE0lZdW76wsRgwOi4+hB1SNE7fiRVlbMghMioRZ8MNTp
	6Xi5uLXny9sfa/0p+0J0kLEbypQerm325nNu7j2Yt0WwE4eDQvpyK7zInT9ZUyo1oZ7t
	Z7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eue9yLGB5l0IYlSShH1poswE77N6xXgv/HnV2yBkElo=;
	b=dp3Qqe0dEQA73ByE+QgLtH+qB9OyiKw4jpmFgMdDpvE6ySkzKKAHrDqplLKkXkk5qW
	NeVqPXxCbrR1/+ByPrbsQKoBCvmfD6p7WYnEbGkhNnxKC7OwcbxAZ+JMBSFviiiuGEZY
	DQVnesQOZsiVm8fYJsrHDiVoDy94yg0gnyasxL+g7/bIeJWv133veLr0r2NIH0a1rXdo
	gMsZMH8vtpEXm+6JeARC7zmHv//fcERsXo6+ODmBlYnJ60w6ebNVr+oNjXnwqCxW/Ll/
	1zlfzPuDmwGCvGNpGd5VZix+m/rVCxjlIrRYv/1OEIp3QUfxbgcz/zkD7QxGkz+A5cUe
	V+Ww==
X-Gm-Message-State: APjAAAVhX8q4wek/14M9vPj8lDshVLU+wjE5K3Y4YiW1E/i+qWzcJp83
	8sA0OFpYCa+uScXAgrDrSw/ImzygXEJRzk/SJp8=
X-Google-Smtp-Source: APXvYqw9aWHoh/0ppUMG/D2X3nvZ31S2xJpr/Ohq3TGpHzIf+hELEoDmeWfGTmY4CKC6gVjKRSSytnLjlbzvH+u1Jv0=
X-Received: by 2002:a92:4944:: with SMTP id w65mr24632036ila.102.1574180344318;
	Tue, 19 Nov 2019 08:19:04 -0800 (PST)
MIME-Version: 1.0
References: <20191108091419.25156-1-stefan@agner.ch>
	<7e0b2e1cc9931c92c2bcdcf5ef1f6f75@agner.ch>
	<4b4629ef84240f6d5e7da1363d88ebe15f4ab049.camel@linuxfoundation.org>
	<92892787582baf91d2de15279d6e60ac@agner.ch>
In-Reply-To: <92892787582baf91d2de15279d6e60ac@agner.ch>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 19 Nov 2019 16:18:53 +0000
Message-ID: <CAO5Uq5Qo9dn52iwc43NVrH2SPp65eKqddNhYu9Mm4RoGQRd+pg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] zstd: move recipe to oe-core from meta-oe
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
X-List-Received-Date: Tue, 19 Nov 2019 16:19:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 18, 2019 at 6:39 PM Stefan Agner <stefan@agner.ch> wrote:
>
> [adding Alex, he maintained the recipe in meta-oe so far]
>
> On 2019-11-18 13:19, Richard Purdie wrote:
> > On Thu, 2019-11-14 at 15:47 +0100, Stefan Agner wrote:
> >> On 2019-11-08 10:14, Stefan Agner wrote:
> >> > From: Stefan Agner <stefan.agner@toradex.com>
> >> >
> >> > Zstd is a very fast compression algorithm and has gained quite some
> >> > popularity recently. An upcoming patch allows to compress rootfs
> >> > using Zstd. Moving Zstd to oe-core allows this new conversion
> >> > formats
> >> > to be automatically tested by the oe-selftest
> >> > imagefeatures.ImageFeatures.test_image_fstypes test.
> >> >
> >> > Furthermore there are three packages in oe-core which allow to
> >> > enable
> >> > Zstd support through packageconfig currently.
> >>
> >> Any update/thoughts on this?
> >
> > I've not made a final decision on whether to merge it fails selftests
> > due to a lack of a maintainer:
>
> Alex, would you be OK with you listed as maintainer?
>

I'm fine with that - it's very low overhead.

-- 
Alex Kiernan

