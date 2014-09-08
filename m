Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1A6617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 16:53:12 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id tr6so1645474ieb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 09:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Q+ZZixweo5biXsjY9/KkalO4HDiKK+gkai4Er0rflB8=;
	b=VNq5OYCSMNqArsvDaaEOfQQfGwo/9sA55KW508OllmRUqOuHe0LweE9VN8CKFUEigV
	eJc2SZelafZFAMQkGksPIsgG0MIV9kySlyINhv/n3JVqxrGjdq/uDxeDjGK6wihiS2dG
	nmfdUzYazG/suD9/hKDlGREX1HMB42My32asayTp7A9oxf7UqUbqx4Lkifx+uxBr1PcY
	nuSxGUR4agG2iST0vnkTp+lOsUFWSYF6ZoT5EmJMESPvi859t9bPlxGjTLBF+ZqPL0g0
	8wk6irdQUAJRZBhtsFyfS7p9yHnpXQxVb0YuQx9v1S8F+Kcp6FInxhgvIoDCfuOf4oEt
	3xqA==
X-Received: by 10.43.64.198 with SMTP id xj6mr4149803icb.70.1410195193834;
	Mon, 08 Sep 2014 09:53:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Mon, 8 Sep 2014 09:52:43 -0700 (PDT)
In-Reply-To: <CAC1BbcS-RTmp1MfJZ7vbRNvM4ciijrHUyjpwztBDnymKhr2Sfw@mail.gmail.com>
References: <53C3A130.4000900@pabigot.com> <53DC39DE.5020105@pabigot.com>
	<CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
	<CAJTo0LaQh=cMsbVYgt_xjhXqe0L76KC-efk17Pju6A21Da=j0Q@mail.gmail.com>
	<CAMKF1sqZZaXy9AkRHEeXyeoMWABWMS-+PK_v-6QAr5d8Qc1hPA@mail.gmail.com>
	<CAMKF1spYXbaKdjQhAYM3SEL8RjqfTeOwmXpsOXNOS0YaXZJzLg@mail.gmail.com>
	<CAJTo0Lb708rnUEEUf9w0B2er_Ttb890niQUjRdBTTD952BcogQ@mail.gmail.com>
	<CAMKF1srf7AFaYXUzwObkAwxO8_P7v-5e5UdcBYCpqXAp0VN7HA@mail.gmail.com>
	<CAMKF1sp29d050n4VHSkjmNX6q9i=nDNyUFTBxot218aj-KzQ+Q@mail.gmail.com>
	<CAC1BbcS-RTmp1MfJZ7vbRNvM4ciijrHUyjpwztBDnymKhr2Sfw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Sep 2014 09:52:43 -0700
Message-ID: <CAMKF1spU_uxjc2Ktz0nN3z74FtX9W2yK-rb_0BPtZd4o3E=_0w@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
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
X-List-Received-Date: Mon, 08 Sep 2014 16:53:19 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 8, 2014 at 5:35 AM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On 6 September 2014 19:25, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sat, Sep 6, 2014 at 8:32 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Sat, Sep 6, 2014 at 6:32 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>>> Thanks Khem, much appreciated.
>>>>
>>>> Presumably the hooks to auto-mark merged patches haven't been
>>>> activated because the git server and the patchwork server are on
>>>> different machines. Has there been previous discussion to get this
>>>> resolved?
>>>
>>> it has been activated and was working in past. Do you see it not happening now ?
>>
>> update hooks were not working too since they use pwclient themselves
>> and pwclient
>> was not working thus far. So it should start working again. I have
>> updated the hooks
>> to reflect the latest changes from patchwork upstream as well
>
> FYI, The current upstream pwclient can now operate on multiple IDs, e.g.:
> pwclient view 1 3 4 9
> pwclient get 2 5
> and you can configure a per-project or global "signoff" option for
> git-am (or on the command-line -- git-am -s 77):
> [options]
> default = my_project2
> signoff = True
> [proj1]
> url = ...
> signoff = True
>

Thanks Bernahrd for note. FWIW our patchwork is uptodate so this should work

> cheers,

