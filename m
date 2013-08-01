Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 87B9461883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 16:50:00 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id i18so4907022oag.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=JH/HiI+gLbBvMqRR4Y1fGuzXurxv+aL2rtHsUs6VzXg=;
	b=S5XARW4hGaID9ZePjhJTIxzFQkYgsl4NafLdsamQcTz0qIgDRp8ZIhFXO19IlIjM8P
	lFM9VxHcuro3rz9zRgN0qROejBpSNx8eRo7M1NzhFcr9g02zmt0keiAvnUx/yCPHgWnk
	qMEfeCugNBXFzEGUTcevcprtPd5hz3Z4X6e5MDoIxbXlFz5SIGsvB5pcJQgrhYH+TQpB
	jzunmAtVzxRbJx9K6ZOrNGMyryAr+UF3QOeHO6BPPzrPxyfrYEjuHnb/odJwnhXdRAYe
	NuiSiXTuOq0uld0yCBcmBBga/VUmZT+x797nRjjzBYHQz2+qxVm39lH4+HbN+iUcpDsM
	DBgg==
MIME-Version: 1.0
X-Received: by 10.60.63.33 with SMTP id d1mr1861448oes.103.1375375801100; Thu,
	01 Aug 2013 09:50:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 1 Aug 2013 09:50:01 -0700 (PDT)
In-Reply-To: <CAOMwXhNXO+ZDSh3Kt41g=K1Jo_EDGSGkX6-DUTHN1hMz3QF2yg@mail.gmail.com>
References: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
	<CAOMwXhNbDzsi4=mBb+0=iqdxafnAezRsMvJbG1dPetCTMEhJQQ@mail.gmail.com>
	<CAJTo0LYPD48S3rjYPfh5HPyeuzxrx=ZiJOguz5doxjd2r3PAXw@mail.gmail.com>
	<CAOMwXhPi108Q0yWNPgZ-XfGA99+AUpaL+oPSH9W5yS8HhuZd3Q@mail.gmail.com>
	<CAJTo0LbVOSEz53G8TT0hn4UKyyhhJu6uacRb3XbCjnwBej7zGQ@mail.gmail.com>
	<CAOMwXhNfdQ_41HybptW0xgqBZhOGOx7pgdJ8M5F+qVs5Qd5vvA@mail.gmail.com>
	<CAJTo0LaYiJsuJG6BNEHiCL8Ga+4EZ9S+vvAKRkiNyXQ16v1fMw@mail.gmail.com>
	<CAOMwXhNXO+ZDSh3Kt41g=K1Jo_EDGSGkX6-DUTHN1hMz3QF2yg@mail.gmail.com>
Date: Thu, 1 Aug 2013 13:50:01 -0300
X-Google-Sender-Auth: dOx_1MkIwFRzLog1W9vpy1fsy7A
Message-ID: <CAP9ODKrXScWCUTfL8_hO6Jm+gFHUbzgADZoBd-iW7xjZW1679w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2] u-boot: state the MACHINE when skipping u-boot
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
X-List-Received-Date: Thu, 01 Aug 2013 16:50:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 1, 2013 at 1:38 PM, Laszlo Papp <lpapp@kde.org> wrote:
> On Thu, Aug 1, 2013 at 5:35 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 1 August 2013 17:33, Laszlo Papp <lpapp@kde.org> wrote:
>> >> I'm not sure what you meant here.  Do you mean a situation where the
>> >> local.conf says MACHINE=foo and the user also sets MACHINE=foo in the
>> >> environment?
>> >
>> > Yes.
>>
>> But there's nothing wrong with the user doing that at all.
>
>
> Why do you think compilers warn in such use cases? Because they cannot know
> if you are doing something silly, or something unintentional. It might just
> well be that the user wanted to type something else, but got confused in
> which case he might get a hard to debug issue later, or even if not hard, it
> is additional issue due to his.

Please provide the message you preferred so it can be seen and
discussed. An example might make it easier to get what you really
mean.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

