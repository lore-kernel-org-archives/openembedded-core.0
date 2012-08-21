Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1T3sdX-0002Xe-7H
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 19:53:07 +0200
Received: (qmail 24597 invoked by uid 1003); 21 Aug 2012 17:34:21 -0000
Received: from unknown (HELO ?10.16.24.71?) (philip@opensdr.com@157.22.28.10)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	21 Aug 2012 17:34:21 -0000
Message-ID: <5033C69A.9030206@balister.org>
Date: Tue, 21 Aug 2012 10:34:18 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <2404459.dJBf5OQotX@helios> <5032A1D3.8090600@windriver.com>
	<1570865.4gpYqKP9pu@helios>
In-Reply-To: <1570865.4gpYqKP9pu@helios>
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] RFC: OE-Core task rework
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 17:53:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/21/2012 01:49 AM, Paul Eggleton wrote:
> On Monday 20 August 2012 15:45:07 Mark Hatle wrote:
...

>>
>> Yup, there is a logical grouping for the lsb specific tasks, as for others.
>> The naming needs to be made clear as to why it's there, and what it
>> represents. Same with the summary and descriptions -- they should list the
>> functionality provided by this group of components.
>
> The main concern with LSB is that we have something called task-basic, which
> seems to be intended for LSB but does not state as much, and I know at least
> one person has tried to use it and then been a little puzzled as to why rpm
> has been pulled in when ipk packaging has been selected. Just naming some of
> these tasks more appropriately would help avoid such situations. In the
> specific case of task-basic there may be a case for creating a similar but not
> LSB-focused task that pulls in real shell utilities in preference to the light
> versions provided by busybox.

I was seriously stumped by the presence of rpm in what I felt should 
have been a very basic image. If a task/group is targeted at lsb, it 
needs to have lsb plastered all over the name so the rest of us can 
avoid it :)

Philip

>
>>> 4) Consider the usefulness of the existing PACKAGE_GROUP_ structure which
>>> converts some IMAGE_FEATURES into the addition of tasks to be installed
>>> (see classes/core-image.bbclass). At the very least we should probably
>>> rename this if we rename tasks to package groups, and there's a question
>>> as to how IMAGE_FEATURES scales - should every task be represented in
>>> there or only a select list? Would we be better off not trying to bring
>>> any tasks in via IMAGE_FEATURES at all and mostly leave that to control
>>> post-processing (e.g. package-management, debug-tweaks, etc.)?
>>
>> I'd certainly prefer that images were limited to selecting software from
>> task (group) recipes only, and not providing their own.  An image should be
>> able to change the selection based on an "image feature" or similar
>> configuration, but the underlying tasks/groups, recipes, etc should all be
>> 'generic' to a given distribution configuration.
>
> The first part seems reasonable to me; but I'm still short of an answer as to
> what to do with the existing IMAGE_FEATURES code as mentioned above. At the
> moment aside from the special features such as debug-tweaks, these are just a
> thin layer on top of task recipes which doesn't add very much at all other
> than extra maintenance.
>
>> I think if you go through the images today, a lot of that stuff is either
>> old, or could be simplified by creating appropriate tasks/groups.
>
> OK, that's a good point. I have another task on my list to clean up our image
> recipes and that would be a good segue into that.
>
> Cheers,
> Paul
>


