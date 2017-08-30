Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2A57B78258
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:16:57 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id j3so4951960wrb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 16:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nGtXVML7oKeqp4nGyGQ/zdftwGU0iAmQVyqVrpfX7jk=;
	b=YnAR4n42dy9uxrv0vdMvaFIiQ24OvmzsASagzQ6/ZGkKICvk1JdRGUc0ykfBKJMApJ
	pmp7Kt4twFerYuKcSUUERxXd7IcEUpPlEIcdTSMcSqgmRGj7mmxXn8lmlTMLZtpb6e0t
	WAPh0p7NZkVnozEJ7Fn5ZiwoHNf3WwhWZSHl4omhTnOTdcoiVXicd1WsAG1UeAVdZm5O
	3VZI/Jgt24kvqjAgzlelSmi9Ly+Lmd9dV0rYlsP55uR649d7ldz1KLqFnOu6VfoslQyN
	uJZefyjaVf4Va6OmKINJ2DArxrAqXkfBABlSl0V18/SczHtRJlyZSJBc/Lt+7C4YqVB+
	dMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nGtXVML7oKeqp4nGyGQ/zdftwGU0iAmQVyqVrpfX7jk=;
	b=WFpWbBwMRpgGoZC5AeL/HFVX2dF9alzRoqF7u3poCf/EAs3eGRdDqO+upq7/pi3EYA
	XjJA0KkVgF4peL6zaG/roGVNbm7jeLF/yNgd3PdrXABCbwYDe3o+PVFfVxxpAV+l+CwV
	wOoQPcSWXX1rRlbWC3/gkL1If6iNWaR9go+hx8pFM1P1RADvOi+ab3J8/pUCy4Zh6zSF
	7G1uzWO/d+EMJWkq+45AZgm9BQGPaZKWZIsEsiMKg59CBbIAq9WzDY7x6RHDtrld+NYt
	CyJXjk8qjLo2TpVdyaWblWXwURyIXgJW3YxxDiIcxBfvee5PWs++jlmF3wsVP/kf3yEA
	BpDg==
X-Gm-Message-State: AHYfb5ghOuBm/PiyhONS599id2E0j+oGJDJ8nnflJ3oCiVP8dLWe9XoL
	jcULaKpdB4WzwAZWkPJHVcuaKpXSMw==
X-Received: by 10.223.185.109 with SMTP id b42mr2154135wrg.16.1504135018904;
	Wed, 30 Aug 2017 16:16:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.184.147 with HTTP; Wed, 30 Aug 2017 16:16:58 -0700 (PDT)
In-Reply-To: <2d1bb10c-e13c-79d0-4e0e-bd5aa5d99a42@axis.com>
References: <1499405543-3127-1-git-send-email-tobiasha@axis.com>
	<2d1bb10c-e13c-79d0-4e0e-bd5aa5d99a42@axis.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 30 Aug 2017 16:16:58 -0700
Message-ID: <CAJ86T=Vfoe5e86OokE3j9dY8Lc0s4A1OAZPwo318mYdFiKTYdA@mail.gmail.com>
To: Tobias Hagelborn <tobias.hagelborn@axis.com>
Cc: Tobias Hagelborn <tobiasha@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/2] Make source code browsable locally - devtool srctree
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
X-List-Received-Date: Wed, 30 Aug 2017 23:16:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 30, 2017 at 2:03 AM, Tobias Hagelborn
<tobias.hagelborn@axis.com> wrote:
> On 07/07/2017 07:32 AM, Tobias Hagelborn wrote:
>>
>> UPDATE v2:
>> - Rebased on latest Poky
>> - Fixed issue with bad paths
>> - Dirname based on $PN
>>
>> In our organization, there is a demand to be able download source code for
>> searching.
>> With the use of sstate-cache this has been challenge. Also, the source is
>> not gathered
>> but rather spread in a larger directory structure together with build
>> output.
>> There are probably others that also want to be able to do the same.
>>
>> This addition does:
>> * Force download of all source via the srctree_all task
>> * Symlink the source together in a separate directory structure for easier
>> search without
>>    the risk of matching with build output.
>>
>> This is achived with a new class srctree.bbclass that implements the
>> needed tasks and
>> a devtool command srctree which offers a convenience command to set up
>> source for
>> a recipe and it's dependencies.
>>
>> There is also a way of organising the package source code in your own way.
>> This is done by implementing a custom dir generation function and assign
>> to SRCTREE_PN_PATH
>> in a custom class and set SRCTREE_EXTENSION in a configuration file.
>>
>>
>> Tobias Hagelborn (2):
>>    srctree.bbclass: Download sourcecode and make it searchable
>>    devtool: srctree: New command for setting up browsable source-code
>>
>>   meta/classes/srctree.bbclass   | 90
>> ++++++++++++++++++++++++++++++++++++++++++
>>   scripts/lib/devtool/srctree.py | 87
>> ++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 177 insertions(+)
>>   create mode 100644 meta/classes/srctree.bbclass
>>   create mode 100644 scripts/lib/devtool/srctree.py
>>
>
> Hi
>
> I did not receive any feedback on this one.
>
> We do make good use of this feature and we can't be the only ones who want
> to browse the source of the distro at times?

Just for reference, I think you could achieve something quite similar with:

  bitbake <your-image> --runall clean  ( or rm -rf tmp )
  bitbake <your-image> --runall patch


> Cheers
> Tobias
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

