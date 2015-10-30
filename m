Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFA075D4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 18:54:08 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so16553471wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 11:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TNwEcACrJrI1gWBkv90dfHFbJWmajC4JXOowO5XHO30=;
	b=RXzMWrrQ3NjVeW7gs4VKfFkar6YrCUL/RipYgcw7+JMQk7PO+kmQKU/lmv3HGzE0Q3
	p7UoxVXO7h9FdOR+G8j7czHtItQpA97ttsoqIVEm+uz76JgzEMLCvic6BXnxYAYo+KA5
	2cFeunZ1A/7XKiRsp6IP5Ssk2aPmOxWihVfXzDBqnQfbFgFYtn4IH+/hFgH/76JxS+V5
	wMKrcT91y8u6Pu7ProJwEjVYx6wxas51CZbIM7GQmOU8mMBQGPG5FetaV2PF0UqQGlKP
	PS7tBu1L8d/yM+jfW3uiMZikwMj5VMt2NTex2cyFMbphAfv38iUmBaXEH2HHs8CZa/sH
	tmtQ==
MIME-Version: 1.0
X-Received: by 10.194.90.169 with SMTP id bx9mr11531456wjb.1.1446231248298;
	Fri, 30 Oct 2015 11:54:08 -0700 (PDT)
Received: by 10.194.140.38 with HTTP; Fri, 30 Oct 2015 11:54:08 -0700 (PDT)
In-Reply-To: <562F85E4.3090200@pseudoterminal.org>
References: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
	<1443390491-23728-4-git-send-email-dv@pseudoterminal.org>
	<CAJTo0LY2cDqCZe99YZP3bXuTq1bKdMaDAze6aEQJ2N1Vcb-K2g@mail.gmail.com>
	<562F85E4.3090200@pseudoterminal.org>
Date: Fri, 30 Oct 2015 11:54:08 -0700
Message-ID: <CAJ86T=W+V0_KUUD4ncoSnjm1_8C_aQ7SBzXE86Gd8XxSzX8yUQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] gstreamer1.0-plugins-bad: upgrade to version 1.6.0
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
X-List-Received-Date: Fri, 30 Oct 2015 18:54:09 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 27, 2015 at 7:10 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> On 10/26/2015 06:20 PM, Burton, Ross wrote:
>
> Hi Carlos,
>
> On 27 September 2015 at 22:48, Carlos Rafael Giani <dv@pseudoterminal.org>
> wrote:
>>
>> 0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch is now
>> in upstream, and therefore not needed as a separate patch anymore.
>>
>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>
>
> I started looking for pieces to queue for when master re-opens and
> discovered that this doesn't apply anymore, so the branch will need
> rebasing.
>
> Cheers,
> Ross
>
>
> Yes, I know. I am waiting until Jethro is released, then I'll send a v2 of
> these patches.

Hi Carlos,

Are these patches available in a public git repo somewhere? I'd like
to start testing now.


> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

