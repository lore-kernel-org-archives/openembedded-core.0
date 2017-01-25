Return-Path: <ygl@iot.bzh>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id ADD4771CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 19:03:48 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id x1so47374986lff.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 11:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wHx1KCiLPjZ2BPfN2UCfvi3VxCzDUHuVboGZcZnBrQs=;
	b=0Pdx3HWcMIs5qNhlFxdPV+1sgRFSdeTW71/9WxpxcoDX55fNN4oqdvPW8M5sG/Rwp5
	f5XpaDFnzoowVUwSzsXjK1KWGO/Y9gvelVSMOiqNSmJ9Jnf/hGiS3WZU9cxrkem1kKVq
	3VT+hX7sF47fInFIptEOGQCvuI9ypSiuZkOPEdIq48/9OXhjfXhpY21FieluD3I6ipB5
	Amzdz3LF1fclnvmiNnD0He56K246CiLb5Am6yAU4ZCY9bii4flwhVHy0qZCjzXP/Kp3L
	HqUENgWbL2CYhaVimT9xTgGkg27cG5wkr8jgP1DtPXZ3AsSMSDkhfc2A1Cj3aq1gOBPf
	dxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wHx1KCiLPjZ2BPfN2UCfvi3VxCzDUHuVboGZcZnBrQs=;
	b=Yhfw7jv01jBJPl3JXgrgu4VtO52GY7G21icHe//eDdd6xle+sF0zrNr93UIhZWJjzl
	VzJ0NQa2AhA8WmKvwCrc/siHO6Aca57yvS9C0gS5sOjax/CJpN0Absr8InWFxmtqLmlx
	HoDpo9IVIf9bj5yJiii2qdLA1IZF7tOvqqAANujvIziL2E3SMdIaBqFg37KIvCV2QCaq
	kr3mUQrT6gLFwYk/ESClzxwQaP/qgYhLlLMjuOYoVbfmF4Y97Lwt/VqZDW8Cy4jbsHpq
	L+Xq/eTl9vCQX3B96egr/aSMUa4KuJGNWoGQbQnhIPCzFdJgIayACtK8/XyEnJOCyv/2
	YHnQ==
X-Gm-Message-State: AIkVDXLV54VyvlcO9KyIN0UAiUjBoa2wkHv9e/+AHiXcAgxBk6O9kRPyqabChY6tMhguT6OoUAO0UmG9aWGVmA==
X-Received: by 10.25.67.84 with SMTP id m20mr14337584lfj.106.1485371028548;
	Wed, 25 Jan 2017 11:03:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.170.18 with HTTP; Wed, 25 Jan 2017 11:03:47 -0800 (PST)
X-Originating-IP: [82.253.123.24]
In-Reply-To: <CAJTo0Lb+x3b7E+3ss2GA6vjScguW4DK_DAZO9wOzUMorSGVf3Q@mail.gmail.com>
References: <1485335933-9845-1-git-send-email-yannick.gicquel@iot.bzh>
	<CAJTo0Lb+x3b7E+3ss2GA6vjScguW4DK_DAZO9wOzUMorSGVf3Q@mail.gmail.com>
From: Yannick GICQUEL <yannick.gicquel@iot.bzh>
Date: Wed, 25 Jan 2017 20:03:47 +0100
Message-ID: <CAMZwcMAhpSt5ZSHshY7=X67ox1OEtNGdb=sQyvQZZvswinQ8ig@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ccache: update to 3.3.3
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
X-List-Received-Date: Wed, 25 Jan 2017 19:03:50 -0000
Content-Type: text/plain; charset=UTF-8

2017-01-25 15:25 GMT+01:00 Burton, Ross <ross.burton@intel.com>:
>
> On 25 January 2017 at 09:18, Yannick Gicquel <yannick.gicquel@iot.bzh>
> wrote:
>>
>> -SRC_URI = "git://git.samba.org/ccache.git"
>> +SRC_URI = "git://github.com/ccache/ccache.git"
>
>
> Why don't we just use the tarballs?

Ok to point on the tarballs on download.samba.org.

>
>> -LIC_FILES_CHKSUM =
>> "file://LICENSE.txt;md5=b8a4fa173ed91c1a5204ea4f9c9eadc3"
>> +LIC_FILES_CHKSUM =
>> "file://LICENSE.txt;md5=938c02728101936f2a74a67d1d82ee25"
>
>
> Always explain why the license checksum has changed.

Ok, I will update accordingly.

>
> [Patchwork-Status: Changes Requested]
>
> Ross

