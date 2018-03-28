Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id EF39677811
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 11:15:33 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id o9-v6so2208249otj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 04:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ynfVpJHNpyk0NdIzbm1X26DGQEr7fr+w8YJ+DDly33w=;
	b=sQV3VQVZ3XGaaH0OKNkdKhKDxr88M8iIfMxrzdLq56+H+bBjXRUlI4UzonKyg4QlBv
	RAQpwtO82G/H52T69iC99SeCmT2awwWV4V37G/0zm3fzXheDhQOpkvUbQJtcMKz105/u
	MS+vCntVZlzrqh5MB1zCyM4uL2AiJuld8B/TNPYTu9devBXUur+f4Pz1wFcuQsylN66X
	3Xjwb9HkFjhBcuw/bO04bIYf0JRhsf+w5rhRj0BcfjzO2BB6mU8tRWVaHCK4I/U6n1bb
	Gbpr+duTq0VjDzTxw5Fs+bQtv+mlQXRwg8bvQgH0G0DiUq2Hp0qDi/3Q5qI/WjtX0nJY
	uV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ynfVpJHNpyk0NdIzbm1X26DGQEr7fr+w8YJ+DDly33w=;
	b=eduVeOOulUmWfEVeROD0EqwFISSqU8ghgUEhNEvATBSdMjS3FVoYSDOI6YIpeCJUKV
	ERk7EhWoYFwf06VEig8OlaOurUf5onSZgPKtCwwGWTq8apO9VBaduUhBVmTd0zm96s9e
	n27kVn96QuEPKfMToGnVB/V/GWCPpTr9bD38IpxAhPXCZOfjggOlH/Ev1lUyPsh02hAn
	TfUiDz+XDbAnCDZKw9rXJXCl7G2YcPsdjDyX4c+eXSJi9LfcYAmYmHYyCYXZn/TC96Ul
	ldEfjCbBcExJfNga47QDquSPqlZ/tvu7725LeDd/NNYTv6T56cx4NJa6uYkkOXn5fOBg
	QANQ==
X-Gm-Message-State: AElRT7Ez60bGptTla8HQrZ+TskDWD2UqPTFTPYaDYtl5dtBhy8m0V/A9
	Uuq+FjwMxipMyzaI75ILHcI+y0M+VfFb2tS45wlJbQ==
X-Google-Smtp-Source: AIpwx49GW/KJVTuuKtG1H78v+bl4ufw7iEu+Yo4vTY3y8KBKnTf6v2RoyX6HGUq+TLMM1KC3onA3kRYdW1R5YmZgbns=
X-Received: by 2002:a9d:70c1:: with SMTP id
	w1-v6mr2049301otj.300.1522235735220; 
	Wed, 28 Mar 2018 04:15:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Wed, 28 Mar 2018 04:15:14 -0700 (PDT)
In-Reply-To: <62e48d71-f219-2d7d-ea58-b99e1caaaecf@gmail.com>
References: <62e48d71-f219-2d7d-ea58-b99e1caaaecf@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Mar 2018 12:15:14 +0100
Message-ID: <CAJTo0LbSaZDNtGmgtoBba1n1aFLBUaaDN00L=G3UUq6UAvT6hA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Bind update
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
X-List-Received-Date: Wed, 28 Mar 2018 11:15:34 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Armin,

Does this mean you are working on the upgrade, or should someone else start now?

Ross

On 24 March 2018 at 15:35, akuster808 <akuster808@gmail.com> wrote:
> Hello,
>
> While working on updating the current bind to the next patch level, I
> noticed our current version 9.10.6 will EOL June 2018. I know we are
> under feature freeze for the Sumo release.
>
> Could we make an exception and allow an update of bind to the ESV
> version 9.11.3 ?, it EOL's Dec 2021.
>
> regards,
>
> armin
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

