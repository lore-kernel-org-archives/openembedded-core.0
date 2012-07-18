Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SrZG8-0006ey-DT
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 20:46:04 +0200
Received: by qcad10 with SMTP id d10so1095609qca.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1Pe4122pR+hQAyeFdwaGSQil4HQep1OSZXJcnPnlpsY=;
	b=iSBPV7RDvllBl+syGPp56BicM7tF1Qlsxkdi1lPwFUywqmn9NNr9kcqTZgGd93FAlj
	R6XSGwDWMEcF1Kn4bvzg9VQFIXYg52YhQFcUgc07nRbInh+ZV97o5eHRCUTDQ4xXZhbz
	258Unel0Lg88iRc6F3SFPF7NsVS3Pev2vk/ymYGDQI43teifBmIqlQTI5wAHlxGbQBHJ
	QmiQkOS7YJxlkFtnIHshAkFpA+h+6JwmXoj9nqk621WgYtPzusH7jbRV5vrNyQgxkf0v
	zFNpoyq13jge+/KPZvW+0jaGMkRwjw5hMrSWrZa4XlZzN4prm4TjZ6znIZd+Hu3WxKip
	tzqQ==
MIME-Version: 1.0
Received: by 10.224.45.8 with SMTP id c8mr8052271qaf.29.1342636483183; Wed, 18
	Jul 2012 11:34:43 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Wed, 18 Jul 2012 11:34:43 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207181429150.23786@oneiric>
References: <alpine.DEB.2.02.1207181358290.23450@oneiric>
	<CADkTA4OdgOFcrMyRKgwGgU9DsMWNMU673Zp-DFV_H+GeFpup1w@mail.gmail.com>
	<alpine.DEB.2.02.1207181429150.23786@oneiric>
Date: Wed, 18 Jul 2012 14:34:43 -0400
Message-ID: <CADkTA4OUHthwOZ24QsOYDr6VGb6spg5R47R0Y3P=HawCbF1p=Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: any easy way to run kern-tools verbosely?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 18:46:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 18, 2012 at 2:29 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Wed, 18 Jul 2012, Bruce Ashfield wrote:
>
>> On Wed, Jul 18, 2012 at 2:02 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>> >
>> >   if there's a way to do this, i'm going to be so embarrassed.
>> > perusing kernel do_patch() routine, which eventually calls:
>> >
>> >         if [ -n "${KMETA}" ]; then
>> >                 createme_flags="--disable-meta-gen"
>> >         fi
>> >         createme ${createme_flags} ${ARCH} ${kbranch}
>> >
>> >   but checking out "createme" in the sysroots/ directory shows:
>> >
>> > usage()
>> > {
>> > cat << EOF
>> >
>> >     createme [-v] [--disable-meta-gen] --meta=<branch name> <arch> <branch> [defconfig]
>> >
>> >       --disable-meta-gen: do not automatically create meta data
>> >                           if not already present in the source tree.
>> >       --meta: the branch name for meta data. default is 'meta'
>> >       -v: verbose processing
>> >       ... snip ...
>> >
>> > so "createme" accepts "-v" for verbose, but i see no trivially
>> > easy way to pass that option given the hardcoding of the call in
>> > do_patch().  are you just expected to manually edit createme to do
>> > that?
>>
>> They are only useful for debugging at the moment, which is me :) So
>> honestly, there's never been a reason to complicate the reciepes any
>> more by dragging these options out to that level.
>
>   ok, just wanted to make sure i wasn't missing something deviously
> complicated.  thanks muchly.

I won't claim that there's nothing devious lurking ;)

Cheers,

Bruce

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


