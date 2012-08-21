Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3t2b-0003Rg-RP
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 20:19:01 +0200
Received: by eaad12 with SMTP id d12so29368eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 11:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TElu6040V9geLC0O0CzAe2qMUXB4PAKJ+Abe2ir3iUQ=;
	b=Xt3XmynqPs4H7mGLWUgxNyYpyovRoI5+mfjw7rm85fzJvyJrIgPuPbdjM8RfDBnKNT
	dGNZY6bWn7szwblnNbwG+0gAy9Fe1dOeSfkHHnT2zWVBX+WRUOmiSY9Y2NZjSW44ykm2
	w5waRXWfRuCbiPLWjvs6w4er37LRQDjuJOpdvPR8M+qE6ER+nqvTlr83kwum6U1gDH6l
	quvcNCV2dBTlqHxDJx3ZG9gmc+KatgmsKnnrfJzO5sJx3I7yctM8XJc6qJPPxR7+aXte
	OqV+MeQjPhH0BclZKVG1bYhVUTAVbwmo5XdBdk9BKf+hLD8xlQZsDhyCpaSNJpAFdyIh
	tV3Q==
Received: by 10.14.211.3 with SMTP id v3mr14517959eeo.43.1345572418135; Tue,
	21 Aug 2012 11:06:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 21 Aug 2012 11:06:28 -0700 (PDT)
In-Reply-To: <CAEsOVNcX=DeAbNpcMPP_sZPzgqN+uKksgodhS6-fTGAaZkLx9Q@mail.gmail.com>
References: <1345566017-15508-1-git-send-email-msm@freescale.com>
	<CAMKF1sp2eYPuaU0yF-BBX9DNjPHwFjfOknLen10gog1n3spDfA@mail.gmail.com>
	<CAEsOVNcX=DeAbNpcMPP_sZPzgqN+uKksgodhS6-fTGAaZkLx9Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2012 11:06:28 -0700
Message-ID: <CAMKF1sphgACT00prBya6svo_dbcV2hOGdj1ACk1hVUyEvqtNEQ@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kmod-native_git.bb: fix builds for hosts with older libc
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
X-List-Received-Date: Tue, 21 Aug 2012 18:19:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 21, 2012 at 10:59 AM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Tue, Aug 21, 2012 at 12:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Aug 21, 2012 at 9:20 AM, Matthew McClintock <msm@freescale.com> wrote:
>>> +
>>> +do_configure_prepend (){
>>> +       if ! grep O_CLOEXEC -r ${includedir_native}/bits/fcntl.h; then
>>> +               export CFLAGS="$CFLAGS -D O_CLOEXEC=0"
>>> +       fi
>>> +}
>>
>>
>> IMO It would be safer to create a patch for kmod itself where you
>> define O_CLOEXEC if it
>> was not defined before. The above seems a bit risky
>
> Why is it risky? I only wanted to do this for affected systems. There
> is not an easy way to do this with a patch, unless of course I apply
> the patch manually.

manually gripping at the host installation and then if O_CLOEXEC might
be in comments
and furthermore it if it comes from fcntl.h which is not where you are
looking for
there are few variables like that where its impacting more than
affected systems.


>
> -M


