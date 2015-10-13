Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 95C1765C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 12:18:39 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so55980491igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 05:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=wBT/89ZdFgvd3bayA7Ey5iPIglSkElPMifOVazb9xQs=;
	b=hkfjsz1qSbasSN74FdyJgEHPVJ3QKwgiXFBevlvttX4OsJpOlML5TJoL+7eZRBR/Gv
	Iskq04IaKGVNZgckUVoFGUAaBfx3vKD/SMAZdzw3IGEe3RM5esWVXYdvXFHffi1JFkbl
	7e7OOmB89wb0Cx396p7NKPaAVnkTWNAwJvu054uEbX1Lkkwry8AXe5MUduD1fV+H4dZQ
	waF9upOLlxizqxZnzYszVmP49KAwJ0xRhK8TsUc6luRKqi2omY//bHCpaEJZApdLlJVe
	wKd5g4I98NfH1tqzAgmPDZPTkpAMrqbJI0Kq+UlQBsgNU5aZquwpMSnT/V6AFc0pZKWL
	SaIA==
X-Gm-Message-State: ALoCoQkfZUY/hjlqAgXju7kqEQfZYCHdolhiBe5yVQaqpu21X3EURaTvb6fI3Gj4S1iXBAZAroSF
X-Received: by 10.50.61.243 with SMTP id t19mr17660708igr.22.1444738719299;
	Tue, 13 Oct 2015 05:18:39 -0700 (PDT)
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com.
	[209.85.223.171]) by smtp.gmail.com with ESMTPSA id
	hz3sm4460447igb.19.2015.10.13.05.18.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 05:18:37 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodv82 with SMTP id v82so18473785iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 05:18:37 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.27.136 with SMTP id b130mr35719111iob.28.1444738717424; 
	Tue, 13 Oct 2015 05:18:37 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 13 Oct 2015 05:18:37 -0700 (PDT)
In-Reply-To: <1444738079.5251.29.camel@pbcl.net>
References: <A543BCF1-FAD0-4993-B357-1BE49B062F63@gmail.com>
	<9C694221-E92E-468E-A950-1D8B530757DD@gmail.com>
	<6BA567C8-0D8A-402A-B733-2E9DECFD9844@gmail.com>
	<32B54709-BA87-45AC-BDC0-22604B6D3979@gmail.com>
	<6C58EED7-075B-4B58-B401-DB9EF31B8D50@gmail.com>
	<CAMKF1sreATF=J9rh-dK5fbsJt9szaJTmNyOOHg1gC+mVGNBZyg@mail.gmail.com>
	<B1E843F8-C2B2-403A-87E4-1D8AD3E13C63@gmail.com>
	<CAP9ODKrCcmX=4bHACTyGpF9BNivvDcBEieTyOcbChHdZr67pkA@mail.gmail.com>
	<1444738079.5251.29.camel@pbcl.net>
Date: Tue, 13 Oct 2015 09:18:37 -0300
Message-ID: <CAP9ODKpD=5Fjr34j2K2ASWjTLZXKhkqDhLFVLPbqLsyme57N2w@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: Avoid non-aligned access for ARM5e
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
X-List-Received-Date: Tue, 13 Oct 2015 12:18:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 13, 2015 at 9:07 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2015-10-13 at 08:45 -0300, Otavio Salvador wrote:
>> I understand Khem is excitant to include more non-upstreamed patches
>> into GCC but I would prefer to have it included and Java working fine
>> than a local patch applied forever. :-(
>
> Maybe you'd like to file a bug against upstream GCC in that case.  I
> think Khem already suggested this to Jens but he said he had "no time"
> to do that.

We don't require upstream bugzilla items for patches in all recipes so
GCC should not be an exception. Sorry but I don't buy this argument
and I think the patch is clear and short enough to go in.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

