Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id A944C713A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 12:07:24 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id x12so13818531qac.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 05:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Il6J2NTB0rAc5evaf5pT5wfPHuknmdQd7jNPRI9+lEQ=;
	b=lWhcIMt+F2ceom+yfmb3AOVr5GHrUrGfzSbDrjo4W8+dK5J+7Kne9jIwgUNAzP49Mw
	JgCsNlLtk4F1dCx3KmXkrD9NrjpR60x2GRu5JRxG9hAn4Icto/n/EpnZAhODGX3D6YO/
	sVylTlt98Z1/2iGWViobS2GxXAp+8Cxj8GX79laVc1VC2cCBubhAFfyT4fl6fQKXrVml
	+jAHNNPRudOax1GW6I6MxcbR3kDx2KcDxPc+wzeVrbFNRPu64qlgEW0lzEj08decs9Nl
	I2uuVTNOsx3oIgd5/kiuc9FJU2+CjDXXqQUNx9SdawSb+pbN2+iRz5q+wkhFHONfzim4
	Igeg==
X-Gm-Message-State: ALoCoQmQnGP9RRfoEhubjLq685NcU9iWZCNldnQyFoeWUq+qRg8Lp0bxhPWos0Gz+H37GHwBR2h/
X-Received: by 10.140.40.84 with SMTP id w78mr38950546qgw.87.1410178045180;
	Mon, 08 Sep 2014 05:07:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 8 Sep 2014 05:07:05 -0700 (PDT)
In-Reply-To: <CAMKF1sp29d050n4VHSkjmNX6q9i=nDNyUFTBxot218aj-KzQ+Q@mail.gmail.com>
References: <53C3A130.4000900@pabigot.com> <53DC39DE.5020105@pabigot.com>
	<CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
	<CAJTo0LaQh=cMsbVYgt_xjhXqe0L76KC-efk17Pju6A21Da=j0Q@mail.gmail.com>
	<CAMKF1sqZZaXy9AkRHEeXyeoMWABWMS-+PK_v-6QAr5d8Qc1hPA@mail.gmail.com>
	<CAMKF1spYXbaKdjQhAYM3SEL8RjqfTeOwmXpsOXNOS0YaXZJzLg@mail.gmail.com>
	<CAJTo0Lb708rnUEEUf9w0B2er_Ttb890niQUjRdBTTD952BcogQ@mail.gmail.com>
	<CAMKF1srf7AFaYXUzwObkAwxO8_P7v-5e5UdcBYCpqXAp0VN7HA@mail.gmail.com>
	<CAMKF1sp29d050n4VHSkjmNX6q9i=nDNyUFTBxot218aj-KzQ+Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Sep 2014 13:07:05 +0100
Message-ID: <CAJTo0LYkKXsvKKuTizSVR7abdV6CM9su+p2n5S+82s1oo_jyjQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 08 Sep 2014 12:07:25 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 6 September 2014 18:25, Khem Raj <raj.khem@gmail.com> wrote:
> update hooks were not working too since they use pwclient themselves
> and pwclient
> was not working thus far. So it should start working again. I have
> updated the hooks
> to reflect the latest changes from patchwork upstream as well

Fair enough.  Can you remind me privately of my username/password, and
would it be possible to get more rights so that I can go and work my
way through the old patches that have been merged and mark them as
such?

Cheers,
Ross

