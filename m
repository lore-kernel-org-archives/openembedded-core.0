Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id EEA7C65C98
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 09:41:39 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id b13so3725713qcw.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 02:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Amq3DAM61T1T7kuT8IWb0sfmp5UI83S7Rjt8zrxufyA=;
	b=R/ox7fQfIDrIAXtY8/gy0v6VclnuYbQYgcgjpN3mO8VFAKhxmAeZu5lbS0C7W93eLQ
	v7oQnCUpAzD+tM/nnCAKQLLam2L8QUsveWgto/JjxfcEfzcIgDA4gJVTc0zuwpf9kACS
	696tqaD8A9TancbWPXR4dLRbSzu5+LxeUC95yX7EfUc+vW5YZSlRo+oV2S3AnDdAemAH
	h+2vyPlaeSAv89En7rWHwDakTFbYhg2EeXTIFVOYBTl+dZVZra1YQRs1F6gK5NJZtWD1
	fpZGHHEN6/XEr2B7RWT5wctrXylqLEckLpecFMk3IKxWEr65m1XXKJpTAxeq+2fcgTfY
	LYwg==
X-Received: by 10.224.132.72 with SMTP id a8mr11228214qat.37.1413798099447;
	Mon, 20 Oct 2014 02:41:39 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Mon, 20 Oct 2014 02:40:59 -0700 (PDT)
In-Reply-To: <5444D400.90702@windriver.com>
References: <5444D400.90702@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 20 Oct 2014 10:40:59 +0100
X-Google-Sender-Auth: ufJrEtoI_8cTT6Sk7-hu8PvemN0
Message-ID: <CANyK_8dYLsNqhOcE6ip1_wz1L4XNvun7TdoCtQW9dtgDcDaF+A@mail.gmail.com>
To: Liu Jian <jian.liu@windriver.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg_svn: update-alternatives fails for "[" and "[[" in busybox
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
X-List-Received-Date: Mon, 20 Oct 2014 09:41:41 -0000
Content-Type: text/plain; charset=UTF-8

On 20 October 2014 10:21, Liu Jian <jian.liu@windriver.com> wrote:
>
> Building a small filesystem with busybox gives the following error lines:
> (see log.do_rootfs under bitbake_build/tmp/work/)
> sed: -e expression #1, char 41: unterminated address regex
> sed: -e expression #1, char 42: unterminated address regex
> This is caused by the script
> bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/update-alternatives.
> "[" can not be used directly in sed expression.
>
> Signed-off-by: Jian Liu <jian.liu@windriver.com>

This patch looks to be corrupted, opkg_svn.bb no longer exists in
oe-core (it's now opkg_0.2.2.bb) and your commit message is very
confusing as it references a log file and a path which only exists on
your system.

What version of poky or oe-core are you sending a patch against? And
have you read the contribution guidelines in
http://openembedded.org/wiki/Commit_Patch_Message_Guidelines and
http://openembedded.org/wiki/Styleguide?

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

