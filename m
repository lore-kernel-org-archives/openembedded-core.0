Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 72440713E4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Sep 2014 17:26:11 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id tp5so2730090ieb.23
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Sep 2014 10:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BY6In4gRUQ77PZxY/mwcy5BWthWa8SFz9ekxPMNryu4=;
	b=vnSQfbc764NcR++9YMXbrSQRCqIqFssI9nNajnlqIXs2BwTr8YoEGEgE0ESwY9XbdK
	Mf7sZZ9LC/hrshheFLuEhqT+rHceQ5mQkBAZNFgkqRTz31K+mZZ/AzS+OyqKWGJwW94T
	4Vn3S0MgjhHBMSTznzk0Ouyhnt4fDWmbyOcjeykjR6COKeL+UOCBF93+3T0LsAqakqtW
	Z3TgkDm1RpYfDk+WiTCPxrPIyuCkbs+axa/iK3Ojz/DQjIQeMyL55V6mGuC2rML2t+Yj
	OWJPcNf3HruoP5hCXlSvNKB8Z0WVbtJweXRbOYZ4tWSgfArdNpcLpOFxorEAKoWiUXzb
	0+JQ==
X-Received: by 10.42.62.6 with SMTP id w6mr22284295ich.24.1410024372687; Sat,
	06 Sep 2014 10:26:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Sat, 6 Sep 2014 10:25:42 -0700 (PDT)
In-Reply-To: <CAMKF1srf7AFaYXUzwObkAwxO8_P7v-5e5UdcBYCpqXAp0VN7HA@mail.gmail.com>
References: <53C3A130.4000900@pabigot.com> <53DC39DE.5020105@pabigot.com>
	<CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
	<CAJTo0LaQh=cMsbVYgt_xjhXqe0L76KC-efk17Pju6A21Da=j0Q@mail.gmail.com>
	<CAMKF1sqZZaXy9AkRHEeXyeoMWABWMS-+PK_v-6QAr5d8Qc1hPA@mail.gmail.com>
	<CAMKF1spYXbaKdjQhAYM3SEL8RjqfTeOwmXpsOXNOS0YaXZJzLg@mail.gmail.com>
	<CAJTo0Lb708rnUEEUf9w0B2er_Ttb890niQUjRdBTTD952BcogQ@mail.gmail.com>
	<CAMKF1srf7AFaYXUzwObkAwxO8_P7v-5e5UdcBYCpqXAp0VN7HA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Sep 2014 10:25:42 -0700
Message-ID: <CAMKF1sp29d050n4VHSkjmNX6q9i=nDNyUFTBxot218aj-KzQ+Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Sat, 06 Sep 2014 17:26:13 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 6, 2014 at 8:32 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Sep 6, 2014 at 6:32 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> Thanks Khem, much appreciated.
>>
>> Presumably the hooks to auto-mark merged patches haven't been
>> activated because the git server and the patchwork server are on
>> different machines. Has there been previous discussion to get this
>> resolved?
>
> it has been activated and was working in past. Do you see it not happening now ?

update hooks were not working too since they use pwclient themselves
and pwclient
was not working thus far. So it should start working again. I have
updated the hooks
to reflect the latest changes from patchwork upstream as well

