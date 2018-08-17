Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id EBB5860745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 19:46:41 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id h1-v6so6384433uao.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ftgvpSCgThbAu1/NmCUN74igj5W0mFwSue8At5Uu4IA=;
	b=rKMpp++YB31E34pPc172LR1Vwv7Mz/jMXe8g81AqZT0A/2RZh+B2VW88pVEWrPMKlf
	Ay64JZFv394UQ/LATBvSt2txoBy9gJbPvXkmqqxWs/EALG6FToA7DR2xtC+AEzz+Mzfx
	TGg0b9la0VMPUga2ZYHFaI9M1M753gH2gnFUXIdUyHtdUlEeSEP4Xdjztrnsd5/AZ2gJ
	kx9KhENOXM1eenYzAoPgGzfg+nuiUCWfX7YdBtyJSW/Gx48o/xd3CDG6eKAvp/VrYfQV
	PIS+ed4+aOdLIHQpvY1a6WurZ2quI8+n5FPHsZrU3rdczycP0w1FIt88xlbbSO4+t6ed
	rSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ftgvpSCgThbAu1/NmCUN74igj5W0mFwSue8At5Uu4IA=;
	b=Cnm4aKsFNUxJ6VHlnFbsMVSshEk8Jd7yE5eYwFsvEpS59l6wTckfkKGDwksgXorpF7
	E2B0JSQNfr/YD/LTtHCfzaVVqqhbaN/ZxzpIVzpxufwehDcYRIZESCxs5VTl0sX7Z9j7
	/YdFiXtBY3R6cbgIgkW+jKAk8ccoIOKekn9J7GKUrzCLBRVgcrgT3X+mxL9ESkRxqtAA
	6rEg0MPYr9HaWHCvmMiakqLAGqmd2JyKw0Un8pAd+KiL0Y0nDzamycJXdegOlv2/aFq7
	SRvv7w37O8NAbrROrobJbMELySWMhhqaE3CsbIIy90l+2D0yt8wlDvH3d1dn/jOgR4P9
	FwpA==
X-Gm-Message-State: AOUpUlFspERd/epJpk6+eJWRGTOD1sDgTGhpWx2Bd0ZwFmZ9yGCJhwVN
	e8SdhQu+mqBzzxEjfz8knQh0dPuPa8VGtXfHIoM=
X-Google-Smtp-Source: AA+uWPwsiZUTZ4NCXe/CBpwFdNHri1hlvAsKsgcpMmnyBoW4Wf9bwuRlXRVGMkQbFpgKhL2ofecvN8Vpc35d4sG5UCg=
X-Received: by 2002:ab0:74d1:: with SMTP id
	f17-v6mr23675596uaq.105.1534535202939; 
	Fri, 17 Aug 2018 12:46:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Fri, 17 Aug 2018 12:46:42 -0700 (PDT)
In-Reply-To: <e8e403ab1cd0a3e4a5754d4d4079508946da0c3f.camel@linuxfoundation.org>
References: <1534453421-28943-1-git-send-email-bruce.ashfield@windriver.com>
	<CADkTA4OrPcXQEZ+d1HEeNZBrJy_VcyJcv_7DmhnBddmLQPVYZg@mail.gmail.com>
	<3927163d00059d0559412175c903ba60ce383dcd.camel@linuxfoundation.org>
	<e8e403ab1cd0a3e4a5754d4d4079508946da0c3f.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 17 Aug 2018 12:46:42 -0700
Message-ID: <CAJ86T=Xx=QwjS9ZpYyY78E_3sqd=_3JmncJJx6WpufoNQiwseg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Fri, 17 Aug 2018 19:46:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 16, 2018 at 10:53 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2018-08-16 at 22:44 +0100, richard.purdie@linuxfoundation.org
> wrote:
>> On Thu, 2018-08-16 at 17:08 -0400, Bruce Ashfield wrote:
>> > I'm getting a strange install issue with x86 that I've never seen
>> > before, and that
>> > part is unchanged from v3 to v4.
>> >
>> > .. and then I realized that a file has changed in my builds, since
>> > I'm
>> > working on 4.18.
>> >
>> > This is worth testing on the autobuilder, but I will have a v5 that
>> > adds a test for some
>> > files that may go missing, and hence we'll have issues across
>> > versions.
>>
>> Thanks, I've added it into a build with a glibc and openssl change
>> and
>> set it away so its possible other issues may occur, we'll see how it
>> works out...
>
> The openssl change caused problems but I did spot qemumips64 failing:

What were the problems related to the openssl updates?

