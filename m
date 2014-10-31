Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 124E665DEB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 08:21:47 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id e131so5308832oig.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 01:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Yw8qKKn1Xcdj0vXYM6IavCU52LPUZqghjHOBxvlXvis=;
	b=mS9zzdMlAjmvPUG4nooLlzrYOEEUgPIEdKM23dUeKjQtk2wcJgLvp8Ol+1yHiohEzS
	dDmGMEmRp4rJUMZwAM3MHKk+WxvdofxXQXiAzf881R8MakLXT0LoVrD7YUDj2cHIKzhu
	O+hP+My2ptujpM8AZcouIQ4Z8tZCZaFVVfLdOA2rrKJXBjnZ/BY/HhrhSwlYR9EuH2P+
	E2Uv3nv2uP0ZQHeSX7jXu4JzA2OxSiikfQAGc3eLpB0t9DrbCBKX05zM/Q6OQX4ms2T6
	g8jEfV5bHJi0IDgIqRDQWxvC5HnmAC2sHr5ALPZ5VCXnSaPKzWwMhILmL57CYnCk+0F+
	vgLw==
MIME-Version: 1.0
X-Received: by 10.202.220.195 with SMTP id t186mr209540oig.86.1414743708216;
	Fri, 31 Oct 2014 01:21:48 -0700 (PDT)
Received: by 10.202.67.84 with HTTP; Fri, 31 Oct 2014 01:21:48 -0700 (PDT)
In-Reply-To: <CAJTo0LauN8+Qc14WNkuOmQmhrF=2nXzfrM_O560E0gfqMgfLtQ@mail.gmail.com>
References: <1412389675-13389-1-git-send-email-Martin.Jansa@gmail.com>
	<20141004023040.GO25706@jama> <20141024090416.GB2430@jama>
	<CAJTo0LauN8+Qc14WNkuOmQmhrF=2nXzfrM_O560E0gfqMgfLtQ@mail.gmail.com>
Date: Fri, 31 Oct 2014 09:21:48 +0100
Message-ID: <CALbNGRTJxpctu143L8myaN1yzDdMVUVJhFoH3iznyr8webpgRA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH] systemd: don't move libgudev around, it breaks libgudev-1.0.la
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
X-List-Received-Date: Fri, 31 Oct 2014 08:21:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 24, 2014 at 12:29 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 24 October 2014 10:04, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> Should I resend without WIP tag now when ChenQi confirmed that moving
>> libgudev isn't needed?
>
>
> No need, I've merged it into my staging branch already.
>
This should go into dizzy - right?

Andreas

