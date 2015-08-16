Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 91A8373E11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 05:38:28 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so35861342igb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Aug 2015 22:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=I7x10Xi7fMU/6Dn+MzbNm0obwxKXlU/HouwJbGoExlY=;
	b=DxaTRjHzwQXzEnSeXt57j3gun9yMkENEAY4fv0Bab93/670m7XAwWRQnG2Ibk4EOhu
	Bu0EKwUVtQcfwYu0v3j8/4M8jRcPij13agisiROsTfSxojufcMkrAsb0gMpMp44AdW18
	2tF7eI2w8HpmP78jnosB57fq0if+Qylhvc35EMR77fosNVnYxq+SX1gWN+Rjair08YUu
	35Ga6D0ZGPp02Lqhg3xKUkWWJzlR/MmIWi9rAkz7yshM7zBlGkrbuuFi8dPzDBwcvMjL
	IgQOx7mqLUL+BwoGNrOMCItmmIrfgRUnx/ZoG4r/ItKRhrUDPDW+OOjTse+BNtZ042sH
	DLvQ==
X-Received: by 10.50.119.33 with SMTP id kr1mr9700275igb.75.1439703508289;
	Sat, 15 Aug 2015 22:38:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Sat, 15 Aug 2015 22:37:58 -0700 (PDT)
In-Reply-To: <20150624152317.GA28330@linux.intel.com>
References: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
	<1435053182-8028-5-git-send-email-ed.bartosh@linux.intel.com>
	<55894189.50102@balister.org> <20150624152317.GA28330@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 15 Aug 2015 22:37:58 -0700
Message-ID: <CAMKF1sp1D2z9UmM2d_X+-Le2m3cpZPyhs+gi0QxxFcvZ8AKrbw@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH 4/6] wic: Implement image compressing
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
X-List-Received-Date: Sun, 16 Aug 2015 05:38:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 24, 2015 at 8:23 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> On Tue, Jun 23, 2015 at 07:22:49AM -0400, Philip Balister wrote:
>> Can you add a way to enable multiple threads for xz? I found this helps
>> speed up file creation.
>>
> I thought about this and other compressor options, but didn't find a good
> way to add them. Introducing new commandline option or config value doesn't
> look convenient to use from my point of view.
>
> Can you propose something better than that?

there is pxz that can be used on same lines as pigz and pbzip2

see
http://manpages.ubuntu.com/manpages/trusty/man1/pxz.1.html

