Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id C619D6093F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 21:28:30 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id c20so5656107ywa.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 14:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=szKl/Wfy0qNmAvo5Z8dY55uU+HW2Z5QXe0VYl+xEWgw=;
	b=A3Lc7p9TM2VaduTNTyBUsDke3EFneLG1+OPf4MXpYJ/S4Leflbho5V9gIui8FXB2UL
	6XDDmlBlvT+dT3cRMUduE5zUnnY2XION4H4XK/zeSeiLbatV4zLnsK8X0jW/GiXpblI2
	QoWP6xEdqFv1ApJOTJVYN/6Z+csO4nrGpL9PCb2SFdtKexEm+z4KTO1BHDpUE8o1PwcQ
	tPhxzceVTFWH5NkuQCiO/a34AxL9meze1KqqSndYD6cYAFs9TrYXx6chk33L0jsUF0Nn
	8u4siHGSOtPVFgDvnQb0b36qyLukuscsGJVZ7u83j0c9en8YBi3jmnhZIVXzca4UFv6D
	+ZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=szKl/Wfy0qNmAvo5Z8dY55uU+HW2Z5QXe0VYl+xEWgw=;
	b=ggBcrnXpFh+RurFtECIwkeH/NKurzUFmq/tF3/wjgU8BV+XnQfgIDocCyn/6lqPSre
	NrysISQYfW0azMtw94ipU2RzDL3QTiv8r1G2zCFnmyOJvHqPNtQf8+Qp37svROKkCMof
	JBzQaonml/2YGggcggMDGEBl0oNHWMmz7qI7EN14kRxFQKpfjo8TsnP6QpYDrK0YlZfO
	QKCaKdUZ7UgLyw64+qRqBzfyuKJVTNex7nJ4iNHa2zABmEnvKP4bshTMbdu7MXYBeTR3
	Wopm1J1lvTNkrayYhlIhnUJ8RT+DFUsmBt9OXsqWTz2R4iRdesh7IErsgP3yUpMa2awJ
	YyMw==
X-Gm-Message-State: AElRT7H22KyBbNzZXDu6QR0ZSfGm9S/Hl4wYz5mCfkJG48vpw+NW7T5Y
	rufslarbSsYqzte5N8HsnuV8pZv7RgDOgHGFv5A=
X-Google-Smtp-Source: AG47ELvBwPhJpApcV2LeI7mzeC0J3J5m1WeBSVhi3W9FGCIieaTRdOccx8J0EFU4VQH7FBftyBNVtJKgLME5t1sYNfo=
X-Received: by 10.129.69.10 with SMTP id s10mr7295137ywa.145.1521149311483;
	Thu, 15 Mar 2018 14:28:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Thu, 15 Mar 2018 14:28:30
	-0700 (PDT)
In-Reply-To: <5c0c563b-bbe2-e1b9-2da0-bb260a946042@yahoo.com>
References: <c1fcdce0-7ad4-d7ce-287b-3783579fc631@yahoo.com>
	<8ef4b697-ea48-80eb-9068-7b15fd7cc944@yahoo.com>
	<ff44760a-886b-b868-c309-3cf52dc142f5@linux.intel.com>
	<5c0c563b-bbe2-e1b9-2da0-bb260a946042@yahoo.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 15 Mar 2018 22:28:30 +0100
Message-ID: <CALbNGRTfdmkms=mi-q8oFp3ENZ3OWv0SGfy0xpta4JWmheynHw@mail.gmail.com>
To: Martin Vuille <jpmv27@yahoo.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipe for Linux page-types tool
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
X-List-Received-Date: Thu, 15 Mar 2018 21:28:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 15, 2018 at 5:43 PM, Martin Vuille <jpmv27@yahoo.com> wrote:
> On 03/15/18 06:49, Alexander Kanavin wrote:
>>
>> On 03/15/2018 12:20 AM, Martin Vuille wrote:
>>>
>>> page-types is a simple Linux kernel debugging tool to list information
>>> about
>>> the state of virtual memory (VM) pages.
>>>
>>> The source is distributed as part of the kernel tree:
>>> tools/vm/page-types.c
>>>
>>> MV
>>>
>>> On 03/14/18 11:22, Martin Vuille wrote:
>>>>
>>>> I have a recipe for building the page-types Linux kernel VM tool.
>>>> Is there any interest in this?
>>>> If so, to what project/layer should I send it?
>>
>>
>>
>> This questions is probably better asked on the linux-yocto mailing list
>> then?
>>
>> Alex
>
>
> Perhaps I'm missing something. I'm offering a bitbake recipe. linux-yocto
> doesn't seem to contain any layers or recipes.
>
Hi Alex,

* You have checked layer list [1] if this recipe is not yet available?
* It would help if you send out a patch - just a description does not
say much. From what you wrote I suggest to locate the patch in repo
meta-openembedded/meta-oe/recipes-devtools. Mail addresses can be
found at [2] - for meta-openembedded it is
openembedded-devel@lists.openembedded.org.

[1] http://layers.openembedded.org/layerindex/branch/master/recipes/
[2] https://www.openembedded.org/wiki/Mailing_lists

