Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0F16B1C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 13:15:15 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id pa12so2161988veb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 06:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=19J5UIXNW5wXE1BcZ9diB3QgxDXDehi+bCBKpKyPwX0=;
	b=csTHId5Bg/ZQMwaB3P8kbYSOHLHvedFT259G5iwo1MjQwq/fHgFqr+ADWo0/CYo3nO
	2560RvC0xEzz+v/962z9wReryanSFxDQnc67ifXWn3+lvxNAMKc9I6tUU6OUZaJJ0vSv
	8cNcu4/WJ19L8BRH0Io3JzKczUDZsVBn75j0VThGkgyPjbD7dABvy7ceL/xUis5hb3hM
	tmsPLKkFbau9Ho8n6NiExE2nV9cuNkVLkv2zIMrHXRtABJa4bret8THhgZ/8h28NRftT
	AMndHQpehOkVBLWat/ZpvIpA49PijQUtPckMQ32lY0msbQudzOo8GlNHKxr5FAEtoP3S
	dltQ==
X-Received: by 10.52.163.46 with SMTP id yf14mr22542403vdb.58.1375190115474;
	Tue, 30 Jul 2013 06:15:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 30 Jul 2013 06:14:55 -0700 (PDT)
In-Reply-To: <1375178646.13247.50.camel@phil-desktop.brightsign>
References: <cover.1375164419.git.sgw@linux.intel.com>
	<CAJTo0LZk9HR12mR7nozaE0yZ-DjMPkagf1GvagEeKmkF2i6M9A@mail.gmail.com>
	<1375178646.13247.50.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jul 2013 14:14:55 +0100
Message-ID: <CAJTo0LbPNLjQKKX1fPfeC+U643D2cD-Snyb_nAAe3P4D=XC+jg@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQkgFfuIMqElZpPVv5HNt0JPdDsWQ7Y4HXZ4v9Z2M4gFPujc8Y7terQ3sqX/itrB3Czw8Cgk
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (M3 rc1) 00/26] Needs early review and ACK
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
X-List-Received-Date: Tue, 30 Jul 2013 13:15:15 -0000
Content-Type: text/plain; charset=UTF-8

On 30 July 2013 11:04, Phil Blundell <pb@pbcl.net> wrote:
>> I'm still unsure why this patch was needed.  I've nothing against
>> splitting out the OBEX functionality and controlling it with a
>> packageconfig, but this does disable it by default when before it was
>> enabled.
>
> Was that patch ever actually posted to the list?  I don't recall seeing
> it in my inbox and I can't find it in the ML archive on the web.

Hmm, I can't see it either.  I just went to fix the little problems I
found and discovered the details of obex in bluez5 are more
complicated so ended up revising the entire patch, which I've just
sent to the list.

Ross

