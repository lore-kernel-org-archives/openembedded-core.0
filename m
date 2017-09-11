Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 71E2A77F70
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 22:01:22 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id l25so3459792qtf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 15:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Y8TTOE90GL8FAIRsfM3SsBNuf5mRbxxwigcpH7bcz9E=;
	b=BfUBCgJ0atK724bCkILH0dof3wWlVyFRA2g5RNNQjsCrDOum0Jp3keecXUxMTYCUv6
	4ViU5mov73m1p1Wqd8uK8vdRP7jWrodFw2gyTiWOvj3DiLwQfkjE7Xjwvh6bA0+peRUh
	y+pp44zHtXxHTnn1OqkeX6wRa9syTYn8EXyakhcOXsrQsmVN/4zU0JliyDd8mkfsrqm6
	Kz4cX2w/N37kKX0rCepoT0bggArb111aHNkPG3+bn+KC+iZzEm9Y7N/g18bm0aNeO1BM
	2e7Kr/CKWSi+m8KujrEOvcRBnb6pCUvWRkO4qETFYdq79LKw8JtueGEVkMqc/uMptr1l
	hlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Y8TTOE90GL8FAIRsfM3SsBNuf5mRbxxwigcpH7bcz9E=;
	b=ZPV4zmSpSaEfvLHZMmXCfVJho9n3dVQdgfZf5PzZzPoXtFb1WlUmsLvjhfMCqmqoye
	EPl/1vx++X71y6Xact8+VIkIcqPYtLtWt9ebkm+AvYEOGNppUpd4ejucPlYt6yo4sM5B
	qsom+M/eQMNVb+AjVUtau3D9DofqLsKuSkEBzzRGGCY0Zolr89xBWZrlwUrqkqmizY/R
	Pa75zwKrTXr0QY8VvNPGpFW8t37D9DnururXp9AQi5vZ4NKvE2/Tqw/FUi6ediJj97hz
	/+sa0bLzZ3uG91XDOvkLvwFSSN/4RAqMiUclAY5k2NnHD9QF65Q91XhC69fLmq9P9VZA
	xuLw==
X-Gm-Message-State: AHPjjUgRsCN3X4OWKUzWVtwx2nLoeSAfdWajTXZeOfEJFSww2Jsvqmop
	xRD9s6OIvjC2xKl6VYU=
X-Received: by 10.200.23.82 with SMTP id u18mr1113587qtk.68.1505167282989;
	Mon, 11 Sep 2017 15:01:22 -0700 (PDT)
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com.
	[209.85.223.169]) by smtp.gmail.com with ESMTPSA id
	d58sm6981732qte.92.2017.09.11.15.01.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Sep 2017 15:01:22 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f169.google.com with SMTP id j141so35571812ioj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 15:01:21 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBMDHkjRYSzwpq3iydUPh6hbOk7gU+A+/ko7BZqRcJTQF+QnGTwPNiMPoBLde6gJA9YTwk1IYSqlemOIRWezwQ=
X-Received: by 10.202.94.67 with SMTP id s64mr3387569oib.249.1505167281316;
	Mon, 11 Sep 2017 15:01:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Mon, 11 Sep 2017 15:01:20 -0700 (PDT)
In-Reply-To: <CAJTo0Lb42b-PT3_u-1vS-apadje4+ZYpP=8jB4q9oc2jmzjgPw@mail.gmail.com>
References: <20170911213326.3480-1-california.l.sullivan@intel.com>
	<CAJTo0LZgBgWL0c9ZaDRFvvKxfULKeDkvGOhAiczGWMXWNrL=Yg@mail.gmail.com>
	<CAP9ODKpmxcObf-re-298t_uLu2HNCnByi+ic_b8EEJDJ-227iQ@mail.gmail.com>
	<CAJTo0Lb42b-PT3_u-1vS-apadje4+ZYpP=8jB4q9oc2jmzjgPw@mail.gmail.com>
Date: Mon, 11 Sep 2017 19:01:20 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqN7nj2esxkVR08jYSaRj-SrybTqbOYManDvC566no_qQ@mail.gmail.com>
Message-ID: <CAP9ODKqN7nj2esxkVR08jYSaRj-SrybTqbOYManDvC566no_qQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: bump PR and fix install-efi and setup-live modules
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
X-List-Received-Date: Mon, 11 Sep 2017 22:01:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 11, 2017 at 6:59 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 11 September 2017 at 22:58, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> On Mon, Sep 11, 2017 at 6:49 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> > On 11 September 2017 at 22:33, California Sullivan
>> > <california.l.sullivan@intel.com> wrote:
>> >>
>> >> Bump initramfs-framework PR, as it was missed in the previous
>> >> initramfs-framework patch.
>> >
>> >
>> > There's no need to bump PR.  In the ideal world, the PR isn't assigned
>> > at
>> > all.
>>
>> there is, the package moved across arches so adding the PR makes sure
>> it is upgraded.
>
>
> Surely the PR service handles this if you're running a feed.  If you're not
> running a feed then this isn't a problem.

It does not; it goes back to r0.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

