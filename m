Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6B7BF6011B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 00:00:13 +0000 (UTC)
Received: by igcto18 with SMTP id to18so23403980igc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 16:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=SkZlYNgHSbOjUZiw4VyW2KVedAEQUvlJ+UEOu4XxtSY=;
	b=NBuJGqpAdvy/6QassOO4n9oSHFJEowYQoDfHy/FO1HiwmSOSG+a2Xi9BURi5rT5Riw
	iIJbFvDX5rTIa/jCMvzkSPVdrnyNAobDqo66yQt+oUPe8zX0FHVOzXWOvf+D4Ojshta3
	j4UqtsVbFnqtrVdkZ6q9fxC7zllibZdu+Pj5JFloC/cgBATA9aBBkipzU31+rIoa6+dA
	+x0Swqx2eV8ySou1l57YrkBU5ffqTe5lLydakx2oxMkZZnReO3ZyUvFXCvpS4k/+Gpav
	/CIEqW+UQyFFZ8OUG+bmlTAWCDXe7mlmL4yGf8wE1lcn9gB8j5TPoMx/oWjEUk4145oJ
	k8HQ==
X-Received: by 10.50.143.10 with SMTP id sa10mr2678935igb.77.1448064014000;
	Fri, 20 Nov 2015 16:00:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Fri, 20 Nov 2015 15:59:44 -0800 (PST)
In-Reply-To: <CAJTo0LZQto4uyMrB7y5Yx16sW=LtZu9OpvgUm3LrS6=j2CeiBA@mail.gmail.com>
References: <1447944434-63631-1-git-send-email-adrian.calianu@enea.com>
	<564F4068.8030701@collabora.co.uk>
	<CAMKF1soWaQ9NGetzHap6YLyK+qjdL2Cc3iGits4i6HqjtPT1Wg@mail.gmail.com>
	<CAJTo0LZQto4uyMrB7y5Yx16sW=LtZu9OpvgUm3LrS6=j2CeiBA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Nov 2015 15:59:44 -0800
Message-ID: <CAMKF1sqzW4DEUiwJq6TBns4PQm1JQwpS8EU7UtnBWhH1dyQwgg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [fido][PATCH] [AArch64] Fix the big endian loader name
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
X-List-Received-Date: Sat, 21 Nov 2015 00:00:14 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 20, 2015 at 3:55 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 20 November 2015 at 23:43, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> it should get into master first so if you refined the commit message
>> then please repost it for master.
>
>
> tt's a backport from 2.22 so is already effectively in master, right?

oh yes. ignore

>
> Ross

