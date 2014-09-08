Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 288B471321
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 12:35:28 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id p9so4042506lbv.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 05:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Wu+omXvE/PECc83HBIY+w5APOq7FYmeCnN9WR8thQJA=;
	b=EYbQaifN4MyW9kj8Gs7fM1QgUdhz70Me3KcCrr1vG0IU+hTlQKIqZUjIXVPXIcqaq7
	27oEw+ND9Smyh+Fwf3Dj6dZqDclKzFxPc9NZe4mbDJ4PEljh7xYMijY2Q+eNlnWLV/hQ
	ktE6fnMrCG5jA7SDYhitHtd9DWscPMemUxVmtvBxKCZi4jY8qF2j4lTTPsBeWAdQM7XT
	rKcTH87OqB929vIa96oSrSEGzXMweDas9JJLiYQcs4izKpk0HrcnOL41SzDcDQkfsGA+
	BKQfxy/rroaI8e2H7idZhr98AxHlmBbrFPGB4TMDeKHWWTgaFMrBvC1EYe8Ga+/XDFMU
	6ZyA==
MIME-Version: 1.0
X-Received: by 10.112.75.233 with SMTP id f9mr2265333lbw.102.1410179725459;
	Mon, 08 Sep 2014 05:35:25 -0700 (PDT)
Received: by 10.114.74.226 with HTTP; Mon, 8 Sep 2014 05:35:25 -0700 (PDT)
In-Reply-To: <CAMKF1sp29d050n4VHSkjmNX6q9i=nDNyUFTBxot218aj-KzQ+Q@mail.gmail.com>
References: <53C3A130.4000900@pabigot.com> <53DC39DE.5020105@pabigot.com>
	<CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
	<CAJTo0LaQh=cMsbVYgt_xjhXqe0L76KC-efk17Pju6A21Da=j0Q@mail.gmail.com>
	<CAMKF1sqZZaXy9AkRHEeXyeoMWABWMS-+PK_v-6QAr5d8Qc1hPA@mail.gmail.com>
	<CAMKF1spYXbaKdjQhAYM3SEL8RjqfTeOwmXpsOXNOS0YaXZJzLg@mail.gmail.com>
	<CAJTo0Lb708rnUEEUf9w0B2er_Ttb890niQUjRdBTTD952BcogQ@mail.gmail.com>
	<CAMKF1srf7AFaYXUzwObkAwxO8_P7v-5e5UdcBYCpqXAp0VN7HA@mail.gmail.com>
	<CAMKF1sp29d050n4VHSkjmNX6q9i=nDNyUFTBxot218aj-KzQ+Q@mail.gmail.com>
Date: Mon, 8 Sep 2014 14:35:25 +0200
Message-ID: <CAC1BbcS-RTmp1MfJZ7vbRNvM4ciijrHUyjpwztBDnymKhr2Sfw@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: patchwork client problems
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
X-List-Received-Date: Mon, 08 Sep 2014 12:35:35 -0000
Content-Type: text/plain; charset=UTF-8

On 6 September 2014 19:25, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Sep 6, 2014 at 8:32 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sat, Sep 6, 2014 at 6:32 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>> Thanks Khem, much appreciated.
>>>
>>> Presumably the hooks to auto-mark merged patches haven't been
>>> activated because the git server and the patchwork server are on
>>> different machines. Has there been previous discussion to get this
>>> resolved?
>>
>> it has been activated and was working in past. Do you see it not happening now ?
>
> update hooks were not working too since they use pwclient themselves
> and pwclient
> was not working thus far. So it should start working again. I have
> updated the hooks
> to reflect the latest changes from patchwork upstream as well

FYI, The current upstream pwclient can now operate on multiple IDs, e.g.:
pwclient view 1 3 4 9
pwclient get 2 5
and you can configure a per-project or global "signoff" option for
git-am (or on the command-line -- git-am -s 77):
[options]
default = my_project2
signoff = True
[proj1]
url = ...
signoff = True

cheers,

