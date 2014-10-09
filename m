Return-Path: <danismostlikely@gmail.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id EA7DA6FC68
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 16:57:51 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id x12so470031qac.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Oct 2014 09:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sTxDYpMKR5V4dSvrN5eu7bbiR2lQwU0bY8acE4bzK2Q=;
	b=wLC08Rr4m0VjWWmgZJw0rLrAIia1yZow+j9f6t+ocUnw2nHyU5mI6p0wXqUecOh8Ap
	C6lzS7fTpK6eRlUymrJHOqyycpH5T7xMr6snFPtr7Y+860RDbFy0WCFfO4GVwYWbg9n8
	zAVf1NAItKGi0JTaayRhtbl/9r1kJ5O6ImIluddB41oX+ZANer2aMqwU/+sbxj/hYn6i
	duFLp3yHEA5UtvrMJofaHJBkq5HFuJCGSwD1F8zjIcv1+SY9rvnIV0LYakv50zA++TW/
	CuUf3s06gqjCylaje/Qp5ughb+1mzNJko8sp2rPDUK1fcOvH2Fr7CrgrM+9lFiV7WIwc
	QdnQ==
MIME-Version: 1.0
X-Received: by 10.224.67.196 with SMTP id s4mr6430318qai.27.1412873872352;
	Thu, 09 Oct 2014 09:57:52 -0700 (PDT)
Received: by 10.96.3.67 with HTTP; Thu, 9 Oct 2014 09:57:52 -0700 (PDT)
In-Reply-To: <CAJTo0LaP2Zu7z8Dp_1uCzkdLuBS_TgZ0xn0CXg5QtNTt3ZCAbw@mail.gmail.com>
References: <CACS+7ZRU6R--qxKFxWmCKGQaHgyDMfd=cUrnLnjZVfsktmhxAQ@mail.gmail.com>
	<CAJTo0LZDeTCp7E3ZMX6To6Ox-bOLS625d_T2QBjjuQ+RZ7==dw@mail.gmail.com>
	<CAJTo0LaP2Zu7z8Dp_1uCzkdLuBS_TgZ0xn0CXg5QtNTt3ZCAbw@mail.gmail.com>
Date: Thu, 9 Oct 2014 10:57:52 -0600
Message-ID: <CACS+7ZTreU8-5jVr7SfBMP3Ogr9Q6XYd2TgQA=7-Tepf6z0PDw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: Use ${ROOT_HOME} instead of /root
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
X-List-Received-Date: Thu, 09 Oct 2014 16:57:52 -0000
Content-Type: text/plain; charset=UTF-8

On 3 October 2014 04:44, Burton, Ross <ross.burton@intel.com> wrote:
> On 6 September 2014 08:23, Burton, Ross <ross.burton@intel.com> wrote:
>>> +++ b/meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
>>> @@ -0,0 +1,176 @@
>>> +From 00138d820fc0dfce6e5fee03d1edda66db34aa80 Mon Sep 17 00:00:00 2001
>>> +From: Dan McGregor <dan.mcgregor@usask.ca>
>>> +Date: Fri, 5 Sep 2014 06:28:58 -0600
>>> +Subject: [PATCH] Make root's home directory configurable.
>>> +
>>> +OpenEmbedded has a configurable home directory for root. Allow
>>> +systemd to be built using its idea of what root's home directory
>>> +should be.
>>
>> Patch looks great, but please add signed-off-by/upstream-status tags.
>
> Going though my list of "needs work" patches, this still needs patch
> tags and I thought I'd just go it myself but the patch got corrupted
> somewhere:
>
> patching file meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
> patch: **** malformed patch at line 107: the root user]),
>
> It looks like something is re-wrapping the patches.  Are you using
> git-send-email or pasting the patch into a compose window?
>
> Ross

I'm using git imap-send to gmail. Perhaps it's corrupting it. I'll double check.

I think I have the upstream status fields in my repo, I guess I didn't
send those changes.

