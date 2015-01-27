Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7C190718E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 17:16:39 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id l6so12992611qcy.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 09:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Fu0sBCaEisscGHUWCzDWQIXzZEqgSAeQvHRRkDZvjAI=;
	b=gRXF+zEYdCOHIDWwNhNlKNT8xMaNnUm5vbYLTYEPj6DMqsj9woSsjYV8k36v89940y
	38pRxJme3NSI2gp9PKfIt5grWnLZm2BGSQpbsvL2a5+qJKnUH2Msp8MLePEvHt2ztLKi
	xME0vO+eytJcyoYDzN1NCqjRPlMjyInnNQzcRNDxv71UvbreOpovtCoLKcVuiBLJhSM/
	IkW5qzR5PH9nhQHgVKDRVKJVXhNMEvZJD0s2WgzFPG2AoA9dHDDaNKTI5YAj7QSy3PtU
	T4AYbXHXgy2+cImhIo1Z8De1RX9B9NMd02OCQL4hxxiIjkqxvo5RrTyyRBZ8Q5XjZ67H
	O3Tw==
MIME-Version: 1.0
X-Received: by 10.224.15.193 with SMTP id l1mr4079290qaa.2.1422378998382; Tue,
	27 Jan 2015 09:16:38 -0800 (PST)
Received: by 10.96.30.35 with HTTP; Tue, 27 Jan 2015 09:16:38 -0800 (PST)
In-Reply-To: <CAJTo0LaHX+XQRJpj3GbgohScdYaxCLz-2qf-YXCZrTF0tO-3=Q@mail.gmail.com>
References: <CACS+7ZRh2fq0ot_u6U0B+SGq6uCORnj9_B2shfSEunrwhPnH+g@mail.gmail.com>
	<CAJTo0LaHX+XQRJpj3GbgohScdYaxCLz-2qf-YXCZrTF0tO-3=Q@mail.gmail.com>
Date: Tue, 27 Jan 2015 11:16:38 -0600
Message-ID: <CACS+7ZRbDtovFdD8DBV+zx-3671pe6N2tPWADsGEe6=mMUK3Tg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: configuration updates
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
X-List-Received-Date: Tue, 27 Jan 2015 17:16:44 -0000
Content-Type: text/plain; charset=UTF-8

On 27 January 2015 at 07:23, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 15 January 2015 at 21:11, Dan McGregor <danismostlikely@gmail.com> wrote:
>>
>> Rebase sshd_config and ssh_config with openssh upstream.
>> Check for the ed25519 key in the systemd keygen service.
>
>
> Since you sent this master has moved on and this doesn't apply anymore. :(
> Can you rebase?

I rebased and sent again; part of me wonders if Gmail broke the patch;
the new version was sent without the help of Gmail's web interface.

