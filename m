Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id AC07A6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 18:35:26 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id mw1so79090505igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 10:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qWUDkAQrKxmjqRYXSqu/Bqc2crtp7SL6KGdg/6vuz2c=;
	b=f/LJ7FstyjxLMH4u9vAEHKfaaNNkOZXzY9F2WMlnZ4Dt6TfAYP47k6404wQtToxNc/
	CPDaKojNKDVnA9KGI/Nor8RvVqs0eoB0yEmFwEP/LDlp2q0YP8DAPCtbNpwT8AntUvn3
	AYTMnAFhbe5PYfzb8JxVj91iPubWMWxA8JkEZAyoE5wznUmObwkrVBBB3CPq6KBB516M
	LzrD8i3KflGESdkixRqXQWx8esa+qojqArpIx9KliOKX3FLXhhq6aEufdeKsH+pb0yrf
	UJV4VaXVEjB2tqjqh+mvh7r0Gm7oWBdxP/D1abQ4QJVryJfLu9P1YfBgk4mw+SqzgLXs
	me7w==
X-Received: by 10.50.7.97 with SMTP id i1mr304311iga.75.1452278126971; Fri, 08
	Jan 2016 10:35:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 8 Jan 2016 10:34:57 -0800 (PST)
In-Reply-To: <CAJTo0LZ=wzVPAi3OuScYX7kmJNXhsLif+FCUfjm9ZdyogZm-Ng@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
	<CAMKF1so8xuy9Q8YjRynpgV68cjt-9KHae4TBTjKvn5EU0UzD+g@mail.gmail.com>
	<CAJTo0LZ=wzVPAi3OuScYX7kmJNXhsLif+FCUfjm9ZdyogZm-Ng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Jan 2016 10:34:57 -0800
Message-ID: <CAMKF1spdFfEJ0ZK22yDf30tnZ_1WFxFBLqprwqaPUDE_jMbQ_A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Fri, 08 Jan 2016 18:35:26 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 10:29 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 January 2016 at 17:43, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> systemd does not work with musl. I have patches in my tree to fix the
>> build but then it does not run :(. musl and systemd has different
>
>
> I wonder if we can/should raise a SkipPackage for systemd if musl is
> enabled?

Seems good.

>
> Ross

