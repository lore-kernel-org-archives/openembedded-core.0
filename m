Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id D99E977D6E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 19:01:14 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id b9so932818wra.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 12:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0F+iSVRhMNyuwaMNSyQ29ieqm7jYCL4vpObzNIlWghc=;
	b=a6h1rfoliTNznnJNl7ZcJG3JVbVNEdUslI3ZZDLMgypOcj7KgDqjs4hGxO4eUvnkHA
	Ieruu/g6JrIGmCa8EGyEbiXpe3T/OmxKrcrHx4xeo7+sxM/IaqmAkb/LDCbfYrVNmd/I
	+p4hW86o52I8zuFTE2mGklM2N3r7moofuB3xNeDnDUKVVwl1CWeaqvkZsw67/pZ5Z85e
	DdyV2bqJYt1pdnMqvfG34euyJvEWq0LQvIIqUwFqBcbsLJHUKILKxwWWbbp5+b9hb7g9
	eNN06eFENhdkaRuAnk+mzzkHOYQL+qbm/AEUjkVdtT7Osfx75Sv7sKjPU/oC+qGQ+pkV
	rGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0F+iSVRhMNyuwaMNSyQ29ieqm7jYCL4vpObzNIlWghc=;
	b=EwEvvNCiljDLFpSpacY22qMitvx+X/nRd+CpLK9G1QnkqQsaF0WjD4fhRPlvtaCbFa
	zleTbFS2Rbot/SmyR1NJzj4wiwRGX3BSjgWfrjcE2uuIYPVWYxpptiY6fOZPSmgGEX2t
	R7eeSMuYDVGHmLjE3Gxj4PKCT9GKfUljEOzVYgp43pKpCQCHQtg8YaAZB4f+lWcg+T3Q
	U0czZowJHGf9N1uoHF2gO16jL2xVMn8osZJP36NSPi47w+5syIWbJDu40v7JQlnwlMBB
	FYmK/zwsU0HaA7wWp4qHHV8zPEgWmin710ytlj8OObQMq/Y88yw7xVIr1WjgQOWhrs/M
	gydA==
X-Gm-Message-State: AHPjjUgxv8e1ftvXVTdSjXyZ7uuBH5fFHyExtnaga02+MadbSk3Zw6EB
	rwCP9Zti9SHy3YeiKBTw3ux8ggYdumeVBPLMwiQ=
X-Google-Smtp-Source: ADKCNb55sUwjNeANxLlblmvli1Z+L1LYwiP7fnGDMJYTOylZ2O3xJe9Bwpag6wuLuunGo75uPNrgaByMT+lxalsmC9Y=
X-Received: by 10.223.186.6 with SMTP id o6mr26935428wrg.263.1505761275579;
	Mon, 18 Sep 2017 12:01:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Mon, 18 Sep 2017 12:01:15 -0700 (PDT)
In-Reply-To: <CAJTo0LZrPSoVNAX6onFFsGgkD1LEm=2DLdBOecnhNEQBRDnS6A@mail.gmail.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
	<a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
	<CAJTo0LaZo2Jhh7Jj=RAUzOzXq_FcXnobu-idL7RFnbq84iR_VA@mail.gmail.com>
	<CAJ86T=UqdDrT2ApxMiM=g__pTftCc5g0-gzs20vd-jV06+6x7w@mail.gmail.com>
	<CAJTo0LZrPSoVNAX6onFFsGgkD1LEm=2DLdBOecnhNEQBRDnS6A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 18 Sep 2017 12:01:15 -0700
Message-ID: <CAJ86T=X5xAtSL4bK9tGLxrdxqtNh6ewG0n8rLfeiewL=cWA6xA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: profile: Get rid of "resize"
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
X-List-Received-Date: Mon, 18 Sep 2017 19:01:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 18, 2017 at 11:43 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 18 September 2017 at 19:41, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Mon, Sep 18, 2017 at 8:17 AM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> > On 18 September 2017 at 16:07, Peter Kjellerstedt
>> > <peter.kjellerstedt@axis.com> wrote:
>> >>
>> >> > -----Original Message-----
>> >> > From: openembedded-core-bounces@lists.openembedded.org
>> >> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> >> > Of
>> >> > Mike Looijmans
>> >> > Sent: den 18 september 2017 16:07
>> >> > To: openembedded-core@lists.openembedded.org
>> >> > Cc: Mike Looijmans <mike.looijmans@topic.nl>; Peter Kjellerstedt
>> >> > <peter.kjellerstedt@axis.com>
>> >> > Subject: [OE-core] [PATCH] base-files: profile: Get rid of "resize"
>> >> >
>> >> > The "resize" command actually outputs shell commands to be executed,
>> >> > for
>> >> > example:
>> >> >
>> >> > $ resize
>> >> > COLUMNS=102;
>> >> > LINES=27;
>> >> > export COLUMNS LINES;
>> >> >
>> >> > The output of "resize" is being discarded to /dev/null so the call
>> >> > has
>> >> > no
>> >> > effect whatsoever, and does not change the environment (it cannot
>> >> > change
>> >> > the
>> >> > environment of its parent). Remove the call and hence solve the
>> >> > messages
>> >> > about shells missing "command" or "tty" or "resize".
>> >> >
>> >> > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> >> > ---
>> >> >  meta/recipes-core/base-files/base-files/profile | 9 ---------
>> >> >  1 file changed, 9 deletions(-)
>> >> >
>> >> > diff --git a/meta/recipes-core/base-files/base-files/profile
>> >> > b/meta/recipes-core/base-files/base-files/profile
>> >> > index a062028..cfd0d69 100644
>> >> > --- a/meta/recipes-core/base-files/base-files/profile
>> >> > +++ b/meta/recipes-core/base-files/base-files/profile
>> >> > @@ -20,15 +20,6 @@ if [ -d /etc/profile.d ]; then
>> >> >       unset i
>> >> >  fi
>> >> >
>> >> > -if command -v resize >/dev/null && command -v tty >/dev/null; then
>> >> > -     # Make sure we are on a serial console (i.e. the device used
>> >> > starts with
>> >> > -     # /dev/tty[A-z]), otherwise we confuse e.g. the eclipse
>> >> > launcher
>> >> > which
>> >> > -     # tries do use ssh
>> >> > -     case $(tty) in
>> >> > -             /dev/tty[A-z]*) resize >/dev/null;;
>> >> > -     esac
>> >> > -fi
>> >> > -
>> >> >  export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
>> >> >
>> >> >  umask 022
>> >> > --
>> >> > 1.9.1
>> >>
>> >> Hold on. Looking at busybox' source code for resize, it seems that
>> >> it actually does something besides outputting the shell code to
>> >> set the variables (which is actually enabled by a separate feature
>> >> called ENABLE_FEATURE_RESIZE_PRINT). It also calls
>> >> ioctl(STDERR_FILENO, TIOCSWINSZ, &w) where w contains the
>> >> calculated sizes.
>> >
>> > My knowledge of ANSI escapes is incredibly sketchy, but isn't that the
>> > code
>> > to *get* the size of the screen?  Put the cursor at 999,999, then ask
>> > where
>> > it is?
>>
>> The behaviour may have got broken with the various /etc/profile
>> rewrites but it certainly did do something useful originally - it
>> greatly improves usability for shells run on serial consoles. Please
>> don't just remove it.
>
>
> The question is does it do something useful *now*?

I don't have a board with a serial console to test at the moment.
Busybox hasn't changed in recent memory though, so as long as the
resize command does actually get run I presume it's still going to
work.

> Ross

