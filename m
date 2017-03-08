Return-Path: <msm-oss@mcclintock.net>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 965B672F44
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 02:55:34 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id 77so7658473pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 18:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mcclintock.net; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZpteK9WiGUiH05cmKS6RbR2Yq84wcYzn+/c8ive5Tys=;
	b=mQMmjpx5Te7jJ+B+Sy7N3+iMC9oMk5ehj56SJF6hzqxbB5/NphNm8x+iFTFj3oIYI7
	Kp1ESVKWO8+U+N68ATGX+1UqMttFqLc5Ta5KcokXLASQs7dOm5lsomWX9Fqly3TmFxxV
	7Cl1h+1g6VbUW/HKDubhQkSr3/Uf4aiBTMmXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZpteK9WiGUiH05cmKS6RbR2Yq84wcYzn+/c8ive5Tys=;
	b=UyBjFgfkdMvx5XybkUQ905x4KXIehUWAvqvhXkNR+6MOE//u3W3rQB8ia1eJ/urRlO
	SC1yVdhLv9Zzk/Dn8a0u8cyKmGZKdzj5af5yawk8ogbCCxPbN1Lq0f9DwYr2FdVoUYCZ
	kg8EWWODdG85XZICXTiuYy5Zwcun3DdFqfPBvSLnOyBNWbe+gdYSEzcbfhr/hxzkQSvw
	06EoS28uJGi1LbizBUachpJJ+P/D4gWT12o7F9GW/OIB5DpTaXDFLciOPEpVsXSUu8VZ
	uw2EIxwtu3GA9wQamo8I8mFliEyLUZN8N5933AdYtE5yNSrpYicaCBEizV6rAxPhY4Gj
	9S+w==
X-Gm-Message-State: AMke39nhNx4Iwtvh8ivjzjQ6vUhgH0a2clzWJj0rUihmrYUTjanPSX+vMlDph8Alr0xAup9VarpJ9DQklXpmTw==
X-Received: by 10.84.210.15 with SMTP id z15mr5179607plh.11.1488941735675;
	Tue, 07 Mar 2017 18:55:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.177.198 with HTTP; Tue, 7 Mar 2017 18:55:14 -0800 (PST)
In-Reply-To: <2425083.J11tCAZyJx@peggleto-mobl.ger.corp.intel.com>
References: <1488916121-30447-1-git-send-email-msm-oss@mcclintock.net>
	<1488919643.22968.47.camel@linuxfoundation.org>
	<2425083.J11tCAZyJx@peggleto-mobl.ger.corp.intel.com>
From: Matthew McClintock <msm-oss@mcclintock.net>
Date: Tue, 7 Mar 2017 20:55:14 -0600
Message-ID: <CAEsOVNd-GEJihTjZ0fWFB8gtfkE8_EahNmiR0=H9oSic8FUybw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utility-task: Add do_patchall task
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
X-List-Received-Date: Wed, 08 Mar 2017 02:55:34 -0000
Content-Type: text/plain; charset=UTF-8

Posted an alternate patch to bitbake mailing list.

-M

On Tue, Mar 7, 2017 at 4:33 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday, 8 March 2017 9:47:23 AM NZDT Richard Purdie wrote:
>> On Tue, 2017-03-07 at 13:48 -0600, Matthew McClintock wrote:
>> > This is useful in a few scenarios:
>> >
>> > 1) A developer wants to be able to grep all the code in a particular
>> > without having to run patch on various components until they guess
>> > the
>> > right one (e.g. which component is generating an error/warning?)
>> >
>> > 2) Other code scanning tools that can be run without requiring a full
>> > image to be built (legal, static code analysis, etc)
>> >
>> > Signed-off-by: Matthew McClintock <msm-oss@mcclintock.net>
>> > ---
>> >  meta/classes/utility-tasks.bbclass | 7 +++++++
>> >  meta/conf/documentation.conf       | 1 +
>> >  2 files changed, 8 insertions(+)
>>
>> I have mixed feelings on this. Whilst I can see the attraction, extra
>> tasks like this do actually have a parsing overhead. We already have a
>> lot of them and its only a question of time before someone wants
>> another XXXall task adding.
>>
>> I'm wondering if we can solve this at the bitbake level instead with a
>> new parameter instead? That would allow us to delete tasks and speed up
>> parsing rather than slow things down.
>
> FYI there is a bug open for this (currently assigned to me, but it's in the
> "new" state so anyone's welcome to take it):
>
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=7733
>
> I suspect most of this would need to be handled in lib/bb/runqueue.py;
> actually adding the option would be in main.py.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

