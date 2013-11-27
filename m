Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6FCC16CCEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 10:09:25 +0000 (UTC)
Received: by mail-vb0-f41.google.com with SMTP id w5so4885520vbf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 02:09:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TS5WPuN5hMDuvrQ3Rj14MMbmNyFt2KVMVCzWIfTnOQw=;
	b=Zc2XfWF6vv9sj9V9elieFG3yV1/f+4AAoOZaBnxvL4fEU5fSapVAfrCzuDw5Lxqe8x
	Ee8Zaqd/Amsi86yIQ1Q6VIc6BqnYHyodRPHuVCIaTqynojCz/Dp7pTxxEO8NivWKsy7g
	vXWpoN7NAw2l0KQTzZEAXsjZTTZqVou2ZkBw/fbsrHzuk8DFI8tLqzOEVfTBDDmXSUGw
	FJrfXkmjYgcl4tgwqniTyvJaj8OhbfE43vd3g4ioR0B4wun7aChc+j6NAFz/7IzKkswy
	pL8OzkDXqSgQwCXJOd7uQ9HRMex/GI4W5m6mJ4OkslNiksgwZKHIuXJzRcv6+UDDdsKi
	PIPg==
X-Gm-Message-State: ALoCoQmW5vLXcCAuz4CajvuViyh8GYtKI0eGNS+Qi6z0zuJVUgJtdV9wjYdLPKObTUJ/AjSf2PUX
X-Received: by 10.220.244.132 with SMTP id lq4mr1188294vcb.31.1385546964439;
	Wed, 27 Nov 2013 02:09:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 27 Nov 2013 02:09:04 -0800 (PST)
In-Reply-To: <20131127090946.GA6099@lpalcu-linux>
References: <1385495362-20784-1-git-send-email-ross.burton@intel.com>
	<20131127090946.GA6099@lpalcu-linux>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Nov 2013 10:09:04 +0000
Message-ID: <CAJTo0LYDgCRxMXE1G61M4YKs5eaneftSmW6FL1PtLDNcd+pbkw@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] fontconfig: upgrade to 2.11.0
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
X-List-Received-Date: Wed, 27 Nov 2013 10:09:26 -0000
Content-Type: text/plain; charset=UTF-8

On 27 November 2013 09:09, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> On Tue, Nov 26, 2013 at 07:49:19PM +0000, Ross Burton wrote:
>> Drop sysroot patch as a rewritten form has been accepted upstream.
>
> How did you test this? The last time I checked, their implementation was
> not able to generate the cache properly when using sysroot. Apparently
> they didn't bother to test if their code works. :| I tried to have a
> look and, after fixing the command line argument parsing bug, I realized
> it has other issues which needed further investigations.

The fonts worked :) and the host-generated caches were the same
(according to md5sum) as the ones on the machine after it had booted.
If you've concerns I'll double-check, anything in particular that you
noticed?

Ross

