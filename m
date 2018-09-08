Return-Path: <leon@sidebranch.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 113AC79550
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Sep 2018 13:38:29 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id r15-v6so14067739uao.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Sep 2018 06:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xn27o1SG1XiOAJFkcdS+nybgd6oBbSlD2axcUF4frG8=;
	b=dcz6FfvYi/n0qg6hn08bvARJSPvchbByEcfnl+yoPtrc4cNMj3awdUDyuUCoG1uUSz
	R/jfcLOj6C2m7gRe5dssA3TuwZVWoCBCV9Zxfkf4mtKdx37xktX93w2ZFFN764NvgEY3
	DguWXU2MxWh0XYW6S9ZoBS9sCLSpxrOHzdN6m60tIBs+5WnQYQ9KaAlZsMiSACfCdpy+
	Sel2VDXpMsWFrtMmD6JwHuCjw41t3416i1pNtyQEjbM2fqN2mLbRwD9N/tf5O4Ny5g6m
	ANV8Bfs474h1w438G6VMsnbCUWVg3IY7HqAlNoCyxxCORjrOH24CL4xEbYSCALSpPBsM
	p7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xn27o1SG1XiOAJFkcdS+nybgd6oBbSlD2axcUF4frG8=;
	b=jvd0KGJJT40T8fXM9J8i32cCmGRsS0hGgZ8Bm2u4dK+s05Hdt2f0PdPrZFqAGsMKbN
	uI6ykoa2ovybHk5PNsCElTXPkC4U+JzG7hwZpvpl5oAE74XQFoOPjA0SshrTL8X3ZO1D
	J9Rofq+HFG5asEd7oHC6G4ffvfgymQfVZ6MDnAuvLn0DhioVAOzOn0bNqIsUuxvQ/JzK
	WvrPWpE1Bp5/aDrEQBlrAUYJteB9+Z4y5k8RkWoyIYzqMHGI6GrusugAIOnbSa+GSy3q
	7ipnLw8BRy9ojTLGxIosa2YszKhW8P3tfMsVyOmCoj6GgNdGtm6WraAmJ3hrlM6XkIES
	/X0g==
X-Gm-Message-State: APzg51CiW7ET9IOrOF2zleuxCNfr06e5UBqNJYgImCreSc+NSMs+Qh8B
	2DZFPkA4MBvIlpGz2U7SwMH9RD6c7wTPtEQB1+0IkA==
X-Google-Smtp-Source: ANB0VdaUlc014a8CT2o54mlq4DwySM79z3phXeB+F1qCrKb8AB1x1cul+He3ZY3NfF+dsstfRIgsZyzIBdOI3cVbe3U=
X-Received: by 2002:a9f:3d6f:: with SMTP id
	m47-v6mr4333012uai.19.1536413910690; 
	Sat, 08 Sep 2018 06:38:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:152c:0:0:0:0:0 with HTTP;
	Sat, 8 Sep 2018 06:38:30 -0700 (PDT)
In-Reply-To: <CAJ86T=V0fn4Mgbz0zsoVPjeW-gYutSj0zLHb7K1wefQPtB44fA@mail.gmail.com>
References: <1536267962-5562-1-git-send-email-leon@sidebranch.com>
	<CAJ86T=V0fn4Mgbz0zsoVPjeW-gYutSj0zLHb7K1wefQPtB44fA@mail.gmail.com>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Sat, 8 Sep 2018 15:38:30 +0200
Message-ID: <CAMjhiJhoEQhs1bxVxXCy-GGe2T_cFxp5a6eN8NMdKTNrBNnKGg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [openembedded-core][PATCH] kernel.bbclass: do not deploy fitImage; kernel-fitimage.bbclass does that.
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
X-List-Received-Date: Sat, 08 Sep 2018 13:38:30 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

thanks for reviewing.

On Sat, Sep 8, 2018 at 12:10 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Sep 6, 2018 at 2:06 PM, Leon Woestenberg <leon@sidebranch.com> wrote:
>> +               if [ "$imageType" != "fitImage" ]; then
>> +                       for imageType in ${KERNEL_IMAGETYPES} ; do
>
> This looks odd. You test imageType before the for loop which assigns a
> value to it?
>
Good catch. I will create new patch that turns the lines around, i.e.
test within the for loop

(The above acted on the last imageType of the previous for loop, which
had the correct order.)

>> +                               initramfs_base_name=${imageType}-${INITRAMFS_NAME}
>> +                               initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
>> +                               install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
>> +                               ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
>> +                       done
>> +               fi
>>         fi
>>  }
>>  do_deploy[cleandirs] = "${DEPLOYDIR}"

Thanks,

Leon.

