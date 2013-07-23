Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id F29786A886
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 10:13:57 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ib11so3877199vcb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 03:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=sdJJQhsZgN7AFFPK9SOUk8XsC+CVdnzXwHRKRHepTcU=;
	b=N2yNfRGoNrj65cQrsJix8fjb0FSme6N5Qqu1xsRon1NdUdZzByyA3N+ZL5zlpRWE2s
	mgmIddd6zwkrQYODXcqdpVRuIkZiuai3YMncBAZsQoKjG/rqhWSiH3TdbmwdRNkJwmrI
	t9tbX+yv/kBz4FJQXrBR3YeNpJ81nrUo6elao0NztHfYjF4y609rKlTKj5OZQAiyDdI4
	lw/R64nxLRHSngmTcQTRuqNmLaOoV1d9aORreB5u6UgXBR6jFUOsLh3p3BPnh91296Zf
	5I452SqGzrEJKROtk7I/CV0HVpKpWWwT/xNz9orqOAjXEbWN3PNQ7ZiH/7uidQoXscfi
	fvBg==
X-Received: by 10.58.67.9 with SMTP id j9mr11103692vet.22.1374574438477; Tue,
	23 Jul 2013 03:13:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Tue, 23 Jul 2013 03:13:38 -0700 (PDT)
In-Reply-To: <CAHt75b53sON+j4b5RfNEaZUgSj6-7MYjjkkFCF1wYVDOFCoLcA@mail.gmail.com>
References: <cover.1374511663.git.sgw@linux.intel.com>
	<CAJTo0LakgfLTuXy_9w+QuHo6cvafd3qaw4=EgCwyYKKTepkyeA@mail.gmail.com>
	<CAHt75b53sON+j4b5RfNEaZUgSj6-7MYjjkkFCF1wYVDOFCoLcA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2013 11:13:38 +0100
Message-ID: <CAJTo0LZKHymuhuoPOqz+m-p0BprZhSocH_HOtKd+g2b+pEJWYQ@mail.gmail.com>
To: Daniel Nilsson <daniel@dnil.se>
X-Gm-Message-State: ALoCoQkAeZ7VA3h735PdmvsFLET4UNul0ZiEhsUeA/yXkZTO0iXhIBxfxdOgO9CptOemT9tcifmW
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/27] Ready for Pull after final ACK
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
X-List-Received-Date: Tue, 23 Jul 2013 10:13:58 -0000
Content-Type: text/plain; charset=UTF-8

On 23 July 2013 11:07, Daniel Nilsson <daniel@dnil.se> wrote:
>> This is just going to hit us every time we upgrade the package, so if
>> we're going to maintain a non-upstreamed build system then can we a)
>> squash our patches to our patches and b) use a do_configure_prepend()
>> to inject PV into configure.ac?
>
> Agreed, maintaining this in multiple places is not ideal. While still
> learning in the area of OE-core I was not sure what a correct solution
> to the problem would be, hence a "quick fix".

If the patch has symbols such as #VERSION# and #LIBVERSION# then a
do_configure_prepend() function can use sed to change those to the
real numbers based on PV.

>> (oddly I can't see this patch on the oe-core list)
>
> My bad, realized too late that the oe-core list was subscriber only so
> my mail bounded.

Fair enough, glad that mystery was easily solved!

Ross

