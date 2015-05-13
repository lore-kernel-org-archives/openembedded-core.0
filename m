Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id BF9C97404D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 13:07:31 +0000 (UTC)
Received: by qgej70 with SMTP id j70so20768292qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 06:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=nbD1LGuulVkZPFphX6GO13jEm0ar1bZwkMD08Tk9GlM=;
	b=TMJOOXoJTihVuUpZJezmbHMhsNiLuJ6OQ1g8D5Tvtf+80sIXH7vOljVoU1oPyFwlqD
	AnxU0tmoiEgO7bJwS6eojo0Yo1/c6O5JH6pK8sgw5+duMKuXiVFe4RvdQMveOVqaxrav
	TyJoArIWdXvtkjm6Ws1tWAdF1ThOFPPIxWwlG8xmuqkvzPLfCzIbcVpxM8K+E3NFc8lY
	Szuix0jCOBI+x8veeChGcXEPeY6D5dKpJ9DPeR1va9C+CH3f5XL4+M1K91xluhCyZxCZ
	IyM4QMF/t5O898bOgtNl6XktRhFRD35kvkrH6uS2vJgwP0AK0wCvybYNmwF06heBsPz+
	sOGA==
X-Received: by 10.55.50.201 with SMTP id y192mr43239334qky.10.1431522452148;
	Wed, 13 May 2015 06:07:32 -0700 (PDT)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94]) by mx.google.com with ESMTPSA id
	j63sm15669037qga.12.2015.05.13.06.07.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 May 2015 06:07:31 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1431442688-5860-1-git-send-email-mario@ossystems.com.br>
	<20150513051701.GA6448@ad.chargestorm.se>
	<6951375.nXgDNRerCy@peggleto-mobl.ger.corp.intel.com>
Date: Wed, 13 May 2015 13:07:28 +0000
In-Reply-To: <6951375.nXgDNRerCy@peggleto-mobl.ger.corp.intel.com> (Paul
	Eggleton's message of "Wed, 13 May 2015 09:54:39 +0100")
Message-ID: <873830tylr.fsf@email.parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] README: add "Contributing" section
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
X-List-Received-Date: Wed, 13 May 2015 13:07:33 -0000
Content-Type: text/plain

On Wed, 13 May 2015 09:54:39 +0100 Paul Eggleton <paul.eggleton@linux.intel.com> wrote:

> On Wednesday 13 May 2015 07:17:01 Anders Darander wrote:
>> * Mario Domenech Goulart <mario@ossystems.com.br> [150512 16:58]:
>> > +Contributing
>> > +------------
>> > +
>> > +To contribute to this layer you should submit the patches for
>> > +review to the mailing list (openembedded-core@lists.openembedded.org).
>> > +
>> > +Please refer to:
>> > +http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>> > +for some useful guidelines to be followed when submitting patches.
>> > +
>> > +Mailing list:
>> > +
>> > +    http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> > +
>> > +Source code:
>> > +
>> > +    http://git.openembedded.org/openembedded-core/
>> > +
>> > +When sending patches, please use something like:
>> > +
>> > +    git send-email --to openembedded-core@lists.openembedded.org
>> > <patches>
>> 
>> Maybe we could add something about the helper scripts:
>> 
>> scripts/create-pull-request
>> scripts/send-pull-request
>> 
>> or do you think that those scripts might be out of scope for the primary
>> intended audience of this section?
>
> My suggestion would be to link to the following page instead which covers all 
> the options and explains how to use them:
>
>   http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>
> We can probably drop the "commit message guidelines" link at the same time 
> since the above page already links to that.

Thanks guys for the suggestions.

Paul: do you mean dropping everything and add something like


Contributing
------------

Please refer to
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
for guidelines on how to submit patches.


?  Or keep everything and just replace the guidelines link?

Best wishes.
Mario
-- 
http://www.ossystems.com.br

