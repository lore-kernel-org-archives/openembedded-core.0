Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4798E6C44A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 09:15:07 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id o10so9900844vsp.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VRkVTlVoauxTEZzx3ikEfq/Cdel/sCVOr4iaDd4kek4=;
	b=ARP4rN7EyVN1/RjRpEPX8QThxRokC9Qz1Op/7D2XL1P3n+rtjX0JeWDEkU4RpCFI8E
	nmH7xjImGh8ky0BpfFd0vU8Xo1ZpNrCcqd2uyFGryR7RjuniHP23xqxy/rIQMTImliOs
	ufHtvGAFNcf/PwQ/RrInpTjC7hDYm1M59zMQ+x0EuKTNMnNly3g4rkkUJB0NowqSEHYL
	rtoOtb3rIT5KobIxyigngviHP7ND6qgMO8qVp5ldN4bvxGOlMrfos5oCshVsC549Kuyd
	S3tyzTnCjUsaa6nr2e9jjNu6KRvcvre01f8K8YoSFFTzR8d8/4RqIGKSfpO9Tu5fKSpm
	dppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VRkVTlVoauxTEZzx3ikEfq/Cdel/sCVOr4iaDd4kek4=;
	b=hnlnKLCAQnw+BrRc4EvjD8o5SPp8PaDAS5D1YyU2vwNT35+B4eLmtJPzxqsnIUYoYC
	KI6iDhQT4VOFVRWatTENIn3rU25kuIuKgPLsUA17PK3+hcig6o8XCPJ6sYkRTjwUuf8n
	SYjC3oAFxZiJZsTicfCMaigwvFDSnG9jabUY+48O45q1/q9NMBADHkrSuRBmCO83+I6z
	dwQcxMH5O0XIr6ak+NL3grW4XnM63V+ID2H5jywmKChr2W0xx3+peuGCk+nO4O0h1ydM
	YvS5jmtYYRLLs3nq5bYvagU+WL8IomdF5Xax1G2XaZjtaeUm+bV6MjwhSCGMaCVJpRJk
	LKhQ==
X-Gm-Message-State: APjAAAVoeVGVsJcGpo1Q+omx9/MFvQczaDHfwDSFJDRnLbVGvvT4DxkC
	JsCFvLQTgTxMqgX3vb1qUgxrLXYMQxvOzbPNprUesWVH
X-Google-Smtp-Source: APXvYqz8cCah8jOf5RKwNrVRP3LJPCj2q6IgKPEpB0FnGiNfRRHzT0FckC1sXNwamY8KGtMpILSk98WfVFeWP2BYSt0=
X-Received: by 2002:a67:ea0a:: with SMTP id g10mr15725292vso.77.1557220508099; 
	Tue, 07 May 2019 02:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190506074531.13459-1-richard.leitner@skidata.com>
In-Reply-To: <20190506074531.13459-1-richard.leitner@skidata.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 7 May 2019 10:14:56 +0100
Message-ID: <CAO5Uq5RJtfyFNkCL=L1Vgrv9cJ+Fu+J90+ecapg3bEupa5hjUg@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [warrior][PATCH] uboot-sign: add support for different u-boot configurations
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
X-List-Received-Date: Tue, 07 May 2019 09:15:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 6, 2019 at 8:53 AM Richard Leitner
<richard.leitner@skidata.com> wrote:
>
> From: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
>
> This is done by concatenating the DTB with the kernels public key
> to all built u-boot binaries. Furthermore the installation of all
> the binaries is required.
>
> Signed-off-by: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>

If this gets applied, please can we get:

https://patchwork.openembedded.org/patch/160510/

applied on top of it?

-- 
Alex Kiernan

