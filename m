Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 66EC871B04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 10:15:47 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id k15so7188594qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 02:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=APFjG0fHPQLjEOabhlOllVZPFYafxpTBl6X5rzsCUn8=;
	b=F29kCeJb0eAw97aFivkc24RbPtXh6iinvbXgUQgZr8qRihyWuU7pggfzJ8HdyegCYq
	T1s9N6DqLC3FM/oLGyQTwvXUXxRkH1hnbLxcLG4YRX25THoCxM45o9rFKkN2NLKo2ohl
	hA1AeVU6kErhMZd6N4kj4c3lY4hzzS5RjVmns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=APFjG0fHPQLjEOabhlOllVZPFYafxpTBl6X5rzsCUn8=;
	b=aWvhAolqNBSzyD92rAxbNmaU0LYDd5UfBuGJNqFb1LmW/pyx79OZsZbER05bhtC8AS
	rwksYr5fuHj93dvQ0e6kLH8IEwHB6cjH8QQ9EGzdm018kZdZdlVrQuuRr8nqPX7uaINA
	O7W3gwWd3TnFSx+Adhw4dA3otZ2g+YpnWptZTH3rdzjR9Abg3aU99W/U/q8qUOT0rGje
	TY7CvA1oeLNmNnEv3QpFZrqQD0sZfteUTw6GXNqP+q1QzhLfahumk4KeN7yOfJH67CfC
	Ge6eMFm07AkL5snadWd6RpfSX32L66ZKkudLloNAM3zdyLFLsDcDth7MTLnukAi37ICh
	n4PA==
X-Gm-Message-State: AIkVDXKk9uCbtg/UuQvNsnyhMj6+p40AUYuHc5ars0MFYwOlSjyW6SMEkgsUMKv6IyPDB85I+qm9uTteidVS62oA
X-Received: by 10.200.53.71 with SMTP id z7mr1937657qtb.203.1484734548467;
	Wed, 18 Jan 2017 02:15:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.19.82 with HTTP; Wed, 18 Jan 2017 02:15:28 -0800 (PST)
In-Reply-To: <cover.1484733982.git.ross.burton@intel.com>
References: <cover.1484733982.git.ross.burton@intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 18 Jan 2017 11:15:28 +0100
Message-ID: <CAP71WjyY0oH=j3ApVZhrc6sQ7YDw4bfnrAc1V9okencZLhjVBw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/56] Consolidated pul
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
X-List-Received-Date: Wed, 18 Jan 2017 10:15:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 18, 2017 at 11:08 AM, Ross Burton <ross.burton@intel.com> wrote:
> Khem Raj (1):
>       gstreamer1.0-plugins-bad: Backport patches for improving live playback
>

I was under the impression that this one would be dropped.. at least
based on last emails. maybe it was discussed separately.. did you
conclude that we need these patches?

