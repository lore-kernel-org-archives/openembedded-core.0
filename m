Return-Path: <gizero@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE35605FE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Oct 2017 13:35:45 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id e46so8074772uaa.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Oct 2017 06:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EKg9AscXivLVlh+uB2a5tJeh5ElbtRZ+9+qMeCDtCv8=;
	b=XamHLWh+FabmTJIiFS6PyLpitCSgHdPPRkPdJ24JkC8vJ7QYxA7BlAqnEFU8mFIOKv
	k83z9TW26RuvcV5QJrfWnDp/o+wwF3lkXmecx9Z3FqEiFRYs3tC5Q4aEoZYbboNrRcnt
	ScIDOQZhqDKeu4kGLvncLI9vuPDC0t+fZG0JLnEgYBnqJCvg8a2jP6XKFEUggzampqeJ
	Decjam0zuWaL05+Twj33KQAMngRwS/IHYrqSm4xP8wniQUEclG1zZlp62Ma5Cw100KG4
	soOkkCfhn6xmRQ/S2FSx4Je2ZB7Z1/Cecj4Q2BZHG6zt6ftXLQKfOoQfqIjYUs86rhbi
	8ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EKg9AscXivLVlh+uB2a5tJeh5ElbtRZ+9+qMeCDtCv8=;
	b=cMilhVsb/TUHg6cKrU5X4C49BonFTTGaE7eVrVXASC3RxL89vhQ/Csl4c4XU+3t4NV
	hpvqhUrCRd5eLiI3RrJ2BPDwPKVu5REOGgnIU4BUGkKN906DaO0QIrn8ruw0lQ9iUCwy
	dKgy1ix/M0/svz2RYH757eDYRzkMQkA2BLk7XF5IVjUQpikSzM0u5CSTifSJZzINUSnV
	B4ZapXUQCyzfh5MfrVUt0eT1stEr9Id6Zri4m1dasThnVxL24yCau2zGjLnGtqiR8qlk
	+lGsXq06fuW3emptZfjbXBPbNSjT7mDVHLGZEZqWcBcudyVphuWidEWSw/mB/vJBxO6F
	SFBA==
X-Gm-Message-State: AMCzsaW6EsXfnf8EczNqLNQFczIH1+qI6kGlxSAL+IYNusU+PltDRsmN
	z56701thPf7ezvdEH5jOFhZVOaB1pkQU0nVVAZk=
X-Google-Smtp-Source: AOwi7QCy2+YGtJFRS+qQAad1unAWta8TimAmg7X5j1h2/dDF8KsCwxxK0vWtSRBnNUsjkdDg+VysD0SCSDPZOanhIds=
X-Received: by 10.176.22.200 with SMTP id g8mr4982553uaf.168.1508074547028;
	Sun, 15 Oct 2017 06:35:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.82.197 with HTTP; Sun, 15 Oct 2017 06:35:46 -0700 (PDT)
In-Reply-To: <20171015020138.GS9221@denix.org>
References: <cover.1506759191.git.Qi.Chen@windriver.com>
	<a74d181f182de5620684e5d4d1019a31e48b400d.1506759191.git.Qi.Chen@windriver.com>
	<CAC+thW1NdA_1zAVLf2jU+bQ+Mr58yBKFT_Gec4wXWiJRjfPFgw@mail.gmail.com>
	<20171015020138.GS9221@denix.org>
From: Andrea Galbusera <gizero@gmail.com>
Date: Sun, 15 Oct 2017 15:35:46 +0200
Message-ID: <CAC+thW2-tQKkyv1m-_TEqqhm8juZZ=v=Cy5nKDyMBf8ypUvU6A@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
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
X-List-Received-Date: Sun, 15 Oct 2017 13:35:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 15, 2017 at 4:01 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Sat, Oct 14, 2017 at 10:53:03PM +0200, Andrea Galbusera wrote:
>> On Sat, Sep 30, 2017 at 10:15 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
>> > Add tools required by testimage to HOSTTOOLS only when testimage is
>> > inherited. These tools, as described in the comment, are only required
>> > by the testimage task. So this change should not have negtive effect.
>> > This would also solve build error on hosts which miss some tool such as scp.
>> >
>> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> > ---
>> >  meta/conf/bitbake.conf | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> > index f41680b..94c1f27 100644
>> > --- a/meta/conf/bitbake.conf
>> > +++ b/meta/conf/bitbake.conf
>> > @@ -484,7 +484,7 @@ HOSTTOOLS += " \
>> >  "
>> >
>> >  # Tools needed to run testimage runtime image testing
>> > -HOSTTOOLS += "ip ping ps scp ssh stty"
>> > +HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage', d)]}"
>> >
>> >  # Link to these if present
>> >  HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
>> > --
>> > 1.9.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>> This one is breaking any recipe that fetches from git repo with
>> 'protocol=ssh' in its SRC_URI... I verified that reverting this one
>> restores the usual fetcher behaviour. Should ssh be added to HOSTTOOLS
>> unconditionally or is there any other way to approach it?
>
> There's an entire thread discussing it here:
> http://lists.openembedded.org/pipermail/openembedded-core/2017-October/143279.html

Thank you Denys for pointing to the full discussion: it was not
threaded together with the initial mail that submitted the patch, then
I missed it... :-/

