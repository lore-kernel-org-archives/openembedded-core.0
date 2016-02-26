Return-Path: <net147@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5CAEF77422
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 13:29:03 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id q63so52240216pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 05:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=wNt2CVbFji8WJt+CcF+mtrcpl3xwf7zPezxYI8Tpi9o=;
	b=pmqIWruXQejhjM+UaD5406lVCwqkx/RK5OiHBC2JJctGLBVp3P594+ah56ZSJIYD5C
	Aun125Wim2fCfQjveaE9m0UXHnykIpaNgIx7Zk7TWlCjdY6W7Z5LB/q2WxY5pKzjvnJi
	/U80pTorw7Zb10/aox9zu2fIn4xAFp8K8rojdxQfMJlOnA0sR/fbs8bbL6Gwi0Af2UZB
	UpwvcEzI+0jQOD6Qgpb1btKwo5La4JkMDOFS6+Vt+CdFNa+NXEEG+ZrGBtijw/IIBADN
	8S2977WpIm13NcQFO3viHkDUlv7DT3JfdbXs/usbPQROICYF2fxW2tW+93/41JYEE8PC
	schA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=wNt2CVbFji8WJt+CcF+mtrcpl3xwf7zPezxYI8Tpi9o=;
	b=CvtcrohX7SUHYgKm0ecBQ4mgg21uAvPkfKumCWdaXfE+vZ9s8Hrza78paDPOL4Ircz
	DNfCsz6yQWWlqPeJZraTiojWm/3n08rVPXpnXhizE1EBGD6a/jeHKmbB34OmqsnS2JSq
	ug3fBIMezQ+l97R1wocnChW/+UGkXsttfycrLpzblUaPO3xPdviYaNzmXNeBkmZfiy/9
	/RqnkTDNmACvKj6slQt3Ef8az4h3nIgHkHjF3Z0BCIOWm4nr4yz6YI3XQbzYp7xkg2Os
	pyX4S/k6gmb2aFWWNOitZ7OwtqgvrH3ymrWazg1oaAWr7efQzosgXwhWH1hgr1uV1n4w
	ymAA==
X-Gm-Message-State: AD7BkJLmlgUYBBqegMQOzR6jgt3F8iEC7BY1iuzewl7RlxWoK9gJkZHPIo3tWYu+g+erLINwkPgDDwh6eEDRRQ==
MIME-Version: 1.0
X-Received: by 10.98.16.198 with SMTP id 67mr2060858pfq.21.1456493344515; Fri,
	26 Feb 2016 05:29:04 -0800 (PST)
Received: by 10.66.155.201 with HTTP; Fri, 26 Feb 2016 05:29:04 -0800 (PST)
In-Reply-To: <CAJTo0LYS-u77Lg+Q4OWT9syYvQVP-631RQ+N9GRRoBKg+6r3Tw@mail.gmail.com>
References: <1456483945-16340-1-git-send-email-net147@gmail.com>
	<20160226110428.GA2557@jama>
	<CANwerB0bs=0b0r_mj+VJ+rgYz56jKUuSiUgs7kdK+tD9f=Ot8A@mail.gmail.com>
	<CAJTo0LYS-u77Lg+Q4OWT9syYvQVP-631RQ+N9GRRoBKg+6r3Tw@mail.gmail.com>
Date: Sat, 27 Feb 2016 00:29:04 +1100
Message-ID: <CANwerB2gBZKqfkXoaFH_dhkQAfDvN7TLeBceyOxsdVJzaxDgGQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: fix build when DISTRO_FEATURES doesn't contain x11
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
X-List-Received-Date: Fri, 26 Feb 2016 13:29:06 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2016 at 23:33, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 26 February 2016 at 11:17, Jonathan Liu <net147@gmail.com> wrote:
>>
>> It doesn't work in PACKAGECONFIG..... that is the first thing I tried.
>
>
> I'd call that a bug, and should be simple to resolve (pass expand=True when
> fetching getVarFlags in the PACKAGECONFIG handling code).
>
> Ross

Feel free to submit a patch to handle the PACKAGECONFIG expansion and
then I can update the fix.

Regards,
Jonathan

