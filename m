Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 01F117EE9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 13:37:06 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y4so2533790wrm.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 06:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Ma/+jbKeYOu51R+CTx+QsOCPtypm/mL6y7YAM3Pn6tc=;
	b=XCly8e/T/03V94b/12kJGUuZrzWuvBTQ7gTRlBkKDuVpP8x8mmGzy+uHXXrIJ5uSzc
	KpCQZi0rAyrPjrFTtOoV/3vob6793FuoCtOCPx1OJF8shiTj5PxvRImUFB24yRnzCBJO
	1ivtX3TKeO3v+FUVWIhXGBjt3UMSFBYMjm7oE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Ma/+jbKeYOu51R+CTx+QsOCPtypm/mL6y7YAM3Pn6tc=;
	b=feoIansCvJHPVgMHkSbbg8KTgYwuUDMjEQr0muCZi+Pl3HyETbqleWz1tImSzIt+Nv
	Lh0LLwQWjRHer15ZynBqoP9KJUxVsnRk2TnEd7s72sk+WjxBOzk7yhClaACyga2W/uJp
	+HB5QBdYM5zYC2nbqN4NljLOxgC2ye1mNzyiVKe93m2ke5kSC3WB2cTM0DTfROcUHxKG
	BdWlhBvM1ZN8APiAT52RVpgfREIidkB8AQo4D5a88/E2xJv3UGsifkEvS6uxe3GvvKcT
	ZxD0/tiCviAtp/zhxJ01ZeCvI1stjS/K7q3NF5VrnEV4wbmgu/EMdHX9jZ8eB3EiNRwR
	OCCw==
X-Gm-Message-State: APjAAAVRNJ9NpnyB+oT/T9yhsfAMF9708sm0AbrRT9p7o9SNgCJ7M6o1
	TcYyCCcdmVW1QKjmQ0a2w+GCZg==
X-Google-Smtp-Source: APXvYqzpBiFG472sfPpuky9FoisFTSKOCevJWh1NIg935wOZ4F/oj0loeAsD0607F75QL79bn2UdpA==
X-Received: by 2002:a05:6000:14b:: with SMTP id
	r11mr31707311wrx.196.1562765827616; 
	Wed, 10 Jul 2019 06:37:07 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id u2sm5403036wmc.3.2019.07.10.06.37.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 10 Jul 2019 06:37:06 -0700 (PDT)
Message-ID: <443f1b7d40c32f1645c448cc778cb682b3b2446a.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 10 Jul 2019 14:37:05 +0100
In-Reply-To: <CADkTA4Pd6hst7zJAcYafa_61h5OoWtHH=O6frawnw4XOEHLVzQ@mail.gmail.com>
References: <e5194d279637f6cb6aaa5e5fd1d2f6657aba522d.camel@linuxfoundation.org>
	<CADkTA4Pd6hst7zJAcYafa_61h5OoWtHH=O6frawnw4XOEHLVzQ@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: config warning from linux-yocto 4.19
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
X-List-Received-Date: Wed, 10 Jul 2019 13:37:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-07-10 at 08:57 -0400, Bruce Ashfield wrote:
> That should have been covered in this patch I sent:
> 
> commit 95e9df0b5cb5179271c78499dc60c3c0df0a5622
> Author: Bruce Ashfield <bruce.ashfield@gmail.com>
> Date:   Fri Jul 5 11:15:37 2019 -0400
> 
>     linux-yocto/4.19: update to 4.19.57 and -rt22
> 
>     Updating the linux-yocto 4.19 recipe to the latest -stable and
> -rt
>     releases.
> 
>     We also integrate a configuration change to support ptests on
> scsci
>     targets:
> 
>       scsi-debug: include core scsi support for standalone inclusion
> 
>     The -stable changes comprise the following commits:
> ---
> 
> Is that applied and yet we are still seeing the warning ?

No, I think I've missed some patches, which would explain a few things.
I'll go digging....

Cheers,

Richard


